using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Menu Item Type.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class MenuItemType : Dto
    {
        public virtual string Name { get; set; }
    }
}
