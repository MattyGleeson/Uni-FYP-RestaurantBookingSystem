using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Diet Info.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class DietInfo : Dto
    {
        public virtual string Name { get; set; }
    }
}
