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
        public static readonly string RolesSessionVar = "IsAdmin";

        //Role names
        public static readonly string AdminRole = "Admin";
        public static readonly string ManagerRole = "Manager";
        public static readonly string CustomerRole = "Customer";
    }
}