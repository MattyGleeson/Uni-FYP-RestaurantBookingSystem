using System;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using WebApi.Facades.Core;
using LibBookingService.Dtos;
using Newtonsoft.Json;
using System.Text;

namespace WebApi.Facades
{
    /// <summary>
    /// Facade that handles interactions between the web api and the restaurant service.
    /// </summary>
    public class RestaurantServiceFacade : GenericServiceFacade
    {
        private readonly string _baseUrl = "http://localhost:57565/";
        private readonly string _restaurantInfoUrl = "Restaurant/";
        private readonly string _companyInfoUrl = "Company/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public RestaurantServiceFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public RestaurantServiceFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Returns a restaurant with the id parameter
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
                    RequestUri = new Uri(_baseUrl + _companyInfoUrl + "Get")
                };

                return await ExecuteRequestAsync<Company>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns an IQueryable of restaurants from the restaurant service.
        /// </summary>
        /// <returns></returns>
        public async Task<IQueryable<Restaurant>> GetRestaurants()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + _restaurantInfoUrl + "Get")
                };

                IQueryable<Restaurant> res = await ExecuteRequestAsyncList<Restaurant>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<Restaurant>().AsQueryable();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<Restaurant>().AsQueryable();
            }
        }

        /// <summary>
        /// Returns a restaurant with the id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Restaurant> GetRestaurantById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + _restaurantInfoUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<Restaurant>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a restaurant to the service and returns the updated model.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        public async Task<Restaurant> PostRestaurant(Restaurant restaurant)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + _restaurantInfoUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(restaurant), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Restaurant>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Updates a restaurant and returns the updated model.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        public async Task<Restaurant> UpdateRestaurant(Restaurant restaurant)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + _restaurantInfoUrl + "Update/" + restaurant.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(restaurant), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Restaurant>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes the restaurant with the id parameter.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> RemoveRestaurant(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + _restaurantInfoUrl + "Delete/" + id));
        }
    }
}