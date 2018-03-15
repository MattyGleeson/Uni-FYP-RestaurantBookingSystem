namespace RestaurantService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RestaurantMenu")]
    public partial class RestaurantMenu
    {
        public int id { get; set; }

        public int facility_id { get; set; }

        public int hotel_id { get; set; }

        public bool deleted { get; set; }

        public virtual MenuItem MenuItem { get; set; }

        public virtual Restaurant Restaurant { get; set; }
    }
}
