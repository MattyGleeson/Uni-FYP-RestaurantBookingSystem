using Android.App;
using Android.OS;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using LibBookingService.Dtos;
using System.Collections.Generic;

namespace BookingSystemMobile.Fragments
{
    public class HomeFragment : Fragment
    {
        private readonly RestaurantFacade _restaurantFacade = new RestaurantFacade();

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
            ((MainActivity)Activity).SetAsDrawerToolbar();
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.home, null);

            Spinner spinner = view.FindViewById<Spinner>(Resource.Id.spinner_home);

            List<LibBookingService.Dtos.Restaurant> restaurants = new List<LibBookingService.Dtos.Restaurant>
            {
                new LibBookingService.Dtos.Restaurant
                {
                    Name = "Please select"
                }
            };

            restaurants.AddRange(_restaurantFacade.Get().Result);
            //restaurants.AddRange(new List<LibBookingService.Dtos.Restaurant>
            //{
            //    new LibBookingService.Dtos.Restaurant { Id = 1, CompanyId = 2, Name = "Restaurant 1", PhoneNo = "01429354096", AddressStreet = "21 Restaurant Road", AddressTown = "Hartlepool", AddressCounty = "Cleveland", AddressPostalCode = "TS248GX" },
            //    new LibBookingService.Dtos.Restaurant { Id = 2, CompanyId = 2, Name = "Restaurant 2", PhoneNo = "01429409235", AddressStreet = "45 Business Road", AddressTown = "Newcastle", AddressCounty = "Tyne and Wear", AddressPostalCode = "NE11DF" }
            //});

            var adapter = new ArrayAdapter<LibBookingService.Dtos.Restaurant>(Activity, Android.Resource.Layout.SimpleSpinnerDropDownItem, restaurants);
            adapter.SetDropDownViewResource(Android.Resource.Layout.SimpleSpinnerDropDownItem);
            spinner.Adapter = adapter;

            int initialSpinnerPosition = spinner.SelectedItemPosition;
            spinner.ItemSelected += (sender, args) =>
            {
                if (args.Position != initialSpinnerPosition)
                {
                    MainActivity.IsNavDisabled = true;
                    spinner.SetSelection(0);
                    Fragment fragment = Restaurant.RestaurantViewFragment.NewInstance(restaurants[args.Position].Id);
                    FragmentManager.BeginTransaction().Replace(Resource.Id.content_frame, fragment).AddToBackStack(null).Commit();
                }
            };

            return view;
        }
    }
}