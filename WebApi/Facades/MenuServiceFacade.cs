﻿using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using WebApi.Facades.Core;
using LibBookingService.Dtos;
using System;
using Newtonsoft.Json;
using System.Text;

namespace WebApi.Facades
{
    /// <summary>
    /// Facade that handles interactions between the web api and the menu service.
    /// </summary>
    public class MenuServiceFacade : GenericServiceFacade
    {
        private readonly string _baseUrl = "http://localhost:57656/";

        /// <summary>
        /// Default constructor.
        /// </summary>
        public MenuServiceFacade()
        {
        }

        /// <summary>
        /// Constructor used for testing that accepts a mock HttpCient.
        /// </summary>
        /// <param name="client"></param>
        public MenuServiceFacade(HttpClient client) : base(client)
        {
        }

        /// <summary>
        /// Returns an IQueryable of menu items from the menu service.
        /// </summary>
        /// <returns></returns>
        public async Task<IQueryable<MenuItem>> GetMenuItems()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IQueryable<MenuItem> res = await ExecuteRequestAsyncList<MenuItem>(request);

                return res.Any()
                    ? res
                    : Enumerable.Empty<MenuItem>().AsQueryable();
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<MenuItem>().AsQueryable();
            }
        }

        /// <summary>
        /// Returns a menu item with the id parameter
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<MenuItem> GetMenuItemById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequestAsync<MenuItem>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Posts a menu item to the service and returns the updated model.
        /// </summary>
        /// <param name="menuItem"></param>
        /// <returns></returns>
        public async Task<MenuItem> PostMenuItem(MenuItem menuItem)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Post,
                    RequestUri = new Uri(_baseUrl + "Create"),
                    Content = new StringContent(JsonConvert.SerializeObject(menuItem), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<MenuItem>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Updates a menu item and returns the updated model.
        /// </summary>
        /// <param name="menuItem"></param>
        /// <returns></returns>
        public async Task<MenuItem> UpdateMenuItem(MenuItem menuItem)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Put,
                    RequestUri = new Uri(_baseUrl + "Update/" + menuItem.Id),
                    Content = new StringContent(JsonConvert.SerializeObject(menuItem), Encoding.UTF8, "application/json")
                };

                return await ExecuteRequestAsync<MenuItem>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes the menu item with the id parameter.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> RemoveMenuItem(int id)
        {
            return await ExecuteRemove(new Uri(_baseUrl + "Delete/" + id));
        }
    }
}