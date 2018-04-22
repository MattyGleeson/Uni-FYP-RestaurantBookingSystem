using BookingSystemMobile.Facades.Core;
using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BookingSystemMobile.Facades
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
        /// Returns an image model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Image> LoadImage(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "LoadImage/" + id)
                };

                return await ExecuteRequest<Image>(request);
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
        public async Task<List<Image>> LoadImagesForMenuItem(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "LoadImagesForMenuItem/" + id)
                };

                IEnumerable<Image> res = await ExecuteRequestList<Image>(request);

                return res.Any()
                    ? res.ToList()
                    : new List<Image>();
            }
            catch (Exception ex)
            {
                return new List<Image>();
            }
        }
    }
}