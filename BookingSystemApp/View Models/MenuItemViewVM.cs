using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class MenuItemViewVM
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(255)]
        public string Description { get; set; }

        [Required]
        [RegularExpression(@"^\d+\.\d{0,2}$")]
        [Range(0, 9999999999999999.99)]
        [DisplayFormat(DataFormatString = "{0:n2}", ApplyFormatInEditMode = true)]
        public double Price { get; set; }

        public string TypesS { get; set; }

        public string DietInfoS { get; set; }

        public virtual IEnumerable<MenuItemType> Types { get; set; }

        public virtual IEnumerable<DietInfo> DietInfo { get; set; }

        public int? ImageId { get; set; }
    }
}