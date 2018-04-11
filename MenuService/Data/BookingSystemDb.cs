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

        public virtual DbSet<DietInfo> DietInfoes { get; set; }
        public virtual DbSet<MenuItem> MenuItems { get; set; }
        public virtual DbSet<MenuItemDietInfo> MenuItemDietInfoes { get; set; }
        public virtual DbSet<MenuItemType> MenuItemTypes { get; set; }
        public virtual DbSet<Restaurant> Restaurants { get; set; }
        public virtual DbSet<RestaurantMenuItem> RestaurantMenuItems { get; set; }
        public virtual DbSet<Type> Types { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
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
                .HasMany(e => e.RestaurantMenuItems)
                .WithRequired(e => e.Restaurant)
                .HasForeignKey(e => e.Restaurant_id)
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
