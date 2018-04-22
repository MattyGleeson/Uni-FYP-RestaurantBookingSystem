using Android.App;
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
    public class RestaurantViewFragment : Fragment
    {
        private readonly RestaurantFacade _restaurantFacade = new RestaurantFacade();
        private readonly MenuItemTypeFacade _menuItemTypeFacade = new MenuItemTypeFacade();
        private View view;
        private RecyclerView menuItemsRecyclerView;
        private LibBookingService.Dtos.Restaurant restaurant;

        public static RestaurantViewFragment NewInstance(int id)
        {
            var f = new RestaurantViewFragment { Arguments = new Bundle() };
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
            //((MainActivity)Activity).SetAsNavigationToolbar();
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
                //restaurant = await _restaurantFacade.FindById(id);
                restaurant = new LibBookingService.Dtos.Restaurant
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


                //List<MenuItemType> types = await _menuItemTypeFacade.Get();
                List<MenuItemType> types = new List<MenuItemType>
                {
                    new MenuItemType { Id = 1, Name = "Starter" },
                    new MenuItemType { Id = 2, Name = "Main" },
                    new MenuItemType { Id = 3, Name = "Dessert" },
                    new MenuItemType { Id = 4, Name = "Special" }
                };

                //List<RestaurantViewMenuVM> categories = new List<RestaurantViewMenuVM>();

                //foreach (var type in types)
                //{
                //    categories.Add(new RestaurantViewMenuVM
                //    {
                //        MenuItemType = type,
                //        Items = restaurant.MenuItems.Where(m => m.Types.Where(t => t.Id == type.Id).Any()).ToList()
                //    });
                //}


                //menuItemsRecyclerView = view.FindViewById<RecyclerView>(Resource.Id.restaurant_view_menu);
                //menuItemsRecyclerView.SetLayoutManager(new LinearLayoutManager(Activity));

                view.FindViewById<TextView>(Resource.Id.restaurant_view_name).Text = restaurant.Name;
                view.FindViewById<TextView>(Resource.Id.restaurant_view_phone).Text = restaurant.PhoneNo;
                view.FindViewById<TextView>(Resource.Id.restaurant_view_address).Text = restaurant.AddressStreet + ", " + restaurant.AddressTown + ", " + restaurant.AddressCounty + ", " + restaurant.AddressPostalCode;

                LinearLayout container = view.FindViewById<LinearLayout>(Resource.Id.restaurant_view_menu_container);

                foreach (var cat in types)
                {
                    View viewCat = LayoutInflater.From(Activity).Inflate(Resource.Layout.restaurant_view_menu, null);

                    viewCat.FindViewById<TextView>(Resource.Id.restaurant_view_menu_type).Text = cat.Name;

                    container.AddView(viewCat);

                    viewCat.Click += delegate
                    {
                        MainActivity.IsNavDisabled = true;
                        Android.App.DialogFragment dialog = RestaurantMenuItemDialogFragment.NewInstance(cat.Id, restaurant.Id);
                        dialog.Show(FragmentManager, "fragmentDialog");
                    };
                }

                //RestaurantMenuItemAdapter adapter = new RestaurantMenuItemAdapter((List<RestaurantViewMenuVM>) categories);
                //menuItemsRecyclerView.SetAdapter(adapter);
            }
        }

        //public override bool OnOptionsItemSelected(IMenuItem item)
        //{
        //    int id = item.ItemId;

        //    if (id == Android.Resource.Id.Home)
        //    {
        //        Activity.OnBackPressed();
        //        return true;
        //    }

        //    return base.OnOptionsItemSelected(item);
        //}
    }
}