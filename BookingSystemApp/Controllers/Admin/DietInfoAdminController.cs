using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BookingSystemApp.Repo;

namespace BookingSystemApp.Controllers.Admin
{
    [Route("Admin/DietInfo/{action=index}")]
    public class DietInfoAdminController : Controller
    {
        DietInfoRepo _dietInfoRepo;

        public DietInfoAdminController()
        {
            _dietInfoRepo = new DietInfoRepo();
        }

        // GET: Admin/DietInfo
        public ActionResult Index()
        {
            IEnumerable<DietInfo> res = _dietInfoRepo.Get();

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
        public ActionResult Create([Bind(Include = "Id,Name")] DietInfo dietInfo)
        {
            if (dietInfo.Name != null && dietInfo.Name.Trim() != "")
            {
                DietInfo res = _dietInfoRepo.Create(dietInfo);
                return RedirectToAction("Index");
            }
            
            return View(dietInfo);
        }

        // GET: Admin/DietInfo/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DietInfo res = _dietInfoRepo.FindById((int) id);
            if (res == null)
            {
                return HttpNotFound();
            }
            return View(res);
        }

        // POST: Admin/DietInfo/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] DietInfo dietInfo)
        {
            if (dietInfo.Name != null && dietInfo.Name.Trim() != "")
            {
                DietInfo res = _dietInfoRepo.Update(dietInfo);
                return RedirectToAction("Index");
            }

            return View(dietInfo);
        }

        // GET: Admin/DietInfo/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DietInfo res = _dietInfoRepo.FindById((int) id);
            if (res == null)
            {
                return HttpNotFound();
            }
            return View(res);
        }

        // POST: Admin/DietInfo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            _dietInfoRepo.Delete(id);
            return RedirectToAction("Index");
        }
    }
}