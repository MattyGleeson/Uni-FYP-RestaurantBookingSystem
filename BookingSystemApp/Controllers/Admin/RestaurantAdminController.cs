using BookingSystemApp.Facades;
using BookingSystemApp.View_Models;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BookingSystemApp.Controllers.Admin
{
    [Route("Admin/Restaurant/{action=index}")]
    public class RestaurantAdminController : Controller
    {
        private readonly RestaurantFacade _restaurantFacade;
        private readonly CompanyFacade _companyFacade;
        private readonly MenuFacade _menuFacade;
        private readonly TableFacade _tableFacade;


        public RestaurantAdminController()
        {
            _restaurantFacade = new RestaurantFacade();
            _companyFacade = new CompanyFacade();
            _menuFacade = new MenuFacade();
            _tableFacade = new TableFacade();
        }

        // GET: Admin/Restaurant
        public ActionResult Index()
        {
            IEnumerable<Restaurant> res = _restaurantFacade.Get();

            return View(res.Select(r => CreateVMFromDto(r)));
        }

        // GET: Admin/Restaurant/5
        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Restaurant res = _restaurantFacade.FindById((int)id);

            if (res == null)
                return HttpNotFound();

            ViewBag.menuItemId = new SelectList(_menuFacade.Get().OrderBy(d => d.Name), "id", "name", "Select menu item");
            Session["RestaurantId"] = res.Id;

            return View(CreateVMFromDto(res));
        }

        // POST: Admin/Restaurant/RemoveMenuItem/5
        public ActionResult RemoveMenuItem(int? id)
        {
            int restaurantId = Session["RestaurantId"] != null ? (int) Session["RestaurantId"] : -1;

            if (id != null && restaurantId != -1)
            {
                _restaurantFacade.RemoveMenuItemFromRestaurant(restaurantId, (int)id);
            }
            return RedirectToAction("Details", new { id = restaurantId });
        }

        [HttpPost]
        // POST: Admin/MenuItem/AddMenuItem/5
        public ActionResult AddMenuItem(int? menuItemId)
        {
            int restaurantId = Session["RestaurantId"] != null ? (int) Session["RestaurantId"] : -1;

            if (menuItemId != null && restaurantId != -1)
            {
                _restaurantFacade.AddMenuItemToRestaurant(restaurantId, (int) menuItemId);
            }
            return RedirectToAction("Details", new { id = restaurantId });
        }

        // GET: Admin/Restaurant/NewTable/5
        public ActionResult NewTable(int id)
        {
            return View(new TableVM { RestaurantId = id });
        }

        // POST: Admin/Restaurant/NewTable/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult NewTable([Bind(Include = "Id,RestaurantId,TableNo,Name,AdditionalNotes,NoSeats")] TableVM table)
        {
            if (ModelState.IsValid)
            {
                Table res = _tableFacade.Create(new Table
                {
                    RestaurantId = table.RestaurantId,
                    TableNo = table.TableNo,
                    NoSeats = table.NoSeats,
                    AdditionalNotes = table.AdditionalNotes,
                    Active = true
                });
                return RedirectToAction("Details", new { id = res.RestaurantId });
            }

            return View(table);
        }

        // POST: Admin/Restaurant/RemoveTable/5
        public ActionResult RemoveTable(int? id)
        {
            int restaurantId = Session["RestaurantId"] != null ? (int)Session["RestaurantId"] : -1;

            if (id != null && restaurantId != -1)
            {
                _tableFacade.Delete((int) id);
            }
            return RedirectToAction("Details", new { id = restaurantId });
        }

        // POST: Admin/Restaurant/ActivateTable/5
        public ActionResult ActivateTable(int? id)
        {
            int restaurantId = Session["RestaurantId"] != null ? (int)Session["RestaurantId"] : -1;

            if (id != null && restaurantId != -1)
            {
                Table table = _tableFacade.FindById((int) id);
                table.Active = true;
                _tableFacade.Update(table);
            }
            return RedirectToAction("Details", new { id = restaurantId });
        }

        // POST: Admin/Restaurant/DeactivateTable/5
        public ActionResult DeactivateTable(int? id)
        {
            int restaurantId = Session["RestaurantId"] != null ? (int)Session["RestaurantId"] : -1;

            if (id != null && restaurantId != -1)
            {
                Table table = _tableFacade.FindById((int) id);
                table.Active = false;
                _tableFacade.Update(table);
            }
            return RedirectToAction("Details", new { id = restaurantId });
        }

        // GET: Admin/Restaurant/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Restaurant/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,PhoneNo,AddressStreet,AddressTown,AddressCounty,AddressPostalCode")] RestaurantVM restaurant)
        {
            if (ModelState.IsValid)
            {
                Restaurant res = _restaurantFacade.Create(new Restaurant
                {
                    Id = restaurant.Id,
                    CompanyId = _companyFacade.Get().Id,
                    Name = restaurant.Name,
                    PhoneNo = restaurant.PhoneNo,
                    AddressStreet = restaurant.AddressStreet,
                    AddressTown = restaurant.AddressTown,
                    AddressCounty = restaurant.AddressCounty,
                    AddressPostalCode = restaurant.AddressPostalCode
                });
                return RedirectToAction("Details", new { Id = res.Id });
            }

            return View(restaurant);
        }

        // GET: Admin/Restaurant/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Restaurant res = _restaurantFacade.FindById((int)id);

            if (res == null)
                return HttpNotFound();

            return View(CreateVMFromDto(res));
        }

        // POST: Admin/Restaurant/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CompanyId,Name,PhoneNo,AddressStreet,AddressTown,AddressCounty,AddressPostalCode")] RestaurantVM restaurant)
        {
            if (ModelState.IsValid)
            {
                Restaurant res = _restaurantFacade.Update(new Restaurant
                {
                    Id = restaurant.Id,
                    CompanyId = restaurant.CompanyId,
                    Name = restaurant.Name,
                    PhoneNo = restaurant.PhoneNo,
                    AddressStreet = restaurant.AddressStreet,
                    AddressTown = restaurant.AddressTown,
                    AddressCounty = restaurant.AddressCounty,
                    AddressPostalCode = restaurant.AddressPostalCode
                });
                return RedirectToAction("Details", new { Id = res.Id });
            }

            return View(restaurant);
        }

        // GET: Admin/Restaurant/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Restaurant res = _restaurantFacade.FindById((int) id);

            if (res == null)
                return HttpNotFound();

            return View(CreateVMFromDto(res));
        }

        // POST: Admin/Restaurant/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            _restaurantFacade.Delete(id);
            return RedirectToAction("Index");
        }

        private RestaurantVM CreateVMFromDto(Restaurant r)
        {
            return new RestaurantVM
            {
                Id = r.Id,
                CompanyId = r.CompanyId,
                Name = r.Name,
                PhoneNo = r.PhoneNo,
                AddressStreet = r.AddressStreet,
                AddressTown = r.AddressTown,
                AddressCounty = r.AddressCounty,
                AddressPostalCode = r.AddressPostalCode,
                MenuItems = r.MenuItems.Select(m => new MenuItemVM
                {
                    Id = m.Id,
                    Name = m.Name,
                    Description = m.Description ?? "No description",
                    DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                    Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
                }).OrderBy(m => m.Name),
                TableCount = r.Tables.Count(),
                Tables = r.Tables
            };
        }
    }
}