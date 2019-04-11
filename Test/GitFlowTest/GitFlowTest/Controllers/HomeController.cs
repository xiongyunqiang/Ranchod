using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GitFlowTest.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
            //add some thing here for test
            // fin release
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}