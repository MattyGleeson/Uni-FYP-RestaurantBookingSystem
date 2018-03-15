using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Menu Item.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class MenuItem : Dto
    {
        public virtual string Name { get; set; }

        public virtual string Description { get; set; }

        public virtual bool ContainsNuts { get; set; }

        public virtual IEnumerable<MenuItemType> Types { get; set; }

        public virtual IEnumerable<DietInfo> DietInfo { get; set; }
    }
}
