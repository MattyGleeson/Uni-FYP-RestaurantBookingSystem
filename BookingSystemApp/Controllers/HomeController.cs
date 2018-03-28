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
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            HttpRequestMessage request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri("http://localhost:64577/api/Company/Get")
            };

            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            JsonSerializerSettings serializerSettings = new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore, MissingMemberHandling = MissingMemberHandling.Ignore };

            HttpResponseMessage response = client.SendAsync(request).Result;
            response.EnsureSuccessStatusCode();
            string content = response.Content.ReadAsStringAsync().Result;
            Company company = JsonConvert.DeserializeObject<Company>(content, serializerSettings);

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