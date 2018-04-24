using Android.App;
using Android.OS;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Facades.Core;
using LibBookingService;
using LibBookingService.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BookingSystemMobile.Fragments.User
{
    public class RegisterFragment : Fragment
    {
        private readonly AuthFacade _authFacade = new AuthFacade();
        private readonly CustomerFacade _customerFacade = new CustomerFacade();
        private View view;
        private Customer customer;

        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your fragment here
        }

        public static RegisterFragment NewInstance()
        {
            var frag1 = new RegisterFragment { Arguments = new Bundle() };
            return frag1;
        }


        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            ((MainActivity)Activity).SetAsDrawerToolbar();
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.register, null);
            customer = new Customer();

            List<string> titles = new List<string>
            {
                "Please select a title"
            };
            titles.AddRange(Enum.GetNames(typeof(Title)).ToList());
            Spinner titleSpinner = view.FindViewById<Spinner>(Resource.Id.register_title);

            var adapter = new ArrayAdapter<string>(Activity, Android.Resource.Layout.SimpleSpinnerDropDownItem, titles);
            adapter.SetDropDownViewResource(Android.Resource.Layout.SimpleSpinnerDropDownItem);
            titleSpinner.Adapter = adapter;

            int initialSpinnerPosition = titleSpinner.SelectedItemPosition;
            titleSpinner.ItemSelected += (sender, args) =>
            {
                if (args.Position != initialSpinnerPosition)
                {
                    customer.Title = titles[args.Position];
                }
            };

            Button register = view.FindViewById<Button>(Resource.Id.register_btn);
            register.Click += delegate
            {
                string password = view.FindViewById<TextView>(Resource.Id.register_password).Text;
                string confirmPassword = view.FindViewById<TextView>(Resource.Id.register_password_confirm).Text;

                customer.UserName = view.FindViewById<TextView>(Resource.Id.register_username).Text;
                customer.Forename = view.FindViewById<TextView>(Resource.Id.register_forename).Text;
                customer.Surname = view.FindViewById<TextView>(Resource.Id.register_surname).Text;
                customer.DoB = view.FindViewById<DatePicker>(Resource.Id.register_surname).DateTime;
                customer.AddressStreet = view.FindViewById<TextView>(Resource.Id.register_street).Text;
                customer.AddressTown = view.FindViewById<TextView>(Resource.Id.register_town).Text;
                customer.AddressCounty = view.FindViewById<TextView>(Resource.Id.register_county).Text;
                customer.AddressPostalCode = view.FindViewById<TextView>(Resource.Id.register_postal_code).Text;
                customer.HomePhoneNo = view.FindViewById<TextView>(Resource.Id.register_home_phone_no).Text;
                customer.WorkPhoneNo = view.FindViewById<TextView>(Resource.Id.register_work_phone_no).Text;
                customer.MobilePhoneNo = view.FindViewById<TextView>(Resource.Id.register_mobile_phone_no).Text;
                customer.Email = view.FindViewById<TextView>(Resource.Id.register_email_address).Text;

                if (Validate())
                {
                    if (_authFacade.Register(customer.UserName, password, confirmPassword))
                    {
                        _authFacade.GetToken(customer.UserName, password);

                        GenericFacade.UserName = customer.UserName;

                        string owinId = _authFacade.GetUserId();

                        GenericFacade.OwinId = owinId;
                        _authFacade.AddCustomerRole();

                        customer.OwinUserId = owinId;

                        Customer newCustomer = _customerFacade.Create(customer).Result;

                        Toast.MakeText(Activity, "Registration successful", ToastLength.Long).Show();

                        Fragment fragment = HomeFragment.NewInstance();
                        FragmentManager.BeginTransaction()
                                .Replace(Resource.Id.content_frame, fragment)
                                .Commit();

                        ((MainActivity)Activity).ToggleLogin();
                    }
                }
                else
                {
                    Toast.MakeText(Activity, "Validation errors detected", ToastLength.Long).Show();
                }
            };

            return view;
        }

        private bool Validate()
        {
            bool valid = true;

            if (customer.UserName.Trim() == "")
                valid = false;
            if (customer.Title == null || customer.Title.Trim() == "")
                valid = false;
            if (customer.Forename.Trim() == "")
                valid = false;
            if (customer.Surname.Trim() == "")
                valid = false;
            if (customer.DoB == null || customer.DoB == DateTime.MinValue)
                valid = false;
            if (customer.AddressStreet.Trim() == "")
                valid = false;
            if (customer.AddressTown.Trim() == "")
                valid = false;
            if (customer.AddressCounty.Trim() == "")
                valid = false;
            if (customer.AddressPostalCode.Trim() == "")
                valid = false;
            if (customer.HomePhoneNo.Trim() == "")
                valid = false;
            if (customer.WorkPhoneNo.Trim() == "")
                valid = false;
            if (customer.MobilePhoneNo.Trim() == "")
                valid = false;
            if (customer.Email.Trim() == "")
                valid = false;

            return valid;
        }
    }
}