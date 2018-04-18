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
    [Authorize]
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
        [Authorize]
        [HttpGet]
        [Route("Get/{id:int?}")]
        public async Task<HttpResponseMessage> Get(int id)
        {
            var identity = User.Identity as ClaimsIdentity;
            Customer customer = await _facade.GetCustomer(id);

            var owinId = identity.Claims.Where(c => c.Type == "UserId").Select(c => c.Value).FirstOrDefault();
            var username = identity.Claims.Where(c => c.Type == ClaimTypes.Name).Select(c => c.Value).FirstOrDefault();

            if (customer != null && customer.OwinUserId == owinId && customer.UserName == username)
                return Request.CreateResponse(HttpStatusCode.OK, customer);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Customer Found For Id");
        }

        /// <summary>
        /// Endpoint to get a customer by username and owin id.
        /// </summary>
        /// <returns></returns>
        [Authorize]
        [HttpGet]
        [Route("GetByAuth")]
        public async Task<HttpResponseMessage> GetByAuth()
        {
            var identity = User.Identity as ClaimsIdentity;
            var owinId = identity.Claims.Where(c => c.Type == "UserId").Select(c => c.Value).FirstOrDefault();
            var username = identity.Claims.Where(c => c.Type == ClaimTypes.Name).Select(c => c.Value).FirstOrDefault();

            Customer cust = await _facade.GetCustomer(owinId, username);

            if (cust != null)
                return Request.CreateResponse(HttpStatusCode.OK, cust);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Customer Found For Id");
        }

        /// <summary>
        /// Endpoint to post a customer.
        /// </summary>
        /// <param name="customer"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Post")]
        public async Task<HttpResponseMessage> Post(Customer customer)
        {
            Customer newCustomer = await _facade.PostCustomer(customer);

            if (newCustomer != null)
                return Request.CreateResponse(HttpStatusCode.OK, newCustomer);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to update a customer.
        /// </summary>
        /// <param name="customer"></param>
        /// <returns></returns>
        [Authorize]
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
        [Authorize]
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
