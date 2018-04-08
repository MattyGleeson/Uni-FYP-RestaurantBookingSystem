using BookingSystemApp.Controllers.ControllerExtensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookingSystemApp.Controllers
{
    public class AdminController : MessageControllerBase
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
    }
}