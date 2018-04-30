using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Threading.Tasks;
using System.Net.Http;
using System.Data.Entity;
using Moq;
using System.Web.Http;

namespace RestaurantService.Tests.Tests
{
    [TestClass]
    public class DeleteTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestRemoveRestaurant()
        {
            HttpResponseMessage response = await restaurantController.Delete(1);

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestRemoveTable()
        {
            HttpResponseMessage response = await tableController.Delete(1);

            Assert.IsTrue(response.IsSuccessStatusCode);
        }
    }
}
