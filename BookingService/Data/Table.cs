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

        public int id { get; set; }

        public int restaurant_id { get; set; }

        public int tableNo { get; set; }

        [StringLength(150)]
        public string additionalNotes { get; set; }

        public int noSeats { get; set; }

        public bool active { get; set; }

        public bool deleted { get; set; }

        public virtual Restaurant Restaurant { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TableBooking> TableBookings { get; set; }
    }
}
