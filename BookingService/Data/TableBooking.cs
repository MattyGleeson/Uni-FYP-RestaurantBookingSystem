namespace BookingService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TableBooking")]
    public partial class TableBooking
    {
        public int Id { get; set; }

        public int Booking_id { get; set; }

        public int Table_id { get; set; }

        public bool Deleted { get; set; }

        public virtual Booking Booking { get; set; }

        public virtual Table Table { get; set; }
    }
}
