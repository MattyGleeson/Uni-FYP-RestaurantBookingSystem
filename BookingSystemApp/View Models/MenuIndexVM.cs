using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class MenuIndexVM
    {
        public IEnumerable<MenuItemViewVM> MenuItems { get; set; }

        [DisplayName("Category")]
        public int? Type { get; set; }

        [DisplayName("Diet Information")]
        public int? DietInfo { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "Please enter a valid price")]
        [DisplayName("Price From")]
        public double? StartPrice { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "Please enter a valid price")]
        [DisplayName("Price To")]
        public double? EndPrice { get; set; }
    }
}