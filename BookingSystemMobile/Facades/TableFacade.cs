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
    public class TableFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public TableFacade() : base("Table/")
        {
        }

        /// <summary>
        /// Returns an IEnumerable of tables from the web api.
        /// </summary>
        /// <returns></returns>
        public async Task<List<Table>> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<Table> res = await ExecuteRequestList<Table>(request);

                return res.Any()
                    ? res.ToList()
                    : new List<Table>();
            }
            catch (Exception ex)
            {
                return new List<Table>();
            }
        }

        /// <summary>
        /// Returns a table model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Table> FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequest<Table>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}