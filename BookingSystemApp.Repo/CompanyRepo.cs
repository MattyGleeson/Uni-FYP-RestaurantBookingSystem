using BookingSystemApp.Repo.Core;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BookingSystemApp.Repo
{
    public class CompanyRepo : GenericRepo
    {
        /// <summary>
        /// Default controller that sets the api controller used by the repo.
        /// </summary>
        public CompanyRepo() : base("Company/")
        {
        }

        /// <summary>
        /// Returns a company model from the web api.
        /// </summary>
        /// <returns></returns>
        public Company Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                Company res = ExecuteRequest<Company>(request);

                return res ?? null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
