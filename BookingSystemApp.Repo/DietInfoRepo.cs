using BookingSystemApp.Repo.Core;
using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BookingSystemApp.Repo
{
    public class DietInfoRepo : GenericRepo, IRepository<DietInfo>
    {
        /// <summary>
        /// Default controller that sets the api controller used by the repo.
        /// </summary>
        public DietInfoRepo() : base("DietInfo/")
        {
        }

        /// <summary>
        /// Returns an IEnumerable of diet info from the web api.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DietInfo> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<DietInfo> res = ExecuteRequestList<DietInfo>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<DietInfo>();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<DietInfo>();
            }
        }

        /// <summary>
        /// Returns a diet info model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public DietInfo FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return ExecuteRequest<DietInfo>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a diet info model to the web api and returns the saved model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DietInfo Create(DietInfo model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Post"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return ExecuteRequest<DietInfo>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Puts a diet info model to the web api and returns the updated model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DietInfo Update(DietInfo model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return ExecuteRequest<DietInfo>(request);
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
