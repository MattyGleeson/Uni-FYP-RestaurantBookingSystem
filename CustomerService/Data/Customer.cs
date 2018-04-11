namespace CustomerService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Customer")]
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            Bookings = new HashSet<Booking>();
            Payments = new HashSet<Payment>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string UserName { get; set; }

        [Required]
        [StringLength(128)]
        public string OwinUserId { get; set; }

        [Required]
        [StringLength(4)]
        public string Title { get; set; }

        [Required]
        [StringLength(20)]
        public string Forename { get; set; }

        [Required]
        [StringLength(25)]
        public string Surname { get; set; }

        [Column(TypeName = "date")]
        public DateTime Dob { get; set; }

        [Required]
        [StringLength(100)]
        public string AddressStreet { get; set; }

        [Required]
        [StringLength(50)]
        public string AddressTown { get; set; }

        [Required]
        [StringLength(50)]
        public string AddressCounty { get; set; }

        [Required]
        [StringLength(8)]
        public string AddressPostalCode { get; set; }

        [Required]
        [StringLength(15)]
        public string HomePhoneNo { get; set; }

        [StringLength(15)]
        public string WorkPhoneNo { get; set; }

        [Required]
        [StringLength(15)]
        public string MobilePhoneNo { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        public bool Deleted { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Booking> Bookings { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Payment> Payments { get; set; }
    }
}
