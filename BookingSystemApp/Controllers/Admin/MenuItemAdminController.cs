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

namespace BookingSystemApp.Controllers.Admin
{
    [Route("Admin/MenuItem/{action=index}")]
    public class MenuItemAdminController : MessageControllerBase
    {
        private readonly MenuFacade _menuFacade;
        private readonly DietInfoFacade _dietInfoFacade;
        private readonly MenuItemTypeFacade _menuItemTypeFacade;

        public MenuItemAdminController()
        {
            _menuFacade = new MenuFacade();
            _dietInfoFacade = new DietInfoFacade();
            _menuItemTypeFacade = new MenuItemTypeFacade();
        }

        // GET: Admin/MenuItem
        public ActionResult Index()
        {
            IEnumerable<MenuItem> res = _menuFacade.Get();

            return View(res.Select(m => CreateVMFromDto(m)));
        }

        // GET: Admin/MenuItem/5
        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            MenuItem res = _menuFacade.FindById((int) id);

            if (res == null)
                return HttpNotFound();

            ViewBag.dietInfoId = new SelectList(_dietInfoFacade.Get().OrderBy(d => d.Name), "id", "name", "Select diet information");
            ViewBag.categoryId = new SelectList(_menuItemTypeFacade.Get().OrderBy(d => d.Name), "id", "name", "Select category");

            Session["MenuItemId"] = res.Id;

            return View(res);
        }

        // GET: Admin/MenuItem/ManageDietInfo/5
        public ActionResult ManageDietInfo(int? id)
        {
            ViewBag.dietInfoId = new SelectList(_dietInfoFacade.Get().OrderBy(d => d.Name), "id", "name", "Select diet information");

            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            MenuItem res = _menuFacade.FindById((int)id);

            if (res == null)
                return HttpNotFound();

            Session["MenuItemId"] = res.Id;

            return View(res.DietInfo.Select(d => new DietInfoVM
            {
                Id = d.Id,
                Name = d.Name
            }));
        }

        // POST: Admin/MenuItem/RemoveDietInfo/5
        public ActionResult RemoveDietInfo(int? id)
        {
            int menuItemId = Session["MenuItemId"] != null ? (int)Session["MenuItemId"] : -1;

            if (id != null && menuItemId != -1)
            {
                _menuFacade.RemoveDietInfoFromMenuItem(menuItemId, (int) id);
            }
            return RedirectToAction("Details", new { id = menuItemId });
        }

        [HttpPost]
        // POST: Admin/MenuItem/AddDietInfo/5
        public ActionResult AddDietInfo(int? dietInfoId)
        {
            int menuItemId = Session["MenuItemId"] != null ? (int) Session["MenuItemId"] : -1;

            if (dietInfoId != null && menuItemId != -1)
            {
                _menuFacade.AddDietInfoToMenuItem(menuItemId, (int) dietInfoId);
            }
            return RedirectToAction("Details", new { id = menuItemId });
        }

        // GET: Admin/MenuItem/ManageCategories/5
        public ActionResult ManageCategories(int? id)
        {
            ViewBag.categoryId = new SelectList(_menuItemTypeFacade.Get().OrderBy(d => d.Name), "id", "name", "Select category");

            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            MenuItem res = _menuFacade.FindById((int)id);

            if (res == null)
                return HttpNotFound();

            Session["MenuItemId"] = res.Id;

            return View(res.Types.Select(d => new MenuItemTypeVM
            {
                Id = d.Id,
                Name = d.Name
            }));
        }

        // POST: Admin/MenuItem/RemoveCategory/5
        public ActionResult RemoveCategory(int? id)
        {
            int menuItemTypeId = Session["MenuItemId"] != null ? (int)Session["MenuItemId"] : -1;

            if (id != null && menuItemTypeId != -1)
            {
                _menuFacade.RemoveMenuItemTypeFromMenuItem(menuItemTypeId, (int)id);
            }
            return RedirectToAction("Details", new { id = menuItemTypeId });
        }

        [HttpPost]
        // POST: Admin/MenuItem/AddCategory/5
        public ActionResult AddCategory(int? categoryId)
        {
            int menuItemId = Session["MenuItemId"] != null ? (int) Session["MenuItemId"] : -1;

            if (categoryId != null && menuItemId != -1)
            {
                _menuFacade.AddMenuItemTypeToMenuItem(menuItemId, (int) categoryId);
            }
            return RedirectToAction("Details", new { id = menuItemId });
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
        public ActionResult Create([Bind(Include = "Id,Name,Description,Price")] MenuItemVM menuItem)
        {
            if (ModelState.IsValid)
            {
                MenuItem res = _menuFacade.Create(new MenuItem
                {
                    Id = menuItem.Id,
                    Name = menuItem.Name,
                    Description = menuItem.Description,
                    Price = menuItem.Price
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
        public ActionResult Edit([Bind(Include = "Id,Name,Description,Price")] MenuItemVM menuItem)
        {
            if (ModelState.IsValid)
            {
                MenuItem res = _menuFacade.Update(new MenuItem
                {
                    Id = menuItem.Id,
                    Name = menuItem.Name,
                    Description = menuItem.Description,
                    Price = menuItem.Price
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
                Description = m.Description,
                Price = m.Price,
                DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
            };
        }
    }
}