using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Restaurant.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class Restaurant : Dto
    {
        public virtual int CompanyId { get; set; }

        public virtual string Name { get; set; }

        public virtual string PhoneNo { get; set; }

        public virtual string AddressStreet { get; set; }

        public virtual string AddressCounty { get; set; }

        public virtual string AddressTown { get; set; }

        public virtual string AddressPostalCode { get; set; }

        public virtual IEnumerable<Booking> Bookings { get; set; }

        public virtual IEnumerable<MenuItem> MenuItems { get; set; }

        public virtual IEnumerable<Table> Tables { get; set; }

        public virtual IEnumerable<int> ImageIds { get; set; }
    }
}
