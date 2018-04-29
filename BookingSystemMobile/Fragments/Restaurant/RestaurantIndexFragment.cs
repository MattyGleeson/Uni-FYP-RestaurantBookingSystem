using Android.App;
using Android.OS;
using Android.Support.V4.Widget;
using Android.Support.V7.Widget;
using Android.Views;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Fragments.Restaurant;
using Java.Lang;
using System.Collections.Generic;
using System.ComponentModel;
using System.Threading.Tasks;

namespace BookingSystemMobile.Fragments.Restaurant
{
    public class RestaurantIndexFragment : Fragment
    {
        private readonly RestaurantFacade _restaurantFacade = new RestaurantFacade();
        private View view;
        private RecyclerView recyclerView;
        private SwipeRefreshLayout swipeRefresh;

        private List<LibBookingService.Dtos.Restaurant> restaurants = new List<LibBookingService.Dtos.Restaurant>();

        private BackgroundWorker backgroundWorker;

        public static RestaurantIndexFragment NewInstance()
        {
            var frag2 = new RestaurantIndexFragment { Arguments = new Bundle() };
            return frag2;
        }

        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
        }

        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            ((MainActivity)Activity).SetAsDrawerToolbar();
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.restaurant_index, null);
            swipeRefresh = view.FindViewById<SwipeRefreshLayout>(Resource.Id.restaurant_index_swipe);

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
            recyclerView = view.FindViewById<RecyclerView>(Resource.Id.restaurant_index);
            recyclerView.SetLayoutManager(new LinearLayoutManager(Activity));

            RestaurantIndexAdapter adapter = new RestaurantIndexAdapter(restaurants);
            adapter.ItemClick += MAdapter_ItemClick;
            recyclerView.SetAdapter(adapter);
        }

        private async Task GetValues()
        {
            restaurants = await _restaurantFacade.Get();
        }

        private void MAdapter_ItemClick(object sender, int i)
        {
            MainActivity.IsNavDisabled = true;
            Fragment fragment = RestaurantViewFragment.NewInstance(restaurants[i].Id);
            FragmentManager.BeginTransaction()
                    .Replace(Resource.Id.content_frame, fragment)
                    .AddToBackStack(null)
                    .Commit();
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
    }
}