using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System.Data.Entity;
using System.Net.Http;
using System.Web.Http;
using System.Threading.Tasks;

namespace MenuService.Tests.Tests
{
    [TestClass]
    public class PutTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestPutCategoryChangeName()
        {
            HttpResponseMessage response = await categoryController.Update(1, new LibBookingService.Dtos.MenuItemType
            {
                Id = 1,
                Name = "Starter123"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutCategoryNoChanges()
        {
            HttpResponseMessage response = await categoryController.Update(1, new LibBookingService.Dtos.MenuItemType
            {
                Id = 1,
                Name = "Starter"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutDietInfoChangeName()
        {
            HttpResponseMessage response = await dietInfoController.Update(1, new LibBookingService.Dtos.DietInfo
            {
                Id = 1,
                Name = "Vegetarian123"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutDietInfoNoChanges()
        {
            HttpResponseMessage response = await dietInfoController.Update(1, new LibBookingService.Dtos.DietInfo
            {
                Id = 1,
                Name = "Vegetarian"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutMenuItemChangeName()
        {
            HttpResponseMessage response = await menuController.Update(1, new LibBookingService.Dtos.MenuItem
            {
                Id = 1,
                Name = "Tomato soup123",
                Description = "A bowl of our delicious tomato soup",
                Price = 3.45
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutMenuItemNoChanges()
        {
            HttpResponseMessage response = await menuController.Update(1, new LibBookingService.Dtos.MenuItem
            {
                Id = 1,
                Name = "Tomato soup",
                Description = "A bowl of our delicious tomato soup",
                Price = 3.45
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }
    }
}
