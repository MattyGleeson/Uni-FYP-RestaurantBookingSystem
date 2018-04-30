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

namespace CustomerService.Tests.Tests
{
    [TestClass]
    public class PostTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestPostCustomer()
        {
            HttpResponseMessage response = await customerController.Post(new LibBookingService.Dtos.Customer
            {
                Id = 2,
                UserName = "user",
                OwinUserId = "5844ad61-a3b1-44a5-ba10-aaa752f828c6",
                Title = "Mr",
                Forename = "User",
                Surname = "Userson",
                DoB = DateTime.Now,
                AddressStreet = "56 Users Road",
                AddressTown = "User Town",
                AddressCounty = "User County",
                AddressPostalCode = "TS24 8HG",
                HomePhoneNo = "07423536456",
                MobilePhoneNo = "07423536456",
                Email = "user@user.com"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);

            mockCustomersSet.Verify(m => m.Add(It.IsAny<Customer>()), Times.Once);
            mockDb.Verify(m => m.SaveChangesAsync(), Times.Once);
        }
        
        [TestMethod]
        public async Task ServiceTestPostNullCustomer()
        {
            HttpResponseMessage response = await customerController.Post(null);

            Assert.IsTrue(!response.IsSuccessStatusCode);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.InternalServerError);
        }
    }
}
