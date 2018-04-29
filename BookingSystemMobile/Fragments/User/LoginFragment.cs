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
    public class LoginFragment : Fragment
    {
        private readonly AuthFacade _authFacade = new AuthFacade();
        private readonly CustomerFacade _customerFacade = new CustomerFacade();
        private View view;
        private SwipeRefreshLayout swipeRefresh;
        private BackgroundWorker backgroundWorker;

        private Customer customer;
        private string username;
        private string password;

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

            swipeRefresh = view.FindViewById<SwipeRefreshLayout>(Resource.Id.swipe_refresh);
            swipeRefresh.Refresh += delegate
            {
                
            };

            Button login = view.FindViewById<Button>(Resource.Id.login_btn);
            login.Click += delegate
            {
                swipeRefresh.Refreshing = true;
                username = view.FindViewById<TextView>(Resource.Id.login_username).Text;
                password = view.FindViewById<TextView>(Resource.Id.login_password).Text;

                if (username.Trim() != "" && password.Trim() != "")
                {
                    backgroundWorker = new BackgroundWorker();
                    backgroundWorker.DoWork += Bworker_DoWork;
                    backgroundWorker.RunWorkerCompleted += Bworker_RunWorkerCompleted;
                    backgroundWorker.RunWorkerAsync();
                }
                else
                {
                    Toast.MakeText(Activity, "Please enter a valid username and password", ToastLength.Long).Show();
                }

                swipeRefresh.Refreshing = false;
            };

            return view;
        }

        private async Task GetValues()
        {
            _authFacade.GetToken(username, password);

            customer = await _customerFacade.Get();
        }

        private void Bworker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            swipeRefresh.Refreshing = false;
            if (customer != null)
            {
                GenericFacade.UserName = username;
                GenericFacade.UserId = customer.Id;

                swipeRefresh.Refreshing = false;

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

        private async void Bworker_DoWork(object sender, DoWorkEventArgs e)
        {
            await GetValues();
        }
    }
}