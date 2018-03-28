using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApi.Controllers.Core;
using LibBookingService.Dtos;
using System.Threading.Tasks;

namespace WebApi.Controllers
{
    /// <summary>
    /// Controller to communicate with the menu service facade.
    /// </summary>
    [RoutePrefix("api/Menu")]
    public class MenuServiceController : ApiController
    {
        /// <summary>
        /// Property of type MenuServiceFacade that the controller endpoints use to access the facade.
        /// </summary>
        protected readonly Facades.MenuServiceFacade _facade;

        MenuServiceController()
        {
            _facade = new Facades.MenuServiceFacade();
        }

        /// <summary>
        /// Endpoint to get a list of menu items.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("Get")]
        public async Task<HttpResponseMessage> Get()
        {
            IEnumerable<MenuItem> menuItems = await _facade.GetMenuItems();

            if (menuItems.Any())
                return Request.CreateResponse(HttpStatusCode.OK, menuItems);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Menu Items Found");
        }

        /// <summary>
        /// Endpoint to get a menu item by id.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("Get/{id:int?}")]
        public async Task<HttpResponseMessage> Get(int id)
        {
            MenuItem menuItem = await _facade.GetMenuItemById(id);

            if (menuItem != null)
                return Request.CreateResponse(HttpStatusCode.OK, menuItem);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Menu Item Found For Id");
        }

        /// <summary>
        /// Endpoint to post a menu item.
        /// </summary>
        /// <param name="menuItem"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Post")]
        public async Task<HttpResponseMessage> Post(MenuItem menuItem)
        {
            MenuItem newMenuItem = await _facade.PostMenuItem(menuItem);

            if (newMenuItem != null)
                return Request.CreateResponse(HttpStatusCode.OK, newMenuItem);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to update a menu item.
        /// </summary>
        /// <param name="menuItem"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("Update")]
        public async Task<HttpResponseMessage> Update(MenuItem menuItem)
        {
            MenuItem updatedMenuItem = await _facade.UpdateMenuItem(menuItem);

            if (updatedMenuItem != null)
                return Request.CreateResponse(HttpStatusCode.OK, updatedMenuItem);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Updating");
        }

        /// <summary>
        /// Endpoint to delete a menu item.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("Delete/{id:int?}")]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            bool res = await _facade.RemoveMenuItem(id);

            if (res)
                return Request.CreateResponse(HttpStatusCode.OK);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Deleting");
        }
    }
}
