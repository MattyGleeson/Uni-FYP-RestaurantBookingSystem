using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Support.V4.Widget;
using Android.Support.V7.App;
using Android.Support.V7.Widget;
using Android.Views;
using BookingSystemMobile.Facades;
using LibBookingService.Dtos;
//using Android.Widget;

namespace BookingSystemMobile.Fragments.Menu
{
    public class MenuItemTypeDialogFragment : DialogFragment
    {
        private readonly MenuFacade _menuFacade = new MenuFacade();

        private List<MenuItem> menuItems = new List<MenuItem>();

        private View view;
        private SwipeRefreshLayout swipeRefresh;
        private BackgroundWorker backgroundWorker;

        public static MenuItemTypeDialogFragment NewInstance(int id)
        {
            MenuItemTypeDialogFragment f = new MenuItemTypeDialogFragment();
            Bundle args = new Bundle();
            args.PutInt("id", id);
            f.Arguments = args;
            return f;
        }

        public override Dialog OnCreateDialog(Bundle savedInstanceState)
        {
            return base.OnCreateDialog(savedInstanceState);
        }

        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetStyle(DialogFragmentStyle.Normal, Resource.Style.Theme_MyTheme);
        }

        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            view = inflater.Inflate(Resource.Layout.menu_index_view_items, null);

            Toolbar toolbar = view.FindViewById<Toolbar>(Resource.Id.toolbar_menu_items);
            toolbar.SetTitle(Resource.String.menuItemDialogTitle);

            SetHasOptionsMenu(true);

            ((AppCompatActivity)Activity).SetSupportActionBar(toolbar);

            Android.Support.V7.App.ActionBar actionBar = ((AppCompatActivity)Activity).SupportActionBar;
            if (actionBar != null)
            {
                actionBar.SetDisplayHomeAsUpEnabled(true);
                actionBar.SetHomeButtonEnabled(true);
                actionBar.SetHomeAsUpIndicator(Resource.Drawable.ic_clear_white);
            }

            swipeRefresh = view.FindViewById<SwipeRefreshLayout>(Resource.Id.menu_index_view_item_types_swipe);

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
            RecyclerView recyclerView = view.FindViewById<RecyclerView>(Resource.Id.menu_index_view_item_types);
            recyclerView.SetLayoutManager(new LinearLayoutManager(Activity));

            MenuItemTypeDialogAdapter adapter = new MenuItemTypeDialogAdapter(menuItems);
            recyclerView.SetAdapter(adapter);
        }

        private async Task GetValues()
        {
            int id = Arguments.GetInt("id");

            if (id > 0)
            {
                menuItems = await _menuFacade.Get();
                menuItems = menuItems.Where(m => m.Types.Where(t => t.Id == id).Any()).ToList();
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
            menu.Clear();
            Activity.MenuInflater.Inflate(Resource.Menu.default_no_toolbar_options, menu);
        }

        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            int id = item.ItemId;

            if (id == Android.Resource.Id.Home)
            {
                Dismiss();
                return true;
            }

            return base.OnOptionsItemSelected(item);
        }

        public override void OnDismiss(IDialogInterface dialog)
        {
            MainActivity.IsNavDisabled = false;
            base.OnDismiss(dialog);
        }
    }
}