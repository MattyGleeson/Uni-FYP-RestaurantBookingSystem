using BookingSystemApp.Facades.Core;
using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;

namespace BookingSystemApp.Facades
{
    public class ImageFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public ImageFacade() : base("Image/")
        {
        }
        
        /// <summary>
        /// Posts an image model to the web api and returns the saved model.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public Image UploadMenuItemImage(Image model)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "UploadMenuItemImage"),
                    Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json")
                };

                return ExecuteRequest<Image>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns an image model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Image LoadImage(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "LoadImage/" + id)
                };

                return ExecuteRequest<Image>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns an IEnumerable of images from the web api.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IEnumerable<Image> LoadImagesForMenuItem(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "LoadImagesForMenuItem/" + id)
                };

                IEnumerable<Image> res = ExecuteRequestList<Image>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<Image>();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<Image>();
            }
        }
    }
}