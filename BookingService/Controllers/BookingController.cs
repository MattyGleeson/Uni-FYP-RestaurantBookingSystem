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
        /// <returns></returns>
        [Route("All")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get()
        {
            IEnumerable<Booking> res = await _db.Bookings.Where(b => b.deleted != true).ToListAsync();

            IEnumerable<LibBookingService.Dtos.Booking> bookings = res.Select(b => CreateBoookingFromDbBooking(b));

            return bookings.Any() ?
                Request.CreateResponse(HttpStatusCode.OK, bookings) :
                Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Bookings");
        }

        /// <summary>
        /// Posts a booking Dto to the database.
        /// </summary>
        /// <param name="b"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.Booking b)
        {
            try
            {
                Booking newBoooking = _db.Bookings.Add(new Booking
                {
                    customer_id = b.CustomerId,
                    bookingMadeDate = b.BookingMadeDate,
                    bookingMadeTime = b.BookingMadeTime,
                    startTime = b.StartTime,
                    endTime = b.EndTime,
                    paymentTotal = b.PaymentTotal,
                    paymentMadeDate = b.PaymentMadeDate,
                    noCustomers = b.NoCustomers,
                    comments = b.Comments,
                    cancelled = b.Cancelled
                });
                await _db.SaveChangesAsync();

                if (b.Tables != null)
                {
                    foreach (LibBookingService.Dtos.Table t in b.Tables)
                    {
                        _db.TableBookings.Add(new TableBooking
                        {
                            table_id = t.Id,
                            booking_id = newBoooking.id
                        });
                        await _db.SaveChangesAsync();
                    }
                }

                if (b.Payments != null)
                {
                    foreach (LibBookingService.Dtos.Payment p in b.Payments)
                    {
                        _db.Payments.Add(new Payment
                        {
                            paymentMethod_id = p.PaymentMethodId,
                            customer_id = p.CustomerId,
                            booking_id = p.BookingId,
                            amount = p.Amount,
                            comments = p.Comments
                        });
                        await _db.SaveChangesAsync();
                    }
                }

                if (b.MenuItems != null)
                {
                    foreach (LibBookingService.Dtos.BookingMenuItem m in b.MenuItems)
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
        [Route("Delete/{id:int?")]
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
        /// <param name="Id"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        [Route("Update/{id:int?")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int Id, LibBookingService.Dtos.Booking b)
        {
            try
            {
                Booking booking = await _db.Bookings.Where(bb => bb.id == Id).FirstOrDefaultAsync();

                booking.customer_id = b.CustomerId;
                booking.bookingMadeDate = b.BookingMadeDate;
                booking.bookingMadeTime = b.BookingMadeTime;
                booking.startTime = b.StartTime;
                booking.endTime = b.EndTime;
                booking.paymentTotal = b.PaymentTotal;
                booking.paymentMadeDate = b.PaymentMadeDate;
                booking.noCustomers = b.NoCustomers;
                booking.comments = b.Comments;
                booking.cancelled = b.Cancelled;

                _db.SetModified(booking);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.Booking res = CreateBoookingFromDbBooking(booking);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Returns a booking model using the database selection box parameter.
        /// </summary>
        /// <param name="b"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.Booking CreateBoookingFromDbBooking(Booking b)
        {
            return new LibBookingService.Dtos.Booking
            {
                CustomerId = b.customer_id,
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
                    PaymentMethodId = p.paymentMethod_id,
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
