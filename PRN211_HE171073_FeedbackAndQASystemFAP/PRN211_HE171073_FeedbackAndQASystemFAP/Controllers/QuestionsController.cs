using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using PRN211_HE171073_FeedbackAndQASystemFAP.Models;
using PRN211_HE171073_FeedbackAndQASystemFAP.Services;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
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
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            var questions = _context.Questions
                            .Include(q=>q.Student)
                                .ThenInclude(s => s.Groups)
                                .ThenInclude(g=> g.Course)
                            .Include(q => q.Answers)
                            .Where(q => q.Student.StudentId.Equals(roll))
                            .OrderBy(q=>q.QuestionStatus)
                            .ThenByDescending(q=>q.QuestionSentTime)
                            .ToList();
            return View(questions);
        }
        public IActionResult LecturerQA(int Id, int Page)
        {
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            ViewBag.Groups = _context.Groups.Where(g => g.InstructorId == roll);

            if (Page <= 0)
            {
                Page = 1;
            }
            int PageSize = 5;
            Console.Write(PageSize);
            QuestionService questionService = new QuestionService(_context);
            List<Question> questions = questionService.GetQuestions(roll, Id, (Page - 1) * PageSize + 1, PageSize);

            //lấy các dữ liệu hiển thị các thanh Pager
            int TotalProduct = questionService.GetNumberOfQuestions(roll, Id);
            int TotalPage = TotalProduct / PageSize;
            if (TotalProduct % PageSize != 0)
            {
                TotalPage++;
            }
            ViewData["TotalPage"] = TotalPage;
            ViewData["CurrentPage"] = Page;
            ViewData["CurrentGroup"] = Id;

            return View(questions);
        }
    }
}
