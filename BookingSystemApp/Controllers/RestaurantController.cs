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
using BookingSystemApp.Controllers.ControllerExtensions;
using BookingSystemApp.Toast;

namespace BookingSystemApp.Controllers
{
    public class RestaurantController : MessageControllerBase
    {
        private readonly RestaurantFacade _restaurantFacade;
        private readonly BookingFacade _bookingFacade;

        public RestaurantController()
        {
            _restaurantFacade = new RestaurantFacade();
            _bookingFacade = new BookingFacade();
        }

        // GET: Restaurant
        public ActionResult Index(int? RestaurantId)
        {
            if (RestaurantId != null)
                return RedirectToAction("Details", new { id = RestaurantId });

            return View(_restaurantFacade.Get());
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
                    Description = m.Description ?? "No Description",
                    Price = m.Price,
                    DietInfo = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                    Types = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
                }),
                TableCount = restaurant.Tables.Count()
            });
        }
    }
}