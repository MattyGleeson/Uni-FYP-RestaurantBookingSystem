using Android.App;
using Android.OS;
using Android.Support.V4.App;
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

namespace BookingSystemMobile.Fragments
{
    public class BookingIndexFragment : Android.App.Fragment
    {
        private readonly BookingFacade _bookingFacade = new BookingFacade();
        private View view;
        private RecyclerView recyclerView;
        private List<Booking> bookings = new List<Booking>();

        public static BookingIndexFragment NewInstance()
        {
            var frag1 = new BookingIndexFragment { Arguments = new Bundle() };
            return frag1;
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
            view = inflater.Inflate(Resource.Layout.booking_index, null);
            
            Setup();

            return view;
        }

        private void Setup()
        {
            //bookings = _bookingFacade.FindByCustomerId(GenericFacade.UserId).Result;
            bookings = new List<Booking>
            {
                new Booking
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
                    Restaurant = new LibBookingService.Dtos.Restaurant { Id = 1, CompanyId = 2, Name = "Restaurant 1", PhoneNo = "01429354096", AddressStreet = "21 Restaurant Road", AddressTown = "Hartlepool", AddressCounty = "Cleveland", AddressPostalCode = "TS248GX" }
                }
            };

            recyclerView = view.FindViewById<RecyclerView>(Resource.Id.booking_index);
            recyclerView.SetLayoutManager(new LinearLayoutManager(Activity));

            BookingIndexAdapter adapter = new BookingIndexAdapter(bookings);
            adapter.ItemClick += MAdapter_ItemClick;
            recyclerView.SetAdapter(adapter);
        }

        private void MAdapter_ItemClick(object sender, int i)
        {
            MainActivity.IsNavDisabled = true;
            Android.App.Fragment fragment = BookingViewFragment.NewInstance(bookings[i].Id);
            FragmentManager.BeginTransaction()
                    .Replace(Resource.Id.content_frame, fragment)
                    .AddToBackStack(null)
                    .Commit();
        }
    }
}