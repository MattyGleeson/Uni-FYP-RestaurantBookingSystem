﻿using BookingSystemApp.Controllers.ControllerExtensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookingSystemApp.Controllers
{
    public class MenuController : MessageControllerBase
    {
        // GET: Menu
        public ActionResult Index()
        {
            return View();
        }
    }
}