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
    [Route("Admin/MenuItem/{action=index}")]
    public class MenuItemAdminController : Controller
    {
        MenuFacade _menuFacade;
        DietInfoFacade _dietInfoFacade;

        public MenuItemAdminController()
        {
            _menuFacade = new MenuFacade();
            _dietInfoFacade = new DietInfoFacade();
        }

        // GET: Admin/MenuItem
        public ActionResult Index()
        {
            IEnumerable<MenuItem> res = _menuFacade.Get();

            return View(res.Select(m => CreateVMFromDto(m)));
        }

        // GET: Admin/MenuItem/test/5
        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            MenuItem res = _menuFacade.FindById((int) id);

            if (res == null)
                return HttpNotFound();

            return View(CreateVMFromDto(res));
        }

        public ActionResult ManageDietInfo(int? id)
        {
            ViewBag.dietInfoId = new SelectList(_dietInfoFacade.Get().OrderBy(d => d.Name), "id", "name", "Select diet information");

            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            MenuItem res = _menuFacade.FindById((int)id);

            if (res == null)
                return HttpNotFound();

            Session["MenuItemId"] = res.Id;

            return View(res.DietInfo.Select(d => new ManageDietInfoVM
            {
                Id = d.Id,
                MenuItemId = res.Id,
                Name = d.Name
            }));
        }

        public ActionResult RemoveDietInfo(int? id, int? menuItemId)
        {
            if (id != null && menuItemId != null)
            {
                _menuFacade.RemoveDietInfoFromMenuItem((int) menuItemId, (int) id);
            }
            return RedirectToAction("ManageDietInfo", new { id = menuItemId });
        }

        [HttpPost]
        public ActionResult AddDietInfo(int? dietInfoId)
        {
            int menuItemId = Session["MenuItemId"] != null ? (int) Session["MenuItemId"] : -1;

            if (dietInfoId != null && menuItemId != -1)
            {
                _menuFacade.AddDietInfoToMenuItem(menuItemId, (int) dietInfoId);
            }
            return RedirectToAction("ManageDietInfo", new { id = menuItemId });
        }

        // GET: Admin/MenuItem/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/MenuItem/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description")] MenuItemVM menuItem)
        {
            if (ModelState.IsValid)
            {
                MenuItem res = _menuFacade.Create(new MenuItem
                {
                    Id = menuItem.Id,
                    Name = menuItem.Name,
                    Description = menuItem.Description
                });
                return RedirectToAction("Details", new { Id = res.Id });
            }

            return View(menuItem);
        }

        // GET: Admin/MenuItem/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            MenuItem res = _menuFacade.FindById((int) id);

            if (res == null)
                return HttpNotFound();

            return View(CreateVMFromDto(res));
        }

        // POST: Admin/MenuItem/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description")] MenuItemVM menuItem)
        {
            if (ModelState.IsValid)
            {
                MenuItem res = _menuFacade.Update(new MenuItem
                {
                    Id = menuItem.Id,
                    Name = menuItem.Name,
                    Description = menuItem.Description
                });
                return RedirectToAction("Details", new { Id = res.Id });
            }

            return View(menuItem);
        }

        // GET: Admin/MenuItem/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            MenuItem res = _menuFacade.FindById((int) id);

            if (res == null)
                return HttpNotFound();

            return View(res);
        }

        // POST: Admin/MenuItem/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            _menuFacade.Delete(id);
            return RedirectToAction("Index");
        }

        private MenuItemVM CreateVMFromDto(MenuItem m)
        {
            return new MenuItemVM
            {
                Id = m.Id,
                Name = m.Name,
                Description = m.Description ?? "No description",
                DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
            };
        }
    }
}