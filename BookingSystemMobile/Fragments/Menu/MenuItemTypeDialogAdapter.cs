using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.Graphics;
using Android.OS;
using Android.Runtime;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using LibBookingService.Dtos;

namespace BookingSystemMobile.Fragments.Menu
{
    public class MenuItemTypeDialogAdapter : RecyclerView.Adapter
    {
        private readonly ImageFacade _imageFacade = new ImageFacade();
        public List<MenuItem> Items;

        public MenuItemTypeDialogAdapter(List<MenuItem> items)
        {
            Items = items;
        }

        public override int ItemCount
        {
            get { return Items.Count(); }
        }

        public override RecyclerView.ViewHolder OnCreateViewHolder(ViewGroup parent, int viewType)
        {
            View view = LayoutInflater.From(parent.Context).Inflate(Resource.Layout.menu_index_view_items_recycler, parent, false);
            return new MenuItemViewHolder(view);
        }

        public override void OnBindViewHolder(RecyclerView.ViewHolder holder, int position)
        {
            MenuItemViewHolder vh = holder as MenuItemViewHolder;
            vh.Item = Items[position];

            Image img = _imageFacade.LoadImage(vh.Item.ImageId.Value).Result;
            vh.Img.SetImageBitmap(BitmapFactory.DecodeByteArray(img.FileContent, 0, img.FileContent.Length));

            vh.Name.Text = vh.Item.Name;
            vh.Description.Text = vh.Item.Description;
            vh.Price.Text = "£" + string.Format("{0:N2}", Math.Round(vh.Item.Price, 2, MidpointRounding.AwayFromZero));
        }
    }

    public class MenuItemViewHolder : RecyclerView.ViewHolder
    {
        public MenuItem Item { get; set; }
        public View View { get; set; }
        public ImageView Img { get; set; }
        public TextView Name { get; set; }
        public TextView Description { get; set; }
        public TextView Price { get; set; }

        public MenuItemViewHolder(View view) : base(view)
        {
            View = view;
            Img = view.FindViewById<ImageView>(Resource.Id.menu_index_recycler_img);
            Name = view.FindViewById<TextView>(Resource.Id.menu_index_recycler_name);
            Description = view.FindViewById<TextView>(Resource.Id.menu_index_recycler_description);
            Price = view.FindViewById<TextView>(Resource.Id.menu_index_recycler_price);
        }
    }
}