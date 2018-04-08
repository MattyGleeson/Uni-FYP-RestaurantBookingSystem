using BookingSystemApp.Controllers.ControllerExtensions;
using System.Web;
using System.Web.Mvc;

namespace BookingSystemApp
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new MessagesActionFilter());
        }
    }
}
