using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Threading.Tasks;
using System.Net.Http;
using System.Data.Entity;
using Moq;
using System.Web.Http;

namespace CustomerService.Tests.Tests
{
    [TestClass]
    public class DeleteTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestRemoveCustomer()
        {
            HttpResponseMessage response = await customerController.Delete(1);

            Assert.IsTrue(response.IsSuccessStatusCode);
        }
    }
}
