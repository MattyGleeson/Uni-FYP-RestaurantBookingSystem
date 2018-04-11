using MenuService.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace MenuService.Controllers
{
    [RoutePrefix("Menu")]
    public class MenuController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public MenuController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public MenuController(BookingSystemDb db)
        {
            this._db = db;
        }

        /// <summary>
        /// Gets all menu items from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Get/{id:int?}")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get(int id = -1)
        {
            if (id != -1)
            {
                MenuItem res = await _db.MenuItems.Where(b => b.Id == id && !b.Deleted).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Menu Item Found With ID");

                LibBookingService.Dtos.MenuItem menuItem = CreateMenuItemFromDbMenuItem(res);

                return Request.CreateResponse(HttpStatusCode.OK, menuItem);
            }
            else
            {
                IEnumerable<MenuItem> res = await _db.MenuItems.Where(b => !b.Deleted).ToListAsync();

                IEnumerable<LibBookingService.Dtos.MenuItem> menuItems = res.Select(b => CreateMenuItemFromDbMenuItem(b)).OrderBy(b => b.Name);

                return menuItems.Any() ?
                    Request.CreateResponse(HttpStatusCode.OK, menuItems) :
                    Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Menu Items");
            }
        }

        /// <summary>
        /// Posts a menu item Dto to the database.
        /// </summary>
        /// <param name="menuItem"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.MenuItem menuItem)
        {
            try
            {
                MenuItem newMenuItem = _db.MenuItems.Add(new MenuItem
                {
                    Name = menuItem.Name,
                    Description = menuItem.Description,
                    Price = Convert.ToDecimal(menuItem.Price)
                });
                await _db.SaveChangesAsync();

                if (menuItem.DietInfo != null)
                {
                    foreach (LibBookingService.Dtos.DietInfo di in menuItem.DietInfo)
                    {
                        _db.MenuItemDietInfoes.Add(new MenuItemDietInfo
                        {
                            MenuItem_id = newMenuItem.Id,
                            DietInfo_id = di.Id
                        });
                        await _db.SaveChangesAsync();
                    }
                }

                if (menuItem.Types != null)
                {
                    foreach (LibBookingService.Dtos.MenuItemType t in menuItem.Types)
                    {
                        _db.MenuItemTypes.Add(new MenuItemType
                        {
                            MenuItem_id = newMenuItem.Id,
                            Type_id = t.Id
                        });
                        await _db.SaveChangesAsync();
                    }
                }

                return Request.CreateResponse(HttpStatusCode.OK, CreateMenuItemFromDbMenuItem(newMenuItem));
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Removes a menu item.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Delete/{id:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            try
            {
                MenuItem menuItem = await _db.MenuItems.Where(m => m.Id == id).FirstOrDefaultAsync();
                menuItem.Deleted = true;

                _db.SetModified(menuItem);
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Puts a booking to the database.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="menuItem"></param>
        /// <returns></returns>
        [Route("Update/{id:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int id, LibBookingService.Dtos.MenuItem menuItem)
        {
            try
            {
                MenuItem mi = await _db.MenuItems.Where(m => m.Id == id).FirstOrDefaultAsync();

                mi.Name = menuItem.Name;
                mi.Description = menuItem.Description;
                mi.Price = Convert.ToDecimal(menuItem.Price);
                
                _db.SetModified(mi);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.MenuItem res = CreateMenuItemFromDbMenuItem(mi);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Adds a diet info to a menu item.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="dietInfoId"></param>
        /// <returns></returns>
        [Route("AddDietInfo/{id:int?}/{dietInfoId:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> AddDietInfo(int id, int dietInfoId)
        {
            try
            {
                MenuItemDietInfo res = await _db.MenuItemDietInfoes.Where(d => d.MenuItem_id == id && d.DietInfo_id == dietInfoId).FirstOrDefaultAsync();

                if (res != null)
                {
                    if(res.Deleted)
                    {
                        res.Deleted = false;
                        _db.SetModified(res);
                        await _db.SaveChangesAsync();
                    }
                }
                else
                {
                    _db.MenuItemDietInfoes.Add(new MenuItemDietInfo
                    {
                        MenuItem_id = id,
                        DietInfo_id = dietInfoId
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
        /// Removes a diet info from a menu item.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="dietInfoId"></param>
        /// <returns></returns>
        [Route("RemoveDietInfo/{id:int?}/{dietInfoId:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> RemoveDietInfo(int id, int dietInfoId)
        {
            try
            {
                MenuItemDietInfo res = await _db.MenuItemDietInfoes.Where(d => d.MenuItem_id == id && d.DietInfo_id == dietInfoId).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateResponse(HttpStatusCode.OK, "Diet info does not exist for menu item");

                res.Deleted = true;

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
        /// Adds a category to a menu item.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="menuItemTypeId"></param>
        /// <returns></returns>
        [Route("AddMenuItemType/{id:int?}/{menuItemTypeId:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> AddMenuItemType(int id, int menuItemTypeId)
        {
            try
            {
                MenuItemType res = await _db.MenuItemTypes.Where(d => d.MenuItem_id == id && d.Type_id == menuItemTypeId).FirstOrDefaultAsync();

                if (res != null)
                {
                    if (res.Deleted)
                    {
                        res.Deleted = false;
                        _db.SetModified(res);
                        await _db.SaveChangesAsync();
                    }
                }
                else
                {
                    _db.MenuItemTypes.Add(new MenuItemType
                    {
                        MenuItem_id = id,
                        Type_id = menuItemTypeId
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
        /// Removes a category from a menu item.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="menuItemTypeId"></param>
        /// <returns></returns>
        [Route("RemoveMenuItemType/{id:int?}/{menuItemTypeId:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> RemoveMenuItemType(int id, int menuItemTypeId)
        {
            try
            {
                MenuItemType res = await _db.MenuItemTypes.Where(d => d.MenuItem_id == id && d.Type_id == menuItemTypeId).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateResponse(HttpStatusCode.OK, "Category does not exist for menu item");

                res.Deleted = true;

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
        /// Returns a menu item model using the database menu item parameter.
        /// </summary>
        /// <param name="mi"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.MenuItem CreateMenuItemFromDbMenuItem(MenuItem mi)
        {
            return new LibBookingService.Dtos.MenuItem
            {
                Id = mi.Id,
                Name = mi.Name,
                Description = mi.Description,
                Price = Convert.ToDouble(mi.Price),
                DietInfo = mi.MenuItemDietInfoes.Where(m => !m.Deleted).Select(m => m.DietInfo).Where(m => !m.Deleted).Select(m => new LibBookingService.Dtos.DietInfo
                {
                    Id = m.Id,
                    Name = m.Name
                }).OrderBy(b => b.Name),
                Types = mi.MenuItemTypes.Where(t => !t.Deleted).Select(t => t.Type).Where(t => !t.Deleted).Select(t => new LibBookingService.Dtos.MenuItemType
                {
                    Id = t.Id,
                    Name = t.Name
                }).OrderBy(b => b.Name)
            };
        }
    }
}
