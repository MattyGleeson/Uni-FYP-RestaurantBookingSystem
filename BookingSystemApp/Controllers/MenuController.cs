using BookingSystemApp.Controllers.ControllerExtensions;
using BookingSystemApp.Facades;
using BookingSystemApp.View_Models;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookingSystemApp.Controllers
{
    public class MenuController : MessageControllerBase
    {
        private readonly MenuFacade _menuFacade;
        private readonly DietInfoFacade _dietInfoFacade;
        private readonly MenuItemTypeFacade _menuItemTypeFacade;

        public MenuController()
        {
            _menuFacade = new MenuFacade();
            _dietInfoFacade = new DietInfoFacade();
            _menuItemTypeFacade = new MenuItemTypeFacade();
        }

        // GET: Menu
        public ActionResult Index(MenuIndexVM indexVM = null)
        {
            IQueryable<MenuItem> res = _menuFacade.Get().AsQueryable();

            ViewBag.Type = new SelectList(_menuItemTypeFacade.Get().OrderBy(d => d.Name), "id", "name", "Select category");
            ViewBag.DietInfo = new SelectList(_dietInfoFacade.Get().OrderBy(d => d.Name), "id", "name", "Select category");

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

                return View(new MenuIndexVM
                {
                    DietInfo = indexVM.DietInfo,
                    Type = indexVM.Type,
                    StartPrice = indexVM.StartPrice,
                    EndPrice = indexVM.EndPrice,
                    MenuItems = res.Select(m => new MenuItemVM
                    {
                        Id = m.Id,
                        Name = m.Name,
                        Description = m.Description ?? "No Description",
                        Price = m.Price,
                        DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                        Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
                    }).AsEnumerable()
                });
            }

            return View(new MenuIndexVM
            {
                MenuItems = res.Select(m => new MenuItemVM
                {
                    Id = m.Id,
                    Name = m.Name,
                    Description = m.Description ?? "No Description",
                    Price = m.Price,
                    DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                    Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
                }).AsEnumerable()
            });
        }
    }
}