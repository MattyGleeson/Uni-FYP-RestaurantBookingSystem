using CustomerService.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace CustomerService.Controllers
{
    [RoutePrefix("Customer")]
    public class CustomerController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public CustomerController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public CustomerController(BookingSystemDb db)
        {
            this._db = db;
        }

        /// <summary>
        /// Gets a customer from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Get/{id:int}")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get(int id = -1)
        {
            Data.Customer res = await _db.Customers.Where(c => c.id == id && !c.deleted).FirstOrDefaultAsync();

            if (res == null)
                return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Customer Found With ID");

            LibBookingService.Dtos.Customer customer = CreateCustomerFromDbCustomer(res);

            return Request.CreateResponse(HttpStatusCode.OK, customer);
        }

        /// <summary>
        /// Posts a customer Dto to the database.
        /// </summary>
        /// <param name="customer"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.Customer customer)
        {
            try
            {
                Customer newCustomer = _db.Customers.Add(new Customer
                {
                    
                });
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, CreateCustomerFromDbCustomer(newCustomer));
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Removes a customer.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Delete/{id:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            try
            {
                Customer customer = await _db.Customers.Where(m => m.id == id).FirstOrDefaultAsync();
                customer.deleted = true;

                _db.SetModified(customer);
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Puts a customer to the database.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="customer"></param>
        /// <returns></returns>
        [Route("Update/{id:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int id, LibBookingService.Dtos.Customer customer)
        {
            try
            {
                Customer c = await _db.Customers.Where(m => m.id == id).FirstOrDefaultAsync();

                

                _db.SetModified(c);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.Customer res = CreateCustomerFromDbCustomer(c);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Checks if a customer is in the database and returns true or false.
        /// </summary>
        /// <param name="customer"></param>
        /// <returns></returns>
        [Route("IsCustomer")]
        [HttpGet]
        public async Task<HttpResponseMessage> IsCustomer(Customer customer)
        {
            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Not Finished");
        }

        /// <summary>
        /// Returns a customer model using the database customer parameter.
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.Customer CreateCustomerFromDbCustomer(Data.Customer c)
        {
            return new LibBookingService.Dtos.Customer
            {
                Id = c.id,
                Title = c.title,
                Forename = c.forename,
                Surname = c.surname,
                AddressStreet = c.addressStreet,
                AddressTown = c.addressTown,
                AddressCounty = c.addressCounty,
                AddressPostalCode = c.addressPostalCode,
                DoB = c.dob,
                Email = c.email,
                MobilePhoneNo = c.mobilePhoneNo,
                HomePhoneNo = c.homePhoneNo,
                WorkPhoneNo = c.workPhoneNo,
                Bookings = c.Bookings.Select(b => new LibBookingService.Dtos.Booking
                {
                    Id = b.id,
                    CustomerId = b.customer_id,
                    RestaurantId = b.restaurant_id,
                    BookingMadeDate = b.bookingMadeDate,
                    BookingMadeTime = b.bookingMadeTime,
                    BookingDate = b.bookingDate,
                    StartTime = b.startTime,
                    EndTime = b.endTime,
                    NoCustomers = b.noCustomers,
                    PaymentMadeDate = b.paymentMadeDate,
                    PaymentTotal = b.paymentTotal,
                    Comments = b.comments,
                    Cancelled = b.cancelled
                }),
                Payments = c.Payments.Select(p => new LibBookingService.Dtos.Payment
                {
                    Id = p.id,
                    BookingId = p.booking_id,
                    CustomerId = p.customer_id,
                    Amount = p.amount,
                    Comments = p.comments,
                    PaymentMethod = new LibBookingService.Dtos.PaymentMethod
                    {
                        Id = p.PaymentMethod.id,
                        Name = p.PaymentMethod.active ? p.PaymentMethod.name : p.PaymentMethod.name + " (Inactive)"
                    }
                })
            };
        }
    }
}
