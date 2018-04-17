using DatabaseContext.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ImageService.Controllers
{
    public class ImageController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public ImageController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public ImageController(BookingSystemDb db)
        {
            this._db = db;
        }

        [Route("UploadImage")]
        [HttpPost]
        public async Task<HttpResponseMessage> UploadImage()
        {

        }
    }
}
