using BookingSystemApp.Facades.Core;
using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;

namespace BookingSystemApp.Facades
{
    public class MenuFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public MenuFacade() : base("Menu/")
        {
        }

        /// <summary>
        /// Returns an IEnumerable of menu items from the web api.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MenuItem> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<MenuItem> res = ExecuteRequestList<MenuItem>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<MenuItem>();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<MenuItem>();
            }
        }

        /// <summary>
        /// Returns a menu item model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public MenuItem FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return ExecuteRequest<MenuItem>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns an IEnumerable of menu items by restaurant id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IEnumerable<MenuItem> FindByRestaurantId(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "GetByRestaurant/" + id)
                };

                IEnumerable<MenuItem> res = ExecuteRequestList<MenuItem>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<MenuItem>();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<MenuItem>();
            }
        }

        /// <summary>
        /// Posts a menu item model to the web api and returns the saved model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public MenuItem Create(MenuItem model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Post"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return ExecuteRequest<MenuItem>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Puts a menu item model to the web api and returns the updated model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public MenuItem Update(MenuItem model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return ExecuteRequest<MenuItem>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Sends a delete request to the web api and returns true if successful.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            return ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }

        /// <summary>
        /// Sends an add diet info request to web api and returns true if successful.
        /// </summary>
        /// <param name="menuItemId"></param>
        /// <param name="dietInfoId"></param>
        /// <returns></returns>
        public bool AddDietInfoToMenuItem(int menuItemId, int dietInfoId)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "AddDietInfo/" + menuItemId + "/" + dietInfoId)
                };

                HttpResponseMessage response = _client.SendAsync(request).Result;
                response.EnsureSuccessStatusCode();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Sends a delete diet info request to web api and returns true if successful.
        /// </summary>
        /// <param name="menuItemId"></param>
        /// <param name="dietInfoId"></param>
        /// <returns></returns>
        public bool RemoveDietInfoFromMenuItem(int menuItemId, int dietInfoId)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Delete,
                    RequestUri = new Uri(_baseUrl + "RemoveDietInfo/" + menuItemId + "/" + dietInfoId)
                };

                HttpResponseMessage response = _client.SendAsync(request).Result;
                response.EnsureSuccessStatusCode();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Sends an add menu item type request to web api and returns true if successful.
        /// </summary>
        /// <param name="menuItemId"></param>
        /// <param name="menuItemTypeId"></param>
        /// <returns></returns>
        public bool AddMenuItemTypeToMenuItem(int menuItemId, int menuItemTypeId)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "AddMenuItemType/" + menuItemId + "/" + menuItemTypeId)
                };

                HttpResponseMessage response = _client.SendAsync(request).Result;
                response.EnsureSuccessStatusCode();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Sends a delete diet info request to web api and returns true if successful.
        /// </summary>
        /// <param name="menuItemId"></param>
        /// <param name="menuItemTypeId"></param>
        /// <returns></returns>
        public bool RemoveMenuItemTypeFromMenuItem(int menuItemId, int menuItemTypeId)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Delete,
                    RequestUri = new Uri(_baseUrl + "RemoveMenuItemType/" + menuItemId + "/" + menuItemTypeId)
                };

                HttpResponseMessage response = _client.SendAsync(request).Result;
                response.EnsureSuccessStatusCode();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}