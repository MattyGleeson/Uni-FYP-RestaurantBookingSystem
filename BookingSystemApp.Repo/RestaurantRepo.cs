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
        public async Task<IEnumerable<Restaurant>> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<Restaurant> res = await ExecuteRequestAsyncList<Restaurant>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<Restaurant>();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<Restaurant>();
            }
        }

        //public IEnumerable<Restaurant> Get()
        //{
        //    try
        //    {
        //        var res = new List<Restaurant>().AsEnumerable();

        //        using (var client = new HttpClient())
        //        {
        //            client.BaseAddress = new System.Uri("http://localhost:64577/");
        //            client.DefaultRequestHeaders.Accept.ParseAdd("application/json");

        //            HttpResponseMessage response = client.GetAsync("api/Restaurant/Get").Result;

        //            if (response.IsSuccessStatusCode)
        //            {
        //                var responseContent = response.Content;

        //                // by calling .Result you are synchronously reading the result
        //                string responseString = responseContent.ReadAsStringAsync().Result;

        //                res = JsonConvert.DeserializeObject<List<Restaurant>>(responseString, _serializerSettings);

        //                Console.WriteLine(responseString);
        //            }
        //        }

        //        return res.Any()
        //            ? res
        //            : Enumerable.Empty<Restaurant>();
        //    }
        //    catch (Exception ex)
        //    {
        //        return Enumerable.Empty<Restaurant>();
        //    }
        //}

        /// <summary>
        /// Returns a restaurant model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Restaurant> FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<Restaurant>(request);
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
        public async Task<Restaurant> Create(Restaurant model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Restaurant>(request);
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
        public async Task<Restaurant> Update(Restaurant model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + model.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Restaurant>(request);
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
        public async Task<bool> Delete(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }
    }
}
