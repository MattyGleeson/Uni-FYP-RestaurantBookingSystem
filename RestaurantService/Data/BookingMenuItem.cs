namespace RestaurantService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BookingMenuItem")]
    public partial class BookingMenuItem
    {
        public int id { get; set; }

        public int quantity { get; set; }

        public decimal total { get; set; }

        public int booking_id { get; set; }

        public int menuItem_id { get; set; }

        public bool deleted { get; set; }

        public virtual Booking Booking { get; set; }

        public virtual MenuItem MenuItem { get; set; }
    }
}
