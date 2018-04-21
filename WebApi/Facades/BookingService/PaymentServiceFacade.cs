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

namespace WebApi.Facades.BookingService
{
    /// <summary>
    /// Facade that handles interactions between the web api and the payment controller on the booking service.
    /// </summary>
    public class PaymentServiceFacade : GenericServiceFacade
    {
        private readonly string _baseUrl = "https://bookingbookingservice.azurewebsites.net/Payment/";
        //private readonly string _baseUrl = "http://localhost:57465/Payment/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public PaymentServiceFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public PaymentServiceFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Returns an IQueryable of payments from the booking service.
        /// </summary>
        /// <returns></returns>
        public async Task<IQueryable<Payment>> GetPayments()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IQueryable<Payment> res = await ExecuteRequestAsyncList<Payment>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<Payment>().AsQueryable();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<Payment>().AsQueryable();
            }
        }

        /// <summary>
        /// Returns a payment with the id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Payment> GetPaymentById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<Payment>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns an IQueryable of payment methods from the booking service.
        /// </summary>
        /// <returns></returns>
        public async Task<IQueryable<PaymentMethod>> GetPaymentMethods()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "GetPaymentMethod")
                };

                IQueryable<PaymentMethod> res = await ExecuteRequestAsyncList<PaymentMethod>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<PaymentMethod>().AsQueryable();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<PaymentMethod>().AsQueryable();
            }
        }

        /// <summary>
        /// Returns a payment method with the id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<PaymentMethod> GetPaymentMethodById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "GetPaymentMethod/" + id)
                };

                return await ExecuteRequestAsync<PaymentMethod>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a payment to the service and returns the updated model.
        /// </summary>
        /// <param name="payment"></param>
        /// <returns></returns>
        public async Task<Payment> PostPayment(Payment payment)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(payment), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Payment>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Updates a payment and returns the updated model.
        /// </summary>
        /// <param name="payment"></param>
        /// <returns></returns>
        public async Task<Payment> UpdatePayment(Payment payment)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + payment.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(payment), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Payment>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes the payment with the id parameter.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> RemovePayment(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }
    }
}