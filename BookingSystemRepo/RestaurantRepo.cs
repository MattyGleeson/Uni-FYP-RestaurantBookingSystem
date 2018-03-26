using System;
using System.Collections.Generic;
using System.Text;
using LibBookingService.Dtos;
using System.Net.Http;
using System.Threading.Tasks;
using BookingSystemRepo.Core;
using System.Linq;
using Newtonsoft.Json;

namespace BookingSystemRepo
{
    class RestaurantRepo : GenericRepo, IRepository<Restaurant>
    {
        /// <summary>
        /// Default controller that sets the api controller used by the repo.
        /// </summary>
        RestaurantRepo() : base("Restaurant/")
        {
        }

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

        public async Task<bool> Delete(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }
    }
}
