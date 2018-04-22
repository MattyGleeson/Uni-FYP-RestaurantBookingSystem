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

namespace BookingSystemMobile.Fragments.Restaurant
{
    public class RestaurantIndexAdapter : RecyclerView.Adapter
    {
        public event EventHandler<int> ItemClick;
        public List<LibBookingService.Dtos.Restaurant> Restaurants;

        public RestaurantIndexAdapter(List<LibBookingService.Dtos.Restaurant> restaurants)
        {
            Restaurants = restaurants;
        }

        public override int ItemCount
        {
            get { return Restaurants.Count(); }
        }

        public override RecyclerView.ViewHolder OnCreateViewHolder(ViewGroup parent, int viewType)
        {
            View view = LayoutInflater.From(parent.Context).Inflate(Resource.Layout.restaurant_index_recycler, parent, false);
            RestaurantViewHolder vh = new RestaurantViewHolder(view, OnClick);
            return vh;
        }

        public override void OnBindViewHolder(RecyclerView.ViewHolder holder, int position)
        {
            RestaurantViewHolder vh = holder as RestaurantViewHolder;
            vh.Restaurant = Restaurants[position];
            vh.Name.Text = vh.Restaurant.Name;
            vh.Address.Text = vh.Restaurant.AddressStreet + ", " + vh.Restaurant.AddressTown + ", " + vh.Restaurant.AddressCounty + ", " + vh.Restaurant.AddressPostalCode;
        }

        private void OnClick(int obj)
        {
            ItemClick?.Invoke(this, obj);
        }
    }

    public class RestaurantViewHolder : RecyclerView.ViewHolder
    {
        public LibBookingService.Dtos.Restaurant Restaurant { get; set; }
        public View View { get; set; }
        public TextView Name { get; set; }
        public TextView Address { get; set; }

        public RestaurantViewHolder(View view, Action<int> listener) : base(view)
        {
            View = view;
            Name = view.FindViewById<TextView>(Resource.Id.restaurant_index_recycler_name);
            Address = view.FindViewById<TextView>(Resource.Id.restaurant_index_recycler_address);

            view.Click += (sender, e) => listener(base.Position);
        }
    }
}