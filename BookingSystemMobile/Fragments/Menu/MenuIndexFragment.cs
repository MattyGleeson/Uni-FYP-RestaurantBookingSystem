using Android.App;
using Android.OS;
using Android.Support.V4.App;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Fragments.Menu;
using LibBookingService.Dtos;
using System.Collections.Generic;

namespace BookingSystemMobile.Fragments
{
    public class MenuIndexFragment : Android.App.Fragment
    {
        private readonly MenuItemTypeFacade _menuItemTypeFacade = new MenuItemTypeFacade();
        private View view;
        private RecyclerView recyclerView;
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

            //Button button = view.FindViewById<Button>(Resource.Id.button1);

            //button.Click += delegate
            //{
            //    GetMenuItems();
            //};

            Setup();

            return view;
        }

        private void Setup()
        {
            //menuItemTypes = _menuItemTypeFacade.Get().Result;
            menuItemTypes = new List<MenuItemType>
            {
                new MenuItemType { Id = 1, Name = "Starter" },
                new MenuItemType { Id = 2, Name = "Main" },
                new MenuItemType { Id = 3, Name = "Dessert" },
                new MenuItemType { Id = 4, Name = "Special" }
            };

            recyclerView = view.FindViewById<RecyclerView>(Resource.Id.menu_index);
            recyclerView.SetLayoutManager(new LinearLayoutManager(Activity));

            MenuIndexAdapter adapter = new MenuIndexAdapter(menuItemTypes);
            adapter.ItemClick += MAdapter_ItemClick;
            recyclerView.SetAdapter(adapter);
        }

        private void MAdapter_ItemClick(object sender, int i)
        {
            //Toast.MakeText(Activity, "This is item number " + (i + 1), ToastLength.Short).Show();
            MainActivity.IsInDialogFragment = true;
            Android.App.DialogFragment dialog = MenuItemTypeDialogFragment.NewInstance(menuItemTypes[i].Id);
            dialog.Show(FragmentManager, "fragmentDialog");
        }
    }
}