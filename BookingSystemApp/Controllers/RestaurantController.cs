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
using System.Threading.Tasks;

namespace BookingSystemApp.Controllers
{
    public class RestaurantController : MessageControllerBase
    {
        private readonly RestaurantFacade _restaurantFacade;
        private readonly BookingFacade _bookingFacade;
        private readonly ImageFacade _imageFacade;
        private readonly MenuItemTypeFacade _menuItemTypeFacade;

        public RestaurantController()
        {
            _restaurantFacade = new RestaurantFacade();
            _bookingFacade = new BookingFacade();
            _imageFacade = new ImageFacade();
            _menuItemTypeFacade = new MenuItemTypeFacade();
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

            IEnumerable<MenuItemType> types = _menuItemTypeFacade.Get();
            List<MenuIndexCategoryVM> categories = new List<MenuIndexCategoryVM>();

            foreach (var type in types)
            {
                categories.Add(new MenuIndexCategoryVM
                {
                    Category = type,
                    MenuItems = restaurant.MenuItems.Where(m => m.Types.Where(t => t.Id == type.Id).Any()).Select(m => new MenuItemViewVM
                    {
                        Id = m.Id,
                        Name = m.Name,
                        Description = m.Description ?? "No Description",
                        Price = m.Price,
                        ImageId = m.ImageId,
                        DietInfoS = m.DietInfo.Any() ? String.Join(", ", m.DietInfo.Select(d => d.Name)) : "N/A",
                        TypesS = m.Types.Any() ? String.Join(", ", m.Types.Select(t => t.Name)) : "N/A"
                    })
                });
            }

            return View(new RestaurantDetailsVM
            {
                Id = restaurant.Id,
                CompanyId = restaurant.CompanyId,
                Name = restaurant.Name,
                PhoneNo = restaurant.PhoneNo,
                AddressStreet = restaurant.AddressStreet,
                AddressTown = restaurant.AddressTown,
                AddressCounty = restaurant.AddressCounty,
                AddressPostalCode = restaurant.AddressPostalCode,
                MenuItems = categories.AsEnumerable(),
                TableCount = restaurant.Tables.Count(),
                ImageIds = restaurant.ImageIds
            });
        }

        public async Task<ActionResult> ImageFromId(int id)
        {
            Image i = _imageFacade.LoadImage(id);

            return File(i.FileContent, i.Type);
        }
    }
}