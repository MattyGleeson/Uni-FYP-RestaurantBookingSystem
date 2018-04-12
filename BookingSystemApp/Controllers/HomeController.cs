using BookingSystemApp.Controllers.ControllerExtensions;
using BookingSystemApp.Facades;
using BookingSystemApp.View_Models;
using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;

namespace BookingSystemApp.Controllers
{
    public class HomeController : MessageControllerBase
    {
        private readonly CompanyFacade _companyFacade;
        private readonly RestaurantFacade _restaurantFacade;

        public HomeController()
        {
            ViewBag.Admin = true;
            _companyFacade = new CompanyFacade();
            _restaurantFacade = new RestaurantFacade();
        }

        public ActionResult Index()
        {
            //Session["UserId"] = 1;
            ViewBag.RestaurantId = new SelectList(_restaurantFacade.Get(), "id", "name", "Select restaurant");
            return View();
        }

        public ActionResult About()
        {
            Company company = _companyFacade.Get();

            return View(new CompanyVM
            {
                Id = company.Id,
                Name = company.Name,
                Description = company.Description,
                AddressStreet = company.AddressStreet,
                AddressTown = company.AddressTown,
                AddressCounty = company.AddressCounty,
                AddressPostalCode = company.AddressPostalCode,
                PhoneNo = company.PhoneNo,
                Email = company.Email,
                RestaurantCount = company.Restaurants != null ? company.Restaurants.Count() : 0
            });
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}