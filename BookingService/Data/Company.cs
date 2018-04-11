namespace BookingService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Company")]
    public partial class Company
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Company()
        {
            Restaurants = new HashSet<Restaurant>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(255)]
        public string Description { get; set; }

        [Required]
        [StringLength(15)]
        public string PhoneNo { get; set; }

        [Required]
        [StringLength(100)]
        public string AddressStreet { get; set; }

        [Required]
        [StringLength(50)]
        public string AddressCounty { get; set; }

        [Required]
        [StringLength(50)]
        public string AddressTown { get; set; }

        [Required]
        [StringLength(8)]
        public string AddressPostalCode { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        public bool Deleted { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Restaurant> Restaurants { get; set; }
    }
}
