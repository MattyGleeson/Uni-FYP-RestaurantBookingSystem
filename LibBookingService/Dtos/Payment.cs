using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Payment.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class Payment : Dto
    {
        public virtual int CustomerId { get; set; }

        public virtual int BookingId { get; set; }

        public virtual decimal Amount { get; set; }

        public virtual string Comments { get; set; }

        public virtual PaymentMethod PaymentMethod { get; set; }
    }
}
