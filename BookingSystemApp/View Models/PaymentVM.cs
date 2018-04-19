using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class PaymentVM
    {
        public virtual int Id { get; set; }

        [Required]
        public virtual int CustomerId { get; set; }

        [Required]
        public virtual int BookingId { get; set; }

        [Required]
        [RegularExpression(@"^\d+\.\d{0,2}$")]
        [Range(0, 9999999999999999.99)]
        [DisplayFormat(DataFormatString = "{0:n2}", ApplyFormatInEditMode = true)]
        public virtual double Amount { get; set; }

        public virtual string Comments { get; set; }

        [Required]
        public virtual int PaymentMethod { get; set; }
    }
}