using RestaurantService.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace RestaurantService.Controllers
{
    [RoutePrefix("Restaurant")]
    public class RestaurantController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public RestaurantController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public RestaurantController(BookingSystemDb db)
        {
            this._db = db;
        }

        /// <summary>
        /// Gets all restaurants or a single restaurant from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Get/{id:int?}")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get(int id = -1)
        {
            if (id != -1)
            {
                Restaurant res = await _db.Restaurants.Where(b => b.id == id && !b.deleted).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Restaurant Found With ID");

                LibBookingService.Dtos.Restaurant restaurant = CreateRestaurantFromDbRestaurant(res);

                return Request.CreateResponse(HttpStatusCode.OK, restaurant);
            }
            else
            {
                IEnumerable<Restaurant> res = await _db.Restaurants.Where(b => b.deleted != true).ToListAsync();

                IEnumerable<LibBookingService.Dtos.Restaurant> restaurants = res.Select(b => CreateRestaurantFromDbRestaurant(b)).OrderBy(b => b.Name);

                return restaurants.Any() ?
                    Request.CreateResponse(HttpStatusCode.OK, restaurants) :
                    Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Restaurants");
            }
        }

        /// <summary>
        /// Posts a restaurant Dto to the database.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.Restaurant restaurant)
        {
            try
            {
                Restaurant newRestaurant = _db.Restaurants.Add(new Restaurant
                {
                    company_id = restaurant.CompanyId,
                    name = restaurant.Name,
                    phoneNo = restaurant.PhoneNo,
                    addressStreet = restaurant.AddressStreet,
                    addressCounty = restaurant.AddressCounty,
                    addressTown = restaurant.AddressTown,
                    addressPostalCode = restaurant.AddressPostalCode
                });
                await _db.SaveChangesAsync();

                if (restaurant.Tables != null)
                {
                    foreach (LibBookingService.Dtos.Table t in restaurant.Tables)
                    {
                        _db.Tables.Add(new Table
                        {
                            restaurant_id = newRestaurant.id,
                            additionalNotes = t.AdditionalNotes,
                            noSeats = t.NoSeats,
                            active = t.Active
                        });
                        await _db.SaveChangesAsync();
                    }
                }

                if (restaurant.MenuItems != null)
                {
                    foreach (LibBookingService.Dtos.MenuItem m in restaurant.MenuItems)
                    {
                        _db.RestaurantMenuItems.Add(new RestaurantMenuItem
                        {
                            restaurant_id = newRestaurant.id,
                            menuItem_id = m.Id
                        });
                        await _db.SaveChangesAsync();
                    }
                }

                return Request.CreateResponse(HttpStatusCode.OK, CreateRestaurantFromDbRestaurant(newRestaurant));
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Removes a restaurant.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Delete/{id:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            try
            {
                Restaurant restaurant = await _db.Restaurants.Where(b => b.id == id).FirstOrDefaultAsync();
                restaurant.deleted = true;

                _db.SetModified(restaurant);
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Puts a restaurant to the database.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        [Route("Update/{id:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int id, LibBookingService.Dtos.Restaurant restaurant)
        {
            try
            {
                Restaurant r = await _db.Restaurants.Where(rr => rr.id == id).FirstOrDefaultAsync();

                r.company_id = restaurant.CompanyId;
                r.name = restaurant.Name;
                r.phoneNo = restaurant.PhoneNo;
                r.addressStreet = restaurant.AddressStreet;
                r.addressCounty = restaurant.AddressCounty;
                r.addressTown = restaurant.AddressTown;
                r.addressPostalCode = restaurant.AddressPostalCode;

                _db.SetModified(r);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.Restaurant res = CreateRestaurantFromDbRestaurant(r);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Adds a menu item to a restaurant.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="menuItemId"></param>
        /// <returns></returns>
        [Route("AddMenuItem/{id:int?}/{menuItemId:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> AddMenuItem(int id, int menuItemId)
        {
            try
            {
                RestaurantMenuItem res = await _db.RestaurantMenuItems.Where(d => d.restaurant_id == id && d.menuItem_id == menuItemId).FirstOrDefaultAsync();

                if (res != null)
                {
                    if (res.deleted)
                    {
                        res.deleted = false;
                        _db.SetModified(res);
                        await _db.SaveChangesAsync();
                    }
                }
                else
                {
                    _db.RestaurantMenuItems.Add(new RestaurantMenuItem
                    {
                        restaurant_id = id,
                        menuItem_id = menuItemId
                    });
                    await _db.SaveChangesAsync();
                }

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Removes a menu item from a restaurant.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="menuItemId"></param>
        /// <returns></returns>
        [Route("RemoveMenuItem/{id:int?}/{menuItemId:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> RemoveMenuItem(int id, int menuItemId)
        {
            try
            {
                RestaurantMenuItem res = await _db.RestaurantMenuItems.Where(d => d.restaurant_id == id && d.menuItem_id == menuItemId).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateResponse(HttpStatusCode.OK, "Menu item does not exist for restaurant");

                res.deleted = true;

                _db.SetModified(res);
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Returns a restaurant model using the database restaurant parameter.
        /// </summary>
        /// <param name="r"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.Restaurant CreateRestaurantFromDbRestaurant(Restaurant r)
        {
            return new LibBookingService.Dtos.Restaurant
            {
                Id = r.id,
                CompanyId = r.company_id,
                Name = r.name,
                PhoneNo = r.phoneNo,
                AddressStreet = r.addressStreet,
                AddressCounty = r.addressCounty,
                AddressTown = r.addressTown,
                AddressPostalCode = r.addressPostalCode,
                Tables = GetTablesForRestaurant(r),
                MenuItems = GetMenuItemsForRestaurant(r)
            };
        }

        /// <summary>
        /// Returns a list of tables from the restaurant parameter.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        private IEnumerable<LibBookingService.Dtos.Table> GetTablesForRestaurant(Restaurant restaurant)
        {
            IEnumerable<Table> restaurantTables = restaurant.Tables.Where(b => !b.deleted);
            if (restaurantTables.Any())
                return restaurantTables.Select(t => new LibBookingService.Dtos.Table
                {
                    Id = t.id,
                    RestaurantId = t.restaurant_id,
                    TableNo = t.tableNo,
                    NoSeats = t.noSeats,
                    AdditionalNotes = t.additionalNotes,
                    Active = t.active
                });
            return Enumerable.Empty<LibBookingService.Dtos.Table>();
        }

        /// <summary>
        /// Returns a list of restaurant menu items from the restaurant parameter.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        private IEnumerable<LibBookingService.Dtos.MenuItem> GetMenuItemsForRestaurant(Restaurant restaurant)
        {
            IEnumerable<MenuItem> restaurantMenuItems = restaurant.RestaurantMenuItems.Where(r => !r.deleted).Select(r => r.MenuItem);

            if (restaurantMenuItems.Any())
                return restaurantMenuItems.Select(mi => new LibBookingService.Dtos.MenuItem
                {
                    Id = mi.id,
                    Name = mi.name,
                    Description = mi.description,
                    DietInfo = mi.MenuItemDietInfoes.Where(m => !m.deleted).Select(m => m.DietInfo).Where(m => !m.deleted).Select(m => new LibBookingService.Dtos.DietInfo
                    {
                        Id = m.id,
                        Name = m.name
                    }),
                    Types = mi.MenuItemTypes.Where(t => !t.deleted).Select(t => t.Type).Where(t => !t.deleted).Select(t => new LibBookingService.Dtos.MenuItemType
                    {
                        Id = t.id,
                        Name = t.name
                    })
                });
            return Enumerable.Empty<LibBookingService.Dtos.MenuItem>();
        }
    }
}
