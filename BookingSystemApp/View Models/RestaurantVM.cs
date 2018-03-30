using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class RestaurantVM
    {
        public int Id { get; set; }

        public int CompanyId { get; set; }

        public string Name { get; set; }

        public string PhoneNo { get; set; }

        public string AddressStreet { get; set; }

        public string AddressCounty { get; set; }

        public string AddressTown { get; set; }

        public string AddressPostalCode { get; set; }

        public IEnumerable<MenuItemVM> MenuItems { get; set; }

        public int TableCount { get; set; }
    }
}