using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class RestaurantVM
    {
        public int Id { get; set; }

        public int CompanyId { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Required]
        [StringLength(15)]
        public string PhoneNo { get; set; }

        [Required]
        [StringLength(100)]
        public string AddressStreet { get; set; }

        [Required]
        [StringLength(50)]
        public string AddressCounty { get; set; }

        [Required]
        [StringLength(50)]
        public string AddressTown { get; set; }

        [Required]
        [StringLength(8)]
        public string AddressPostalCode { get; set; }

        public IEnumerable<MenuItemVM> MenuItems { get; set; }

        public int TableCount { get; set; }
    }
}