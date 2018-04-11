namespace BookingService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Payment")]
    public partial class Payment
    {
        public int Id { get; set; }

        public int PaymentMethod_id { get; set; }

        public int Customer_id { get; set; }

        public int Booking_id { get; set; }

        public decimal Amount { get; set; }

        [StringLength(150)]
        public string Comments { get; set; }

        public bool Deleted { get; set; }

        public virtual Booking Booking { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual PaymentMethod PaymentMethod { get; set; }
    }
}
