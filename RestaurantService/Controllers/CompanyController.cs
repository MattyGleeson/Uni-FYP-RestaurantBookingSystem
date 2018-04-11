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
            Company res = await _db.Companies.Where(b => !b.Deleted).FirstOrDefaultAsync();

            if (res == null)
                return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Company Found With ID");

            LibBookingService.Dtos.Company company = new LibBookingService.Dtos.Company
            {
                Id = res.Id,
                Name = res.Name,
                Description = res.Description,
                PhoneNo = res.PhoneNo,
                AddressStreet = res.AddressStreet,
                AddressTown = res.AddressTown,
                AddressCounty = res.AddressCounty,
                AddressPostalCode = res.AddressPostalCode,
                Email = res.Email,
                Restaurants = res.Restaurants.Select(r => new LibBookingService.Dtos.Restaurant
                {
                    Id = r.Id,
                    Name = r.Name
                }).OrderBy(b => b.Name)
            };

            return Request.CreateResponse(HttpStatusCode.OK, company);
        }
    }
}