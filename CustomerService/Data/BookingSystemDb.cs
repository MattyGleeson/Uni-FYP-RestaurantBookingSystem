namespace CustomerService.Data
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using CustomerService.Data.Core;

    public partial class BookingSystemDb : GenericDbContext
    {
        public BookingSystemDb()
            : base("name=BookingSystemDb")
        {
        }

        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<PaymentMethod> PaymentMethods { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Booking>()
                .Property(e => e.PaymentTotal)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Booking>()
                .Property(e => e.Comments)
                .IsUnicode(false);

            modelBuilder.Entity<Booking>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.Booking)
                .HasForeignKey(e => e.Booking_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Forename)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Surname)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.AddressStreet)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.AddressTown)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.AddressCounty)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.AddressPostalCode)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.HomePhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.WorkPhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.MobilePhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Bookings)
                .WithRequired(e => e.Customer)
                .HasForeignKey(e => e.Customer_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.Customer)
                .HasForeignKey(e => e.Customer_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Payment>()
                .Property(e => e.Amount)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Payment>()
                .Property(e => e.Comments)
                .IsUnicode(false);

            modelBuilder.Entity<PaymentMethod>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<PaymentMethod>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.PaymentMethod)
                .HasForeignKey(e => e.PaymentMethod_id)
                .WillCascadeOnDelete(false);
        }
    }
}
