namespace BookingService.Data
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using BookingService.Data.Core;

    public partial class BookingSystemDb : GenericDbContext
    {
        public BookingSystemDb()
            : base("name=BookingSystemDb")
        {
        }

        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<BookingMenuItem> BookingMenuItems { get; set; }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<DietInfo> DietInfoes { get; set; }
        public virtual DbSet<MenuItem> MenuItems { get; set; }
        public virtual DbSet<MenuItemDietInfo> MenuItemDietInfoes { get; set; }
        public virtual DbSet<MenuItemType> MenuItemTypes { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<PaymentMethod> PaymentMethods { get; set; }
        public virtual DbSet<Restaurant> Restaurants { get; set; }
        public virtual DbSet<RestaurantMenuItem> RestaurantMenuItems { get; set; }
        public virtual DbSet<Table> Tables { get; set; }
        public virtual DbSet<TableBooking> TableBookings { get; set; }
        public virtual DbSet<Type> Types { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Booking>()
                .Property(e => e.PaymentTotal)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Booking>()
                .Property(e => e.Comments)
                .IsUnicode(false);

            modelBuilder.Entity<Booking>()
                .HasMany(e => e.BookingMenuItems)
                .WithRequired(e => e.Booking)
                .HasForeignKey(e => e.Booking_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Booking>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.Booking)
                .HasForeignKey(e => e.Booking_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Booking>()
                .HasMany(e => e.TableBookings)
                .WithRequired(e => e.Booking)
                .HasForeignKey(e => e.Booking_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BookingMenuItem>()
                .Property(e => e.Total)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Company>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.PhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.AddressStreet)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.AddressCounty)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.AddressTown)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.AddressPostalCode)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .HasMany(e => e.Restaurants)
                .WithRequired(e => e.Company)
                .HasForeignKey(e => e.Company_id)
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

            modelBuilder.Entity<DietInfo>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<DietInfo>()
                .HasMany(e => e.MenuItemDietInfoes)
                .WithRequired(e => e.DietInfo)
                .HasForeignKey(e => e.DietInfo_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MenuItem>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<MenuItem>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<MenuItem>()
                .Property(e => e.Price)
                .HasPrecision(19, 4);

            modelBuilder.Entity<MenuItem>()
                .HasMany(e => e.BookingMenuItems)
                .WithRequired(e => e.MenuItem)
                .HasForeignKey(e => e.MenuItem_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MenuItem>()
                .HasMany(e => e.MenuItemDietInfoes)
                .WithRequired(e => e.MenuItem)
                .HasForeignKey(e => e.MenuItem_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MenuItem>()
                .HasMany(e => e.MenuItemTypes)
                .WithRequired(e => e.MenuItem)
                .HasForeignKey(e => e.MenuItem_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MenuItem>()
                .HasMany(e => e.RestaurantMenuItems)
                .WithRequired(e => e.MenuItem)
                .HasForeignKey(e => e.MenuItem_id)
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

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.PhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.AddressStreet)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.AddressCounty)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.AddressTown)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.AddressPostalCode)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .HasMany(e => e.Bookings)
                .WithRequired(e => e.Restaurant)
                .HasForeignKey(e => e.Restaurant_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Restaurant>()
                .HasMany(e => e.RestaurantMenuItems)
                .WithRequired(e => e.Restaurant)
                .HasForeignKey(e => e.Restaurant_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Restaurant>()
                .HasMany(e => e.Tables)
                .WithRequired(e => e.Restaurant)
                .HasForeignKey(e => e.Restaurant_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Table>()
                .Property(e => e.AdditionalNotes)
                .IsUnicode(false);

            modelBuilder.Entity<Table>()
                .HasMany(e => e.TableBookings)
                .WithRequired(e => e.Table)
                .HasForeignKey(e => e.Table_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Type>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Type>()
                .HasMany(e => e.MenuItemTypes)
                .WithRequired(e => e.Type)
                .HasForeignKey(e => e.Type_id)
                .WillCascadeOnDelete(false);
        }
    }
}
