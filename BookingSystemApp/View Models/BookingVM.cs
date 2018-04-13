using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class BookingVM
    {
        public int Id { get; set; }

        [Required]
        public int CustomerId { get; set; }

        [Required]
        public int RestaurantId { get; set; }

        public RestaurantVM Restaurant { get; set; }

        [Required]
        public DateTime BookingMadeDate { get; set; }

        [Required]
        public TimeSpan BookingMadeTime { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [DisplayName("Date")]
        public DateTime BookingDate { get; set; }

        [Required]
        [DisplayName("Time")]
        public TimeSpan StartTime { get; set; }

        public TimeSpan EndTime { get; set; }

        public decimal PaymentTotal { get; set; }

        public DateTime PaymentMadeDate { get; set; }

        [Required]
        [DisplayName("Number of Customers")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value greater than 0")]
        public int NoCustomers { get; set; }

        [StringLength(150)]
        [DisplayName("Additional Comments")]
        public string Comments { get; set; }

        public bool Cancelled { get; set; }
    }
}