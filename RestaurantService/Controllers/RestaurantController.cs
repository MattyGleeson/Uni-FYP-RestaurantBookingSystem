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
        /// Gets all restaurants from the database.
        /// </summary>
        /// <returns></returns>
        [Route("All")]
        [HttpGet]
        public async Task<HttpResponseMessage> GetAllRestaurants()
        {
            IEnumerable<Restaurant> res = await _db.Restaurants.Where(b => b.deleted != true).ToListAsync();

            IEnumerable<LibBookingService.Dtos.Restaurant> restaurants = res.Select(b => CreateRestaurantFromDbRestaurant(b));

            return restaurants.Any() ?
                Request.CreateResponse(HttpStatusCode.OK, restaurants) :
                Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Restaurants");
        }

        /// <summary>
        /// Posts a restaurant Dto to the database.
        /// </summary>
        /// <param name="r"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.Restaurant r)
        {
            try
            {
                Restaurant newRestaurant = _db.Restaurants.Add(new Restaurant
                {
                    company_id = r.CompanyId,
                    name = r.Name,
                    phoneNo = r.PhoneNo,
                    addressStreet = r.AddressStreet,
                    addressCounty = r.AddressCounty,
                    addressTown = r.AddressTown,
                    addressPostalCode = r.AddressPostalCode
                });
                await _db.SaveChangesAsync();

                if (r.Tables != null)
                {
                    foreach (LibBookingService.Dtos.Table t in r.Tables)
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

                if (r.MenuItems != null)
                {
                    foreach (LibBookingService.Dtos.MenuItem m in r.MenuItems)
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
        /// <param name="r"></param>
        /// <returns></returns>
        [Route("Update/{id:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int id, LibBookingService.Dtos.Restaurant r)
        {
            try
            {
                Restaurant restaurant = await _db.Restaurants.Where(rr => rr.id == id).FirstOrDefaultAsync();

                restaurant.company_id = r.CompanyId;
                restaurant.name = r.Name;
                restaurant.phoneNo = r.PhoneNo;
                restaurant.addressStreet = r.AddressStreet;
                restaurant.addressCounty = r.AddressCounty;
                restaurant.addressTown = r.AddressTown;
                restaurant.addressPostalCode = r.AddressPostalCode;

                _db.SetModified(restaurant);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.Restaurant res = CreateRestaurantFromDbRestaurant(restaurant);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Returns a booking model using the database selection box parameter.
        /// </summary>
        /// <param name="r"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.Restaurant CreateRestaurantFromDbRestaurant(Restaurant r)
        {
            return new LibBookingService.Dtos.Restaurant
            {
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
        /// Returns a list of tables from the booking parameter.
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
                    NoSeats = t.noSeats,
                    AdditionalNotes = t.additionalNotes,
                    Active = t.active
                });
            return Enumerable.Empty<LibBookingService.Dtos.Table>();
        }

        /// <summary>
        /// Returns a list of booking menu items from the booking parameter.
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
                    DietInfo = mi.MenuItemDietInfoes.Where(di => !di.deleted).Select(di => new LibBookingService.Dtos.DietInfo
                    {
                        Id = di.DietInfo.id,
                        Name = di.DietInfo.name
                    }),
                    Types = mi.MenuItemTypes.Where(t => !t.deleted).Select(t => new LibBookingService.Dtos.MenuItemType
                    {
                        Id = t.Type.id,
                        Name = t.Type.name
                    })
                });
            return Enumerable.Empty<LibBookingService.Dtos.MenuItem>();
        }
    }
}
