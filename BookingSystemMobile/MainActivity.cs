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
using Android.Support.V7.Widget;
using BookingSystemMobile.Fragments.Restaurant;
using BookingSystemMobile.Fragments.User;
using BookingSystemMobile.Facades.Core;
using Android.Widget;

namespace BookingSystemMobile
{
    //[Activity(Label = "@string/app_name", MainLauncher = true, LaunchMode = LaunchMode.SingleTop, Icon = "@drawable/Icon")]
    [Activity(Label = "@string/app_name", ConfigurationChanges = Android.Content.PM.ConfigChanges.ScreenSize | Android.Content.PM.ConfigChanges.Orientation)]
    public class MainActivity : AppCompatActivity
    {
        public static bool IsNavDisabled = false;

        DrawerLayout drawerLayout;
        NavigationView navigationView;
        
        IMenuItem previousItem;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.main);
            SetupNavigationDrawer();


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
                    fragment = LoginFragment.NewInstance();
                    break;
                case 4:
                    fragment = RegisterFragment.NewInstance();
                    break;
                case 5:
                    fragment = UserDetailsFragment.NewInstance();
                    break;
                case 6:
                    fragment = BookingIndexFragment.NewInstance();
                    break;
                case 7:
                    new Android.App.AlertDialog.Builder(this).
                        SetIcon(Android.Resource.Drawable.IcDialogAlert).
                        SetTitle("Confirm").
                        SetMessage("Are you sure you want to logout?").
                        SetPositiveButton("Yes", (c, ev) =>
                        {
                            GenericFacade.Token = "";
                            GenericFacade.UserName = "";
                            GenericFacade.UserId = 0;
                            ToggleLogout();
                        }).
                        SetNegativeButton("No", (c, ev) =>
                        {

                        }).
                        Show();
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

        public override void OnBackPressed()
        {
            if (IsTaskRoot && FragmentManager.BackStackEntryCount == 0)
            {
                ExitApp();
            }
            else
            {
                base.OnBackPressed();
            }
        }

        public void ToggleLogin()
        {
            navigationView.Menu.FindItem(Resource.Id.user_menu_logged_in).SetVisible(true);
            navigationView.Menu.FindItem(Resource.Id.user_menu_logged_out).SetVisible(false);
            FindViewById<TextView>(Resource.Id.user_text).Text = GenericFacade.UserName;
        }

        public void ToggleLogout()
        {
            navigationView.Menu.FindItem(Resource.Id.user_menu_logged_in).SetVisible(false);
            navigationView.Menu.FindItem(Resource.Id.user_menu_logged_out).SetVisible(true);
            FindViewById<TextView>(Resource.Id.user_text).Text = "Not Authed";
        }

        public void SetAsDrawerToolbar()
        {
            SetupNavigationDrawer();
        }

        private void SetupNavigationDrawer()
        {
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
        }

        public void SetAsNavigationToolbar(Android.Support.V7.Widget.Toolbar toolbar = null)
        {
            SupportActionBar.SetHomeAsUpIndicator(Resource.Drawable.ic_chevron_left_white);
        }

        private void ExitApp()
        {
            new Android.App.AlertDialog.Builder(this).
                    SetIcon(Android.Resource.Drawable.IcDialogAlert).
                    SetTitle("Confirm").
                    SetMessage("Are you sure you want to exit?").
                    SetPositiveButton("Yes", (c, ev) =>
                    {
                        FinishAffinity();
                    }).
                    SetNegativeButton("No", (c, ev) =>
                    {

                    }).
                    Show();
        }
    }
}

