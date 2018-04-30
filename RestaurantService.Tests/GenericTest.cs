using DatabaseContext.Data;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using RestaurantService.Controllers;
using RestaurantService.Tests.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;

namespace RestaurantService.Tests.Tests
{
    public class GenericTest
    {
        public CompanyController companyController;
        public RestaurantController restaurantController;
        public TableController tableController;

        public Mock<BookingSystemDb> mockDb;
        public Mock<DbSet<Company>> mockCompanySet;
        public Mock<DbSet<Restaurant>> mockRestaurantsSet;
        public Mock<DbSet<RestaurantMenuItem>> mockRestaurantMenuItemsSet;
        public Mock<DbSet<MenuItem>> mockMenuItemsSet;
        public Mock<DbSet<MenuItemDietInfo>> mockMenuItemDietInfoSet;
        public Mock<DbSet<DietInfo>> mockDietInfoSet;
        public Mock<DbSet<MenuItemType>> mockMenuItemTypeSet;
        public Mock<DbSet<DatabaseContext.Data.Type>> mockTypesSet;
        public Mock<DbSet<Table>> mockTablesSet;
        public Mock<DbSet<TableBooking>> mockTableBookingSet;
        public Mock<DbSet<Booking>> mockBookingSet;
        public Mock<DbSet<BookingMenuItem>> mockBookingMenuItemsSet;
        public Mock<DbSet<Payment>> mockPaymentsSet;
        public Mock<DbSet<PaymentMethod>> mockPaymentMethodsSet;
        public Mock<DbSet<Customer>> mockCustomersSet;

        public SampleData data;

        [TestInitialize]
        public void Init()
        {
            data = new SampleData();
            mockCompanySet = data.Companies;
            mockRestaurantsSet = data.Restaurants;
            mockRestaurantMenuItemsSet = data.RestaurantMenuItems;
            mockMenuItemsSet = data.MenuItems;
            mockMenuItemDietInfoSet = data.MenuItemDietInfos;
            mockDietInfoSet = data.DietInfos;
            mockMenuItemTypeSet = data.MenuItemTypes;
            mockTypesSet = data.Types;
            mockTablesSet = data.Tables;
            mockTableBookingSet = data.TableBookings;
            mockBookingSet = data.Bookings;
            mockBookingMenuItemsSet = data.BookingMenuItems;
            mockPaymentsSet = data.Payments;
            mockPaymentMethodsSet = data.PaymentMethods;
            mockCustomersSet = data.Customers;
            mockDb = data.Context();

            companyController = new CompanyController(mockDb.Object)
            {
                Request = new HttpRequestMessage(),
                Configuration = new HttpConfiguration()
            };

            restaurantController = new RestaurantController(mockDb.Object)
            {
                Request = new HttpRequestMessage(),
                Configuration = new HttpConfiguration()
            };

            tableController = new TableController(mockDb.Object)
            {
                Request = new HttpRequestMessage(),
                Configuration = new HttpConfiguration()
            };
        }
    }
}
