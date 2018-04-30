using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System.Data.Entity;
using System.Net.Http;
using System.Web.Http;
using System.Threading.Tasks;

namespace CustomerService.Tests.Tests
{
    [TestClass]
    public class PutTests : GenericTest
    {
        [TestMethod]
        public async Task ServiceTestPutCustomerChangeEmail()
        {
            HttpResponseMessage response = await customerController.Update(1, new LibBookingService.Dtos.Customer
            {
                Id = 1,
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
                Email = "user123@user.com"
            });

            Assert.IsTrue(response.IsSuccessStatusCode);
        }

        [TestMethod]
        public async Task ServiceTestPutCustomerNoChanges()
        {
            HttpResponseMessage response = await customerController.Update(1, new LibBookingService.Dtos.Customer
            {
                Id = 1,
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
        }
    }
}
