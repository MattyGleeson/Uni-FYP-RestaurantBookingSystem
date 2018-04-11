namespace CustomerService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Booking")]
    public partial class Booking
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Booking()
        {
            Payments = new HashSet<Payment>();
        }

        public int Id { get; set; }

        public int Customer_id { get; set; }

        public int Restaurant_id { get; set; }

        [Column(TypeName = "date")]
        public DateTime BookingMadeDate { get; set; }

        public TimeSpan BookingMadeTime { get; set; }

        [Column(TypeName = "date")]
        public DateTime BookingDate { get; set; }

        public TimeSpan StartTime { get; set; }

        public TimeSpan EndTime { get; set; }

        public decimal PaymentTotal { get; set; }

        [Column(TypeName = "date")]
        public DateTime? PaymentMadeDate { get; set; }

        public int NoCustomers { get; set; }

        [StringLength(150)]
        public string Comments { get; set; }

        public bool Cancelled { get; set; }

        public bool Deleted { get; set; }

        public virtual Customer Customer { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Payment> Payments { get; set; }
    }
}
