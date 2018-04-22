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
    public class DietInfoFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public DietInfoFacade() : base("DietInfo/")
        {
        }

        /// <summary>
        /// Returns an IEnumerable of diet info from the web api.
        /// </summary>
        /// <returns></returns>
        public async Task<List<DietInfo>> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<DietInfo> res = await ExecuteRequestList<DietInfo>(request);

                return res.Any()
                    ? res.ToList()
                    : new List<DietInfo>();
            }
            catch (Exception ex)
            {
                return new List<DietInfo>();
            }
        }

        /// <summary>
        /// Returns a diet info model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<DietInfo> FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequest<DietInfo>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}