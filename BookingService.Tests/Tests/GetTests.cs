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
using BookingService.Tests.Tests;
using DatabaseContext.Data;
using BookingService.Tests.Data;
using BookingService.Controllers;

namespace SelectionBoxService.Tests.Tests
{
    [TestClass]
    public class GetTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestGet()
        {
            Console.WriteLine("Test Get");
            HttpResponseMessage response = await bookingController.Get();
            Console.WriteLine("Test Get");
            IEnumerable<LibBookingService.Dtos.Booking> bookings;
            IEnumerable<Booking> dbBookings = mockDb.Object.Bookings.ToList();

            Assert.IsTrue(response.TryGetContentValue(out bookings));
            Assert.AreEqual(bookings.Count(), dbBookings.Count());
            Assert.IsTrue(true);
        }

        [TestMethod]
        public async Task ServiceTestGetNoData()
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
            
            BookingController Controller = new BookingController(MockDb.Object)
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
