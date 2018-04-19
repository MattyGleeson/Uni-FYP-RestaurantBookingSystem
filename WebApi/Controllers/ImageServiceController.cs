using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace WebApi.Controllers
{
    /// <summary>
    /// Controller to communicate with the image service facade.
    /// </summary>
    [RoutePrefix("api/Image")]
    public class ImageServiceController : ApiController
    {
        /// <summary>
        /// Property of type CustomerServiceFacade that the controller endpoints use to access the facade.
        /// </summary>
        protected readonly Facades.ImageServiceFacade _facade;

        ImageServiceController()
        {
            _facade = new Facades.ImageServiceFacade();
        }

        /// <summary>
        /// Endpoint to post an image.
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        [Authorize(Roles = ("Admin,Manager"))]
        [HttpPost]
        [Route("UploadMenuItemImage")]
        public async Task<HttpResponseMessage> UploadMenuItemImage(Image image)
        {
            Image newImage = await _facade.UploadMenuItemImage(image);

            if (newImage != null)
                return Request.CreateResponse(HttpStatusCode.OK, newImage);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to remove an image.
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        [Authorize(Roles = ("Admin,Manager"))]
        [HttpPost]
        [Route("RemoveMenuItemImage")]
        public async Task<HttpResponseMessage> RemoveMenuItemImage(Image image)
        {
            bool res = await _facade.RemoveMenuItemImage(image);

            if (res)
                return Request.CreateResponse(HttpStatusCode.OK, res);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to post an image.
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        [Authorize(Roles = ("Admin,Manager"))]
        [HttpPost]
        [Route("UploadRestaurantImage")]
        public async Task<HttpResponseMessage> UploadRestaurantImage(Image image)
        {
            Image newImage = await _facade.UploadRestaurantImage(image);

            if (newImage != null)
                return Request.CreateResponse(HttpStatusCode.OK, newImage);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to remove an image.
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        [Authorize(Roles = ("Admin,Manager"))]
        [HttpPost]
        [Route("RemoveRestaurantImage")]
        public async Task<HttpResponseMessage> RemoveRestaurantImage(Image image)
        {
            bool res = await _facade.RemoveRestaurantImage(image);

            if (res)
                return Request.CreateResponse(HttpStatusCode.OK, res);

            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "An Error Occured Whilst Saving");
        }

        /// <summary>
        /// Endpoint to get an image by id.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("LoadImage/{id:int?}")]
        public async Task<HttpResponseMessage> Get(int id)
        {
            Image image = await _facade.LoadImage(id);

            if (image != null)
                return Request.CreateResponse(HttpStatusCode.OK, image);

            return Request.CreateErrorResponse(HttpStatusCode.NoContent, "No Image Found For Id");
        }
    }
}
