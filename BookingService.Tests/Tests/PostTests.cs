using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System.Data.Entity;
using System.Net.Http;
using System.Web.Http;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Net;
using BookingService.Tests.Tests;
using DatabaseContext.Data;

namespace BookingService.Tests.Tests
{
    [TestClass]
    public class PostTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestPostBooking()
        {
            HttpResponseMessage response = await bookingController.Post(new LibBookingService.Dtos.Booking
            {
                Id = 2,
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

            mockBookingSet.Verify(m => m.Add(It.IsAny<Booking>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Once);
        }

        [TestMethod]
        public async Task ServiceTestPostBookingSingleTable()
        {
            HttpResponseMessage response = await bookingController.Post(new LibBookingService.Dtos.Booking
            {
                Id = 2,
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
                Tables = new List<LibBookingService.Dtos.Table>()
                {
                    new LibBookingService.Dtos.Table
                    {
                        Id = 1,
                        NoSeats = 4,
                        TableNo = 1,
                        RestaurantId = 1
                    }
                }
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            mockBookingSet.Verify(m => m.Add(It.IsAny<Booking>()), Times.Once);
            mockTableBookingSet.Verify(m => m.Add(It.IsAny<TableBooking>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Exactly(2));
        }

        [TestMethod]
        public async Task ServiceTestPostFullBooking()
        {
            HttpResponseMessage response = await bookingController.Post(new LibBookingService.Dtos.Booking
            {
                Id = 2,
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
                Tables = new List<LibBookingService.Dtos.Table>()
                {
                    new LibBookingService.Dtos.Table
                    {
                        Id = 1,
                        NoSeats = 4,
                        TableNo = 1,
                        RestaurantId = 1
                    }
                },
                MenuItems = new List<LibBookingService.Dtos.BookingMenuItem>()
                {
                    new LibBookingService.Dtos.BookingMenuItem
                    {
                        Id = 2,
                        MenuItemId = 2,
                        BookingId = 2,
                        TotalPrice = 6.78,
                        Quantity = 1
                    }
                }
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            HttpResponseMessage response1 = await paymentController.Post(new LibBookingService.Dtos.Payment
            {
                Id = 2,
                BookingId = 2,
                CustomerId = 1,
                Amount = Convert.ToDecimal(6.78),
                PaymentMethod = new LibBookingService.Dtos.PaymentMethod
                {
                    Id = 2,
                    Name = "PayPal"
                }
            });

            Assert.IsTrue(response1.IsSuccessStatusCode);

            mockBookingSet.Verify(m => m.Add(It.IsAny<Booking>()), Times.Once);
            mockTableBookingSet.Verify(m => m.Add(It.IsAny<TableBooking>()), Times.Once);
            mockBookingMenuItemsSet.Verify(m => m.Add(It.IsAny<BookingMenuItem>()), Times.Once);
            mockPaymentsSet.Verify(m => m.Add(It.IsAny<Payment>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Exactly(4));
        }

        [TestMethod]
        public async Task ServiceTestPostNullBooking()
        {
            HttpResponseMessage response = await bookingController.Post(null);

            Assert.IsTrue(!response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.InternalServerError);
        }
    }
}
