using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    public class BookingMenuItem
    {
        public virtual int BookingId { get; set; }

        public virtual int MenuItemId { get; set; }

        public virtual int Quantity { get; set; }
    }
}
