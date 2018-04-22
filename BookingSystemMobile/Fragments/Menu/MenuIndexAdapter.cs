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
    public class MenuIndexAdapter : RecyclerView.Adapter
    {
        public event EventHandler<int> ItemClick;
        public List<MenuItemType> Items;

        public MenuIndexAdapter(List<MenuItemType> items)
        {
            Items = items;
        }

        public override int ItemCount
        {
            get { return Items.Count(); }
        }

        public override RecyclerView.ViewHolder OnCreateViewHolder(ViewGroup parent, int viewType)
        {
            View view = LayoutInflater.From(parent.Context).Inflate(Resource.Layout.menu_index_recycler, parent, false);
            MenuItemTypeViewHolder vh = new MenuItemTypeViewHolder(view, OnClick);
            return vh;
        }

        public override void OnBindViewHolder(RecyclerView.ViewHolder holder, int position)
        {
            MenuItemTypeViewHolder vh = holder as MenuItemTypeViewHolder;
            vh.Item = Items[position];
            vh.Name.Text = vh.Item.Name;
        }

        private void OnClick(int obj)
        {
            ItemClick?.Invoke(this, obj);
        }
    }

    public class MenuItemTypeViewHolder : RecyclerView.ViewHolder
    {
        public MenuItemType Item { get; set; }
        public View View { get; set; }
        public ImageView Img { get; set; }
        public TextView Name { get; set; }
        public TextView Description { get; set; }
        public TextView Price { get; set; }

        public MenuItemTypeViewHolder(View view, Action<int> listener) : base(view)
        {
            View = view;
            Img = view.FindViewById<ImageView>(Resource.Id.menu_index_recycler_img);
            Name = view.FindViewById<TextView>(Resource.Id.menu_index_recycler_name);

            view.Click += (sender, e) => listener(base.Position);
        }
    }
}