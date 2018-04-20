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
    public class PaymentController : MessageControllerBase
    {
        private readonly BookingFacade _bookingFacade;
        private readonly MenuFacade _menuFacade;
        private readonly PaymentFacade _paymentFacade;

        public PaymentController()
        {
            _bookingFacade = new BookingFacade();
            _menuFacade = new MenuFacade();
            _paymentFacade = new PaymentFacade();
        }

        // GET: Payment
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            List<int> ids = Session["MenuItems"] as List<int>;

            IEnumerable<PaymentMethod> paymentMethods = _paymentFacade.GetPaymentMethod().OrderBy(p => p.Name);

            IEnumerable<MenuItem> selectedItems = _menuFacade.Get().Where(m => ids.Contains(m.Id));

            ViewBag.PaymentMethod = new SelectList(paymentMethods, "Id", "Name", "Select payment method");

            double total = 0;

            foreach (var item in selectedItems)
            {
                total += item.Price;
            }

            return View(new PaymentVM
            {
                Amount = total
            });
        }

        // POST: Payment/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BookingId,CustomerId,Amount,Comments,PaymentMethod")] PaymentVM payment)
        {
            Booking booking = (Booking)Session["Booking"];

            payment.CustomerId = (int)Session[Global.UserIdSessionVar];
            payment.BookingId = booking.Id;

            if (ModelState.IsValid)
            {
                booking.PaymentMadeDate = DateTime.Now.Date;
                booking.PaymentTotal = Convert.ToDecimal(payment.Amount);

                Booking resBooking = _bookingFacade.Create(booking);

                payment.BookingId = resBooking.Id;

                Payment res = _paymentFacade.Create(new Payment
                {
                    Amount = Convert.ToDecimal(payment.Amount),
                    Comments = payment.Comments,
                    BookingId = payment.BookingId,
                    CustomerId = payment.CustomerId,
                    PaymentMethod = new PaymentMethod
                    {
                        Id = payment.PaymentMethod
                    }
                });

                AddToastMessage("Confirmed", "Booking Confirmed", Toast.ToastType.Success);
                return RedirectToAction("Index", "Booking", new { userId = Session[Global.UserIdSessionVar] });
            }

            ViewBag.PaymentMethod = new SelectList(_paymentFacade.GetPaymentMethod().OrderBy(d => d.Name), "id", "name", "Select payment method");

            return View(payment);
        }
    }
}