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

namespace WebApi.Facades.MenuService
{
    /// <summary>
    /// Facade that handles interactions between the web api and the menu service diet info controller.
    /// </summary>
    public class MenuServiceDietInfoFacade : GenericServiceFacade
    {
        private readonly string _baseUrl = "https://bookingmenuservice.azurewebsites.net/DietInfo/";
        //private readonly string _baseUrl = "http://localhost:57656/DietInfo/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public MenuServiceDietInfoFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public MenuServiceDietInfoFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Returns an IQueryable of diet info from the menu service.
        /// </summary>
        /// <returns></returns>
        public async Task<IQueryable<DietInfo>> GetDietInfo()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IQueryable<DietInfo> res = await ExecuteRequestAsyncList<DietInfo>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<DietInfo>().AsQueryable();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<DietInfo>().AsQueryable();
            }
        }

        /// <summary>
        /// Returns a diet info Dto with the id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<DietInfo> GetDietInfoById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<DietInfo>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a diet info Dto to the service and returns the updated model.
        /// </summary>
        /// <param name="dietInfo"></param>
        /// <returns></returns>
        public async Task<DietInfo> PostDietInfo(DietInfo dietInfo)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(dietInfo), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<DietInfo>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Updates a diet info Dto and returns the updated model.
        /// </summary>
        /// <param name="dietInfo"></param>
        /// <returns></returns>
        public async Task<DietInfo> UpdateDietInfo(DietInfo dietInfo)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + dietInfo.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(dietInfo), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<DietInfo>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes the diet info with the id parameter.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> RemoveDietInfo(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }
    }
}