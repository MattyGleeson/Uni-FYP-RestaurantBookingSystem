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
    public class RestaurantFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public RestaurantFacade() : base("Restaurant/")
        {
        }

        /// <summary>
        /// Returns an IEnumerable of restaurants from the web api.
        /// </summary>
        /// <returns></returns>
        public async Task<List<Restaurant>> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<Restaurant> res = await ExecuteRequestList<Restaurant>(request);

                return res.Any()
                    ? res.ToList()
                    : new List<Restaurant>();
            }
            catch (Exception ex)
            {
                return new List<Restaurant>();
            }
        }

        /// <summary>
        /// Returns a restaurant model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Restaurant> FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequest<Restaurant>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}