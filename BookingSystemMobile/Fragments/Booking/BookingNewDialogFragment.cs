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
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Facades.Core;
using LibBookingService.Dtos;
//using Android.Widget;

namespace BookingSystemMobile.Fragments.Restaurant
{
    public class BookingNewDialogFragment : DialogFragment
    {
        private readonly MenuFacade _menuFacade = new MenuFacade();
        private readonly RestaurantFacade _restaurantFacade = new RestaurantFacade();
        private readonly BookingFacade _bookingFacade = new BookingFacade();
        private readonly PaymentFacade _paymentFacade = new PaymentFacade();
        private readonly MenuItemTypeFacade _menuItemTypeFacade = new MenuItemTypeFacade();

        private View view;
        private Dictionary<MenuItem, int> miCounts = new Dictionary<MenuItem, int>();

        private Booking newBooking;
        private Payment newPayment;

        public static BookingNewDialogFragment NewInstance(int id)
        {
            BookingNewDialogFragment f = new BookingNewDialogFragment();
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
            
            SetHasOptionsMenu(true);
        }

        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            view = inflater.Inflate(Resource.Layout.booking_new, null);
            miCounts = new Dictionary<MenuItem, int>();
            newBooking = new Booking();
            newPayment = new Payment();

            newBooking.CustomerId = GenericFacade.UserId;
            newPayment.CustomerId = GenericFacade.UserId;

            Android.Support.V7.Widget.Toolbar toolbar = view.FindViewById<Android.Support.V7.Widget.Toolbar>(Resource.Id.toolbar_new_booking);
            toolbar.SetTitle(Resource.String.bookingNewDialogTitle);
            
            ((AppCompatActivity)Activity).SetSupportActionBar(toolbar);

            Android.Support.V7.App.ActionBar actionBar = ((AppCompatActivity)Activity).SupportActionBar;
            if (actionBar != null)
            {
                actionBar.SetDisplayHomeAsUpEnabled(true);
                actionBar.SetHomeButtonEnabled(true);
                actionBar.SetHomeAsUpIndicator(Resource.Drawable.ic_clear_white);
            }

            Setup();
            
            return view;
        }

        private void Setup()
        {
            int id = Arguments.GetInt("id");

            if (id > 0)
            {
                LibBookingService.Dtos.Restaurant restaurant = _restaurantFacade.FindById(id).Result;
                //LibBookingService.Dtos.Restaurant restaurant = new LibBookingService.Dtos.Restaurant
                //{
                //    Id = 1,
                //    CompanyId = 2,
                //    Name = "Restaurant 1",
                //    PhoneNo = "01429354096",
                //    AddressStreet = "21 Restaurant Road",
                //    AddressTown = "Hartlepool",
                //    AddressCounty = "Cleveland",
                //    AddressPostalCode = "TS248GX",
                //    MenuItems = new List<MenuItem>
                //    {
                //        new MenuItem { Id = 4, Description = "A fresh bowl of caesar salad", Price = 4.38, ImageId = 4, Name = "Caesar Salad", DietInfo = new List<DietInfo> { new DietInfo { Name = "Vegan", Id = 2 } }, Types = new List<MenuItemType> { new MenuItemType { Id = 1, Name = "Starter" } } },
                //        new MenuItem { Id = 5, Description = null, Price = 3.59, ImageId = 5, Name = "Chocolate Fudge Cake", DietInfo = new List<DietInfo> { new DietInfo { Name = "Contains Dairy", Id = 4 } }, Types = new List<MenuItemType> { new MenuItemType { Id = 3, Name = "Dessert" }, new MenuItemType { Id = 4, Name = "Special" } } },
                //        new MenuItem { Id = 2, Description = "A fresh cod fillet served with thick cut chips and mushy peas", Price = 6.00, ImageId = 2, Name = "Fish and Chips", DietInfo = new List<DietInfo> { }, Types = new List<MenuItemType> { new MenuItemType { Id = 2, Name = "Main" }, new MenuItemType { Id = 4, Name = "Special" } } }
                //    }
                //};

                IEnumerable<MenuItemType> types = _menuItemTypeFacade.Get().Result;
                //IEnumerable<MenuItemType> types = new List<MenuItemType>
                //{
                //    new MenuItemType { Id = 1, Name = "Starter" },
                //    new MenuItemType { Id = 2, Name = "Main" },
                //    new MenuItemType { Id = 3, Name = "Dessert" },
                //    new MenuItemType { Id = 4, Name = "Special" }
                //}.AsEnumerable();

                newBooking.RestaurantId = restaurant.Id;

                view.FindViewById<TextView>(Resource.Id.booking_new_restaurant_name).Text = restaurant.Name;
                view.FindViewById<TextView>(Resource.Id.booking_new_restaurant_address).Text = restaurant.AddressStreet + ", " + restaurant.AddressTown + ", " + restaurant.AddressCounty + ", " + restaurant.AddressPostalCode;

                Spinner time = view.FindViewById<Spinner>(Resource.Id.booking_new_time);
                Spinner paymentMethod = view.FindViewById<Spinner>(Resource.Id.booking_new_payment_method);

                List<TimeSpan> times = GetTimes();

                List<PaymentMethod> paymentMethods = new List<PaymentMethod>
                {
                    new PaymentMethod { Name = "Please select a payment method" }
                };
                paymentMethods.AddRange(_paymentFacade.GetPaymentMethod().Result);

                var timeAdapter = new ArrayAdapter<TimeSpan>(Activity, Android.Resource.Layout.SimpleSpinnerDropDownItem, times);
                timeAdapter.SetDropDownViewResource(Android.Resource.Layout.SimpleSpinnerDropDownItem);
                time.Adapter = timeAdapter;

                var paymentMethodAdapter = new ArrayAdapter<PaymentMethod>(Activity, Android.Resource.Layout.SimpleSpinnerDropDownItem, paymentMethods);
                paymentMethodAdapter.SetDropDownViewResource(Android.Resource.Layout.SimpleSpinnerDropDownItem);
                paymentMethod.Adapter = paymentMethodAdapter;

                int initialSpinnerPosition = time.SelectedItemPosition;
                time.ItemSelected += (sender, args) =>
                {
                    if (args.Position != initialSpinnerPosition)
                    {
                        newBooking.StartTime = times[args.Position];
                    }
                };

                paymentMethod.ItemSelected += (sender, args) =>
                {
                    if (args.Position != initialSpinnerPosition)
                    {
                        newPayment.PaymentMethod = paymentMethods[args.Position];
                    }
                };

                LinearLayout layoutContainer = view.FindViewById<LinearLayout>(Resource.Id.booking_new_container);

                //Dictionary<MenuItemType, IEnumerable<MenuItem>> categories = new Dictionary<MenuItemType, IEnumerable<MenuItem>>();

                //foreach (var type in types)
                //{
                //    categories.Add(type, restaurant.MenuItems.Where(m => m.Types.Where(t => t.Id == type.Id).Any()));
                //}

                //foreach (KeyValuePair<MenuItemType, IEnumerable<MenuItem>> entry in categories)
                //{
                //    TextView lbl = new TextView(Activity);
                //    lbl.Text = entry.Key.Name;

                //    LinearLayout menuItem = new LinearLayout(Activity);
                //    LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MatchParent, LinearLayout.LayoutParams.WrapContent);
                //    menuItem.LayoutParameters = layoutParams;
                //    menuItem.WeightSum = 4;

                //}

                miCounts = new Dictionary<MenuItem, int>();

                foreach (var mi in restaurant.MenuItems)
                {
                    View menuItem = LayoutInflater.From(Activity).Inflate(Resource.Layout.booking_new_menu, null);
                    LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MatchParent, LinearLayout.LayoutParams.WrapContent)
                    {
                        TopMargin = 16
                    };
                    menuItem.LayoutParameters = layout;

                    menuItem.FindViewById<TextView>(Resource.Id.booking_new_menu_item).Text = mi.Name + " - " + String.Join(", ", mi.Types.Select(t => t.Name));
                    miCounts.Add(mi, 0);

                    TextView miCount = menuItem.FindViewById<TextView>(Resource.Id.booking_new_menu_item_count);
                    FrameLayout miMinus = menuItem.FindViewById<FrameLayout>(Resource.Id.booking_new_menu_item_remove);
                    FrameLayout miAdd = menuItem.FindViewById<FrameLayout>(Resource.Id.booking_new_menu_item_add);

                    miAdd.Click += delegate
                    {
                        miCounts[mi] += 1;
                        miCount.Text = miCounts[mi].ToString();
                    };

                    miMinus.Click += delegate
                    {
                        if (miCounts[mi] > 0)
                            miCounts[mi] = miCounts[mi] - 1;

                        miCount.Text = miCounts[mi].ToString();
                    };

                    layoutContainer.AddView(menuItem);
                }
            }
        }

        private List<TimeSpan> GetTimes()
        {
            List<TimeSpan> times = new List<TimeSpan>();
            List<int> minutes = new List<int>
            {
                0,
                15,
                30,
                45
            };

            for (int i = 9; i < 22; i++)
            {
                foreach (int ii in minutes)
                {
                    times.Add(new TimeSpan(i, ii, 0));
                }
            }

            return times;
        }

        public override void OnCreateOptionsMenu(IMenu menu, MenuInflater inflater)
        {
            menu.Clear();
            Activity.MenuInflater.Inflate(Resource.Menu.booking_new_options, menu);
        }

        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            int id = item.ItemId;

            if (id == Android.Resource.Id.Home)
            {
                new Android.App.AlertDialog.Builder(Activity).
                        SetIcon(Android.Resource.Drawable.IcDialogAlert).
                        SetTitle("Confirm").
                        SetMessage("Are you sure you want to cancel the booking?").
                        SetPositiveButton("Yes", (c, ev) =>
                        {
                            Dismiss();
                        }).
                        SetNegativeButton("No", (c, ev) =>
                        {

                        }).
                        Show();
                return true;
            }
            else if (id == Resource.Id.save_booking)
            {
                string noCustomers = view.FindViewById<TextView>(Resource.Id.booking_new_customers).Text;
                DateTime date = view.FindViewById<DatePicker>(Resource.Id.booking_new_date).DateTime;

                if (noCustomers.Trim() != "" && int.Parse(noCustomers) > 0 && date != null && date != DateTime.MinValue && newBooking.StartTime != null && newBooking.StartTime != TimeSpan.MinValue)
                {
                    newBooking.BookingMadeDate = DateTime.Now;
                    newBooking.BookingMadeTime = DateTime.Now.TimeOfDay;
                    newBooking.BookingDate = date;
                    newBooking.EndTime = newBooking.StartTime.Add(new TimeSpan(1, 29, 59));

                    Table table = _bookingFacade.GetAvailableTable(newBooking).Result;

                    if (table != null)
                    {
                        List<Table> resTables = new List<Table>
                        {
                            table
                        };
                        newBooking.Tables = resTables.AsEnumerable();

                        newPayment.Comments = view.FindViewById<TextView>(Resource.Id.booking_new_payment_comments).Text;

                        double totalPayment = 0;

                        foreach (KeyValuePair<MenuItem, int> entry in miCounts)
                        {
                            if (entry.Value > 0)
                            {
                                totalPayment += (entry.Key.Price * entry.Value);
                            }
                        }

                        newPayment.Amount = Convert.ToDecimal(totalPayment);
                        
                        newBooking.PaymentTotal = Convert.ToDecimal(totalPayment);
                        newBooking.PaymentMadeDate = DateTime.Now;

                        if (newPayment.Amount > 0)
                        {
                            if (newPayment.PaymentMethod != null)
                            {
                                List<BookingMenuItem> menuItems = new List<BookingMenuItem>();
                                foreach (KeyValuePair<MenuItem, int> entry in miCounts)
                                {
                                    if (entry.Value > 0)
                                    {
                                        menuItems.Add(new BookingMenuItem
                                        {
                                            MenuItemId = entry.Key.Id,
                                            Quantity = entry.Value
                                        });
                                    }
                                }
                                newBooking.MenuItems = menuItems.AsEnumerable();

                                CompleteSave();
                            }
                            else
                            {
                                Toast.MakeText(Activity, "Please make sure a payment method is selected", ToastLength.Long).Show();
                            }
                        }
                        else
                        {
                            CompleteSave();
                        }
                    }
                    else
                    {
                        Toast.MakeText(Activity, "No table available for selected time", ToastLength.Long).Show();
                    }
                }
                else
                {
                    Toast.MakeText(Activity, "Please make sure the time, date and number of customers fields are completed", ToastLength.Long).Show();
                }
                return true;
            }

            return base.OnOptionsItemSelected(item);
        }

        private void CompleteSave()
        {
            string message = "Do you wish to confirm the booking?";

            if (newPayment.Amount > 0)
                message += " - (£" + newPayment.Amount + ")";

            new Android.App.AlertDialog.Builder(Activity).
                SetIcon(Android.Resource.Drawable.IcDialogAlert).
                SetTitle("Confirm").
                SetMessage(message).
                SetPositiveButton("Yes", (c, ev) =>
                {
                    Booking svdBooking = _bookingFacade.Create(newBooking).Result;

                    newPayment.BookingId = svdBooking.Id;

                    if (newPayment.Amount > 0)
                    {
                        Payment svdPayment = _paymentFacade.Create(newPayment).Result;
                    }

                    Toast.MakeText(Activity, "Booking Confirmed", ToastLength.Long).Show();

                    Dismiss();
                }).
                SetNegativeButton("No", (c, ev) =>
                {

                }).
                Show();
        }

        public override void OnDismiss(IDialogInterface dialog)
        {
            RestaurantViewFragment.IsActive = true;
            base.OnDismiss(dialog);
        }
    }
}