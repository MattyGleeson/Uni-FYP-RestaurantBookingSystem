using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApi.Controllers.Core;
using LibBookingService.Dtos;
using System.Threading.Tasks;

namespace WebApi.Controllers
{
    /// <summary>
    /// Controller to communicate with the booking service facade.
    /// </summary>
    public class BookingServiceController : ApiController
    {
        /// <summary>
        /// Property of type BookingServiceFacade that the controller endpoints use to access the facade.
        /// </summary>
        protected readonly Facades.BookingServiceFacade _facade;

        BookingServiceController()
        {
            _facade = new Facades.BookingServiceFacade();
        }

        /// <summary>
        /// Endpoint to get a list of restaurants.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("api/Booking/Get")]
        public async Task<IEnumerable<Booking>> Get()
        {
            return await _facade.GetBookings();
        }

        /// <summary>
        /// Endpoint to get a restaurant by id.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("api/Booking/Get/{id:int?}")]
        public async Task<Booking> Get(int id)
        {
            return await _facade.GetBookingById(id);
        }

        /// <summary>
        /// Endpoint to post a restaurant.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("api/Booking/Post")]
        public async Task<Booking> Post(Booking booking)
        {
            return await _facade.PostBooking(booking);
        }

        /// <summary>
        /// Endpoint to update a restaurant.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("api/Booking/Update")]
        public async Task<Booking> Update(Booking booking)
        {
            return await _facade.UpdateBooking(booking);
        }

        /// <summary>
        /// Endpoint to delete a restaurant.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("api/Booking/Delete/{id:int?}")]
        public async Task<bool> Delete(int id)
        {
            return await _facade.RemoveBooking(id);
        }
    }
}
