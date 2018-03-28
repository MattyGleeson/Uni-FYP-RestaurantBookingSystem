using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class CompanyVM
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string PhoneNo { get; set; }

        public string AddressStreet { get; set; }

        public string AddressCounty { get; set; }

        public string AddressTown { get; set; }

        public string AddressPostalCode { get; set; }

        public string Email { get; set; }

        public int RestaurantCount { get; set; }
    }
}