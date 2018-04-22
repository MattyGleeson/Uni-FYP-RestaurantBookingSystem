using BookingSystemMobile.Facades.Core;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace BookingSystemMobile.Facades
{
    public class CompanyFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public CompanyFacade() : base("Company/")
        {
        }

        /// <summary>
        /// Returns a company model from the web api.
        /// </summary>
        /// <returns></returns>
        public async Task<Company> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                Company res = await ExecuteRequest<Company>(request);

                return res ?? null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}