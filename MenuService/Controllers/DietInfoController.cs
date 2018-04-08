using MenuService.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace MenuService.Controllers
{
    [RoutePrefix("DietInfo")]
    public class DietInfoController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public DietInfoController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public DietInfoController(BookingSystemDb db)
        {
            this._db = db;
        }

        /// <summary>
        /// Gets all diet info models from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Get/{id:int?}")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get(int id = -1)
        {
            if (id != -1)
            {
                DietInfo res = await _db.DietInfoes.Where(b => b.id == id && !b.deleted).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Diet Info Found With ID");

                LibBookingService.Dtos.DietInfo menuItem = CreateDietInfoFromDbDietInfo(res);

                return Request.CreateResponse(HttpStatusCode.OK, menuItem);
            }
            else
            {
                IEnumerable<DietInfo> res = await _db.DietInfoes.Where(b => !b.deleted).ToListAsync();

                IEnumerable<LibBookingService.Dtos.DietInfo> dietInfoList = res.Select(b => CreateDietInfoFromDbDietInfo(b)).OrderBy(b => b.Name);

                return dietInfoList.Any() ?
                    Request.CreateResponse(HttpStatusCode.OK, dietInfoList) :
                    Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Diet Info");
            }
        }

        /// <summary>
        /// Posts a diet info Dto to the database.
        /// </summary>
        /// <param name="dietInfo"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.DietInfo dietInfo)
        {
            try
            {
                DietInfo newDietInfo = _db.DietInfoes.Add(new DietInfo
                {
                    name = dietInfo.Name
                });
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, CreateDietInfoFromDbDietInfo(newDietInfo));
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Removes a diet info model.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Delete/{id:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            try
            {
                DietInfo menuItem = await _db.DietInfoes.Where(m => m.id == id).FirstOrDefaultAsync();
                menuItem.deleted = true;

                _db.SetModified(menuItem);
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Puts a diet info model to the database.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="dietInfo"></param>
        /// <returns></returns>
        [Route("Update/{id:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int id, LibBookingService.Dtos.DietInfo dietInfo)
        {
            try
            {
                DietInfo di = await _db.DietInfoes.Where(m => m.id == id).FirstOrDefaultAsync();

                di.name = dietInfo.Name;

                _db.SetModified(di);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.DietInfo res = CreateDietInfoFromDbDietInfo(di);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Returns a menu item type model using the database menu item type parameter.
        /// </summary>
        /// <param name="mi"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.DietInfo CreateDietInfoFromDbDietInfo(DietInfo mi)
        {
            return new LibBookingService.Dtos.DietInfo
            {
                Id = mi.id,
                Name = mi.name
            };
        }
    }
}
