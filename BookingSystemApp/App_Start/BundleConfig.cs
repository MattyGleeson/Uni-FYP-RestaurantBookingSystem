using System.Web;
using System.Web.Optimization;

namespace BookingSystemApp
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/materialize").Include(
                        "~/Content/js/materialize.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                "~/Scripts/jquery-ui-{version}.js",
                "~/Content/js/jquery-ui-timepicker-addon.js"));

            bundles.Add(new StyleBundle("~/Content/css/jqueryui").Include(
                "~/Content/themes/base/all.css",
                "~/Content/css/jquery-ui-timepicker-addon.css"));

            bundles.Add(new StyleBundle("~/Content/css/Materialize").Include(
                      "~/Content/css/materialize.css",
                      "~/Content/css/site.css"));

            bundles.Add(new StyleBundle("~/content/toastr", "http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css").Include(
                "~/Content/toastr.css"));

            bundles.Add(new ScriptBundle("~/bundles/toastr", "http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js").Include(
                "~/Scripts/toastr.js"));
        }
    }
}
