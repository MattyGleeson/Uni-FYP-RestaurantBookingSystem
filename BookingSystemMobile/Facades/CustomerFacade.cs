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
    public class CustomerFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public CustomerFacade() : base("Customer/")
        {
        }

        /// <summary>
        /// Returns a customer model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Customer> Get(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequest<Customer>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns a customer model using auth.
        /// </summary>
        /// <returns></returns>
        public async Task<Customer> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "GetByAuth")
                };

                return await ExecuteRequest<Customer>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a customer model to the web api and returns the saved model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public async Task<Customer> Create(Customer model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Post"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequest<Customer>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Puts a customer model to the web api and returns the updated model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public async Task<Customer> Update(Customer model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + model.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequest<Customer>(request);
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