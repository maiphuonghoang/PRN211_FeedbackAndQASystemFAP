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
        private readonly IWebHostEnvironment _webEnvironment;
        public QuestionsController(PRN211_FeedbackAndQASystemContext context, IWebHostEnvironment webEnvironment)
        {
            _context = context;
            _webEnvironment = webEnvironment;
        }

        //[Authorize(Roles = "Student")]
        public IActionResult ViewQAS()
        {
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            var questions = _context.Questions
                            .Include(q => q.Student)
                                .ThenInclude(s => s.Groups)
                                .ThenInclude(g => g.Course)
                            .Include(q => q.Answers)
                            .Where(q => q.Student.StudentId.Equals(roll))
                            .OrderBy(q => q.QuestionStatus)
                            .ThenByDescending(q => q.QuestionSentTime)
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
            int TotalQuestion = questionService.GetNumberOfQuestions(roll, Id);
            int TotalPage = TotalQuestion / PageSize;
            if (TotalQuestion % PageSize != 0)
            {
                TotalPage++;
            }
            ViewData["TotalPage"] = TotalPage;
            ViewData["CurrentPage"] = Page;
            ViewData["CurrentGroup"] = Id;

            return View(questions);
        }

        public IActionResult AskQA()
        {
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            ViewBag.subjects = _context.Students.Include(s => s.Groups).ThenInclude(g => g.Course)
                .Where(s => s.StudentId.Equals(roll)).FirstOrDefault().Groups.Select(g => g.Course).ToList();
            return View();
        }


        [HttpPost]
        public IActionResult AskQA(Question q, IFormCollection iform)
        {
            string courseId = iform["courseId"];
            string studentId = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            Group groupId = _context.Students.Include(s => s.Groups).Where(s => s.StudentId.Equals(studentId)).FirstOrDefault()
                .Groups.Where(g => g.CourseId.Equals(courseId)).FirstOrDefault();

            Question newq = new Question
            {
                QuestionTitle = q.QuestionTitle,
                QuestionDescription = q.QuestionDescription,
                QuestionSentTime = DateTime.Now,
                StudentId = studentId,
                GroupId = groupId.GroupId,
                QuestionStatus = 0,
            };
            _context.Add(newq);
            _context.SaveChanges();
            return RedirectToAction("ViewQAS");
        }

        public IActionResult AnswerQA(int Id)
        {
            Question stuQuestion = _context.Questions.Include(q => q.Student).FirstOrDefault(q => q.QuestionId == Id);
            ViewBag.courseId = _context.Questions.Include(q => q.Group).Where(q => q.QuestionId == Id).FirstOrDefault().Group.CourseId;
            return View(stuQuestion);
        }
        [HttpPost]
        public IActionResult AnswerQA(IFormCollection iform)
        {
            int questionId = Convert.ToInt32(iform["questionId"]);
            string answerContent = iform["answerContent"];
            bool isReject = iform.ContainsKey("isReject") && bool.Parse(iform["isReject"]);
            Question existQuestion = _context.Questions.Where(q => q.QuestionId == questionId).FirstOrDefault();
            //update Question 
            if (existQuestion != null)
            {
                existQuestion.QuestionStatus = isReject ? 2 : 1;
                _context.SaveChanges();
                //insert answer 
                if (!isReject)
                {
                    Answer a = new Answer
                    {
                        AnswerContent = answerContent,
                        AnswerTime = DateTime.Now,
                        QuestionId = questionId,
                    };
                    _context.Answers.Add(a);
                    _context.SaveChanges();
                }
            }
            return RedirectToAction("LecturerQA");

        }
    }
}
