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
using MenuService.Tests.Data;
using MenuService.Controllers;

namespace MenuService.Tests.Tests
{
    [TestClass]
    public class GetTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestGetCategories()
        {
            HttpResponseMessage response = await categoryController.Get();
            IEnumerable<LibBookingService.Dtos.MenuItemType> types;
            IEnumerable<DatabaseContext.Data.Type> dbTypes = mockDb.Object.Types.ToList();

            Assert.IsTrue(response.TryGetContentValue(out types));
            Assert.AreEqual(types.Count(), dbTypes.Count());
            Assert.IsTrue(true);
        }

        [TestMethod]
        public async Task ServiceTestGetDietInfo()
        {
            HttpResponseMessage response = await dietInfoController.Get();
            IEnumerable<LibBookingService.Dtos.DietInfo> dietInfoes;
            IEnumerable<DietInfo> dbDietInfoes = mockDb.Object.DietInfoes.ToList();

            Assert.IsTrue(response.TryGetContentValue(out dietInfoes));
            Assert.AreEqual(dietInfoes.Count(), dbDietInfoes.Count());
            Assert.IsTrue(true);
        }

        [TestMethod]
        public async Task ServiceTestGetMenuItems()
        {
            HttpResponseMessage response = await menuController.Get();
            IEnumerable<LibBookingService.Dtos.MenuItem> menuItems;
            IEnumerable<MenuItem> dbMenuItems = mockDb.Object.MenuItems.ToList();

            Assert.IsTrue(response.TryGetContentValue(out menuItems));
            Assert.AreEqual(menuItems.Count(), dbMenuItems.Count());
            Assert.IsTrue(true);
        }

        [TestMethod]
        public async Task ServiceTestGetCategoriesNoData()
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
            
            CategoryController Controller = new CategoryController(MockDb.Object)
            {
                Request = new HttpRequestMessage(),
                Configuration = new HttpConfiguration()
            };

            HttpResponseMessage response = await Controller.Get();

            Assert.IsTrue(response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.NoContent);
        }

        [TestMethod]
        public async Task ServiceTestGetDietInfoNoData()
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

            DietInfoController Controller = new DietInfoController(MockDb.Object)
            {
                Request = new HttpRequestMessage(),
                Configuration = new HttpConfiguration()
            };

            HttpResponseMessage response = await Controller.Get();

            Assert.IsTrue(response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.NoContent);
        }

        [TestMethod]
        public async Task ServiceTestGetMenuItemsNoData()
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

            MenuController Controller = new MenuController(MockDb.Object)
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
