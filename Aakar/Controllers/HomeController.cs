using Aakar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Aakar.Controllers
{
    public class HomeController : Controller
    {
        AakarEntities1 db = new AakarEntities1();
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }
   
        [HttpGet]
        public ActionResult logIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult logIn(user userModel,string returnUrl)
        {
            var usr = db.users.Where(x=>x.user_name==userModel.user_name && x.password==userModel.password).First();
            if (usr != null)
            {
                FormsAuthentication.SetAuthCookie(usr.user_name,false);
                if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1&&returnUrl.StartsWith("/"))
                {
                    return Redirect(returnUrl);
                }
                else
                {
                    return RedirectToAction("index");
                }
            }
            else
            {
                ModelState.AddModelError("","error ");
                return View();
            }
        }
        [Authorize]
        public ActionResult logOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("logIn");
        }
        [Authorize(Roles="admin")]
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