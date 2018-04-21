using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace WebApi.Controllers
{
    /// <summary>
    /// Controller to communicate with the menu service type facade.
    /// </summary>
    [Authorize(Roles = "Admin,Manager")]
    [RoutePrefix("api/MenuItemType")]
    public class MenuItemTypeServiceController : ApiController
    {
        /// <summary>
        /// Property of type MenuServiceTypeFacade that the controller endpoints use to access the facade.
        /// </summary>
        protected readonly Facades.MenuService.MenuServiceTypeFacade _facade;

        MenuItemTypeServiceController()
        {
            _facade = new Facades.MenuService.MenuServiceTypeFacade();
        }

        /// <summary>
        /// Endpoint to get a list of menu item types.
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        [Route("Get")]
        public async Task<HttpResponseMessage> Get()
        {
            IEnumerable<MenuItemType> menuItemTypes = await _facade.GetMenuItemTypes();

            if (menuItemTypes.Any())
                return Request.CreateResponse(HttpStatusCode.OK, menuItemTypes);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Menu Item Types Found");
        }

        /// <summary>
        /// Endpoint to get a menu item type by id.
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        [Route("Get/{id:int?}")]
        public async Task<HttpResponseMessage> Get(int id)
        {
            MenuItemType menuItemType = await _facade.GetMenuItemTypeById(id);

            if (menuItemType != null)
                return Request.CreateResponse(HttpStatusCode.OK, menuItemType);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Menu Item Type Found For Id");
        }

        /// <summary>
        /// Endpoint to post a menu item type.
        /// </summary>
        /// <param name="menuItemType"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Post")]
        public async Task<HttpResponseMessage> Post(MenuItemType menuItemType)
        {
            MenuItemType newMenuItem = await _facade.PostMenuItemType(menuItemType);

            if (newMenuItem != null)
                return Request.CreateResponse(HttpStatusCode.OK, newMenuItem);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to update a menu item type.
        /// </summary>
        /// <param name="menuItemType"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("Update")]
        public async Task<HttpResponseMessage> Update(MenuItemType menuItemType)
        {
            MenuItemType updatedMenuItem = await _facade.UpdateMenuItemType(menuItemType);

            if (updatedMenuItem != null)
                return Request.CreateResponse(HttpStatusCode.OK, updatedMenuItem);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Updating");
        }

        /// <summary>
        /// Endpoint to delete a menu item type.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("Delete/{id:int?}")]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            bool res = await _facade.RemoveMenuItemType(id);

            if (res)
                return Request.CreateResponse(HttpStatusCode.OK);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Deleting");
        }
    }
}
