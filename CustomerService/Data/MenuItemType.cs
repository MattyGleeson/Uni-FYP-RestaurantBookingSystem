namespace CustomerService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MenuItemType")]
    public partial class MenuItemType
    {
        public int id { get; set; }

        public int menuItem_id { get; set; }

        public int type_id { get; set; }

        public bool deleted { get; set; }

        public virtual MenuItem MenuItem { get; set; }

        public virtual Type Type { get; set; }
    }
}
