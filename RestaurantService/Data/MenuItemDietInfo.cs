namespace RestaurantService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MenuItemDietInfo")]
    public partial class MenuItemDietInfo
    {
        public int Id { get; set; }

        public int MenuItem_id { get; set; }

        public int DietInfo_id { get; set; }

        public bool Deleted { get; set; }

        public virtual DietInfo DietInfo { get; set; }

        public virtual MenuItem MenuItem { get; set; }
    }
}
