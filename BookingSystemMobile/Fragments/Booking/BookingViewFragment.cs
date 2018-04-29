using Android.App;
using Android.Graphics;
using Android.OS;
using Android.Support.V4.Widget;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Fragments.Menu;
using BookingSystemMobile.Fragments.Restaurant;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace BookingSystemMobile.Fragments.Restaurant
{
    public class BookingViewFragment : Fragment
    {
        private readonly BookingFacade _bookingFacade = new BookingFacade();
        private readonly RestaurantFacade _restaurantFacade = new RestaurantFacade();
        private View view;
        private Booking booking;
        private LibBookingService.Dtos.Restaurant restaurant;
        private SwipeRefreshLayout swipeRefresh;
        private BackgroundWorker backgroundWorker;

        public static bool IsActive = true;

        public static BookingViewFragment NewInstance(int id)
        {
            var f = new BookingViewFragment { Arguments = new Bundle() };
            Bundle args = new Bundle();
            args.PutInt("id", id);
            f.Arguments = args;
            return f;
        }

        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your fragment here
        }
        
        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            ((MainActivity)Activity).SetAsNavigationToolbar();
            SetHasOptionsMenu(true);
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.booking_view, null);
            swipeRefresh = view.FindViewById<SwipeRefreshLayout>(Resource.Id.booking_view_swipe);

            swipeRefresh.Refresh += delegate
            {
                backgroundWorker.RunWorkerAsync();
            };

            swipeRefresh.Refreshing = true;

            backgroundWorker = new BackgroundWorker();
            backgroundWorker.DoWork += Bworker_DoWork;
            backgroundWorker.RunWorkerCompleted += Bworker_RunWorkerCompleted;
            backgroundWorker.RunWorkerAsync();

            return view;
        }

        private void Setup()
        {
            view.FindViewById<TextView>(Resource.Id.booking_view_restaurant_name).Text = restaurant.Name;
            view.FindViewById<TextView>(Resource.Id.booking_view_restaurant_address).Text = restaurant.AddressStreet + ", " + restaurant.AddressTown + ", " + restaurant.AddressCounty + ", " + restaurant.AddressPostalCode;

            view.FindViewById<TextView>(Resource.Id.booking_view_created).Text = booking.BookingMadeDate.ToShortDateString() + " at " + booking.BookingMadeTime.Hours + ":" + booking.BookingMadeTime.Minutes;
            view.FindViewById<TextView>(Resource.Id.booking_view_booking).Text = booking.BookingDate.ToShortDateString() + " at " + booking.StartTime.Hours + ":" + booking.StartTime.Minutes;
            view.FindViewById<TextView>(Resource.Id.booking_view_customers).Text = booking.NoCustomers.ToString();
            view.FindViewById<TextView>(Resource.Id.booking_view_comments).Text = booking.Comments;
        }

        private async Task GetValues()
        {
            int id = Arguments.GetInt("id");

            if (id > 0)
            {
                booking = await _bookingFacade.FindById(id);
                restaurant = await _restaurantFacade.FindById(booking.RestaurantId);
            }
        }

        private void Bworker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            Setup();
            swipeRefresh.Refreshing = false;
        }

        private async void Bworker_DoWork(object sender, DoWorkEventArgs e)
        {
            await GetValues();
        }

        public override void OnCreateOptionsMenu(IMenu menu, MenuInflater inflater)
        {
            inflater.Inflate(Resource.Menu.booking_view_options, menu);
        }

        public override void OnResume()
        {
            MainActivity.IsNavDisabled = true;
            base.OnResume();
        }

        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            if (IsActive)
            {
                int id = item.ItemId;

                if (id == Android.Resource.Id.Home)
                {
                    MainActivity.IsNavDisabled = false;
                    Activity.OnBackPressed();
                    return true;
                }
                else if (id == Resource.Id.view_restaurant)
                {
                    Fragment fragment = RestaurantViewFragment.NewInstance(booking.RestaurantId);
                    FragmentManager.BeginTransaction()
                            .Replace(Resource.Id.content_frame, fragment)
                            .AddToBackStack(null)
                            .Commit();
                }
                else if (id == Resource.Id.cancel_booking)
                {
                    new Android.App.AlertDialog.Builder(Activity).
                            SetIcon(Android.Resource.Drawable.IcDialogAlert).
                            SetTitle("Confirm").
                            SetMessage("Are you sure you want to cancel the booking?").
                            SetPositiveButton("Yes", (c, ev) =>
                            {
                                bool res = _bookingFacade.Cancel(booking.Id).Result;

                                if (res)
                                {
                                    Toast.MakeText(Activity, "Booking Cancelled", ToastLength.Long).Show();
                                    Fragment fragment = BookingIndexFragment.NewInstance();
                                    FragmentManager.BeginTransaction()
                                            .Replace(Resource.Id.content_frame, fragment)
                                            .Commit();
                                }
                                else
                                {
                                    Toast.MakeText(Activity, "An error occured whilst cancelling. Please try again later", ToastLength.Long).Show();
                                }
                            }).
                            SetNegativeButton("No", (c, ev) =>
                            {

                            }).
                            Show();
                }
            }

            return base.OnOptionsItemSelected(item);
        }
    }
}