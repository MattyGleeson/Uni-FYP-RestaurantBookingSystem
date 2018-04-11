namespace BookingService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BookingMenuItem")]
    public partial class BookingMenuItem
    {
        public int Id { get; set; }

        public int Quantity { get; set; }

        public decimal Total { get; set; }

        public int Booking_id { get; set; }

        public int MenuItem_id { get; set; }

        public bool Deleted { get; set; }

        public virtual Booking Booking { get; set; }

        public virtual MenuItem MenuItem { get; set; }
    }
}
