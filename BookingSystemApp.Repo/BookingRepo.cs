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
    class BookingRepo : GenericRepo, IRepository<Booking>
    {
        /// <summary>
        /// Default controller that sets the api controller used by the repo.
        /// </summary>
        BookingRepo() : base("Booking/")
        {
        }

        /// <summary>
        /// Returns an IEnumerable of bookings from the web api.
        /// </summary>
        /// <returns></returns>
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

        /// <summary>
        /// Returns a booking model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Returns an IEnumerable of bookings by customer id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<IEnumerable<Booking>> FindByCustomerId(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<Booking> bookings = await ExecuteRequestAsyncList<Booking>(request);

                bookings = bookings.Where(b => b.CustomerId == id);

                return bookings;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a booking model to the web api and returns the saved model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Puts a booking model to the web api and returns the updated model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
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
