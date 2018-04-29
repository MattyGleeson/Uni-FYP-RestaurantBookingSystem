using Android.App;
using Android.OS;
using Android.Support.V4.App;
using Android.Support.V4.Widget;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Fragments.Menu;
using LibBookingService.Dtos;
using System.Collections.Generic;
using System.ComponentModel;
using System.Threading.Tasks;

namespace BookingSystemMobile.Fragments
{
    public class MenuIndexFragment : Android.App.Fragment
    {
        private readonly MenuItemTypeFacade _menuItemTypeFacade = new MenuItemTypeFacade();
        private View view;
        private RecyclerView recyclerView;
        private SwipeRefreshLayout swipeRefresh;
        private BackgroundWorker backgroundWorker;

        private List<MenuItem> menuItems = new List<MenuItem>();
        private List<MenuItemType> menuItemTypes = new List<MenuItemType>();

        public static MenuIndexFragment NewInstance()
        {
            var frag1 = new MenuIndexFragment { Arguments = new Bundle() };
            return frag1;
        }
        
        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your fragment here
        }

        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.menu_index, null);

            swipeRefresh = view.FindViewById<SwipeRefreshLayout>(Resource.Id.menu_index_swipe);

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
            recyclerView = view.FindViewById<RecyclerView>(Resource.Id.menu_index);
            recyclerView.SetLayoutManager(new LinearLayoutManager(Activity));

            MenuIndexAdapter adapter = new MenuIndexAdapter(menuItemTypes);
            adapter.ItemClick += MAdapter_ItemClick;
            recyclerView.SetAdapter(adapter);
        }

        private async Task GetValues()
        {
            menuItemTypes = await _menuItemTypeFacade.Get();
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

        private void MAdapter_ItemClick(object sender, int i)
        {
            //Toast.MakeText(Activity, "This is item number " + (i + 1), ToastLength.Short).Show();
            MainActivity.IsNavDisabled = true;
            Android.App.DialogFragment dialog = MenuItemTypeDialogFragment.NewInstance(menuItemTypes[i].Id);
            dialog.Show(FragmentManager, "fragmentDialog");
        }
    }
}