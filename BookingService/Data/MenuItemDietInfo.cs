namespace BookingService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MenuItemDietInfo")]
    public partial class MenuItemDietInfo
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id { get; set; }

        public int menuItem_id { get; set; }

        public int dietInfo_id { get; set; }

        public bool deleted { get; set; }

        public virtual DietInfo DietInfo { get; set; }

        public virtual MenuItem MenuItem { get; set; }
    }
}
