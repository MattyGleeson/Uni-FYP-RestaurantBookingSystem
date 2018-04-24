using Android.App;
using Android.OS;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using BookingSystemMobile.Facades.Core;
using LibBookingService.Dtos;
using System.Collections.Generic;

namespace BookingSystemMobile.Fragments
{
    public class LoginFragment : Fragment
    {
        private readonly AuthFacade _authFacade = new AuthFacade();
        private readonly CustomerFacade _customerFacade = new CustomerFacade();
        private View view;

        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your fragment here
        }

        public static LoginFragment NewInstance()
        {
            var frag1 = new LoginFragment { Arguments = new Bundle() };
            return frag1;
        }


        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            ((MainActivity)Activity).SetAsDrawerToolbar();
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.login, null);

            string username = view.FindViewById<TextView>(Resource.Id.login_username).Text;
            string password = view.FindViewById<TextView>(Resource.Id.login_password).Text;

            Button login = view.FindViewById<Button>(Resource.Id.login_btn);
            login.Click += delegate
            {
                if (username.Trim() != "" && password.Trim() != "")
                {
                    _authFacade.GetToken(username, password);

                    Customer c = _customerFacade.Get().Result;

                    if (c != null)
                    {
                        GenericFacade.UserName = username;
                        Toast.MakeText(Activity, "Login successful", ToastLength.Long).Show();

                        Fragment fragment = HomeFragment.NewInstance();
                        FragmentManager.BeginTransaction()
                                .Replace(Resource.Id.content_frame, fragment)
                                .Commit();

                        ((MainActivity)Activity).ToggleLogin();
                    }
                    else
                    {
                        Toast.MakeText(Activity, "Please enter a valid username and password", ToastLength.Long).Show();
                    }
                }
            };

            return view;
        }
    }
}