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
    /// Controller to communicate with the menu service diet info facade.
    /// </summary>
    [Authorize(Roles = "Admin,Manager")]
    [RoutePrefix("api/DietInfo")]
    public class DietInfoServiceController : ApiController
    {
        /// <summary>
        /// Property of type MenuServiceDietInfoFacade that the controller endpoints use to access the facade.
        /// </summary>
        protected readonly Facades.MenuService.MenuServiceDietInfoFacade _facade;

        DietInfoServiceController()
        {
            _facade = new Facades.MenuService.MenuServiceDietInfoFacade();
        }

        /// <summary>
        /// Endpoint to get a list of diet info.
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        [Route("Get")]
        public async Task<HttpResponseMessage> Get()
        {
            IEnumerable<DietInfo> dietInfo = await _facade.GetDietInfo();

            if (dietInfo.Any())
                return Request.CreateResponse(HttpStatusCode.OK, dietInfo);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Diet Info Found");
        }

        /// <summary>
        /// Endpoint to get a diet info by id.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("Get/{id:int?}")]
        public async Task<HttpResponseMessage> Get(int id)
        {
            DietInfo dietInfo = await _facade.GetDietInfoById(id);

            if (dietInfo != null)
                return Request.CreateResponse(HttpStatusCode.OK, dietInfo);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Diet Info Found For Id");
        }

        /// <summary>
        /// Endpoint to post diet info.
        /// </summary>
        /// <param name="dietInfo"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Post")]
        public async Task<HttpResponseMessage> Post(DietInfo dietInfo)
        {
            DietInfo newDietInfo = await _facade.PostDietInfo(dietInfo);

            if (newDietInfo != null)
                return Request.CreateResponse(HttpStatusCode.OK, newDietInfo);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to update a menu item type.
        /// </summary>
        /// <param name="dietInfo"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("Update")]
        public async Task<HttpResponseMessage> Update(DietInfo dietInfo)
        {
            DietInfo updatedDietInfo = await _facade.UpdateDietInfo(dietInfo);

            if (updatedDietInfo != null)
                return Request.CreateResponse(HttpStatusCode.OK, updatedDietInfo);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Updating");
        }

        /// <summary>
        /// Endpoint to delete a menu item type.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("Delete/{id:int?}")]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            bool res = await _facade.RemoveDietInfo(id);

            if (res)
                return Request.CreateResponse(HttpStatusCode.OK);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Deleting");
        }
    }
}
