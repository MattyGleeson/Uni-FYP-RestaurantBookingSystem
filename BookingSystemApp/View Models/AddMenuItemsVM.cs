using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class AddMenuItemsVM
    {
        public IEnumerable<AddMenuItemVM> MenuItems { get; set; }
    }
}