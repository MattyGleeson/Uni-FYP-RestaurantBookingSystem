﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DatabaseContext.Data
{
    using Core;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;

    public partial class BookingSystemDb : GenericDbContext
    {
        public BookingSystemDb()
            : base("name=BookingSystemDb")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<BookingMenuItem> BookingMenuItems { get; set; }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<DietInfo> DietInfoes { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<MenuItem> MenuItems { get; set; }
        public virtual DbSet<MenuItemDietInfo> MenuItemDietInfoes { get; set; }
        public virtual DbSet<MenuItemImage> MenuItemImages { get; set; }
        public virtual DbSet<MenuItemType> MenuItemTypes { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<PaymentMethod> PaymentMethods { get; set; }
        public virtual DbSet<Restaurant> Restaurants { get; set; }
        public virtual DbSet<RestaurantImage> RestaurantImages { get; set; }
        public virtual DbSet<RestaurantMenuItem> RestaurantMenuItems { get; set; }
        public virtual DbSet<Table> Tables { get; set; }
        public virtual DbSet<TableBooking> TableBookings { get; set; }
        public virtual DbSet<Type> Types { get; set; }
    }
}
