﻿using BookingSystemApp.Repo;
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
    [Route("Admin/MenuItemCategory/{action=index}")]
    public class MenuItemCategoryAdminController : Controller
    {
        MenuItemTypeRepo _menuItemTypeRepo;

        public MenuItemCategoryAdminController()
        {
            _menuItemTypeRepo = new MenuItemTypeRepo();
        }

        // GET: Admin/MenuItemCategory
        public ActionResult Index()
        {
            IEnumerable<MenuItemType> res = _menuItemTypeRepo.Get();
            return View(res);
        }

        // GET: Admin/MenuItemCategory/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/MenuItemCategory/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name")] MenuItemTypeVM menuItemType)
        {
            if (ModelState.IsValid)
            {
                MenuItemType res = _menuItemTypeRepo.Create(new MenuItemType
                {
                    Id = menuItemType.Id,
                    Name = menuItemType.Name
                });
                return RedirectToAction("Index");
            }

            return View(menuItemType);
        }

        // GET: Admin/MenuItemCategory/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MenuItemType res = _menuItemTypeRepo.FindById((int)id);
            if (res == null)
            {
                return HttpNotFound();
            }
            return View(res);
        }

        // POST: Admin/MenuItemCategory/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] MenuItemTypeVM menuItemType)
        {
            if (ModelState.IsValid)
            {
                MenuItemType res = _menuItemTypeRepo.Update(new MenuItemType
                {
                    Id = menuItemType.Id,
                    Name = menuItemType.Name
                });
                return RedirectToAction("Index");
            }

            return View(menuItemType);
        }

        // GET: Admin/MenuItemCategory/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MenuItemType res = _menuItemTypeRepo.FindById((int)id);
            if (res == null)
            {
                return HttpNotFound();
            }
            return View(res);
        }

        // POST: Admin/MenuItemCategory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            _menuItemTypeRepo.Delete(id);
            return RedirectToAction("Index");
        }
    }
}