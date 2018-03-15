using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Payment Method.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class PaymentMethod : Dto
    {
        public virtual string Name { get; set; }

        public virtual int Active { get; set; }

        public virtual IEnumerable<Payment> Payments { get; set; }
    }
}
