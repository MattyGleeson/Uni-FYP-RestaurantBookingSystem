using Android.App;
using Android.OS;
using Android.Support.V7.Widget;
using Android.Views;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Fragments.Restaurant;
using System.Collections.Generic;

namespace BookingSystemMobile.Fragments.Restaurant
{
    public class RestaurantIndexFragment : Fragment
    {
        private readonly RestaurantFacade _restaurantFacade = new RestaurantFacade();
        private View view;
        private RecyclerView recyclerView;
        private List<LibBookingService.Dtos.Restaurant> restaurants = new List<LibBookingService.Dtos.Restaurant>();

        public static RestaurantIndexFragment NewInstance()
        {
            var frag2 = new RestaurantIndexFragment { Arguments = new Bundle() };
            return frag2;
        }

        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your fragment here
        }

        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            ((MainActivity)Activity).SetAsDrawerToolbar();
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.restaurant_index, null);

            Setup();

            return view;
        }

        private async void Setup()
        {
            //restaurants = await _restaurantFacade.Get();
            restaurants = new List<LibBookingService.Dtos.Restaurant>
            {
                new LibBookingService.Dtos.Restaurant { Id = 1, CompanyId = 2, Name = "Restaurant 1", PhoneNo = "01429354096", AddressStreet = "21 Restaurant Road", AddressTown = "Hartlepool", AddressCounty = "Cleveland", AddressPostalCode = "TS248GX" },
                new LibBookingService.Dtos.Restaurant { Id = 2, CompanyId = 2, Name = "Restaurant 2", PhoneNo = "01429409235", AddressStreet = "45 Business Road", AddressTown = "Newcastle", AddressCounty = "Tyne and Wear", AddressPostalCode = "NE11DF" }
            };

            recyclerView = view.FindViewById<RecyclerView>(Resource.Id.restaurant_index);
            recyclerView.SetLayoutManager(new LinearLayoutManager(Activity));

            RestaurantIndexAdapter adapter = new RestaurantIndexAdapter(restaurants);
            adapter.ItemClick += MAdapter_ItemClick;
            recyclerView.SetAdapter(adapter);
        }

        private void MAdapter_ItemClick(object sender, int i)
        {
            MainActivity.IsNavDisabled = true;
            Fragment fragment = RestaurantViewFragment.NewInstance(restaurants[i].Id);
            FragmentManager.BeginTransaction()
                    .Replace(Resource.Id.content_frame, fragment)
                    .AddToBackStack(null)
                    .Commit();
            //Android.App.DialogFragment dialog = MenuItemTypeDialogFragment.NewInstance(menuItemTypes[i].Id);
            //dialog.Show(FragmentManager, "fragmentDialog");
        }
    }
}