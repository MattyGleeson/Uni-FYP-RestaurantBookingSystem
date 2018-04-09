using BookingService.Data;
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
    public class BookingController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public BookingController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public BookingController(BookingSystemDb db)
        {
            this._db = db;
        }

        /// <summary>
        /// Gets all bookings from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Get/{id:int?}")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get(int id = -1)
        {
            if (id != -1)
            {
                Booking res = await _db.Bookings.Where(b => b.id == id && !b.deleted).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Booking Found With ID");

                LibBookingService.Dtos.Booking booking = CreateBoookingFromDbBooking(res);

                return Request.CreateResponse(HttpStatusCode.OK, booking);
            }
            else
            {
                IEnumerable<Booking> res = await _db.Bookings.Where(b => b.deleted != true).ToListAsync();

                IEnumerable<LibBookingService.Dtos.Booking> bookings = res.Select(b => CreateBoookingFromDbBooking(b));

                return bookings.Any() ?
                    Request.CreateResponse(HttpStatusCode.OK, bookings) :
                    Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Bookings");
            }
        }

        /// <summary>
        /// Posts a booking Dto to the database.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.Booking booking)
        {
            try
            {
                Booking newBoooking = _db.Bookings.Add(new Booking
                {
                    customer_id = booking.CustomerId,
                    restaurant_id = booking.RestaurantId,
                    bookingMadeDate = booking.BookingMadeDate,
                    bookingMadeTime = booking.BookingMadeTime,
                    startTime = booking.StartTime,
                    endTime = booking.EndTime,
                    paymentTotal = booking.PaymentTotal,
                    paymentMadeDate = booking.PaymentMadeDate,
                    noCustomers = booking.NoCustomers,
                    comments = booking.Comments,
                    cancelled = booking.Cancelled
                });
                await _db.SaveChangesAsync();

                if (booking.Tables != null)
                {
                    foreach (LibBookingService.Dtos.Table t in booking.Tables)
                    {
                        _db.TableBookings.Add(new TableBooking
                        {
                            table_id = t.Id,
                            booking_id = newBoooking.id
                        });
                        await _db.SaveChangesAsync();
                    }
                }

                if (booking.Payments != null)
                {
                    foreach (LibBookingService.Dtos.Payment p in booking.Payments)
                    {
                        _db.Payments.Add(new Payment
                        {
                            paymentMethod_id = p.PaymentMethod.Id,
                            customer_id = p.CustomerId,
                            booking_id = p.BookingId,
                            amount = p.Amount,
                            comments = p.Comments
                        });
                        await _db.SaveChangesAsync();
                    }
                }

                if (booking.MenuItems != null)
                {
                    foreach (LibBookingService.Dtos.BookingMenuItem m in booking.MenuItems)
                    {
                        _db.BookingMenuItems.Add(new BookingMenuItem
                        {
                            booking_id = newBoooking.id,
                            menuItem_id = m.MenuItemId,
                            quantity = m.Quantity
                        });
                        await _db.SaveChangesAsync();
                    }
                }

                return Request.CreateResponse(HttpStatusCode.OK, CreateBoookingFromDbBooking(newBoooking));
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Removes a booking.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Delete/{id:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            try
            {
                Booking booking = await _db.Bookings.Where(b => b.id == id).FirstOrDefaultAsync();
                booking.deleted = true;

                _db.SetModified(booking);
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Puts a booking to the database.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="booking"></param>
        /// <returns></returns>
        [Route("Update/{id:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int id, LibBookingService.Dtos.Booking booking)
        {
            try
            {
                Booking b = await _db.Bookings.Where(bb => bb.id == id).FirstOrDefaultAsync();

                b.customer_id = booking.CustomerId;
                b.restaurant_id = booking.RestaurantId;
                b.bookingMadeDate = booking.BookingMadeDate;
                b.bookingMadeTime = booking.BookingMadeTime;
                b.startTime = booking.StartTime;
                b.endTime = booking.EndTime;
                b.paymentTotal = booking.PaymentTotal;
                b.paymentMadeDate = booking.PaymentMadeDate;
                b.noCustomers = booking.NoCustomers;
                b.comments = booking.Comments;
                b.cancelled = booking.Cancelled;

                _db.SetModified(b);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.Booking res = CreateBoookingFromDbBooking(b);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Returns a booking model using the database booking parameter.
        /// </summary>
        /// <param name="b"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.Booking CreateBoookingFromDbBooking(Booking b)
        {
            return new LibBookingService.Dtos.Booking
            {
                Id = b.id,
                CustomerId = b.customer_id,
                RestaurantId = b.restaurant_id,
                BookingMadeDate = b.bookingMadeDate,
                BookingMadeTime = b.bookingMadeTime,
                StartTime = b.startTime,
                EndTime = b.endTime,
                PaymentTotal = b.paymentTotal,
                PaymentMadeDate = b.paymentMadeDate,
                NoCustomers = b.noCustomers,
                Comments = b.comments,
                Cancelled = b.cancelled,
                Tables = GetTablesForBooking(b),
                Payments = GetPaymentsForBooking(b),
                MenuItems = GetBookingMenuItemsForBooking(b)
            };
        }

        /// <summary>
        /// Returns a list of tables from the booking parameter.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        private IEnumerable<LibBookingService.Dtos.Table> GetTablesForBooking(Booking booking)
        {
            IEnumerable<Table> bookingTables = booking.TableBookings.Where(b => !b.deleted).Select(b => b.Table).Where(b => !b.deleted);
            if (bookingTables.Any())
                return bookingTables.Select(t => new LibBookingService.Dtos.Table
                {
                    Id = t.id,
                    RestaurantId = t.restaurant_id,
                    NoSeats = t.noSeats,
                    AdditionalNotes = t.additionalNotes,
                    Active = t.active
                });
            return Enumerable.Empty<LibBookingService.Dtos.Table>();
        }

        /// <summary>
        /// Returns a list of payments from the booking parameter.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        private IEnumerable<LibBookingService.Dtos.Payment> GetPaymentsForBooking(Booking booking)
        {
            IEnumerable<Payment> bookingPayments = booking.Payments.Where(p => !p.deleted);
            if (bookingPayments.Any())
                return bookingPayments.Select(p => new LibBookingService.Dtos.Payment
                {
                    Id = p.id,
                    BookingId = booking.id,
                    CustomerId = p.customer_id,
                    PaymentMethod = new LibBookingService.Dtos.PaymentMethod
                    {
                        Id = p.PaymentMethod.id,
                        Name = p.PaymentMethod.name,
                        Active = p.PaymentMethod.active
                    },
                    Amount = p.amount,
                    Comments = p.comments
                });
            return Enumerable.Empty<LibBookingService.Dtos.Payment>();
        }

        /// <summary>
        /// Returns a list of booking menu items from the booking parameter.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        private IEnumerable<LibBookingService.Dtos.BookingMenuItem> GetBookingMenuItemsForBooking(Booking booking)
        {
            IEnumerable<BookingMenuItem> bookingMenuItems = booking.BookingMenuItems.Where(p => !p.deleted);
            if (bookingMenuItems.Any())
                return bookingMenuItems.Select(mi => new LibBookingService.Dtos.BookingMenuItem
                {
                    Id = mi.id,
                    BookingId = booking.id,
                    MenuItemId = mi.menuItem_id,
                    Quantity = mi.quantity
                });
            return Enumerable.Empty<LibBookingService.Dtos.BookingMenuItem>();
        }
    }
}
