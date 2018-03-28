using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LibBookingService.Dtos;
using System.Net.Http;
using BookingSystemApp.Repo;
using System.Net;
using BookingSystemApp.View_Models;

namespace BookingSystemApp.Controllers
{
    public class RestaurantController : Controller
    {
        RestaurantRepo _restaurantRepo;

        public RestaurantController()
        {
            _restaurantRepo = new RestaurantRepo();
        }

        // GET: Restaurant
        public ActionResult Index()
        {
            IEnumerable<Restaurant> res = _restaurantRepo.Get();

            return View(res);
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Restaurant restaurant = _restaurantRepo.FindById((int) id);
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
                    DietInfo = String.Join(", ", m.DietInfo.Select(d => d.Name))
                }),
                TableCount = restaurant.Tables.Count()
            });
        }
    }
}