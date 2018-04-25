using Android.App;
using Android.OS;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Facades.Core;
using LibBookingService.Dtos;
using System.Collections.Generic;

namespace BookingSystemMobile.Fragments.User
{
    public class UserDetailsFragment : Fragment
    {
        private View view;
        private readonly CustomerFacade _customerFacade = new CustomerFacade();

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

            int id = GenericFacade.UserId;

            Customer c = _customerFacade.Get().Result;

            if (c != null)
            {
                view.FindViewById<TextView>(Resource.Id.user_details_username).Text = c.UserName;
                view.FindViewById<TextView>(Resource.Id.user_details_name).Text = c.Forename + " " + c.Surname;
                view.FindViewById<TextView>(Resource.Id.user_details_dob).Text = c.DoB.ToShortDateString();
                view.FindViewById<TextView>(Resource.Id.user_details_address).Text = c.AddressStreet + ", " + c.AddressTown + ", " + c.AddressCounty + ", " + c.AddressPostalCode;
                view.FindViewById<TextView>(Resource.Id.user_details_home_phone_no).Text = c.HomePhoneNo;
                view.FindViewById<TextView>(Resource.Id.user_details_work_phone_no).Text = c.WorkPhoneNo;
                view.FindViewById<TextView>(Resource.Id.user_details_mobile_phone_no).Text = c.MobilePhoneNo;
                view.FindViewById<TextView>(Resource.Id.user_details_email).Text = c.Email;
            }

            return view;
        }
    }
}