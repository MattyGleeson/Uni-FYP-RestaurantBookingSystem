using DatabaseContext.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace BookingService.Controllers
{
    [RoutePrefix("Payment")]
    public class PaymentController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public PaymentController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public PaymentController(BookingSystemDb db)
        {
            _db = db;
        }

        /// <summary>
        /// Gets all payments from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Get/{id:int?}")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get(int id = -1)
        {
            if (id != -1)
            {
                Payment res = await _db.Payments.Where(b => b.Id == id && !b.Deleted).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Payment Found With ID");

                LibBookingService.Dtos.Payment payment = CreatePaymentFromDbPayment(res);

                return Request.CreateResponse(HttpStatusCode.OK, payment);
            }
            else
            {
                IEnumerable<Payment> res = await _db.Payments.Where(b => b.Deleted != true).ToListAsync();

                IEnumerable<LibBookingService.Dtos.Payment> payments = res.Select(b => CreatePaymentFromDbPayment(b));

                return payments.Any() ?
                    Request.CreateResponse(HttpStatusCode.OK, payments) :
                    Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Payments");
            }
        }

        /// <summary>
        /// Gets all payment methods from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("GetPaymentMethod/{id:int?}")]
        [HttpGet]
        public async Task<HttpResponseMessage> GetPaymentMethod(int id = -1)
        {
            if (id != -1)
            {
                PaymentMethod res = await _db.PaymentMethods.Where(b => b.Id == id && !b.Deleted).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Payment Method Found With ID");

                LibBookingService.Dtos.PaymentMethod paymentMethod = new LibBookingService.Dtos.PaymentMethod
                {
                    Id = res.Id,
                    Name = res.Name,
                    Active = res.Active
                };

                return Request.CreateResponse(HttpStatusCode.OK, paymentMethod);
            }
            else
            {
                IEnumerable<PaymentMethod> res = await _db.PaymentMethods.Where(b => b.Deleted != true).ToListAsync();

                IEnumerable<LibBookingService.Dtos.PaymentMethod> paymentMethods = res.Select(b => new LibBookingService.Dtos.PaymentMethod
                {
                    Id = b.Id,
                    Name = b.Name,
                    Active = b.Active
                });

                return paymentMethods.Any() ?
                    Request.CreateResponse(HttpStatusCode.OK, paymentMethods) :
                    Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Payment Methods");
            }
        }

        /// <summary>
        /// Posts a payment Dto to the database.
        /// </summary>
        /// <param name="payment"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.Payment payment)
        {
            try
            {
                Payment newPayment = _db.Payments.Add(new Payment
                {
                    Booking_id = payment.BookingId,
                    Customer_id = payment.CustomerId,
                    PaymentMethod_id = payment.PaymentMethod.Id,
                    Amount = payment.Amount,
                    Comments = payment.Comments
                });
                await _db.SaveChangesAsync();
                
                _db.Entry(newPayment).Reload();

                return Request.CreateResponse(HttpStatusCode.OK, CreatePaymentFromDbPayment(newPayment));
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Removes a payment.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Delete/{id:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            try
            {
                Payment payment = await _db.Payments.Where(b => b.Id == id).FirstOrDefaultAsync();
                payment.Deleted = true;

                _db.SetModified(payment);
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Puts a payment to the database.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="payment"></param>
        /// <returns></returns>
        [Route("Update/{id:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int id, LibBookingService.Dtos.Payment payment)
        {
            try
            {
                Payment p = await _db.Payments.Where(bb => bb.Id == id).FirstOrDefaultAsync();

                p.Amount = payment.Amount;
                p.Comments = payment.Comments;
                p.PaymentMethod_id = payment.PaymentMethod.Id;

                _db.SetModified(p);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.Payment res = CreatePaymentFromDbPayment(p);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        private LibBookingService.Dtos.Payment CreatePaymentFromDbPayment(Payment payment)
        {
            return new LibBookingService.Dtos.Payment
            {
                Id = payment.Id,
                Amount = payment.Amount,
                Comments = payment.Comments,
                BookingId = payment.Booking_id,
                CustomerId = payment.Customer_id,
                PaymentMethod = new LibBookingService.Dtos.PaymentMethod
                {
                    Id = payment.PaymentMethod.Id,
                    Name = payment.PaymentMethod.Name
                }
            };
        }
    }
}
