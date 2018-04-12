using BookingSystemApp.Facades.Core;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;

namespace BookingSystemApp.Facades
{
    public class AuthFacade
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
        protected readonly string _baseUrl = "http://localhost:64392/";

        /// <summary>
        /// Default constructor that sets up the HttpClient and JsonSerializerSettings.
        /// </summary>
        public AuthFacade()
        {
            _client = new HttpClient();
            _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            _serializerSettings = new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore, MissingMemberHandling = MissingMemberHandling.Ignore };
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public AuthFacade(HttpClient client)
        {
            _client = client;
            _serializerSettings = new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore, MissingMemberHandling = MissingMemberHandling.Ignore };
        }

        public void GetToken(string username, string password)
        {
            try
            {
                var dictionary = new Dictionary<string, string>
                {
                    { "grant_type", "password" },
                    { "username", username },
                    { "password", password }
                };

                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "token"),
                    Content = new FormUrlEncodedContent(dictionary)
                };

                var res = _client.SendAsync(request).Result;

                res.EnsureSuccessStatusCode();

                string content = res.Content.ReadAsStringAsync().Result;
                var model = JsonConvert.DeserializeObject<Dictionary<string, string>>(content, _serializerSettings);

                GenericFacade.Token = model["access_token"];
            }
            catch (Exception ex)
            {
                
            }
        }

        public string GetUserId()
        {
            try
            {
                using (HttpClient _c = new HttpClient())
                {
                    _c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    _c.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", GenericFacade.Token);

                    HttpRequestMessage request = new HttpRequestMessage
                    {
                        Method = HttpMethod.Get,
                        RequestUri = new Uri(_baseUrl + "api/Account/UserInfo")
                    };

                    var res = _c.SendAsync(request).Result;

                    res.EnsureSuccessStatusCode();

                    string content = res.Content.ReadAsStringAsync().Result;
                    var model = JsonConvert.DeserializeObject<Dictionary<string, string>>(content, _serializerSettings);

                    return model["userId"];
                }
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        public void AddCustomerRole()
        {
            try
            {
                using (HttpClient _c = new HttpClient())
                {
                    _c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    _c.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", GenericFacade.Token);

                    HttpRequestMessage request = new HttpRequestMessage
                    {
                        Method = HttpMethod.Post,
                        RequestUri = new Uri(_baseUrl + "api/Account/AddCustomerRole")
                    };

                    var res = _c.SendAsync(request).Result;

                    res.EnsureSuccessStatusCode();
                }
            }
            catch (Exception ex)
            {
            }
        }


        public bool Register(string username, string password, string confirmPassword)
        {
            try
            {
                var dictionary = new Dictionary<string, string>
                {
                    { "userName", username },
                    { "password", password },
                    { "confirmPassword", confirmPassword }
                };

                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "api/Account/Register"),
                    Content = new StringContent(JsonConvert.SerializeObject(dictionary), Encoding.UTF8, "application/json")
                };

                var res = _client.SendAsync(request).Result;

                res.EnsureSuccessStatusCode();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public IEnumerable<string> GetRoles()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Roles")
                };

                var res = _client.SendAsync(request).Result;

                res.EnsureSuccessStatusCode();

                string content = res.Content.ReadAsStringAsync().Result;
                return JsonConvert.DeserializeObject<List<string>>(content, _serializerSettings).AsEnumerable();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<string>();
            }
        }
    }
}