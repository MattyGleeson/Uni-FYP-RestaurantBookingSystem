using System;
using System.Collections.Generic;
using System.Text;

namespace LibBookingService.Dtos
{
    /// <summary>
    /// Class Company.
    /// </summary>
    /// <seealso cref="LibBookingService.Dto" />
    public class Company : Dto
    {
        public virtual string Name { get; set; }

        public virtual string Description { get; set; }

        public virtual string PhoneNo { get; set; }

        public virtual string AddressStreet { get; set; }

        public virtual string AddressCounty { get; set; }

        public virtual string AddressTown { get; set; }

        public virtual string AddressPostalCode { get; set; }

        public virtual string Email { get; set; }

        public virtual IEnumerable<Restaurant> Restaurants { get; set; }
        
    }
}
