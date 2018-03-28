using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class MenuItemVM
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string Types { get; set; }

        public string DietInfo { get; set; }
    }
}