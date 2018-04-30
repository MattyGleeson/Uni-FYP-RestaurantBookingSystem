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
using CustomerService.Tests.Data;
using CustomerService.Controllers;

namespace CustomerService.Tests.Tests
{
    [TestClass]
    public class GetTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestGetCustomer()
        {
            HttpResponseMessage response = await customerController.Get(1);
            LibBookingService.Dtos.Customer customer;
            Customer dbCustomer = mockDb.Object.Customers.ToList().First();

            Assert.IsTrue(response.TryGetContentValue(out customer));
            Assert.AreEqual(customer.Id, dbCustomer.Id);
            Assert.IsTrue(true);
        }

        [TestMethod]
        public async Task ServiceTestGetCustomersNoData()
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
            
            CustomerController Controller = new CustomerController(MockDb.Object)
            {
                Request = new HttpRequestMessage(),
                Configuration = new HttpConfiguration()
            };

            HttpResponseMessage response = await Controller.Get(1);

            Assert.IsTrue(response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.NoContent);
        }
    }
}
