using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class TableVM
    {
        public int Id { get; set; }

        [Required]
        public int RestaurantId { get; set; }

        [Required]
        public int TableNo { get; set; }

        [StringLength(150)]
        public string AdditionalNotes { get; set; }

        [Required]
        public int NoSeats { get; set; }

        public bool Active { get; set; }
    }
}