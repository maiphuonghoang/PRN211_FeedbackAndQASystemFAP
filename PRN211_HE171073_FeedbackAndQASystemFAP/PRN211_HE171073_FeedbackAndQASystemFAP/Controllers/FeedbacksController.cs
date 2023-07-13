using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PRN211_HE171073_FeedbackAndQASystemFAP.Models;
using PRN211_HE171073_FeedbackAndQASystemFAP.Services;
using System.Security.Claims;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;

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
        public IActionResult FeedbackGPA(int Id)
        {
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            Feedback f = _context.Feedbacks.FirstOrDefault(f => f.Group.InstructorId.Equals(roll) && f.FeedbackId == Id);
            List<Response> results = new List<Response>();
            if (f != null)
            {

                results = _context.Responses
                               .Include(r => r.Do)
                                   .Where(f => f.Do.FeedbackId == Id && f.Do.DoStatus == true)
                               .Include(r => r.FbQuestion)
                                   .ThenInclude(q => q.FbOptions)
                               .ToList();
                ViewBag.CurrentFeedback = _context.Feedbacks
                    .Include(f => f.Group)
                                    .FirstOrDefault(f => f.FeedbackId == Id);
                ViewBag.Does = _context.Dos
                                .Where(d => d.FeedbackId == Id)
                                .ToList();
            }
            return View(results);
        }
        public IActionResult StudentFeedback()
        {
            DateTime today = DateTime.Now;
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            roll = roll;
            var feedbackIds = _context.Dos
            .Where(d => d.StudentId.Equals(roll))
            .Select(d => d.FeedbackId);
            List<Feedback> feedbacks = _context.Feedbacks
            .Where(f => feedbackIds.Contains(f.FeedbackId) && f.FeedbackOpenDay <= today && today <= f.FeedbackCloseDay)
            .Include(f => f.Group)
            .ToList();

            ViewBag.doStatus = _context.Dos
            .Where(d => feedbackIds.Contains(d.Feedback.FeedbackId)).ToList();

            return View(feedbacks);
        }
        public IActionResult DoFeedback(int Id)
        {
            int id = Id;
            List<FbQuestion> questions = _context.Feedbacks.Include(f => f.FbQuestions)
                .ThenInclude(q => q.FbOptions)
                .FirstOrDefault(f => f.FeedbackId == Id).FbQuestions.ToList();
            ViewBag.CurrentFeedback = _context.Feedbacks.Where(f => f.FeedbackId == Id).FirstOrDefault();
            return View(questions);
        }
        [HttpPost]
        public IActionResult DoFeedback(int id, IFormCollection iformCollection)
        {
            int feedbackId = id;
            string doComment = iformCollection["doComment"];

            string[] fbQuestionIds = iformCollection["fbQuestionId"];
            foreach (var fbQuestionId in fbQuestionIds)
            {
                string fbOptionId = iformCollection["fbQuestion_" + fbQuestionId];
            }
            /*
            foreach (var key in iformCollection.Keys)
            {
                if (key.StartsWith("fbQuestion_"))
                {
                    string fbQuestionId = key.Substring("fbQuestion_".Length);
                    string answer = iformCollection[key];
                    .WriteLine("Question ID: " + fbQuestionId);
                    Console.WriteLine("Answer: " + answer);
                }
            }
            */
            return View();
        }
    }
}
