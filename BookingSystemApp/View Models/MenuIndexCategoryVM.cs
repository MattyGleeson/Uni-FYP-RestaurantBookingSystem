using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class MenuIndexCategoryVM
    {
        public virtual MenuItemType Category { get; set; }

        public IEnumerable<MenuItemViewVM> MenuItems { get; set; }
    }
}