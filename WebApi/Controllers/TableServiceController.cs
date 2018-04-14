using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace WebApi.Controllers
{
    /// <summary>
    /// Controller to communicate with the table service facade.
    /// </summary>
    [Authorize(Roles = "Admin,Manager")]
    [AllowAnonymous]
    [RoutePrefix("api/Table")]
    public class TableServiceController : ApiController
    {
        /// <summary>
        /// Property of type RestaurantServiceTableFacade that the controller endpoints use to access the facade.
        /// </summary>
        protected readonly Facades.RestaurantService.RestaurantServiceTableFacade _facade;

        TableServiceController()
        {
            _facade = new Facades.RestaurantService.RestaurantServiceTableFacade();
        }

        /// <summary>
        /// Endpoint to get a list of tables.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("Get")]
        public async Task<HttpResponseMessage> Get()
        {
            IEnumerable<Table> tables = await _facade.GetTables();

            if (tables.Any())
                return Request.CreateResponse(HttpStatusCode.OK, tables);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Tables Found");
        }

        /// <summary>
        /// Endpoint to get a table by id.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("Get/{id:int?}")]
        public async Task<HttpResponseMessage> Get(int id)
        {
            Table table = await _facade.GetTableById(id);

            if (table != null)
                return Request.CreateResponse(HttpStatusCode.OK, table);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Table Found For Id");
        }

        /// <summary>
        /// Endpoint to post a table.
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Post")]
        public async Task<HttpResponseMessage> Post(Table table)
        {
            Table newTable = await _facade.PostTable(table);

            if (newTable != null)
                return Request.CreateResponse(HttpStatusCode.OK, newTable);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to update a table.
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("Update")]
        public async Task<HttpResponseMessage> Update(Table table)
        {
            Table updatedTable = await _facade.UpdateTable(table);

            if (updatedTable != null)
                return Request.CreateResponse(HttpStatusCode.OK, updatedTable);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Updating");
        }

        /// <summary>
        /// Endpoint to delete a table.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("Delete/{id:int?}")]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            bool res = await _facade.RemoveTable(id);

            if (res)
                return Request.CreateResponse(HttpStatusCode.OK);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Deleting");
        }
    }
}
