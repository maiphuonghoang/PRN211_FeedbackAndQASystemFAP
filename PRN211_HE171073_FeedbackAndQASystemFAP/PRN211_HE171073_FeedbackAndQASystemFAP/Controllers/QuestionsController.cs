using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Controllers
{
    public class QuestionsController : Controller
    {
        [Authorize(Roles = "Teacher")]
        public IActionResult Show()
        {
            return View();
        }
    }
}
