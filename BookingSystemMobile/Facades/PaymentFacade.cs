using BookingSystemMobile.Facades.Core;
using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BookingSystemMobile.Facades
{
    public class PaymentFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public PaymentFacade() : base("Payment/")
        {
        }

        /// <summary>
        /// Returns an IEnumerable of payments from the web api.
        /// </summary>
        /// <returns></returns>
        public async Task<List<Payment>> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<Payment> res = await ExecuteRequestList<Payment>(request);

                return res.Any()
                    ? res.ToList()
                    : new List<Payment>();
            }
            catch (Exception ex)
            {
                return new List<Payment>();
            }
        }

        /// <summary>
        /// Returns a payment model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Payment> FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequest<Payment>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns an IEnumerable of payment methods from the web api.
        /// </summary>
        /// <returns></returns>
        public async Task<List<PaymentMethod>> GetPaymentMethod()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "GetPaymentMethod")
                };

                IEnumerable<PaymentMethod> res = await ExecuteRequestList<PaymentMethod>(request);

                return res.Any()
                    ? res.ToList()
                    : new List<PaymentMethod>();
            }
            catch (Exception ex)
            {
                return new List<PaymentMethod>();
            }
        }

        /// <summary>
        /// Returns a payment method model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<PaymentMethod> FindPaymentMethodById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "GetPaymentMethod/" + id)
                };

                return await ExecuteRequest<PaymentMethod>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a payment model to the web api and returns the saved model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public async Task<Payment> Create(Payment model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Post"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequest<Payment>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Puts a payment model to the web api and returns the updated model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public async Task<Payment> Update(Payment model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + model.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequest<Payment>(request);
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