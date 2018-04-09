using BookingSystemApp.Facades.Core;
using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;

namespace BookingSystemApp.Facades
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
        public Customer Get(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return ExecuteRequest<Customer>(request);
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
        public Customer Create(Customer model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return ExecuteRequest<Customer>(request);
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
        public Customer Update(Customer model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + model.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return ExecuteRequest<Customer>(request);
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