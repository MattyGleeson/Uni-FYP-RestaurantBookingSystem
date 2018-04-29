using Android.App;
using Android.OS;
using Android.Support.V4.App;
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
using System.Threading.Tasks;

namespace BookingSystemMobile.Fragments
{
    public class BookingIndexFragment : Android.App.Fragment
    {
        private readonly BookingFacade _bookingFacade = new BookingFacade();
        private View view;
        private RecyclerView recyclerView;
        private SwipeRefreshLayout swipeRefresh;

        private List<Booking> bookings = new List<Booking>();

        private BackgroundWorker backgroundWorker;

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

            swipeRefresh = view.FindViewById<SwipeRefreshLayout>(Resource.Id.booking_index_swipe);

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
            recyclerView = view.FindViewById<RecyclerView>(Resource.Id.booking_index);
            recyclerView.SetLayoutManager(new LinearLayoutManager(Activity));

            BookingIndexAdapter adapter = new BookingIndexAdapter(bookings);
            adapter.ItemClick += MAdapter_ItemClick;
            recyclerView.SetAdapter(adapter);
        }

        private async Task GetValues()
        {
            bookings = await _bookingFacade.FindByCustomerId(GenericFacade.UserId);
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