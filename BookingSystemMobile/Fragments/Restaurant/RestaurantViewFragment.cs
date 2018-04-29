using Android.App;
using Android.Graphics;
using Android.OS;
using Android.Support.V4.Widget;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Facades.Core;
using BookingSystemMobile.Fragments.Menu;
using BookingSystemMobile.Fragments.Restaurant;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace BookingSystemMobile.Fragments.Restaurant
{
    public class RestaurantViewFragment : Fragment
    {
        private readonly RestaurantFacade _restaurantFacade = new RestaurantFacade();
        private readonly MenuItemTypeFacade _menuItemTypeFacade = new MenuItemTypeFacade();
        private readonly ImageFacade _imageFacade = new ImageFacade();
        private View view;
        private SwipeRefreshLayout swipeRefresh;
        private BackgroundWorker backgroundWorker;

        private LibBookingService.Dtos.Restaurant restaurant;
        private List<MenuItemType> types = new List<MenuItemType>();

        public static bool IsActive = true;

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
            ((MainActivity)Activity).SetAsNavigationToolbar();
            SetHasOptionsMenu(true);
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.restaurant_view, null);
            swipeRefresh = view.FindViewById<SwipeRefreshLayout>(Resource.Id.restaurant_view_swipe);

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
            if (restaurant != null)
            {
                LinearLayout imageLayout = view.FindViewById<LinearLayout>(Resource.Id.restaurant_view_images);

                if (restaurant.ImageIds.Any())
                {
                    foreach (int imageId in restaurant.ImageIds)
                    {
                        View imgView = LayoutInflater.From(Activity).Inflate(Resource.Layout.restaurant_view_image, null);
                        ImageView img = imgView.FindViewById<ImageView>(Resource.Id.restaurant_view_img);
                        Image dbImg = _imageFacade.LoadImage(imageId).Result;

                        if (dbImg == null)
                        {
                            img.SetImageResource(Resource.Drawable.nophoto);
                        }
                        else
                        {
                            img.SetImageBitmap(BitmapFactory.DecodeByteArray(dbImg.FileContent, 0, dbImg.FileContent.Length));
                        }

                        imageLayout.AddView(img);
                        View divider = LayoutInflater.From(Activity).Inflate(Resource.Layout.vertical_divider_full, null);
                        imageLayout.AddView(divider);
                    }
                }
                else
                {
                    View imgView = LayoutInflater.From(Activity).Inflate(Resource.Layout.restaurant_view_image, null);
                    ImageView img = imgView.FindViewById<ImageView>(Resource.Id.restaurant_view_img);
                    img.SetImageResource(Resource.Drawable.nophoto);

                    imageLayout.AddView(img);
                }

                view.FindViewById<TextView>(Resource.Id.restaurant_view_name).Text = restaurant.Name;
                view.FindViewById<TextView>(Resource.Id.restaurant_view_phone).Text = restaurant.PhoneNo;
                view.FindViewById<TextView>(Resource.Id.restaurant_view_address).Text = restaurant.AddressStreet + ", " + restaurant.AddressTown + ", " + restaurant.AddressCounty + ", " + restaurant.AddressPostalCode;

                LinearLayout container = view.FindViewById<LinearLayout>(Resource.Id.restaurant_view_menu_container);

                foreach (var cat in types)
                {
                    View viewCat = LayoutInflater.From(Activity).Inflate(Resource.Layout.restaurant_view_menu, null);
                    LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MatchParent, LinearLayout.LayoutParams.WrapContent)
                    {
                        TopMargin = 16
                    };
                    viewCat.LayoutParameters = layout;
                    viewCat.FindViewById<TextView>(Resource.Id.restaurant_view_menu_type).Text = cat.Name;

                    container.AddView(viewCat);

                    viewCat.Click += delegate
                    {
                        MainActivity.IsNavDisabled = true;
                        IsActive = false;
                        Android.App.DialogFragment dialog = RestaurantMenuItemDialogFragment.NewInstance(cat.Id, restaurant.Id);
                        dialog.Show(FragmentManager, "fragmentDialog");
                    };
                }
            }
        }

        private async Task GetValues()
        {
            int id = Arguments.GetInt("id");

            if (id > 0)
            {
                restaurant = await _restaurantFacade.FindById(id);
                types = await _menuItemTypeFacade.Get();

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
            inflater.Inflate(Resource.Menu.restaurant_view_options, menu);
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
                else if (id == Resource.Id.book_table)
                {
                    if (GenericFacade.UserName != null && GenericFacade.UserName != "")
                    {
                        MainActivity.IsNavDisabled = true;
                        IsActive = false;
                        Android.App.DialogFragment dialog = BookingNewDialogFragment.NewInstance(restaurant.Id);
                        dialog.Show(FragmentManager, "fragmentDialog");
                    }
                    else
                    {
                        Toast.MakeText(Activity, "Please login before booking a table", ToastLength.Long).Show();
                    }
                }
            }

            return base.OnOptionsItemSelected(item);
        }
    }
}