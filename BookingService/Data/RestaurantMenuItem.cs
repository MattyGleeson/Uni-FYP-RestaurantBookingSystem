namespace BookingService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RestaurantMenuItem")]
    public partial class RestaurantMenuItem
    {
        public int Id { get; set; }

        public int Restaurant_id { get; set; }

        public int MenuItem_id { get; set; }

        public bool Deleted { get; set; }

        public virtual MenuItem MenuItem { get; set; }

        public virtual Restaurant Restaurant { get; set; }
    }
}
