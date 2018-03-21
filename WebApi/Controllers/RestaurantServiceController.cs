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
    /// Controller to communicate with the restaurant service facade.
    /// </summary>
    public class RestaurantServiceController : ApiController
    {
        /// <summary>
        /// Property of type RestaurantServiceFacade that the controller endpoints use to access the facade.
        /// </summary>
        protected readonly Facades.RestaurantServiceFacade _facade;

        RestaurantServiceController()
        {
            _facade = new Facades.RestaurantServiceFacade();
        }

        /// <summary>
        /// Endpoint to get a list of restaurants.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("api/Restaurant/Get")]
        public async Task<IEnumerable<Restaurant>> Get()
        {
            return await _facade.GetRestaurants();
        }

        /// <summary>
        /// Endpoint to get a restaurant by id.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("api/Restaurant/Get/{id:int?}")]
        public async Task<Restaurant> Get(int id)
        {
            return await _facade.GetRestaurantById(id);
        }

        /// <summary>
        /// Endpoint to post a restaurant.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("api/Restaurant/Post")]
        public async Task<Restaurant> Post(Restaurant restaurant)
        {
            return await _facade.PostRestaurant(restaurant);
        }

        /// <summary>
        /// Endpoint to update a restaurant.
        /// </summary>
        /// <param name="restaurant"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("api/Restaurant/Update")]
        public async Task<Restaurant> Update(Restaurant restaurant)
        {
            return await _facade.UpdateRestaurant(restaurant);
        }

        /// <summary>
        /// Endpoint to delete a restaurant.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("api/Restaurant/Delete/{id:int?}")]
        public async Task<bool> Delete(int id)
        {
            return await _facade.RemoveRestaurant(id);
        }
    }
}
