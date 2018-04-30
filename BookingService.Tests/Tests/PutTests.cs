using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System.Data.Entity;
using System.Net.Http;
using System.Web.Http;
using System.Threading.Tasks;
using BookingService.Tests.Tests;

namespace SelectionBoxService.Tests.Tests
{
    [TestClass]
    public class PutTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestPutChangeNoCustomers()
        {
            HttpResponseMessage response = await bookingController.Update(1, new LibBookingService.Dtos.Booking
            {
                Id = 1,
                CustomerId = 1,
                RestaurantId = 1,
                BookingDate = DateTime.Now,
                BookingMadeDate = DateTime.Now,
                BookingMadeTime = TimeSpan.MinValue,
                NoCustomers = 3,
                StartTime = TimeSpan.MinValue,
                EndTime = TimeSpan.MinValue.Add(TimeSpan.FromHours(1)),
                PaymentTotal = Convert.ToDecimal(6.7800),
                PaymentMadeDate = DateTime.Now,
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutNoChanges()
        {
            HttpResponseMessage response = await bookingController.Update(1, new LibBookingService.Dtos.Booking
            {
                Id = 1,
                CustomerId = 1,
                RestaurantId = 1,
                BookingDate = DateTime.Now,
                BookingMadeDate = DateTime.Now,
                BookingMadeTime = TimeSpan.MinValue,
                NoCustomers = 4,
                StartTime = TimeSpan.MinValue,
                EndTime = TimeSpan.MinValue.Add(TimeSpan.FromHours(1)),
                PaymentTotal = Convert.ToDecimal(6.7800),
                PaymentMadeDate = DateTime.Now,
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }
    }
}
