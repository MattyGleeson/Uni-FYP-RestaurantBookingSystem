using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Http;

namespace WebApi.Controllers
{
    /// <summary>
    /// Controller to communicate with the customer service facade.
    /// </summary>
    [RoutePrefix("api/Customer")]
    public class CustomerServiceController : ApiController
    {
        /// <summary>
        /// Property of type CustomerServiceFacade that the controller endpoints use to access the facade.
        /// </summary>
        protected readonly Facades.CustomerServiceFacade _facade;

        CustomerServiceController()
        {
            _facade = new Facades.CustomerServiceFacade();
        }

        [Authorize(Roles = "Admin")]
        [Route("")]
        public IEnumerable<object> GetClaims()
        {
            var identity = User.Identity as ClaimsIdentity;

            return identity.Claims.Select(c => new
            {
                Type = c.Type,
                Value = c.Value
            });
        }

        /// <summary>
        /// Endpoint to get a customer by id.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("Get/{id:int?}")]
        public async Task<HttpResponseMessage> Get(int id)
        {
            Customer customer = await _facade.GetCustomer(id);

            if (customer != null)
                return Request.CreateResponse(HttpStatusCode.OK, customer);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Customer Found For Id");
        }

        /// <summary>
        /// Endpoint to post a customer.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Post")]
        public async Task<HttpResponseMessage> Post(Customer restaurant)
        {
            Customer newCustomer = await _facade.PostCustomer(restaurant);

            if (newCustomer != null)
                return Request.CreateResponse(HttpStatusCode.OK, newCustomer);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to update a customer.
        /// </summary>
        /// <param name="customer"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("Update")]
        public async Task<HttpResponseMessage> Update(Customer customer)
        {
            Customer updatedCustomer = await _facade.UpdateCustomer(customer);

            if (updatedCustomer != null)
                return Request.CreateResponse(HttpStatusCode.OK, updatedCustomer);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Updating");
        }

        /// <summary>
        /// Endpoint to delete a customer.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("Delete/{id:int?}")]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            bool res = await _facade.RemoveRestaurant(id);

            if (res)
                return Request.CreateResponse(HttpStatusCode.OK);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Deleting");
        }
    }
}
