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
            Data.Customer res = await _db.Customers.Where(c => c.Id == id && !c.Deleted).FirstOrDefaultAsync();

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
                    OwinUserId = customer.OwinUserId,
                    UserName = customer.UserName,
                    Title = customer.Title,
                    Forename = customer.Forename,
                    Surname = customer.Surname,
                    Dob = customer.DoB,
                    AddressStreet = customer.AddressStreet,
                    AddressTown = customer.AddressTown,
                    AddressCounty = customer.AddressCounty,
                    AddressPostalCode = customer.AddressPostalCode,
                    HomePhoneNo = customer.HomePhoneNo,
                    WorkPhoneNo = customer.WorkPhoneNo,
                    MobilePhoneNo = customer.MobilePhoneNo,
                    Email = customer.Email
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
                Customer customer = await _db.Customers.Where(m => m.Id == id).FirstOrDefaultAsync();
                customer.Deleted = true;

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
                Customer c = await _db.Customers.Where(m => m.Id == id).FirstOrDefaultAsync();

                c.OwinUserId = customer.OwinUserId;
                c.UserName = customer.UserName;
                c.Title = customer.Title;
                c.Forename = customer.Forename;
                c.Surname = customer.Surname;
                c.Dob = customer.DoB;
                c.AddressStreet = customer.AddressStreet;
                c.AddressTown = customer.AddressTown;
                c.AddressCounty = customer.AddressCounty;
                c.AddressPostalCode = customer.AddressPostalCode;
                c.HomePhoneNo = customer.HomePhoneNo;
                c.WorkPhoneNo = customer.WorkPhoneNo;
                c.MobilePhoneNo = customer.MobilePhoneNo;
                c.Email = customer.Email;

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
                Id = c.Id,
                Title = c.Title,
                Forename = c.Forename,
                Surname = c.Surname,
                AddressStreet = c.AddressStreet,
                AddressTown = c.AddressTown,
                AddressCounty = c.AddressCounty,
                AddressPostalCode = c.AddressPostalCode,
                DoB = c.Dob,
                Email = c.Email,
                MobilePhoneNo = c.MobilePhoneNo,
                HomePhoneNo = c.HomePhoneNo,
                WorkPhoneNo = c.WorkPhoneNo,
                Bookings = c.Bookings.Select(b => new LibBookingService.Dtos.Booking
                {
                    Id = b.Id,
                    CustomerId = b.Customer_id,
                    RestaurantId = b.Restaurant_id,
                    BookingMadeDate = b.BookingMadeDate,
                    BookingMadeTime = b.BookingMadeTime,
                    BookingDate = b.BookingDate,
                    StartTime = b.StartTime,
                    EndTime = b.EndTime,
                    NoCustomers = b.NoCustomers,
                    PaymentMadeDate = b.PaymentMadeDate,
                    PaymentTotal = b.PaymentTotal,
                    Comments = b.Comments,
                    Cancelled = b.Cancelled
                }),
                Payments = c.Payments.Select(p => new LibBookingService.Dtos.Payment
                {
                    Id = p.Id,
                    BookingId = p.Booking_id,
                    CustomerId = p.Customer_id,
                    Amount = p.Amount,
                    Comments = p.Comments,
                    PaymentMethod = new LibBookingService.Dtos.PaymentMethod
                    {
                        Id = p.PaymentMethod.Id,
                        Name = p.PaymentMethod.Active ? p.PaymentMethod.Name : p.PaymentMethod.Name + " (Inactive)"
                    }
                })
            };
        }
    }
}
