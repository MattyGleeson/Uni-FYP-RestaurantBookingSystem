using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using WebApi.Facades.Core;

namespace WebApi.Facades.RestaurantService
{
    /// <summary>
    /// Facade that handles interactions between the web api and the restaurant service company controller.
    /// </summary>
    public class RestaurantServiceCompanyFacade : GenericServiceFacade
    {
        private readonly string _baseUrl = "https://bookingrestaurantservice.azurewebsites.net/Company/";
        //private readonly string _baseUrl = "http://localhost:57565/Company/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public RestaurantServiceCompanyFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public RestaurantServiceCompanyFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Returns a company with the id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Company> GetCompany()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                return await ExecuteRequestAsync<Company>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}