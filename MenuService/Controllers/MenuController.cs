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
                MenuItem res = await _db.MenuItems.Where(b => b.id == id && !b.deleted).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Menu Item Found With ID");

                LibBookingService.Dtos.MenuItem menuItem = CreateMenuItemFromDbMenuItem(res);

                return Request.CreateResponse(HttpStatusCode.OK, menuItem);
            }
            else
            {
                IEnumerable<MenuItem> res = await _db.MenuItems.Where(b => !b.deleted).ToListAsync();

                IEnumerable<LibBookingService.Dtos.MenuItem> menuItems = res.Select(b => CreateMenuItemFromDbMenuItem(b));

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
                    name = menuItem.Name,
                    description = menuItem.Description,
                });
                await _db.SaveChangesAsync();

                if (menuItem.DietInfo != null)
                {
                    foreach (LibBookingService.Dtos.DietInfo di in menuItem.DietInfo)
                    {
                        _db.MenuItemDietInfoes.Add(new MenuItemDietInfo
                        {
                            menuItem_id = newMenuItem.id,
                            dietInfo_id = di.Id
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
                            menuItem_id = newMenuItem.id,
                            type_id = t.Id
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
                MenuItem menuItem = await _db.MenuItems.Where(m => m.id == id).FirstOrDefaultAsync();
                menuItem.deleted = true;

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
                MenuItem mi = await _db.MenuItems.Where(m => m.id == id).FirstOrDefaultAsync();

                mi.name = menuItem.Name;
                mi.description = menuItem.Description;

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
        /// Returns a menu item model using the database menu item parameter.
        /// </summary>
        /// <param name="mi"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.MenuItem CreateMenuItemFromDbMenuItem(MenuItem mi)
        {
            return new LibBookingService.Dtos.MenuItem
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
            };
        }
    }
}
