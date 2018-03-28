using LibBookingService;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace BookingSystemApp.Repo.Core
{
    public class GenericRepo
    {

        /// <summary>
        /// Http client used to send http requests.
        /// </summary>
        protected readonly HttpClient _client;

        /// <summary>
        /// Json serializer settings used to define how received data is serialized.
        /// </summary>
        protected JsonSerializerSettings _serializerSettings;

        /// <summary>
        /// Readonly string which defines the base url for the web api.
        /// </summary>
        protected readonly string _baseUrl = "http://localhost:64577/api/";

        /// <summary>
        /// Default constructor that sets up the HttpClient and JsonSerializerSettings.
        /// </summary>
        public GenericRepo(string apiController)
        {
            _client = new HttpClient();
            _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            _serializerSettings = new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore, MissingMemberHandling = MissingMemberHandling.Ignore };
            _baseUrl += apiController;
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public GenericRepo(HttpClient client)
        {
            _client = client;
            _serializerSettings = new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore, MissingMemberHandling = MissingMemberHandling.Ignore };
        }

        /// <summary>
        /// Task to execute a HttpRequestMessage and return a single model. Uses T type parameter to declare the return type of the request.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="request"></param>
        /// <returns></returns>
        protected T ExecuteRequest<T>(HttpRequestMessage request) where T : Dto
        {
            HttpResponseMessage response = _client.SendAsync(request).Result;
            response.EnsureSuccessStatusCode();
            string content = response.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<T>(content, _serializerSettings);
        }
        
        /// <summary>
        /// Task to execute a HttpRequestMessage and return a list of models. Uses T type parameter to declare the return type of the request.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="request"></param>
        /// <returns></returns>
        protected IEnumerable<T> ExecuteRequestList<T>(HttpRequestMessage request) where T : Dto
        {
            HttpResponseMessage response = _client.SendAsync(request).Result;
            response.EnsureSuccessStatusCode();
            string content = response.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<List<T>>(content, _serializerSettings);
        }

        /// <summary>
        /// Async task to remove a model from the database.
        /// </summary>
        /// <param name="uri"></param>
        /// <returns></returns>
        protected bool ExecuteRemove(Uri uri)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Delete,
                    RequestUri = uri
                };

                HttpResponseMessage response = _client.SendAsync(request).Result;
                response.EnsureSuccessStatusCode();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
