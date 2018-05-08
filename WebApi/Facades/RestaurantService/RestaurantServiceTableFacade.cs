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

namespace WebApi.Facades.RestaurantService
{
    public class RestaurantServiceTableFacade : GenericServiceFacade
    {
        //private readonly string _baseUrl = "https://bookingrestaurantservice.azurewebsites.net/Table/";
        private readonly string _baseUrl = "http://localhost:57565/Table/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public RestaurantServiceTableFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public RestaurantServiceTableFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Returns an IQueryable of tables from the restaurant service.
        /// </summary>
        /// <returns></returns>
        public async Task<IQueryable<Table>> GetTables()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IQueryable<Table> res = await ExecuteRequestAsyncList<Table>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<Table>().AsQueryable();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<Table>().AsQueryable();
            }
        }

        /// <summary>
        /// Returns a table with the id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Table> GetTableById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<Table>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a table to the service and returns the updated model.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        public async Task<Table> PostTable(Table restaurant)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(restaurant), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Table>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Updates a table and returns the updated model.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        public async Task<Table> UpdateTable(Table restaurant)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + restaurant.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(restaurant), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Table>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes the table with the id parameter.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> RemoveTable(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }
    }
}