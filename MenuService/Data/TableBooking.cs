namespace MenuService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TableBooking")]
    public partial class TableBooking
    {
        public int id { get; set; }

        public int booking_id { get; set; }

        public int table_id { get; set; }

        public bool deleted { get; set; }

        public virtual Booking Booking { get; set; }

        public virtual Table Table { get; set; }
    }
}
