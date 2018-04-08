using RestaurantService.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace RestaurantService.Controllers
{
    [RoutePrefix("Company")]
    public class CompanyController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public CompanyController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public CompanyController(BookingSystemDb db)
        {
            this._db = db;
        }

        /// <summary>
        /// Gets all restaurants or a single restaurant from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Get")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get()
        {
            Company res = await _db.Companies.Where(b => !b.deleted).FirstOrDefaultAsync();

            if (res == null)
                return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Company Found With ID");

            LibBookingService.Dtos.Company company = new LibBookingService.Dtos.Company
            {
                Id = res.id,
                Name = res.name,
                Description = res.description,
                PhoneNo = res.phoneNo,
                AddressStreet = res.addressStreet,
                AddressTown = res.addressTown,
                AddressCounty = res.addressCounty,
                AddressPostalCode = res.addressPostalCode,
                Email = res.email,
                Restaurants = res.Restaurants.Select(r => new LibBookingService.Dtos.Restaurant
                {
                    Id = r.id,
                    Name = r.name
                }).OrderBy(b => b.Name)
            };

            return Request.CreateResponse(HttpStatusCode.OK, company);
        }
    }
}