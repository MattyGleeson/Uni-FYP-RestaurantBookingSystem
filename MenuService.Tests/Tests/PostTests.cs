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

namespace MenuService.Tests.Tests
{
    [TestClass]
    public class PostTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestPostCategory()
        {
            HttpResponseMessage response = await categoryController.Post(new LibBookingService.Dtos.MenuItemType
            {
                Id = 5,
                Name = "New Category"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            mockTypesSet.Verify(m => m.Add(It.IsAny<DatabaseContext.Data.Type>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Once);
        }

        [TestMethod]
        public async Task ServiceTestPostDietInfo()
        {
            HttpResponseMessage response = await dietInfoController.Post(new LibBookingService.Dtos.DietInfo
            {
                Id = 5,
                Name = "New Diet Info"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            mockDietInfoSet.Verify(m => m.Add(It.IsAny<DietInfo>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Once);
        }

        [TestMethod]
        public async Task ServiceTestPostMenuItem()
        {
            HttpResponseMessage response = await menuController.Post(new LibBookingService.Dtos.MenuItem
            {
                Id = 5,
                Name = "New Menu Item"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            mockMenuItemsSet.Verify(m => m.Add(It.IsAny<MenuItem>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Once);
        }

        [TestMethod]
        public async Task ServiceTestPostMenuItemDietInfo()
        {
            HttpResponseMessage response = await menuController.Post(new LibBookingService.Dtos.MenuItem
            {
                Id = 5,
                Name = "New Menu Item",
                DietInfo = new List<LibBookingService.Dtos.DietInfo>
                {
                    new LibBookingService.Dtos.DietInfo
                    {
                        Id = 1
                    }
                }
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            mockMenuItemsSet.Verify(m => m.Add(It.IsAny<MenuItem>()), Times.Once);
            mockMenuItemDietInfoSet.Verify(m => m.Add(It.IsAny<MenuItemDietInfo>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Exactly(2));
        }

        [TestMethod]
        public async Task ServiceTestPostFullMenuItem()
        {
            HttpResponseMessage response = await menuController.Post(new LibBookingService.Dtos.MenuItem
            {
                Id = 5,
                Name = "New Menu Item",
                DietInfo = new List<LibBookingService.Dtos.DietInfo>
                {
                    new LibBookingService.Dtos.DietInfo
                    {
                        Id = 1
                    }
                },
                Types = new List<LibBookingService.Dtos.MenuItemType>
                {
                    new LibBookingService.Dtos.MenuItemType
                    {
                        Id = 1
                    }
                }
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            mockMenuItemsSet.Verify(m => m.Add(It.IsAny<MenuItem>()), Times.Once);
            mockMenuItemDietInfoSet.Verify(m => m.Add(It.IsAny<MenuItemDietInfo>()), Times.Once);
            mockMenuItemTypeSet.Verify(m => m.Add(It.IsAny<MenuItemType>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Exactly(3));
        }

        [TestMethod]
        public async Task ServiceTestPostNullCategory()
        {
            HttpResponseMessage response = await categoryController.Post(null);

            Assert.IsTrue(!response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.InternalServerError);
        }

        [TestMethod]
        public async Task ServiceTestPostNullDietInfo()
        {
            HttpResponseMessage response = await dietInfoController.Post(null);

            Assert.IsTrue(!response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.InternalServerError);
        }

        [TestMethod]
        public async Task ServiceTestPostNullMenuItem()
        {
            HttpResponseMessage response = await menuController.Post(null);

            Assert.IsTrue(!response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.InternalServerError);
        }
    }
}
