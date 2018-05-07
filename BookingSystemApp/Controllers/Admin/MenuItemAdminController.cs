using BookingSystemApp.Controllers.ControllerExtensions;
using BookingSystemApp.Facades;
using BookingSystemApp.View_Models;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
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
        private readonly ImageFacade _imageFacade;

        public MenuItemAdminController()
        {
            _menuFacade = new MenuFacade();
            _dietInfoFacade = new DietInfoFacade();
            _menuItemTypeFacade = new MenuItemTypeFacade();
            _imageFacade = new ImageFacade();
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

            return View(new MenuItemViewVM
            {
                Id = res.Id,
                Name = res.Name,
                Description = res.Description,
                ImageId = res.ImageId,
                Price = res.Price,
                DietInfo = res.DietInfo,
                Types = res.Types
            });
        }

        public async Task<ActionResult> ImageFromId(int id)
        {
            Image i = _imageFacade.LoadImage(id);

            return File(i.FileContent, i.Type);
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
        public ActionResult Create([Bind(Include = "Id,Name,Description,Price,Image")] MenuItemVM menuItem)
        {
            if (ModelState.IsValid)
            {
                MenuItem res = _menuFacade.Create(new MenuItem
                {
                    Name = menuItem.Name,
                    Description = menuItem.Description,
                    Price = menuItem.Price
                });

                if (menuItem.Image != null && menuItem.Image.FileName != null && menuItem.Image.FileName != "")
                {
                    var fileName = Path.GetFileName(menuItem.Image.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images/"), fileName);
                    Stream imgFileStream = menuItem.Image.InputStream;
                    byte[] documentBytes = new byte[imgFileStream.Length];
                    imgFileStream.Read(documentBytes, 0, documentBytes.Length);

                    Image img = _imageFacade.UploadMenuItemImage(new Image
                    {
                        Name = fileName,
                        Size = menuItem.Image.ContentLength,
                        Type = menuItem.Image.ContentType,
                        FileContent = documentBytes,
                        CreatedOn = DateTime.Now,
                        Source = res.Id
                    });
                }

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

            return View(new MenuItemVM
            {
                Id = res.Id,
                Name = res.Name,
                Description = res.Description,
                Price = res.Price,
                DietInfo = res.DietInfo.Any() ? String.Join(", ", res.DietInfo.Select(d => d.Name)) : "N/A",
                Types = res.Types.Any() ? String.Join(", ", res.Types.Select(t => t.Name)) : "N/A"
            });
        }

        // POST: Admin/MenuItem/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description,Price,Image")] MenuItemVM menuItem)
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

                //var fileName = Path.GetFileName(menuItem.Image.FileName);
                //var path = Path.Combine(Server.MapPath("~/Images/"), fileName);
                //Stream imgFileStream = menuItem.Image.InputStream;
                //byte[] documentBytes = new byte[imgFileStream.Length];
                //imgFileStream.Read(documentBytes, 0, documentBytes.Length);

                //if (fileName != null && path != null)
                //{
                //    Image img = _imageFacade.UploadMenuItemImage(new Image
                //    {
                //        Name = fileName,
                //        Size = menuItem.Image.ContentLength,
                //        Type = menuItem.Image.ContentType,
                //        FileContent = documentBytes,
                //        CreatedOn = DateTime.Now,
                //        Source = res.Id
                //    });
                //}
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

        private MenuItemViewVM CreateVMFromDto(MenuItem m)
        {
            return new MenuItemViewVM
            {
                Id = m.Id,
                Name = m.Name,
                Description = m.Description,
                Price = m.Price,
                ImageId = m.ImageId != -1 ? m.ImageId : null,
                DietInfoS = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                TypesS = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
            };
        }
    }
}