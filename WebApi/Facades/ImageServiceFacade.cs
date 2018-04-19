using LibBookingService.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using WebApi.Facades.Core;

namespace WebApi.Facades
{
    /// <summary>
    /// Facade that handles interactions between the web api and the image service.
    /// </summary>
    public class ImageServiceFacade : GenericServiceFacade
    {
        private readonly string _baseUrl = "http://localhost:54418/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public ImageServiceFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public ImageServiceFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Posts an image to the service and returns the updated model.
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        public async Task<Image> UploadMenuItemImage(Image image)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "UploadMenuItemImage"),
                    Content = new StringContent(JsonConvert.SerializeObject(image), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Image>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes an image from the service.
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        public async Task<bool> RemoveMenuItemImage(Image image)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "RemoveMenuItemImage"),
                    Content = new StringContent(JsonConvert.SerializeObject(image), Encoding.UTF8, "application/json")
                };

                HttpResponseMessage response = await _client.SendAsync(request);
                response.EnsureSuccessStatusCode();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Posts an image to the service and returns the updated model.
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        public async Task<Image> UploadRestaurantImage(Image image)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "UploadRestaurantImage"),
                    Content = new StringContent(JsonConvert.SerializeObject(image), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<Image>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes an image from the service.
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        public async Task<bool> RemoveRestaurantImage(Image image)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "RemoveRestaurantImage"),
                    Content = new StringContent(JsonConvert.SerializeObject(image), Encoding.UTF8, "application/json")
                };

                HttpResponseMessage response = await _client.SendAsync(request);
                response.EnsureSuccessStatusCode();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Returns an image from the customer service.
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

                return await ExecuteRequestAsync<Image>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}