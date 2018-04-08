namespace MenuService.Data
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
                .Property(e => e.paymentTotal)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Booking>()
                .Property(e => e.comments)
                .IsUnicode(false);

            modelBuilder.Entity<Booking>()
                .HasMany(e => e.BookingMenuItems)
                .WithRequired(e => e.Booking)
                .HasForeignKey(e => e.booking_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Booking>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.Booking)
                .HasForeignKey(e => e.booking_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Booking>()
                .HasMany(e => e.TableBookings)
                .WithRequired(e => e.Booking)
                .HasForeignKey(e => e.booking_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BookingMenuItem>()
                .Property(e => e.total)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Company>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.phoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.addressStreet)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.addressCounty)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.addressTown)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.addressPostalCode)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .HasMany(e => e.Restaurants)
                .WithRequired(e => e.Company)
                .HasForeignKey(e => e.company_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.title)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.forename)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.surname)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.addressStreet)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.addressTown)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.addressCounty)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.addressPostalCode)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.homePhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.workPhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.mobilePhoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Bookings)
                .WithRequired(e => e.Customer)
                .HasForeignKey(e => e.customer_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.Customer)
                .HasForeignKey(e => e.customer_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DietInfo>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<DietInfo>()
                .HasMany(e => e.MenuItemDietInfoes)
                .WithRequired(e => e.DietInfo)
                .HasForeignKey(e => e.dietInfo_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MenuItem>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<MenuItem>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<MenuItem>()
                .Property(e => e.price)
                .HasPrecision(19, 4);

            modelBuilder.Entity<MenuItem>()
                .HasMany(e => e.BookingMenuItems)
                .WithRequired(e => e.MenuItem)
                .HasForeignKey(e => e.menuItem_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MenuItem>()
                .HasMany(e => e.MenuItemDietInfoes)
                .WithRequired(e => e.MenuItem)
                .HasForeignKey(e => e.menuItem_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MenuItem>()
                .HasMany(e => e.MenuItemTypes)
                .WithRequired(e => e.MenuItem)
                .HasForeignKey(e => e.menuItem_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MenuItem>()
                .HasMany(e => e.RestaurantMenuItems)
                .WithRequired(e => e.MenuItem)
                .HasForeignKey(e => e.menuItem_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Payment>()
                .Property(e => e.amount)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Payment>()
                .Property(e => e.comments)
                .IsUnicode(false);

            modelBuilder.Entity<PaymentMethod>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<PaymentMethod>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.PaymentMethod)
                .HasForeignKey(e => e.paymentMethod_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.phoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.addressStreet)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.addressCounty)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.addressTown)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .Property(e => e.addressPostalCode)
                .IsUnicode(false);

            modelBuilder.Entity<Restaurant>()
                .HasMany(e => e.RestaurantMenuItems)
                .WithRequired(e => e.Restaurant)
                .HasForeignKey(e => e.restaurant_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Restaurant>()
                .HasMany(e => e.Tables)
                .WithRequired(e => e.Restaurant)
                .HasForeignKey(e => e.restaurant_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Table>()
                .Property(e => e.additionalNotes)
                .IsUnicode(false);

            modelBuilder.Entity<Table>()
                .HasMany(e => e.TableBookings)
                .WithRequired(e => e.Table)
                .HasForeignKey(e => e.table_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Type>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Type>()
                .HasMany(e => e.MenuItemTypes)
                .WithRequired(e => e.Type)
                .HasForeignKey(e => e.type_id)
                .WillCascadeOnDelete(false);
        }
    }
}
