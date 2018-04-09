using BookingSystemApp.Controllers.ControllerExtensions;
using BookingSystemApp.Facades;
using BookingSystemApp.View_Models;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
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
        public ActionResult Index()
        {
            return View();
        }

        // GET: Booking/Create
        public ActionResult Create(int RestaurantId, int CustomerId)
        {
            ViewBag.StartTime = new SelectList(new List<TimeSpan>(), "Select time");
            return View();
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
    }
}