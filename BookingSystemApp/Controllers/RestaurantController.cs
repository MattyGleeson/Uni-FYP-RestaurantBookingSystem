using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LibBookingService.Dtos;
using System.Net.Http;
using BookingSystemApp.Repo;

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
            IEnumerable<Restaurant> res = _restaurantRepo.Get().Result;

            return View();
        }
    }
}