using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Customer.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class Customer : Dto
    {
        public virtual string Title { get; set; }

        public virtual string UserName { get; set; }

        public virtual string OwinUserId { get; set; }

        public virtual string Forename { get; set; }

        public virtual string Surname { get; set; }

        public virtual DateTime DoB { get; set; }

        public virtual string AddressStreet { get; set; }

        public virtual string AddressTown { get; set; }

        public virtual string AddressCounty { get; set; }

        public virtual string AddressPostalCode { get; set; }

        public virtual string HomePhoneNo { get; set; }

        public virtual string WorkPhoneNo { get; set; }

        public virtual string MobilePhoneNo { get; set; }

        public virtual string Email { get; set; }

        public virtual IEnumerable<Booking> Bookings { get; set; }

        public virtual IEnumerable<Payment> Payments { get; set; }
    }
}
