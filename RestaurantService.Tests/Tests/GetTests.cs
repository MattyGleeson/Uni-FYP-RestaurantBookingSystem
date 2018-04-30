using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System.Data.Entity;
using System.Net.Http;
using System.Web.Http;
using System.Net;
using System.Linq;
using System.Data.Entity.Infrastructure;
using System.Collections.Generic;
using System.Threading.Tasks;
using DatabaseContext.Data;
using RestaurantService.Tests.Data;
using RestaurantService.Controllers;

namespace RestaurantService.Tests.Tests
{
    [TestClass]
    public class GetTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestGetCompany()
        {
            HttpResponseMessage response = await companyController.Get();
            LibBookingService.Dtos.Company company;
            Company dbCompany = mockDb.Object.Companies.ToList().First();

            Assert.IsTrue(response.TryGetContentValue(out company));
            Assert.AreEqual(company.Id, dbCompany.Id);
            Assert.IsTrue(true);
        }

        [TestMethod]
        public async Task ServiceTestGetRestaurants()
        {
            HttpResponseMessage response = await restaurantController.Get();
            IEnumerable<LibBookingService.Dtos.Restaurant> restaurants;
            IEnumerable<Restaurant> dbRestaurants = mockDb.Object.Restaurants.ToList();

            Assert.IsTrue(response.TryGetContentValue(out restaurants));
            Assert.AreEqual(restaurants.Count(), dbRestaurants.Count());
            Assert.IsTrue(true);
        }

        [TestMethod]
        public async Task ServiceTestGetTables()
        {
            HttpResponseMessage response = await tableController.Get();
            IEnumerable<LibBookingService.Dtos.Table> tables;
            IEnumerable<Table> dbTables = mockDb.Object.Tables.ToList();

            Assert.IsTrue(response.TryGetContentValue(out tables));
            Assert.AreEqual(tables.Count(), dbTables.Count());
            Assert.IsTrue(true);
        }

        [TestMethod]
        public async Task ServiceTestGetCompanyNoData()
        {
            SampleData Data = new SampleData(false);

            Mock<BookingSystemDb> MockDb = Data.Context();
            Mock<DbSet<Company>> MockCompanySet = data.Companies;
            Mock<DbSet<Restaurant>> MockRestaurantsSet = data.Restaurants;
            Mock<DbSet<RestaurantMenuItem>> MockRestaurantMenuItemsSet = data.RestaurantMenuItems;
            Mock<DbSet<MenuItem>> MockMenuItemsSet = data.MenuItems;
            Mock<DbSet<MenuItemDietInfo>> MockMenuItemDietInfoSet = data.MenuItemDietInfos;
            Mock<DbSet<DietInfo>> MockDietInfoSet = data.DietInfos;
            Mock<DbSet<MenuItemType>> MockMenuItemTypeSet = data.MenuItemTypes;
            Mock<DbSet<DatabaseContext.Data.Type>> MockTypesSet = data.Types;
            Mock<DbSet<Table>> MockTablesSet = data.Tables;
            Mock<DbSet<TableBooking>> MockTableBookingSet = data.TableBookings;
            Mock<DbSet<Booking>> MockBookingSet = data.Bookings;
            Mock<DbSet<BookingMenuItem>> MockBookingMenuItemsSet = data.BookingMenuItems;
            Mock<DbSet<Payment>> MockPaymentsSet = data.Payments;
            Mock<DbSet<PaymentMethod>> MockPaymentMethodsSet = data.PaymentMethods;
            Mock<DbSet<Customer>> MockCustomersSet = data.Customers;
            
            CompanyController Controller = new CompanyController(MockDb.Object)
            {
                Request = new HttpRequestMessage(),
                Configuration = new HttpConfiguration()
            };

            HttpResponseMessage response = await Controller.Get();

            Assert.IsTrue(response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.NoContent);
        }

        [TestMethod]
        public async Task ServiceTestGetRestaurantsNoData()
        {
            SampleData Data = new SampleData(false);

            Mock<BookingSystemDb> MockDb = Data.Context();
            Mock<DbSet<Company>> MockCompanySet = data.Companies;
            Mock<DbSet<Restaurant>> MockRestaurantsSet = data.Restaurants;
            Mock<DbSet<RestaurantMenuItem>> MockRestaurantMenuItemsSet = data.RestaurantMenuItems;
            Mock<DbSet<MenuItem>> MockMenuItemsSet = data.MenuItems;
            Mock<DbSet<MenuItemDietInfo>> MockMenuItemDietInfoSet = data.MenuItemDietInfos;
            Mock<DbSet<DietInfo>> MockDietInfoSet = data.DietInfos;
            Mock<DbSet<MenuItemType>> MockMenuItemTypeSet = data.MenuItemTypes;
            Mock<DbSet<DatabaseContext.Data.Type>> MockTypesSet = data.Types;
            Mock<DbSet<Table>> MockTablesSet = data.Tables;
            Mock<DbSet<TableBooking>> MockTableBookingSet = data.TableBookings;
            Mock<DbSet<Booking>> MockBookingSet = data.Bookings;
            Mock<DbSet<BookingMenuItem>> MockBookingMenuItemsSet = data.BookingMenuItems;
            Mock<DbSet<Payment>> MockPaymentsSet = data.Payments;
            Mock<DbSet<PaymentMethod>> MockPaymentMethodsSet = data.PaymentMethods;
            Mock<DbSet<Customer>> MockCustomersSet = data.Customers;

            RestaurantController Controller = new RestaurantController(MockDb.Object)
            {
                Request = new HttpRequestMessage(),
                Configuration = new HttpConfiguration()
            };

            HttpResponseMessage response = await Controller.Get();

            Assert.IsTrue(response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.NoContent);
        }

        [TestMethod]
        public async Task ServiceTestGetTableNoData()
        {
            SampleData Data = new SampleData(false);

            Mock<BookingSystemDb> MockDb = Data.Context();
            Mock<DbSet<Company>> MockCompanySet = data.Companies;
            Mock<DbSet<Restaurant>> MockRestaurantsSet = data.Restaurants;
            Mock<DbSet<RestaurantMenuItem>> MockRestaurantMenuItemsSet = data.RestaurantMenuItems;
            Mock<DbSet<MenuItem>> MockMenuItemsSet = data.MenuItems;
            Mock<DbSet<MenuItemDietInfo>> MockMenuItemDietInfoSet = data.MenuItemDietInfos;
            Mock<DbSet<DietInfo>> MockDietInfoSet = data.DietInfos;
            Mock<DbSet<MenuItemType>> MockMenuItemTypeSet = data.MenuItemTypes;
            Mock<DbSet<DatabaseContext.Data.Type>> MockTypesSet = data.Types;
            Mock<DbSet<Table>> MockTablesSet = data.Tables;
            Mock<DbSet<TableBooking>> MockTableBookingSet = data.TableBookings;
            Mock<DbSet<Booking>> MockBookingSet = data.Bookings;
            Mock<DbSet<BookingMenuItem>> MockBookingMenuItemsSet = data.BookingMenuItems;
            Mock<DbSet<Payment>> MockPaymentsSet = data.Payments;
            Mock<DbSet<PaymentMethod>> MockPaymentMethodsSet = data.PaymentMethods;
            Mock<DbSet<Customer>> MockCustomersSet = data.Customers;

            TableController Controller = new TableController(MockDb.Object)
            {
                Request = new HttpRequestMessage(),
                Configuration = new HttpConfiguration()
            };

            HttpResponseMessage response = await Controller.Get();

            Assert.IsTrue(response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.NoContent);
        }
    }
}
