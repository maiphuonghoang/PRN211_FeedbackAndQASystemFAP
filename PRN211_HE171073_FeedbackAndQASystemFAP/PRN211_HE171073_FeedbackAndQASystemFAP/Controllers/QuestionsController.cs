using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PRN211_HE171073_FeedbackAndQASystemFAP.Models;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Controllers
{
    public class QuestionsController : Controller
    {
        private readonly PRN211_FeedbackAndQASystemContext _context;

        public QuestionsController(PRN211_FeedbackAndQASystemContext context)
        {
            _context = context;
        }

        //[Authorize(Roles = "Student")]
        public IActionResult ViewQAS()
        {
            var questions = _context.Questions
                            .Include(q=>q.Student)
                                .ThenInclude(s => s.Groups)
                                .ThenInclude(g=> g.Course)
                            .Include(q => q.Answers)
                            .Where(q => q.Student.StudentId == "HE171073")
                            .OrderBy(q=>q.QuestionStatus)
                            .ThenByDescending(q=>q.QuestionSentTime)
                            .ToList();
            return View(questions);
        }
    }
}
