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
        [Route("api/Menu/Get")]
        public async Task<IEnumerable<MenuItem>> Get()
        {
            return await _facade.GetMenuItems();
        }

        /// <summary>
        /// Endpoint to get a menu item by id.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("api/Menu/Get/{id:int?}")]
        public async Task<MenuItem> Get(int id)
        {
            return await _facade.GetMenuItemById(id);
        }

        /// <summary>
        /// Endpoint to post a menu item.
        /// </summary>
        /// <param name="menuItem"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("api/Menu/Post")]
        public async Task<MenuItem> Post(MenuItem menuItem)
        {
            return await _facade.PostMenuItem(menuItem);
        }

        /// <summary>
        /// Endpoint to update a menu item.
        /// </summary>
        /// <param name="menuItem"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("api/Menu/Update")]
        public async Task<MenuItem> Update(MenuItem menuItem)
        {
            return await _facade.UpdateMenuItem(menuItem);
        }

        /// <summary>
        /// Endpoint to delete a menu item.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("api/Menu/Delete/{id:int?}")]
        public async Task<bool> Delete(int id)
        {
            return await _facade.RemoveMenuItem(id);
        }
    }
}
