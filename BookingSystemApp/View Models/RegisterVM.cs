using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BookingSystemApp.View_Models
{
    public class RegisterVM
    {
        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        [DisplayName("Username")]
        public string Username { get; set; }

        [StringLength(128)]
        public string OwinUserId { get; set; }

        [Required]
        [StringLength(4)]
        public string Title { get; set; }

        [Required]
        [StringLength(20)]
        [DisplayName("Forename (max. 25 characters)")]
        public string Forename { get; set; }

        [Required]
        [StringLength(25)]
        [DisplayName("Surname (max. 25 characters)")]
        public string Surname { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [DisplayName("Date of Birth")]
        public DateTime Dob { get; set; }

        [Required]
        [StringLength(100)]
        [DisplayName("Street (max. 100 characters)")]
        public string AddressStreet { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("Town (max. 50 characters)")]
        public string AddressTown { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("County (max. 50 characters)")]
        public string AddressCounty { get; set; }

        [Required]
        [StringLength(8)]
        [DisplayName("Postal Code (max. 8 characters)")]
        public string AddressPostalCode { get; set; }

        [Required]
        [StringLength(15)]
        [DisplayName("Home Phone No")]
        public string HomePhoneNo { get; set; }

        [StringLength(15)]
        [DisplayName("Work Phone No")]
        public string WorkPhoneNo { get; set; }

        [Required]
        [StringLength(15)]
        [DisplayName("Mobile Phone No")]
        public string MobilePhoneNo { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("Email (max. 50 characters)")]
        public string Email { get; set; }

        [Required]
        [DisplayName("Password")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [DisplayName("Confirm Password")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
    }
}