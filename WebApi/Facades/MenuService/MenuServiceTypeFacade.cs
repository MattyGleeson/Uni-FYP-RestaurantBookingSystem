using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using WebApi.Facades.Core;

namespace WebApi.Facades.MenuService
{
    /// <summary>
    /// Facade that handles interactions between the web api and the menu service category controller.
    /// </summary>
    public class MenuServiceTypeFacade : GenericServiceFacade
    {
        //private readonly string _baseUrl = "https://bookingmenuservice.azurewebsites.net/Category/";
        private readonly string _baseUrl = "http://localhost:57656/Category/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public MenuServiceTypeFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public MenuServiceTypeFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Returns an IQueryable of menu item types from the menu service.
        /// </summary>
        /// <returns></returns>
        public async Task<IQueryable<MenuItemType>> GetMenuItemTypes()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IQueryable<MenuItemType> res = await ExecuteRequestAsyncList<MenuItemType>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<MenuItemType>().AsQueryable();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<MenuItemType>().AsQueryable();
            }
        }

        /// <summary>
        /// Returns a menu item type with the id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<MenuItemType> GetMenuItemTypeById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<MenuItemType>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a menu item type to the service and returns the updated model.
        /// </summary>
        /// <param name="menuItemType"></param>
        /// <returns></returns>
        public async Task<MenuItemType> PostMenuItemType(MenuItemType menuItemType)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(menuItemType), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<MenuItemType>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Updates a menu item type and returns the updated model.
        /// </summary>
        /// <param name="menuItemType"></param>
        /// <returns></returns>
        public async Task<MenuItemType> UpdateMenuItemType(MenuItemType menuItemType)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + menuItemType.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(menuItemType), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<MenuItemType>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes the menu item type with the id parameter.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> RemoveMenuItemType(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }
    }
}