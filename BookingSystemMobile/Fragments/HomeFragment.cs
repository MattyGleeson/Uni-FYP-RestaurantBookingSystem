using Android.App;
using Android.OS;
using Android.Views;
using Android.Widget;
using LibBookingService.Dtos;
using System.Collections.Generic;

namespace BookingSystemMobile.Fragments
{
    public class HomeFragment : Fragment
    {
        private View view;

        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your fragment here
        }

        public static HomeFragment NewInstance()
        {
            var frag1 = new HomeFragment { Arguments = new Bundle() };
            return frag1;
        }


        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.home, null);

            Spinner spinner = view.FindViewById<Spinner>(Resource.Id.spinner_home);

            var adapter = new ArrayAdapter<LibBookingService.Dtos.Restaurant>(Activity, Android.Resource.Layout.SimpleSpinnerDropDownItem, new List<LibBookingService.Dtos.Restaurant>());
            adapter.SetDropDownViewResource(Android.Resource.Layout.SimpleSpinnerDropDownItem);
            spinner.Adapter = adapter;

            return view;
        }
    }
}