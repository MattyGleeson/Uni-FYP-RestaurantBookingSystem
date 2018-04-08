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
    public class HomeController : Controller
    {
        private readonly CompanyFacade _companyFacade;

        public HomeController()
        {
            _companyFacade = new CompanyFacade();
        }

        public ActionResult Index()
        {
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