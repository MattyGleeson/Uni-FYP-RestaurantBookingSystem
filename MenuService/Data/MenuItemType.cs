namespace MenuService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MenuItemType")]
    public partial class MenuItemType
    {
        public int Id { get; set; }

        public int MenuItem_id { get; set; }

        public int Type_id { get; set; }

        public bool Deleted { get; set; }

        public virtual MenuItem MenuItem { get; set; }

        public virtual Type Type { get; set; }
    }
}
