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
    [RoutePrefix("Table")]
    public class TableController : ApiController
    {
        private BookingSystemDb _db;

        /// <summary>
        /// Default constructor that sets the database to be an instance of BookingSystemDb
        /// </summary>
        public TableController()
        {
            _db = new BookingSystemDb();
        }

        /// <summary>
        /// Constructor used when unit testing to pass a mock of the BookingSystemDb
        /// </summary>
        /// <param name="db"></param>
        public TableController(BookingSystemDb db)
        {
            this._db = db;
        }

        /// <summary>
        /// Gets all tables or a single table from the database.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Get/{id:int?}")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get(int id = -1)
        {
            if (id != -1)
            {
                Table res = await _db.Tables.Where(b => b.id == id && !b.deleted).FirstOrDefaultAsync();

                if (res == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Table Found With ID");

                LibBookingService.Dtos.Table restaurant = CreateTableFromDbTable(res);

                return Request.CreateResponse(HttpStatusCode.OK, restaurant);
            }
            else
            {
                IEnumerable<Table> res = await _db.Tables.Where(b => b.deleted != true).ToListAsync();

                IEnumerable<LibBookingService.Dtos.Table> restaurants = res.Select(b => CreateTableFromDbTable(b)).OrderBy(b => b.TableNo);

                return restaurants.Any() ?
                    Request.CreateResponse(HttpStatusCode.OK, restaurants) :
                    Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Restaurants");
            }
        }

        /// <summary>
        /// Posts a table Dto to the database.
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        [Route("Create")]
        [HttpPost]
        public async Task<HttpResponseMessage> Post(LibBookingService.Dtos.Table table)
        {
            try
            {
                Table newTable = _db.Tables.Add(new Table
                {
                    restaurant_id = table.RestaurantId,
                    tableNo = table.TableNo,
                    noSeats = table.NoSeats,
                    additionalNotes = table.AdditionalNotes
                });
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, CreateTableFromDbTable(newTable));
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Removes a table.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("Delete/{id:int?}")]
        [HttpDelete]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            try
            {
                Table table = await _db.Tables.Where(b => b.id == id).FirstOrDefaultAsync();
                table.deleted = true;

                _db.SetModified(table);
                await _db.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Puts a table to the database.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="table"></param>
        /// <returns></returns>
        [Route("Update/{id:int?}")]
        [HttpPut]
        public async Task<HttpResponseMessage> Update(int id, LibBookingService.Dtos.Table table)
        {
            try
            {
                Table r = await _db.Tables.Where(rr => rr.id == id).FirstOrDefaultAsync();

                r.restaurant_id = table.RestaurantId;
                r.tableNo = table.TableNo;
                r.noSeats = table.NoSeats;
                r.additionalNotes = table.AdditionalNotes;
                r.active = table.Active;

                _db.SetModified(r);
                await _db.SaveChangesAsync();

                LibBookingService.Dtos.Table res = CreateTableFromDbTable(r);

                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Failed");
            }
        }

        /// <summary>
        /// Returns a table model using the database table parameter.
        /// </summary>
        /// <param name="r"></param>
        /// <returns></returns>
        private LibBookingService.Dtos.Table CreateTableFromDbTable(Table r)
        {
            return new LibBookingService.Dtos.Table
            {
                Id = r.id,
                RestaurantId = r.restaurant_id,
                TableNo = r.tableNo,
                NoSeats = r.noSeats,
                AdditionalNotes = r.additionalNotes,
                Active = r.active
            };
        }
    }
}
