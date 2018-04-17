using DatabaseContext.Data;
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
    [RoutePrefix("Category")]
    public class CategoryController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public CategoryController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public CategoryController(BookingSystemDb db)
        {
            this._db = db;
        }

        /// <summary>
        /// Gets all menu item types from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Get/{id:int?}")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get(int id = -1)
        {
            if (id != -1)
            {
                DatabaseContext.Data.Type res = await _db.Types.Where(b => b.Id == id && !b.Deleted).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Menu Item Type Found With ID");

                LibBookingService.Dtos.MenuItemType menuItem = CreateMenuItemTypeFromDbMenuItemType(res);

                return Request.CreateResponse(HttpStatusCode.OK, menuItem);
            }
            else
            {
                IEnumerable<DatabaseContext.Data.Type> res = await _db.Types.Where(b => !b.Deleted).ToListAsync();

                IEnumerable<LibBookingService.Dtos.MenuItemType> menuItemTypes = res.Select(b => CreateMenuItemTypeFromDbMenuItemType(b)).OrderBy(b => b.Name);

                return menuItemTypes.Any() ?
                    Request.CreateResponse(HttpStatusCode.OK, menuItemTypes) :
                    Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Menu Item Types");
            }
        }

        /// <summary>
        /// Posts a menu item type Dto to the database.
        /// </summary>
        /// <param name="menuItemType"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.MenuItemType menuItemType)
        {
            try
            {
                DatabaseContext.Data.Type newMenuItem = _db.Types.Add(new DatabaseContext.Data.Type
                {
                    Name = menuItemType.Name
                });
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, CreateMenuItemTypeFromDbMenuItemType(newMenuItem));
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
                DatabaseContext.Data.Type menuItem = await _db.Types.Where(m => m.Id == id).FirstOrDefaultAsync();
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
        /// <param name="menuItemType"></param>
        /// <returns></returns>
        [Route("Update/{id:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int id, LibBookingService.Dtos.MenuItemType menuItemType)
        {
            try
            {
                DatabaseContext.Data.Type mi = await _db.Types.Where(m => m.Id == id).FirstOrDefaultAsync();

                mi.Name = menuItemType.Name;

                _db.SetModified(mi);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.MenuItemType res = CreateMenuItemTypeFromDbMenuItemType(mi);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Returns a menu item type model using the database menu item type parameter.
        /// </summary>
        /// <param name="mi"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.MenuItemType CreateMenuItemTypeFromDbMenuItemType(DatabaseContext.Data.Type mi)
        {
            return new LibBookingService.Dtos.MenuItemType
            {
                Id = mi.Id,
                Name = mi.Name
            };
        }
    }
}
