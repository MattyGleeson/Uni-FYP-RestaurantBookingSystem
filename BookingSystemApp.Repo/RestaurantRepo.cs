using BookingSystemApp.Repo.Core;
using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BookingSystemApp.Repo
{
    public class RestaurantRepo : GenericRepo, IRepository<Restaurant>
    {
        /// <summary>
        /// Default controller that sets the api controller used by the repo.
        /// </summary>
        public RestaurantRepo() : base("Restaurant/")
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
    }
}
