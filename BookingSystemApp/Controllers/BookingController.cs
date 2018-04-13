using BookingSystemApp.Controllers.ControllerExtensions;
using BookingSystemApp.Facades;
using BookingSystemApp.View_Models;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BookingSystemApp.Controllers
{
    public class BookingController : MessageControllerBase
    {
        private readonly BookingFacade _bookingFacade;

        public BookingController()
        {
            _bookingFacade = new BookingFacade();
        }

        // GET: Booking
        public ActionResult Index(int userId = -1)
        {
            if (userId != -1)
            {
                IEnumerable<Booking> res = _bookingFacade.FindByCustomerId(userId);

                return View(res.Select(b => CreateBookingVMFromDto(b)));
            }

            return View(Enumerable.Empty<BookingVM>());
        }

        // GET: Booking/5
        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Booking res = _bookingFacade.FindById((int)id);

            if (res == null)
                return HttpNotFound();

            return View(CreateBookingVMFromDto(res));
        }

        // GET: Booking/Create
        public ActionResult Create(int? RestaurantId)
        {
            if (RestaurantId == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            if (Session[Global.UserIdSessionVar] == null)
            {
                AddToastMessage("Login", "You must login before booking a table", Toast.ToastType.Warning);
                return RedirectToAction("login", "customer");
            }

            Session[Global.RestaurantIdSessionVar] = RestaurantId;

            ViewBag.StartTime = new SelectList(new List<TimeSpan>(), "Select time");
            return View();
        }

        // POST: Booking/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StartTime,BookingDate,NoCustomers,Comments")] BookingVM booking)
        {
            //booking.CustomerId = Convert.ToInt16(Session["UserId"]);
            booking.BookingMadeDate = DateTime.Now;
            booking.BookingMadeTime = DateTime.Now.TimeOfDay;
            booking.RestaurantId = (int) Session[Global.RestaurantIdSessionVar];
            booking.CustomerId = (int) Session[Global.UserIdSessionVar];

            if (ModelState.IsValid)
            {
                Booking res = _bookingFacade.Create(new Booking
                {
                    Id = booking.Id,
                    CustomerId = booking.CustomerId,
                    BookingMadeDate = booking.BookingMadeDate,
                    BookingMadeTime = booking.BookingMadeTime,
                    BookingDate = booking.BookingDate,
                    StartTime = booking.StartTime,
                    EndTime = booking.EndTime,
                    PaymentTotal = booking.PaymentTotal,
                    PaymentMadeDate = booking.PaymentMadeDate,
                    NoCustomers = booking.NoCustomers,
                    Comments = booking.Comments
                });
                return RedirectToAction("Index");
            }

            GetTimes();
            return View(booking);
        }

        // GET: Booking/Cancel/5
        public ActionResult Cancel(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Booking res = _bookingFacade.FindById((int)id);

            if (res == null)
                return HttpNotFound();

            return View(CreateBookingVMFromDto(res));
        }

        // POST: Booking/Cancel/5
        [HttpPost, ActionName("Cancel")]
        [ValidateAntiForgeryToken]
        public ActionResult CancelConfirmed(int id)
        {
            _bookingFacade.Cancel(id);
            return RedirectToAction("Index", new { userId = Session[Global.UserIdSessionVar] });
        }

        [HttpPost]
        public JsonResult GetTimes()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            SelectListItem defaultVal = new SelectListItem
            {
                Value = null,
                Text = "Select time",
                Selected = true
            };
            list.Add(defaultVal);

            List<TimeSpan> times = new List<TimeSpan>();
            List<int> minutes = new List<int>
            {
                0,
                15,
                30,
                45
            };

            for (int i = 9; i < 22; i++)
            {
                foreach (int ii in minutes)
                {
                    times.Add(new TimeSpan(i, ii, 0));
                }
            }

            foreach (var t in times.Select(tt => new SelectListItem { Value = tt.ToString(), Text = tt.ToString() }))
            {
                list.Add(t);
            }

            ViewBag.StartTime = new SelectList(times, "Select time");

            return Json(list, JsonRequestBehavior.AllowGet);
        }

        private BookingVM CreateBookingVMFromDto(Booking dto)
        {
            return new BookingVM
            {
                Id = dto.Id,
                CustomerId = dto.CustomerId,
                RestaurantId = dto.RestaurantId,
                Restaurant = new RestaurantVM
                {
                    Id = dto.Restaurant.Id,
                    CompanyId = dto.Restaurant.CompanyId,
                    Name = dto.Restaurant.Name,
                    PhoneNo = dto.Restaurant.PhoneNo,
                    AddressStreet = dto.Restaurant.AddressStreet,
                    AddressTown = dto.Restaurant.AddressTown,
                    AddressCounty = dto.Restaurant.AddressCounty,
                    AddressPostalCode = dto.Restaurant.AddressPostalCode,
                    TableCount = dto.Restaurant.Tables.Count()
                },
                BookingMadeDate = dto.BookingMadeDate,
                BookingMadeTime = dto.BookingMadeTime,
                BookingDate = dto.BookingDate,
                StartTime = dto.StartTime,
                EndTime = dto.EndTime,
                PaymentTotal = dto.PaymentTotal,
                NoCustomers = dto.NoCustomers,
                Comments = dto.Comments,
                Cancelled = dto.Cancelled
            };
        }
    }
}