using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookingSystemApp
{
    public static class Global
    {
        //Session var names
        public static readonly string UserIdSessionVar = "UserId";
        public static readonly string UsernameSessionVar = "Username";
        public static readonly string RestaurantIdSessionVar = "RestaurantId";
        public static readonly string IsAdminSessionVar = "IsAdmin";
    }
}