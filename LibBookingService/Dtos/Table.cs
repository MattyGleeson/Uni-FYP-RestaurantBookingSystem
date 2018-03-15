using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Table.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class Table : Dto
    {
        public virtual int RestaurantId { get; set; }

        public virtual string AdditionalNotes { get; set; }

        public virtual int NoSeats { get; set; }

        public virtual bool Active { get; set; }

        public virtual IEnumerable<Booking> TableBookings { get; set; }
    }
}
