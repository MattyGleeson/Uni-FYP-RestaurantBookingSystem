using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using WebApi.Facades.Core;
using LibBookingService.Dtos;
using System;
using Newtonsoft.Json;
using System.Text;

namespace WebApi.Facades.BookingService
{
    /// <summary>
    /// Facade that handles interactions between the web api and the booking service.
    /// </summary>
    public class BookingServiceFacade : GenericServiceFacade
    {
        private readonly string _baseUrl = "http://localhost:57465/Booking/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public BookingServiceFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public BookingServiceFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Returns an IQueryable of bookings from the booking service.
        /// </summary>
        /// <returns></returns>
        public async Task<IQueryable<Booking>> GetBookings()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IQueryable<Booking> res = await ExecuteRequestAsyncList<Booking>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<Booking>().AsQueryable();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<Booking>().AsQueryable();
            }
        }

        /// <summary>
        /// Returns a booking with the id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Booking> GetBookingById(int id)
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
        /// Returns a bookings with the customer id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<IQueryable<Booking>> GetBookingsByCustomerId(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "GetByCustomer/" + id)
                };

                return await ExecuteRequestAsyncList<Booking>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns a table that doesn't conflict with other bookings
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        public async Task<Table> GetAvailableTable(Booking booking)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "GetAvailableTable"),
                    Content = new StringContent(JsonConvert.SerializeObject(booking), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Table>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a booking to the service and returns the updated model.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        public async Task<Booking> PostBooking(Booking booking)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(booking), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Booking>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Updates a booking and returns the updated model.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        public async Task<Booking> UpdateBooking(Booking booking)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + booking.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(booking), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Booking>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes the booking with the id parameter.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> RemoveBooking(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }

        /// <summary>
        /// Cancels the booking with the id parameter.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> CancelBooking(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Cancel/" + id));
        }
    }
}