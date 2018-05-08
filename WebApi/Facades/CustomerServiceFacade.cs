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

namespace WebApi.Facades
{
    /// <summary>
    /// Facade that handles interactions between the web api and the customer service.
    /// </summary>
    public class CustomerServiceFacade : GenericServiceFacade
    {
        //private readonly string _baseUrl = "https://bookingcustomerservice.azurewebsites.net/";
        private readonly string _baseUrl = "http://localhost:55826/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public CustomerServiceFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public CustomerServiceFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Returns a customer from the customer service.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Customer> GetCustomer(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<Customer>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns a customer from the customer service.
        /// </summary>
        /// <param name="owinId"></param>
        /// <param name="username"></param>
        /// <returns></returns>
        public async Task<Customer> GetCustomer(string owinId, string username)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "GetByAuth"),
                    Content = new StringContent(JsonConvert.SerializeObject(new Customer { OwinUserId = owinId, UserName = username }), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Customer>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a customer to the service and returns the updated model.
        /// </summary>
        /// <param name="customer"></param>
        /// <returns></returns>
        public async Task<Customer> PostCustomer(Customer customer)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(customer), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Customer>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Updates a customer and returns the updated model.
        /// </summary>
        /// <param name="customer"></param>
        /// <returns></returns>
        public async Task<Customer> UpdateCustomer(Customer customer)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + customer.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(customer), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Customer>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes the customer with the id parameter.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> RemoveRestaurant(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }
    }
}