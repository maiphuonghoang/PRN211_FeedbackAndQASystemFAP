using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PRN211_HE171073_FeedbackAndQASystemFAP.Models;
using PRN211_HE171073_FeedbackAndQASystemFAP.Services;
using System.Security.Claims;
using System.Collections.Generic;
using System.Linq;
namespace PRN211_HE171073_FeedbackAndQASystemFAP.Controllers
{
    public class FeedbacksController : Controller
    {
        private readonly PRN211_FeedbackAndQASystemContext _context;

        public FeedbacksController(PRN211_FeedbackAndQASystemContext context)
        {
            _context = context;
        }
        public IActionResult LecturerFeedback()
        {
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            var feedbacks = _context.Feedbacks
                            .Include(f => f.Group)
                                .ThenInclude(g => g.Course)
                            .Where(f => f.Group.InstructorId.Equals(roll))
                            .OrderByDescending(f => f.FeedbackCloseDay)
                            .ToList();

            return View(feedbacks);
        }
        public IActionResult FeedbackGPA()
        {
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            var feedbacks = _context.Feedbacks
                            .Include(f => f.Group)
                                .ThenInclude(g => g.Course)
                            .Where(f => f.Group.InstructorId.Equals(roll))
                            .OrderByDescending(f => f.FeedbackCloseDay)
                            .ToList();

            return View(feedbacks);
        }
    }
}
