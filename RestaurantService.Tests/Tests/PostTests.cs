using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System.Data.Entity;
using System.Net.Http;
using System.Web.Http;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Net;
using DatabaseContext.Data;

namespace RestaurantService.Tests.Tests
{
    [TestClass]
    public class PostTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestPostRestaurant()
        {
            HttpResponseMessage response = await restaurantController.Post(new LibBookingService.Dtos.Restaurant
            {
                Id = 3,
                CompanyId = 1,
                Name = "Restaurant 3",
                PhoneNo = "01429354096",
                AddressStreet = "24 Restaurant Road",
                AddressTown = "Hartlepool",
                AddressCounty = "Cleveland",
                AddressPostalCode = "TS248GX"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            mockRestaurantsSet.Verify(m => m.Add(It.IsAny<Restaurant>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Once);
        }

        [TestMethod]
        public async Task ServiceTestPostTable()
        {
            HttpResponseMessage response = await tableController.Post(new LibBookingService.Dtos.Table
            {
                Id = 3,
                RestaurantId = 1,
                NoSeats = 4,
                TableNo = 1,
                Active = true
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            mockTablesSet.Verify(m => m.Add(It.IsAny<Table>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Once);
        }
        
        [TestMethod]
        public async Task ServiceTestPostNullRestaurant()
        {
            HttpResponseMessage response = await restaurantController.Post(null);

            Assert.IsTrue(!response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.InternalServerError);
        }

        [TestMethod]
        public async Task ServiceTestPostNullTable()
        {
            HttpResponseMessage response = await tableController.Post(null);

            Assert.IsTrue(!response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.InternalServerError);
        }
    }
}
