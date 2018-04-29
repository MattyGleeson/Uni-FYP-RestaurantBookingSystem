using Android.App;
using Android.OS;
using Android.Support.V4.Widget;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Facades.Core;
using LibBookingService.Dtos;
using System.Collections.Generic;
using System.ComponentModel;
using System.Threading.Tasks;

namespace BookingSystemMobile.Fragments.User
{
    public class UserDetailsFragment : Fragment
    {
        private View view;
        private readonly CustomerFacade _customerFacade = new CustomerFacade();

        private Customer customer;
        private SwipeRefreshLayout swipeRefresh;
        private BackgroundWorker backgroundWorker;

        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your fragment here
        }

        public static UserDetailsFragment NewInstance()
        {
            var frag1 = new UserDetailsFragment { Arguments = new Bundle() };
            return frag1;
        }

        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            ((MainActivity)Activity).SetAsDrawerToolbar();
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.user_details, null);

            swipeRefresh = view.FindViewById<SwipeRefreshLayout>(Resource.Id.user_details_swipe);

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
            if (customer != null)
            {
                view.FindViewById<TextView>(Resource.Id.user_details_username).Text = customer.UserName;
                view.FindViewById<TextView>(Resource.Id.user_details_name).Text = customer.Forename + " " + customer.Surname;
                view.FindViewById<TextView>(Resource.Id.user_details_dob).Text = customer.DoB.ToShortDateString();
                view.FindViewById<TextView>(Resource.Id.user_details_address).Text = customer.AddressStreet + ", " + customer.AddressTown + ", " + customer.AddressCounty + ", " + customer.AddressPostalCode;
                view.FindViewById<TextView>(Resource.Id.user_details_home_phone_no).Text = customer.HomePhoneNo;
                view.FindViewById<TextView>(Resource.Id.user_details_work_phone_no).Text = customer.WorkPhoneNo;
                view.FindViewById<TextView>(Resource.Id.user_details_mobile_phone_no).Text = customer.MobilePhoneNo;
                view.FindViewById<TextView>(Resource.Id.user_details_email).Text = customer.Email;
            }
        }

        private async Task GetValues()
        {
            int id = GenericFacade.UserId;

            Customer c = await _customerFacade.Get();
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