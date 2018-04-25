using Android.App;
using Android.Graphics;
using Android.OS;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Fragments.Menu;
using BookingSystemMobile.Fragments.Restaurant;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BookingSystemMobile.Fragments.Restaurant
{
    public class BookingViewFragment : Fragment
    {
        private readonly BookingFacade _bookingFacade = new BookingFacade();
        private View view;
        private LibBookingService.Dtos.Booking booking;

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
            view = inflater.Inflate(Resource.Layout.restaurant_view, null);

            Setup();

            return view;
        }

        private async void Setup()
        {
            int id = Arguments.GetInt("id");

            if (id > 0)
            {
                booking = _bookingFacade.FindById(id).Result;

            }
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
            }

            return base.OnOptionsItemSelected(item);
        }
    }
}