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
    public class RestaurantFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public RestaurantFacade() : base("Restaurant/")
        {
        }

        /// <summary>
        /// Returns an IEnumerable of restaurants from the web api.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Restaurant> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<Restaurant> res = ExecuteRequestList<Restaurant>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<Restaurant>();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<Restaurant>();
            }
        }

        /// <summary>
        /// Returns a restaurant model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Restaurant FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return ExecuteRequest<Restaurant>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a restaurant model to the web api and returns the saved model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public Restaurant Create(Restaurant model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return ExecuteRequest<Restaurant>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Puts a restaurant model to the web api and returns the updated model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public Restaurant Update(Restaurant model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + model.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return ExecuteRequest<Restaurant>(request);
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
        /// Sends an add menu item request to web api and returns true if successful.
        /// </summary>
        /// <param name="restaurantId"></param>
        /// <param name="menuItemId"></param>
        /// <returns></returns>
        public bool AddMenuItemToRestaurant(int restaurantId, int menuItemId)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "AddMenuItem/" + restaurantId + "/" + menuItemId)
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
        /// Sends a delete menu item request to web api and returns true if successful.
        /// </summary>
        /// <param name="restaurantId"></param>
        /// <param name="menuItemId"></param>
        /// <returns></returns>
        public bool RemoveMenuItemFromRestaurant(int restaurantId, int menuItemId)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Delete,
                    RequestUri = new Uri(_baseUrl + "RemoveMenuItem/" + restaurantId + "/" + menuItemId)
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