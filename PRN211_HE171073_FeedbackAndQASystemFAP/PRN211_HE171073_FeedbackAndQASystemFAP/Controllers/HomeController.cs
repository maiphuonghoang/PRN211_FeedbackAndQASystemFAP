using Microsoft.AspNetCore.Mvc;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
