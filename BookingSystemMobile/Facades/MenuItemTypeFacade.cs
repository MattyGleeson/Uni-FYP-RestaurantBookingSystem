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
    public class MenuItemTypeFacade : GenericFacade
    {
        /// <summary>
        /// Default controller that sets the api controller used by the facade.
        /// </summary>
        public MenuItemTypeFacade() : base("MenuItemType/")
        {
        }

        /// <summary>
        /// Returns an IEnumerable of menu item types from the web api.
        /// </summary>
        /// <returns></returns>
        public async Task<List<MenuItemType>> Get()
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get")
                };

                IEnumerable<MenuItemType> res = await ExecuteRequestList<MenuItemType>(request);

                return res.Any()
                    ? res.ToList()
                    : new List<MenuItemType>();
            }
            catch (Exception ex)
            {
                return new List<MenuItemType>();
            }
        }

        /// <summary>
        /// Returns a menu item type model by id.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<MenuItemType> FindById(int id)
        {
            try
            {
                HttpRequestMessage request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri(_baseUrl + "Get/" + id)
                };

                return await ExecuteRequest<MenuItemType>(request);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}