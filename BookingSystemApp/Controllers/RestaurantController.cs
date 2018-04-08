using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LibBookingService.Dtos;
using System.Net.Http;
using System.Net;
using BookingSystemApp.View_Models;
using BookingSystemApp.Facades;

namespace BookingSystemApp.Controllers
{
    public class RestaurantController : Controller
    {
        RestaurantFacade _restaurantFacade;

        public RestaurantController()
        {
            _restaurantFacade = new RestaurantFacade();
        }

        // GET: Restaurant
        public ActionResult Index()
        {
            IEnumerable<Restaurant> res = _restaurantFacade.Get();

            return View(res);
        }

        //GET: Restaurant/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Restaurant restaurant = _restaurantFacade.FindById((int) id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }

            return View(new RestaurantVM
            {
                Id = restaurant.Id,
                CompanyId = restaurant.CompanyId,
                Name = restaurant.Name,
                PhoneNo = restaurant.PhoneNo,
                AddressStreet = restaurant.AddressStreet,
                AddressTown = restaurant.AddressTown,
                AddressCounty = restaurant.AddressCounty,
                AddressPostalCode = restaurant.AddressPostalCode,
                MenuItems = restaurant.MenuItems.Select(m => new MenuItemVM
                {
                    Id = m.Id,
                    Name = m.Name,
                    Description = m.Description,
                    DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                    Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
                }),
                TableCount = restaurant.Tables.Count()
            });
        }
    }
}