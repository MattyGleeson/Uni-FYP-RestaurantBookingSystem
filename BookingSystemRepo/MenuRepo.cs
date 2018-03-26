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
    class MenuRepo : GenericRepo, IRepository<MenuItem>
    {
        /// <summary>
        /// Default controller that sets the api controller used by the repo.
        /// </summary>
        MenuRepo() : base("Menu/")
        {
        }

        public async Task<IEnumerable<MenuItem>> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<MenuItem> res = await ExecuteRequestAsyncList<MenuItem>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<MenuItem>();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<MenuItem>();
            }
        }

        public async Task<MenuItem> FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<MenuItem>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<MenuItem> Create(MenuItem model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<MenuItem>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<MenuItem> Update(MenuItem model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + model.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<MenuItem>(request);
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
