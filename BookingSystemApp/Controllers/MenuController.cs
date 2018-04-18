using BookingSystemApp.Controllers.ControllerExtensions;
using BookingSystemApp.Facades;
using BookingSystemApp.View_Models;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace BookingSystemApp.Controllers
{
    public class MenuController : MessageControllerBase
    {
        private readonly MenuFacade _menuFacade;
        private readonly DietInfoFacade _dietInfoFacade;
        private readonly MenuItemTypeFacade _menuItemTypeFacade;
        private readonly ImageFacade _imageFacade;

        public MenuController()
        {
            _menuFacade = new MenuFacade();
            _dietInfoFacade = new DietInfoFacade();
            _menuItemTypeFacade = new MenuItemTypeFacade();
            _imageFacade = new ImageFacade();
        }

        // GET: Menu
        public ActionResult Index(MenuIndexVM indexVM = null)
        {
            IQueryable<MenuItem> res = _menuFacade.Get().AsQueryable();

            ViewBag.Type = new SelectList(_menuItemTypeFacade.Get().OrderBy(d => d.Name), "id", "name", "Select category");
            ViewBag.DietInfo = new SelectList(_dietInfoFacade.Get().OrderBy(d => d.Name), "id", "name", "Select diet information");

            if (indexVM != null)
            {
                if (indexVM.Type != null)
                    res = res.Where(m => m.Types.Select(mm => mm.Id).ToList().Contains((int) indexVM.Type));

                if (indexVM.DietInfo != null)
                    res = res.Where(m => m.DietInfo.Select(mm => mm.Id).ToList().Contains((int) indexVM.DietInfo));

                if (indexVM.StartPrice != null)
                    res = res.Where(m => m.Price >= indexVM.StartPrice);

                if (indexVM.EndPrice != null)
                    res = res.Where(m => m.Price <= indexVM.EndPrice);

                IEnumerable<MenuItemType> types = _menuItemTypeFacade.Get();
                List<MenuIndexCategoryVM> categories = new List<MenuIndexCategoryVM>();

                foreach (var type in types)
                {
                    categories.Add(new MenuIndexCategoryVM
                    {
                        Category = type,
                        MenuItems = res.Where(m => m.Types.Where( t => t.Id == type.Id).Any()).Select(m => new MenuItemViewVM
                        {
                            Id = m.Id,
                            Name = m.Name,
                            Description = m.Description ?? "No Description",
                            Price = m.Price,
                            ImageId = m.ImageId,
                            DietInfoS = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                            TypesS = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
                        })
                    });
                }

                return View(categories.AsEnumerable());
            }

            return View(new MenuIndexVM
            {
                MenuItems = res.Select(m => new MenuItemViewVM
                {
                    Id = m.Id,
                    Name = m.Name,
                    Description = m.Description ?? "No Description",
                    Price = m.Price,
                    ImageId = m.ImageId,
                    DietInfoS = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                    TypesS = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
                }).AsEnumerable()
            });
        }

        public async Task<ActionResult> ImageFromId(int id)
        {
            Image i = _imageFacade.LoadImage(id);

            return File(i.FileContent, i.Type);
        }
    }
}