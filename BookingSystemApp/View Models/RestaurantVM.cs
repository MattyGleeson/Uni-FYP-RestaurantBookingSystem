using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
        [DisplayName("Phone Number")]
        public string PhoneNo { get; set; }

        [Required]
        [StringLength(100)]
        [DisplayName("Street")]
        public string AddressStreet { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("County")]
        public string AddressCounty { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("Town")]
        public string AddressTown { get; set; }

        [Required]
        [StringLength(8)]
        [DisplayName("Postal Code")]
        public string AddressPostalCode { get; set; }

        public IEnumerable<MenuItemVM> MenuItems { get; set; }

        [DisplayName("Number of Tables")]
        public int TableCount { get; set; }

        public IEnumerable<Table> Tables { get; set; }
    }
}