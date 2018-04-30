using BookingSystemApp.Controllers.ControllerExtensions;
using BookingSystemApp.Facades;
using BookingSystemApp.Facades.Core;
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
        private readonly MenuFacade _menuFacade;

        public BookingController()
        {
            _bookingFacade = new BookingFacade();
            _menuFacade = new MenuFacade();
        }

        // GET: Booking
        public ActionResult Index()
        {
            int? userId = (int?) Session[Global.UserIdSessionVar];

            if (userId != null)
            {
                IEnumerable<Booking> res = _bookingFacade.FindByCustomerId((int) userId);

                return View(res.Select(b => CreateBookingVMFromDto(b)));
            }

            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
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

            if (Session[Global.RolesSessionVar] != null && ((IList<string>)Session[Global.RolesSessionVar]).Contains(Global.AdminRole))
            {
                AddToastMessage("Error", "An admin cannot create a booking", Toast.ToastType.Warning);
                return Redirect(Request.UrlReferrer.ToString());
            }

            if (Session[Global.UserIdSessionVar] == null)
            {
                AddToastMessage("Login", "You must login before booking a table", Toast.ToastType.Warning);
                return RedirectToAction("Login", "Customer");
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
            booking.BookingMadeDate = DateTime.Now;
            booking.BookingMadeTime = DateTime.Now.TimeOfDay;
            booking.RestaurantId = (int) Session[Global.RestaurantIdSessionVar];
            booking.CustomerId = (int) Session[Global.UserIdSessionVar];
            booking.EndTime = booking.StartTime.Add(new TimeSpan(1, 29, 59));

            if (ModelState.IsValid)
            {
                Booking res = new Booking
                {
                    Id = booking.Id,
                    CustomerId = booking.CustomerId,
                    RestaurantId = booking.RestaurantId,
                    BookingMadeDate = booking.BookingMadeDate,
                    BookingMadeTime = booking.BookingMadeTime,
                    BookingDate = booking.BookingDate,
                    StartTime = booking.StartTime,
                    EndTime = booking.EndTime,
                    PaymentTotal = booking.PaymentTotal,
                    PaymentMadeDate = booking.PaymentMadeDate,
                    NoCustomers = booking.NoCustomers,
                    Comments = booking.Comments
                };

                Table table = _bookingFacade.GetAvailableTable(res);

                if (table != null)
                {
                    List<Table> resTables = new List<Table>
                    {
                        table
                    };
                    res.Tables = resTables.AsEnumerable();

                    Session["Booking"] = res;

                    //_bookingFacade.Create(res);
                    //AddToastMessage("Confirmed", "Booking Confirmed", Toast.ToastType.Success);
                    return RedirectToAction("AddMenuItems", new { userId = Session[Global.UserIdSessionVar] });
                }
                else
                {
                    AddToastMessage("No Table", "There are no available tables for the time selected", Toast.ToastType.Info);
                }
            }

            GetTimes();
            return View(booking);
        }

        public ActionResult AddMenuItems()
        {
            IEnumerable<MenuItem> res = _menuFacade.FindByRestaurantId((int)Session[Global.RestaurantIdSessionVar]);

            //IEnumerable<MenuItem> res = _menuFacade.Get();

            return View(res.Select(m => new AddMenuItemVM
            {
                Id = m.Id,
                Name = m.Name,
                Description = m.Description,
                Price = m.Price,
                DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
            }).ToList());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddMenuItems([Bind(Include = "Id,Name,Description,Price,Selected")] IList<AddMenuItemVM> menuItems)
        {
            List<int> ids = Session["MenuItems"] as List<int>;

            if (ids != null && ids.Any())
            {
                return RedirectToAction("Create", "Payment");
            }

            Booking booking = (Booking)Session["Booking"];
            _bookingFacade.Create(booking);
            AddToastMessage("Confirmed", "Booking Confirmed", Toast.ToastType.Success);

            return RedirectToAction("Index", new { userId = Session[Global.UserIdSessionVar] });
        }

        public void AddMenuItem(int Id)
        {
            if (Session["MenuItems"] == null)
            {
                List<int> ids = new List<int>
                {
                    Id
                };
                Session["MenuItems"] = ids;
            }
            else
            {
                List<int> ids = Session["MenuItems"] as List<int>;
                ids.Add(Id);
                Session["MenuItems"] = ids;
            }
        }

        public void RemoveMenuItem(int Id)
        {
            List<int> ids = Session["MenuItems"] as List<int>;
            ids.Remove(Id);
            Session["MenuItems"] = ids;
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