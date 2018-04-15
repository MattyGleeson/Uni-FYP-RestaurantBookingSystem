using BookingSystemApp.Controllers.ControllerExtensions;
using BookingSystemApp.Facades;
using BookingSystemApp.Facades.Core;
using BookingSystemApp.View_Models;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BookingSystemApp.Controllers
{
    public class CustomerController : MessageControllerBase
    {
        private readonly AuthFacade _authFacade;
        private readonly CustomerFacade _customerFacade;

        public CustomerController()
        {
            _authFacade = new AuthFacade();
            _customerFacade = new CustomerFacade();
        }

        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Customer res = _customerFacade.Get();

            if (res == null)
                return HttpNotFound();

            return View(new RegisterVM
            {
                Id = res.Id,
                Username = res.UserName,
                Title = res.Title,
                Forename = res.Forename,
                Surname = res.Surname,
                Dob = res.DoB,
                AddressStreet = res.AddressStreet,
                AddressTown = res.AddressTown,
                AddressCounty = res.AddressCounty,
                AddressPostalCode = res.AddressPostalCode,
                HomePhoneNo = res.HomePhoneNo,
                WorkPhoneNo = res.WorkPhoneNo ?? "No number",
                MobilePhoneNo = res.MobilePhoneNo,
                Email = res.Email,
            });
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include = "Id,Username,Password,ConfirmPassword,Title,Forename,Surname,Dob,AddressStreet," +
            "AddressTown,AddressCounty,AddressPostalCode,HomePhoneNo,WorkPhoneNo,MobilePhoneNo,Email")] RegisterVM registration)
        {
            if (ModelState.IsValid)
            {
                if (_authFacade.Register(registration.Username, registration.Password, registration.ConfirmPassword))
                {
                    _authFacade.GetToken(registration.Username, registration.Password);

                    GenericFacade.UserName = registration.Username;

                    string owinId = _authFacade.GetUserId();

                    GenericFacade.OwinId = owinId;
                    _authFacade.AddCustomerRole();

                    Session[Global.RolesSessionVar] = GenericFacade.IsAdmin;

                    _customerFacade.Create(new Customer
                    {
                        OwinUserId = owinId,
                        UserName = registration.Username,
                        Title = registration.Title,
                        Forename = registration.Forename,
                        Surname = registration.Surname,
                        DoB = registration.Dob,
                        AddressStreet = registration.AddressStreet,
                        AddressTown = registration.AddressTown,
                        AddressCounty = registration.AddressCounty,
                        AddressPostalCode = registration.AddressPostalCode,
                        HomePhoneNo = registration.HomePhoneNo,
                        WorkPhoneNo = registration.WorkPhoneNo,
                        MobilePhoneNo = registration.MobilePhoneNo,
                        Email = registration.Email
                    });

                    Customer c = _customerFacade.Get();

                    Session[Global.UserIdSessionVar] = c.Id;
                    Session[Global.UsernameSessionVar] = registration.Username;

                    return RedirectToAction("index", "home");
                }
                else
                {
                    return View(registration);
                }
                
            }
            
            return View(registration);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginVM login)
        {
            if (ModelState.IsValid)
            {
                _authFacade.GetToken(login.Username, login.Password);

                Customer c = _customerFacade.Get();

                Session[Global.RolesSessionVar] = GenericFacade.Roles;
                Session[Global.UsernameSessionVar] = login.Username;

                if (c != null || !GenericFacade.Roles.Contains(Global.AdminRole))
                {
                    Session[Global.UserIdSessionVar] = c.Id;
                }

                return RedirectToAction("index", "home");
            }

            return View(login);
        }

        public ActionResult Logout()
        {
            Session[Global.UserIdSessionVar] = null;
            Session[Global.UsernameSessionVar] =  null;
            Session[Global.RolesSessionVar] = null;

            GenericFacade.Token = null;
            GenericFacade.UserName = null;
            GenericFacade.OwinId = null;
            GenericFacade.IsAdmin = false;
            GenericFacade.Roles = null;

            return RedirectToAction("index", "home");
        }
    }
}