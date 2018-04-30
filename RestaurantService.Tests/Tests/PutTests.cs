using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System.Data.Entity;
using System.Net.Http;
using System.Web.Http;
using System.Threading.Tasks;

namespace RestaurantService.Tests.Tests
{
    [TestClass]
    public class PutTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestPutRestaurantChangeName()
        {
            HttpResponseMessage response = await restaurantController.Update(1, new LibBookingService.Dtos.Restaurant
            {
                Id = 1,
                CompanyId = 1,
                Name = "Restaurant 123",
                PhoneNo = "01429354096",
                AddressStreet = "21 Restaurant Road",
                AddressTown = "Hartlepool",
                AddressCounty = "Cleveland",
                AddressPostalCode = "TS248GX"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutRestaurantNoChanges()
        {
            HttpResponseMessage response = await restaurantController.Update(1, new LibBookingService.Dtos.Restaurant
            {
                Id = 1,
                CompanyId = 1,
                Name = "Restaurant 1",
                PhoneNo = "01429354096",
                AddressStreet = "21 Restaurant Road",
                AddressTown = "Hartlepool",
                AddressCounty = "Cleveland",
                AddressPostalCode = "TS248GX"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutTableChangeNoSeats()
        {
            HttpResponseMessage response = await tableController.Update(1, new LibBookingService.Dtos.Table
            {
                Id = 1,
                RestaurantId = 1,
                NoSeats = 5,
                TableNo = 1,
                Active = true
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutTableNoChanges()
        {
            HttpResponseMessage response = await tableController.Update(1, new LibBookingService.Dtos.Table
            {
                Id = 1,
                RestaurantId = 1,
                NoSeats = 4,
                TableNo = 1,
                Active = true
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }
    }
}
