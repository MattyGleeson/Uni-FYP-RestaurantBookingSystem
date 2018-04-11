﻿using System;
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
    [AllowAnonymous]
    [RoutePrefix("api/Booking")]
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
        [Route("Get")]
        public async Task<HttpResponseMessage> Get()
        {
            IEnumerable<Booking> bookings = await _facade.GetBookings();

            if (bookings.Any())
                return Request.CreateResponse(HttpStatusCode.OK, bookings);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Bookings Found");
        }

        /// <summary>
        /// Endpoint to get a restaurant by id.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("Get/{id:int?}")]
        public async Task<HttpResponseMessage> Get(int id)
        {
            Booking booking = await _facade.GetBookingById(id);

            if (booking != null)
                return Request.CreateResponse(HttpStatusCode.OK, booking);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Booking Found For Id");
        }

        /// <summary>
        /// Endpoint to post a restaurant.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Post")]
        public async Task<HttpResponseMessage> Post(Booking booking)
        {
            Booking newBooking = await _facade.PostBooking(booking);

            if (newBooking != null)
                return Request.CreateResponse(HttpStatusCode.OK, newBooking);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to update a restaurant.
        /// </summary>
        /// <param name="booking"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("Update")]
        public async Task<HttpResponseMessage> Update(Booking booking)
        {
            Booking updatedBooking = await _facade.UpdateBooking(booking);

            if (updatedBooking != null)
                return Request.CreateResponse(HttpStatusCode.OK, updatedBooking);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Updating");
        }

        /// <summary>
        /// Endpoint to delete a restaurant.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("Delete/{id:int?}")]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            bool res = await _facade.RemoveBooking(id);

            if (res)
                return Request.CreateResponse(HttpStatusCode.OK);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Deleting");
        }
    }
}
