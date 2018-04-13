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

        public MenuController()
        {
            _menuFacade = new MenuFacade();
        }

        // GET: Menu
        public ActionResult Index()
        {
            IEnumerable<MenuItem> res = _menuFacade.Get();

            return View(res.Select(m => new MenuItemVM
            {
                Id = m.Id,
                Name = m.Name,
                Description = m.Description ?? "No Description",
                Price = m.Price,
                DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
            }));
        }
    }
}