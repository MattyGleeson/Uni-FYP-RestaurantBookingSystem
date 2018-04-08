using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    public class BookingMenuItem : Dto
    {
        public virtual int BookingId { get; set; }

        public virtual int MenuItemId { get; set; }

        public virtual int Quantity { get; set; }

        public virtual double TotalPrice { get; set; }
    }
}
