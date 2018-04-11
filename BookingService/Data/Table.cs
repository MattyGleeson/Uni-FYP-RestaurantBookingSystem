namespace BookingService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Table")]
    public partial class Table
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Table()
        {
            TableBookings = new HashSet<TableBooking>();
        }

        public int Id { get; set; }

        public int Restaurant_id { get; set; }

        public int TableNo { get; set; }

        [StringLength(150)]
        public string AdditionalNotes { get; set; }

        public int NoSeats { get; set; }

        public bool Active { get; set; }

        public bool Deleted { get; set; }

        public virtual Restaurant Restaurant { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TableBooking> TableBookings { get; set; }
    }
}
