using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using WebApi.Facades.BookingService;

namespace WebApi.Controllers
{
    /// <summary>
    /// Controller to communicate with the booking service facade.
    /// </summary>
    [Authorize]
    [RoutePrefix("api/Payment")]
    public class PaymentServiceController : ApiController
    {
        /// <summary>
        /// Property of type PaymentServiceFacade that the controller endpoints use to access the facade.
        /// </summary>
        protected readonly PaymentServiceFacade _facade;

        PaymentServiceController()
        {
            _facade = new PaymentServiceFacade();
        }

        /// <summary>
        /// Endpoint to get a list of payments.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("Get")]
        public async Task<HttpResponseMessage> Get()
        {
            IEnumerable<Payment> payments = await _facade.GetPayments();

            if (payments.Any())
                return Request.CreateResponse(HttpStatusCode.OK, payments);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Payments Found");
        }

        /// <summary>
        /// Endpoint to get a payment by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("Get/{id:int?}")]
        public async Task<HttpResponseMessage> Get(int id)
        {
            Payment payment = await _facade.GetPaymentById(id);

            if (payment != null)
                return Request.CreateResponse(HttpStatusCode.OK, payment);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Payment Found For Id");
        }

        /// <summary>
        /// Endpoint to get a list of payment methods.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetPaymentMethod")]
        public async Task<HttpResponseMessage> GetPaymentMethod()
        {
            IEnumerable<PaymentMethod> paymentMethods = await _facade.GetPaymentMethods();

            if (paymentMethods.Any())
                return Request.CreateResponse(HttpStatusCode.OK, paymentMethods);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Payment Methods Found");
        }

        /// <summary>
        /// Endpoint to get a payment by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("GetPaymentMethod/{id:int?}")]
        public async Task<HttpResponseMessage> GetPaymentMethod(int id)
        {
            PaymentMethod paymentMethod = await _facade.GetPaymentMethodById(id);

            if (paymentMethod != null)
                return Request.CreateResponse(HttpStatusCode.OK, paymentMethod);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Booking Found For Id");
        }

        /// <summary>
        /// Endpoint to post a payment.
        /// </summary>
        /// <param name="payment"></param>
        /// <returns></returns>
        [Authorize]
        [HttpPost]
        [Route("Post")]
        public async Task<HttpResponseMessage> Post(Payment payment)
        {
            Payment newPayment = await _facade.PostPayment(payment);

            if (newPayment != null)
                return Request.CreateResponse(HttpStatusCode.OK, newPayment);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to update a payment.
        /// </summary>
        /// <param name="payment"></param>
        /// <returns></returns>
        [Authorize]
        [HttpPut]
        [Route("Update")]
        public async Task<HttpResponseMessage> Update(Payment payment)
        {
            Payment updatedPayment = await _facade.UpdatePayment(payment);

            if (updatedPayment != null)
                return Request.CreateResponse(HttpStatusCode.OK, updatedPayment);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Updating");
        }

        /// <summary>
        /// Endpoint to delete a payment.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Authorize]
        [HttpDelete]
        [Route("Delete/{id:int?}")]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            bool res = await _facade.RemovePayment(id);

            if (res)
                return Request.CreateResponse(HttpStatusCode.OK);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Deleting");
        }
    }
}
