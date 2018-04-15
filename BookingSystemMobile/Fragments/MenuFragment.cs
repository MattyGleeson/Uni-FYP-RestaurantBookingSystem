using Android.OS;
using Android.Support.V4.App;
using Android.Views;
using Android.Widget;
using BookingSystemMobile.Facades;
using LibBookingService.Dtos;
using System.Collections.Generic;

namespace BookingSystemMobile.Fragments
{
    public class MenuFragment : Fragment
    {
        private readonly MenuFacade _menuFacade = new MenuFacade();
        private View view;

        public override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your fragment here
        }

        public static MenuFragment NewInstance()
        {
            var frag1 = new MenuFragment { Arguments = new Bundle() };
            return frag1;
        }


        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            var ignored = base.OnCreateView(inflater, container, savedInstanceState);
            view = inflater.Inflate(Resource.Layout.menu, null);

            Button button = view.FindViewById<Button>(Resource.Id.button1);

            button.Click += delegate
            {
                GetMenuItems();
            };

            return view;
        }

        private void GetMenuItems()
        {
            IEnumerable<MenuItem> res = _menuFacade.Get().Result;

            int four = 2 + 2;
        }
    }
}