using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Threading.Tasks;
using System.Net.Http;
using System.Data.Entity;
using Moq;
using System.Web.Http;

namespace BookingService.Tests.Tests
{
    [TestClass]
    public class DeleteTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestRemove()
        {
            HttpResponseMessage response = await bookingController.Delete(1);

            Assert.IsTrue(response.IsSuccessStatusCode);
        }
    }
}
