using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using LibBookingService.Dtos;

namespace BookingSystemMobile.Fragments.Menu
{
    public class BookingIndexAdapter : RecyclerView.Adapter
    {
        public event EventHandler<int> ItemClick;
        public List<Booking> Items;

        public BookingIndexAdapter(List<Booking> items)
        {
            Items = items;
        }

        public override int ItemCount
        {
            get { return Items.Count(); }
        }

        public override RecyclerView.ViewHolder OnCreateViewHolder(ViewGroup parent, int viewType)
        {
            View view = LayoutInflater.From(parent.Context).Inflate(Resource.Layout.booking_index_recycler, parent, false);
            BookingViewHolder vh = new BookingViewHolder(view, OnClick);
            return vh;
        }

        public override void OnBindViewHolder(RecyclerView.ViewHolder holder, int position)
        {
            BookingViewHolder vh = holder as BookingViewHolder;
            vh.Item = Items[position];

            vh.Restaurant.Text = vh.Item.Restaurant.Name;
            vh.Date.Text = vh.Item.BookingDate.ToShortDateString();
            vh.Time.Text = vh.Item.StartTime.ToString();
            vh.NoCustomers.Text = vh.Item.NoCustomers.ToString();
            vh.Cancelled.Text = vh.Item.Cancelled.ToString();
        }

        private void OnClick(int obj)
        {
            ItemClick?.Invoke(this, obj);
        }
    }

    public class BookingViewHolder : RecyclerView.ViewHolder
    {
        public Booking Item { get; set; }
        public View View { get; set; }
        public TextView Restaurant { get; set; }
        public TextView Date { get; set; }
        public TextView Time { get; set; }
        public TextView NoCustomers { get; set; }
        public TextView Cancelled { get; set; }

        public BookingViewHolder(View view, Action<int> listener) : base(view)
        {
            View = view;
            Restaurant = view.FindViewById<TextView>(Resource.Id.booking_index_recycler_restaurant);
            Date = view.FindViewById<TextView>(Resource.Id.booking_index_recycler_date);
            Time = view.FindViewById<TextView>(Resource.Id.booking_index_recycler_time);
            NoCustomers = view.FindViewById<TextView>(Resource.Id.booking_index_recycler_num_customers);
            Cancelled = view.FindViewById<TextView>(Resource.Id.booking_index_recycler_cancelled);

            view.Click += (sender, e) => listener(base.Position);
        }
    }
}