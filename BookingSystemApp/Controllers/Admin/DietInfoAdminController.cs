using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BookingSystemApp.View_Models;
using BookingSystemApp.Facades;

namespace BookingSystemApp.Controllers.Admin
{
    [Route("Admin/DietInfo/{action=index}")]
    public class DietInfoAdminController : Controller
    {
        DietInfoFacade _dietInfoFacade;

        public DietInfoAdminController()
        {
            _dietInfoFacade = new DietInfoFacade();
        }

        // GET: Admin/DietInfo
        public ActionResult Index()
        {
            IEnumerable<DietInfo> res = _dietInfoFacade.Get();

            return View(res);
        }

        // GET: Admin/DietInfo/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/DietInfo/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name")] DietInfoVM dietInfo)
        {
            if (ModelState.IsValid)
            {
                DietInfo res = _dietInfoFacade.Create(new DietInfo
                {
                    Id = dietInfo.Id,
                    Name = dietInfo.Name
                });
                return RedirectToAction("Index");
            }
            
            return View(dietInfo);
        }

        // GET: Admin/DietInfo/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            DietInfo res = _dietInfoFacade.FindById((int) id);

            if (res == null)
                return HttpNotFound();

            return View(new DietInfoVM
            {
                Id = res.Id,
                Name = res.Name
            });
        }

        // POST: Admin/DietInfo/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] DietInfoVM dietInfo)
        {
            if (ModelState.IsValid)
            {
                DietInfo res = _dietInfoFacade.Update(new DietInfo
                {
                    Id = dietInfo.Id,
                    Name = dietInfo.Name
                });
                return RedirectToAction("Index");
            }

            return View(dietInfo);
        }

        // GET: Admin/DietInfo/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            DietInfo res = _dietInfoFacade.FindById((int) id);

            if (res == null)
                return HttpNotFound();

            return View(res);
        }

        // POST: Admin/DietInfo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            _dietInfoFacade.Delete(id);
            return RedirectToAction("Index");
        }
    }
}