namespace RestaurantService.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Company")]
    public partial class Company
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Company()
        {
            Restaurants = new HashSet<Restaurant>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(50)]
        public string name { get; set; }

        [StringLength(255)]
        public string description { get; set; }

        [Required]
        [StringLength(15)]
        public string phoneNo { get; set; }

        [Required]
        [StringLength(100)]
        public string addressStreet { get; set; }

        [Required]
        [StringLength(50)]
        public string addressCounty { get; set; }

        [Required]
        [StringLength(50)]
        public string addressTown { get; set; }

        [Required]
        [StringLength(8)]
        public string addressPostalCode { get; set; }

        [Required]
        [StringLength(50)]
        public string email { get; set; }

        public bool deleted { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Restaurant> Restaurants { get; set; }
    }
}
