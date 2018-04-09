namespace CustomerService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RestaurantMenuItem")]
    public partial class RestaurantMenuItem
    {
        public int id { get; set; }

        public int restaurant_id { get; set; }

        public int menuItem_id { get; set; }

        public bool deleted { get; set; }

        public virtual MenuItem MenuItem { get; set; }

        public virtual Restaurant Restaurant { get; set; }
    }
}
