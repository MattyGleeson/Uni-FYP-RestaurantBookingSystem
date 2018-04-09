using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Booking.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class Booking : Dto
    {
        public virtual int CustomerId { get; set; }

        public virtual int RestaurantId { get; set; }

        public virtual DateTime BookingMadeDate { get; set; }

        public virtual TimeSpan BookingMadeTime { get; set; }

        public virtual DateTime BookingDate { get; set; }

        public virtual TimeSpan StartTime { get; set; }

        public virtual TimeSpan EndTime { get; set; }

        public virtual decimal PaymentTotal { get; set; }

        public virtual DateTime? PaymentMadeDate { get; set; }

        public virtual int NoCustomers { get; set; }

        public virtual string Comments { get; set; }

        public virtual bool Cancelled { get; set; }

        public virtual IEnumerable<BookingMenuItem> MenuItems { get; set; }

        public virtual IEnumerable<Payment> Payments { get; set; }

        public virtual IEnumerable<Table> Tables { get; set; }
    }
}
