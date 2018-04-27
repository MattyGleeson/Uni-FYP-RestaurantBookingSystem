using Android.App;
using Android.Graphics;
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
    public class BookingViewFragment : Fragment
    {
        private readonly BookingFacade _bookingFacade = new BookingFacade();
        private readonly RestaurantFacade _restaurantFacade = new RestaurantFacade();
        private View view;
        private Booking booking;

        public static bool IsActive = true;

        public static BookingViewFragment NewInstance(int id)
        {
            var f = new BookingViewFragment { Arguments = new Bundle() };
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
            view = inflater.Inflate(Resource.Layout.booking_view, null);

            Setup();

            return view;
        }

        private async void Setup()
        {
            int id = Arguments.GetInt("id");

            if (id > 0)
            {
                //booking = _bookingFacade.FindById(id).Result;
                //var restaurant = _restaurantFacade.FindById(booking.RestaurantId).Result;

                booking = new Booking
                {
                    Id = 1,
                    StartTime = DateTime.Now.TimeOfDay,
                    EndTime = DateTime.Now.TimeOfDay,
                    BookingDate = DateTime.Now,
                    BookingMadeDate = DateTime.Now,
                    BookingMadeTime = DateTime.Now.TimeOfDay,
                    Cancelled = false,
                    Comments = "Comment",
                    NoCustomers = 4,
                    PaymentTotal = Convert.ToDecimal(5.50),
                    CustomerId = 1,
                    MenuItems = new List<BookingMenuItem>
                    {
                        new BookingMenuItem
                        {
                            Id = 1,
                            BookingId = 1,
                            MenuItemId = 1,
                            Quantity = 1,
                            TotalPrice = 5.50
                        }
                    },
                    Tables = new List<Table>
                    {
                        new Table
                        {
                            Id = 1,
                            Active = true,
                            NoSeats = 4,
                            TableNo = 1,
                            AdditionalNotes = "Notes",
                            RestaurantId = 1
                        }
                    },
                    Payments = new List<Payment>
                    {
                        new Payment
                        {
                            Id = 1,
                            Comments = "Comment",
                            Amount = Convert.ToDecimal(5.50),
                            BookingId = 1,
                            CustomerId = 1,
                            PaymentMethod = new PaymentMethod
                            {
                                Id = 1,
                                Active = true,
                                Name = "PayPal"
                            }
                        }
                    },
                    Restaurant = new LibBookingService.Dtos.Restaurant { Id = 1, CompanyId = 2, Name = "Restaurant 1", PhoneNo = "01429354096", AddressStreet = "21 Restaurant Road", AddressTown = "Hartlepool", AddressCounty = "Cleveland", AddressPostalCode = "TS248GX" },
                    RestaurantId = 1
                };
                var restaurant = new LibBookingService.Dtos.Restaurant { Id = 1, CompanyId = 2, Name = "Restaurant 1", PhoneNo = "01429354096", AddressStreet = "21 Restaurant Road", AddressTown = "Hartlepool", AddressCounty = "Cleveland", AddressPostalCode = "TS248GX" };

                view.FindViewById<TextView>(Resource.Id.booking_view_restaurant_name).Text = restaurant.Name;
                view.FindViewById<TextView>(Resource.Id.booking_view_restaurant_address).Text = restaurant.AddressStreet + ", " + restaurant.AddressTown + ", " + restaurant.AddressCounty + ", " + restaurant.AddressPostalCode;

                view.FindViewById<TextView>(Resource.Id.booking_view_created).Text = booking.BookingMadeDate.ToShortDateString() + " at " + booking.BookingMadeTime.Hours + ":" + booking.BookingMadeTime.Minutes;
                view.FindViewById<TextView>(Resource.Id.booking_view_booking).Text = booking.BookingDate.ToShortDateString() + " at " + booking.StartTime.Hours + ":" + booking.StartTime.Minutes;
                view.FindViewById<TextView>(Resource.Id.booking_view_customers).Text = booking.NoCustomers.ToString();
                view.FindViewById<TextView>(Resource.Id.booking_view_comments).Text = booking.Comments;
            }
        }

        public override void OnCreateOptionsMenu(IMenu menu, MenuInflater inflater)
        {
            inflater.Inflate(Resource.Menu.booking_view_options, menu);
        }

        public override void OnResume()
        {
            MainActivity.IsNavDisabled = true;
            base.OnResume();
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
                else if (id == Resource.Id.view_restaurant)
                {
                    Fragment fragment = RestaurantViewFragment.NewInstance(booking.RestaurantId);
                    FragmentManager.BeginTransaction()
                            .Replace(Resource.Id.content_frame, fragment)
                            .AddToBackStack(null)
                            .Commit();
                }
            }

            return base.OnOptionsItemSelected(item);
        }
    }
}