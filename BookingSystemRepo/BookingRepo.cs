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
    class BookingRepo : GenericRepo, IRepository<Booking>
    {
        /// <summary>
        /// Default controller that sets the api controller used by the repo.
        /// </summary>
        BookingRepo() : base("Booking/")
        {
        }

        public async Task<IEnumerable<Booking>> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<Booking> res = await ExecuteRequestAsyncList<Booking>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<Booking>();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<Booking>();
            }
        }

        public async Task<Booking> FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<Booking>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<Booking> Create(Booking model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Booking>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<Booking> Update(Booking model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + model.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Booking>(request);
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
