using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Threading.Tasks;
using System.Net.Http;
using System.Data.Entity;
using Moq;
using System.Web.Http;

namespace MenuService.Tests.Tests
{
    [TestClass]
    public class DeleteTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestRemoveCategory()
        {
            HttpResponseMessage response = await categoryController.Delete(1);

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestRemoveDietInfo()
        {
            HttpResponseMessage response = await dietInfoController.Delete(1);

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestRemoveMenuItem()
        {
            HttpResponseMessage response = await menuController.Delete(1);

            Assert.IsTrue(response.IsSuccessStatusCode);
        }
    }
}
