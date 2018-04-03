using BookingSystemApp.Repo;
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
        MenuRepo _menuRepo;

        public MenuItemAdminController()
        {
            _menuRepo = new MenuRepo();
        }

        // GET: Admin/MenuItem
        public ActionResult Index()
        {
            IEnumerable<MenuItem> res = _menuRepo.Get();

            return View(res.Select(m => new MenuItemVM
            {
                Id = m.Id,
                Name = m.Name,
                Description = m.Description ?? "No description",
                DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
            }));
        }

        // GET: Admin/MenuItem/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MenuItem res = _menuRepo.FindById((int) id);
            if (res == null)
            {
                return HttpNotFound();
            }
            return View(new MenuItemVM
            {
                Id = res.Id,
                Name = res.Name,
                Description = res.Description ?? "No description",
                DietInfo = res.DietInfo.Any() ? String.Join(", ", res.DietInfo.Select(d => d.Name)) : "N/A",
                Types = res.Types.Any() ? String.Join(", ", res.Types.Select(t => t.Name)) : "N/A"
            });
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
                MenuItem res = _menuRepo.Create(new MenuItem
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
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MenuItem res = _menuRepo.FindById((int) id);
            if (res == null)
            {
                return HttpNotFound();
            }
            return View(new MenuItemVM
            {
                Id = res.Id,
                Name = res.Name,
                Description = res.Description
            });
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
                MenuItem res = _menuRepo.Update(new MenuItem
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
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MenuItem res = _menuRepo.FindById((int) id);
            if (res == null)
            {
                return HttpNotFound();
            }
            return View(res);
        }

        // POST: Admin/MenuItem/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            _menuRepo.Delete(id);
            return RedirectToAction("Index");
        }
    }
}