using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Support.V7.App;
using Android.Support.V7.Widget;
using Android.Views;
using BookingSystemMobile.Facades;
using LibBookingService.Dtos;
//using Android.Widget;

namespace BookingSystemMobile.Fragments.Restaurant
{
    public class RestaurantMenuItemDialogFragment : DialogFragment
    {
        private readonly MenuFacade _menuFacade = new MenuFacade();
        private readonly RestaurantFacade _restaurantFacade = new RestaurantFacade();

        public static RestaurantMenuItemDialogFragment NewInstance(int id, int resId)
        {
            RestaurantMenuItemDialogFragment f = new RestaurantMenuItemDialogFragment();
            Bundle args = new Bundle();
            args.PutInt("id", id);
            args.PutInt("resId", resId);
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
            View view = inflater.Inflate(Resource.Layout.menu_index_view_items, null);

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

            int id = Arguments.GetInt("id");
            int resId = Arguments.GetInt("resId");

            if (id > 0 && resId > 0)
            {
                //LibBookingService.Dtos.Restaurant restaurant = _restaurantFacade.FindById(resId).Result;
                LibBookingService.Dtos.Restaurant restaurant = new LibBookingService.Dtos.Restaurant
                {
                    Id = 1,
                    CompanyId = 2,
                    Name = "Restaurant 1",
                    PhoneNo = "01429354096",
                    AddressStreet = "21 Restaurant Road",
                    AddressTown = "Hartlepool",
                    AddressCounty = "Cleveland",
                    AddressPostalCode = "TS248GX",
                    MenuItems = new List<MenuItem>
                    {
                        new MenuItem { Id = 4, Description = "A fresh bowl of caesar salad", Price = 4.38, ImageId = 4, Name = "Caesar Salad", DietInfo = new List<DietInfo> { new DietInfo { Name = "Vegan", Id = 2 } }, Types = new List<MenuItemType> { new MenuItemType { Id = 1, Name = "Starter" } } },
                        new MenuItem { Id = 5, Description = null, Price = 3.59, ImageId = 5, Name = "Chocolate Fudge Cake", DietInfo = new List<DietInfo> { new DietInfo { Name = "Contains Dairy", Id = 4 } }, Types = new List<MenuItemType> { new MenuItemType { Id = 3, Name = "Dessert" }, new MenuItemType { Id = 4, Name = "Special" } } },
                        new MenuItem { Id = 2, Description = "A fresh cod fillet served with thick cut chips and mushy peas", Price = 6.00, ImageId = 2, Name = "Fish and Chips", DietInfo = new List<DietInfo> { }, Types = new List<MenuItemType> { new MenuItemType { Id = 2, Name = "Main" } } }
                    }
                };
                
                RecyclerView recyclerView = view.FindViewById<RecyclerView>(Resource.Id.menu_index_view_item_types);
                recyclerView.SetLayoutManager(new LinearLayoutManager(Activity));

                List<MenuItem> menuItems = restaurant.MenuItems.ToList();
                menuItems = menuItems.Where(m => m.Types.Where(t => t.Id == id).Any()).ToList();

                RestaurantMenuItemDialogAdapter adapter = new RestaurantMenuItemDialogAdapter(menuItems);
                recyclerView.SetAdapter(adapter);
            }

            return view;
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