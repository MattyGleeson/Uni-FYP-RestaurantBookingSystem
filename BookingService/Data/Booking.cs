namespace BookingService.Data
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
            BookingMenuItems = new HashSet<BookingMenuItem>();
            Payments = new HashSet<Payment>();
            TableBookings = new HashSet<TableBooking>();
        }

        public int id { get; set; }

        public int customer_id { get; set; }

        [Column(TypeName = "date")]
        public DateTime bookingMadeDate { get; set; }

        public TimeSpan bookingMadeTime { get; set; }

        public TimeSpan startTime { get; set; }

        public TimeSpan endTime { get; set; }

        public decimal paymentTotal { get; set; }

        [Column(TypeName = "date")]
        public DateTime? paymentMadeDate { get; set; }

        public int noCustomers { get; set; }

        [StringLength(150)]
        public string comments { get; set; }

        public bool cancelled { get; set; }

        public bool deleted { get; set; }

        public virtual Customer Customer { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingMenuItem> BookingMenuItems { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Payment> Payments { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TableBooking> TableBookings { get; set; }
    }
}
