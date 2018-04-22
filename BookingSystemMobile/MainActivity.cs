using Android.App;
using Android.Content.PM;
using Android.OS;
using Android.Support.V4.Widget;
using Android.Views;

using BookingSystemMobile.Fragments;
using Android.Support.V7.App;
using Android.Support.V4.View;
using Android.Support.Design.Widget;
using System.Threading.Tasks;
using LibBookingService.Dtos;
using System.Net;
using System;
using System.IO;
using System.Json;
using LibBookingService;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace BookingSystemMobile
{
    //[Activity(Label = "@string/app_name", MainLauncher = true, LaunchMode = LaunchMode.SingleTop, Icon = "@drawable/Icon")]
    [Activity(Label = "@string/app_name")]
    public class MainActivity : AppCompatActivity
    {
        private readonly string _webApiBaseUrl = "https://bookingsystemwebapi.azurewebsites.net/api/";
        private readonly string _authServiceBaseUrl = "https://bookingauthservice.azurewebsites.net/";

        public static bool IsNavDisabled = false;

        DrawerLayout drawerLayout;
        NavigationView navigationView;
        
        IMenuItem previousItem;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.main);
            var toolbar = FindViewById<Android.Support.V7.Widget.Toolbar>(Resource.Id.toolbar);
            if (toolbar != null)
            {
                SetSupportActionBar(toolbar);
                SupportActionBar.SetDisplayHomeAsUpEnabled(true);
                SupportActionBar.SetHomeButtonEnabled(true);
            }

            drawerLayout = FindViewById<DrawerLayout>(Resource.Id.drawer_layout);

            //Set hamburger items menu
            SupportActionBar.SetHomeAsUpIndicator(Resource.Drawable.ic_menu);

            //setup navigation view
            navigationView = FindViewById<NavigationView>(Resource.Id.nav_view);

            //handle navigation
            navigationView.NavigationItemSelected += (sender, e) =>
            {
                if (previousItem != null)
                    previousItem.SetChecked(false);

                navigationView.SetCheckedItem(e.MenuItem.ItemId);

                previousItem = e.MenuItem;

                switch (e.MenuItem.ItemId)
                {
                    case Resource.Id.nav_home:
                        ListItemClicked(0);
                        break;
                    case Resource.Id.nav_restaurants:
                        ListItemClicked(1);
                        break;
                    case Resource.Id.nav_menu:
                        ListItemClicked(2);
                        break;
                    case Resource.Id.nav_login:
                        ListItemClicked(3);
                        break;
                    case Resource.Id.nav_register:
                        ListItemClicked(4);
                        break;
                    case Resource.Id.nav_account_details:
                        ListItemClicked(5);
                        break;
                    case Resource.Id.nav_account_bookings:
                        ListItemClicked(6);
                        break;
                    case Resource.Id.nav_logout:
                        ListItemClicked(7);
                        break;
                    case Resource.Id.nav_exit:
                        ListItemClicked(8);
                        break;
                }
                
                drawerLayout.CloseDrawers();
            };


            //if first time you will want to go ahead and click first item.
            if (savedInstanceState == null)
            {
                navigationView.SetCheckedItem(Resource.Id.nav_home);
                ListItemClicked(0);
            }
        }
        
        int oldPosition = -1;
        private void ListItemClicked(int position)
        {
            //this way we don't load twice, but you might want to modify this a bit.
            if (position == oldPosition)
                return;

            oldPosition = position;

            Fragment fragment = null;
            switch (position)
            {
                case 0:
                    fragment = HomeFragment.NewInstance();
                    break;
                case 1:
                    fragment = RestaurantIndexFragment.NewInstance();
                    break;
                case 2:
                    fragment = MenuIndexFragment.NewInstance();
                    break;
                case 3:
                    ToggleLogin();
                    break;
                case 7:
                    ToggleLogout();
                    break;
                case 8:
                    ExitApp();
                    break;
            }

            if (fragment != null)
            {
                FragmentManager.BeginTransaction()
                    .Replace(Resource.Id.content_frame, fragment)
                    .Commit();
            }
        }

        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            if (!IsNavDisabled)
            {
                switch (item.ItemId)
                {
                    case Android.Resource.Id.Home:
                        drawerLayout.OpenDrawer(GravityCompat.Start);
                        return true;
                }
            }
            return base.OnOptionsItemSelected(item);
        }

        public void ToggleLogin()
        {
            navigationView.Menu.FindItem(Resource.Id.user_menu_logged_in).SetVisible(true);
            navigationView.Menu.FindItem(Resource.Id.user_menu_logged_out).SetVisible(false);
        }

        public void ToggleLogout()
        {
            navigationView.Menu.FindItem(Resource.Id.user_menu_logged_in).SetVisible(false);
            navigationView.Menu.FindItem(Resource.Id.user_menu_logged_out).SetVisible(true);
        }

        private void ExitApp()
        {
            new Android.App.AlertDialog.Builder(this).
                    SetIcon(Android.Resource.Attribute.AlertDialogIcon).
                    SetTitle("Confirm").
                    SetMessage("Are you sure you want to exit?").
                    SetPositiveButton("Yes", (c, ev) =>
                    {
                        Finish();
                    }).
                    SetNegativeButton("No", (c, ev) =>
                    {

                    }).
                    Show();
        }

        //private async Task<JsonValue> GetToken()
        //{
        //    HttpWebRequest request = (HttpWebRequest) HttpWebRequest.Create(new Uri(_authServiceBaseUrl + "token"));
        //    request.ContentType = "application/json";
        //    request.Method = "GET";

        //    using (WebResponse response = await request.GetResponseAsync())
        //    {
        //        using (Stream stream = response.GetResponseStream())
        //        {
        //            JsonValue jsonDoc = await Task.Run(() => JsonObject.Load(stream));
        //            Console.Out.WriteLine("Response: {0}", jsonDoc.ToString());

        //            return jsonDoc;
        //        }
        //    }
        //}

        //private async Task<T> ExecuteRequestAsync<T>(HttpRequestMessage request) where T : Dto
        //{
        //    using (HttpClient _client = new HttpClient())
        //    {
        //        _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

        //        JsonSerializerSettings _serializerSettings = new JsonSerializerSettings
        //        {
        //            NullValueHandling = NullValueHandling.Ignore,
        //            MissingMemberHandling = MissingMemberHandling.Ignore
        //        };

        //        HttpResponseMessage response = await _client.SendAsync(request);
        //        response.EnsureSuccessStatusCode();
        //        string content = await response.Content.ReadAsStringAsync();
        //        return JsonConvert.DeserializeObject<T>(content, _serializerSettings);
        //    }
        //}

        //private async Task<List<T>> ExecuteRequestAsyncList<T>(HttpRequestMessage request) where T : Dto
        //{
        //    using (HttpClient _client = new HttpClient())
        //    {
        //        _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

        //        JsonSerializerSettings _serializerSettings = new JsonSerializerSettings
        //        {
        //            NullValueHandling = NullValueHandling.Ignore,
        //            MissingMemberHandling = MissingMemberHandling.Ignore
        //        };

        //        HttpResponseMessage response = await _client.SendAsync(request);
        //        response.EnsureSuccessStatusCode();
        //        string content = await response.Content.ReadAsStringAsync();
        //        return JsonConvert.DeserializeObject<List<T>>(content, _serializerSettings);
        //    }
        //}
    }
}

