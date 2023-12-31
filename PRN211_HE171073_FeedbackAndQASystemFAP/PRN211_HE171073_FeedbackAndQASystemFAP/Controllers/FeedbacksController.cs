﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PRN211_HE171073_FeedbackAndQASystemFAP.Models;
using PRN211_HE171073_FeedbackAndQASystemFAP.Services;
using System.Security.Claims;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using Microsoft.AspNetCore.Authorization;
using System.Data;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Controllers
{
    public class FeedbacksController : Controller
    {
        private readonly PRN211_FeedbackAndQASystemContext _context;

        public FeedbacksController(PRN211_FeedbackAndQASystemContext context)
        {
            _context = context;
        }
        //[Authorize(Roles = "Instructor")]
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

        //[Authorize(Roles = "Instructor")]
        public IActionResult FeedbackGPA(int Id)
        {
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            Feedback f = _context.Feedbacks.FirstOrDefault(f => f.Group.InstructorId.Equals(roll) && f.FeedbackId == Id);
            List<Response> results = new List<Response>();
            if (f != null)
            {
                results = _context.Responses
                               .Include(r => r.Do)
                                   //.Where(f => f.Do.FeedbackId == Id && f.Do.DoStatus == true)
                                   .Where(f => f.Do.FeedbackId == Id && f.Do.DoStatus > 0)
                               .Include(r => r.FbQuestion)
                                   .ThenInclude(q => q.FbOptions)
                               .ToList();
                ViewBag.CurrentFeedback = _context.Feedbacks
                    .Include(f => f.Group)
                                    .FirstOrDefault(f => f.FeedbackId == Id);
                ViewBag.Does = _context.Dos
                                //.Where(d => d.FeedbackId == Id && d.DoStatus == true)
                                .Where(d => d.FeedbackId == Id && d.DoStatus > 0)
                                .ToList();
            }
            return View(results);
        }
        //[Authorize(Roles = "Student")]
        public IActionResult StudentFeedback()
        {
            DateTime today = DateTime.Now;
            //today = new DateTime(2023, 07, 07, 15, 30, 45);
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            var feedbackIds = _context.Dos
            .Where(d => d.StudentId.Equals(roll))
            .Select(d => d.FeedbackId);
            List<Feedback> feedbacks = _context.Feedbacks
            .Where(f => feedbackIds.Contains(f.FeedbackId) && f.FeedbackOpenDay <= today && today <= f.FeedbackCloseDay)
            .Include(f => f.Group)
            .ToList();

            ViewBag.doStatus = _context.Dos
            .Where(d => feedbackIds.Contains(d.Feedback.FeedbackId) && d.StudentId.Equals(roll)).ToList();

            return View(feedbacks);
        }
        //[Authorize(Roles = "Student")]
        public IActionResult DoFeedback(int Id)
        {
            if (!validFeedbackBelongStudent(Id))
            {
                return RedirectToAction("StudentFeedback");
            }
            List<FbQuestion> questions = _context.Feedbacks.Include(f => f.FbQuestions)
                .ThenInclude(q => q.FbOptions)
                .FirstOrDefault(f => f.FeedbackId == Id).FbQuestions.ToList();
                ViewBag.CurrentFeedback = _context.Feedbacks.Where(f => f.FeedbackId == Id).FirstOrDefault();
            return View(questions);
        }
        [Authorize(Roles = "Student")]
        [HttpPost]
        public IActionResult DoFeedback(int id, IFormCollection iformCollection)
        {
            if (!validFeedbackBelongStudent(id))
            {
                return RedirectToAction("StudentFeedback");
            }

            int feedbackId = id;
            string doComment = iformCollection["doComment"];

            //update Do table  
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            Do existDo = _context.Dos.FirstOrDefault(d => d.FeedbackId == feedbackId && d.StudentId.Equals(roll));
            if (existDo != null)
            {
                existDo.DoStatus = existDo.DoStatus + 1;
                //existDo.DoStatus = true;
                existDo.DoTime = DateTime.Now;
                existDo.DoComment = doComment;

                _context.SaveChanges();

                //insert into Response
                string[] fbQuestionIds = iformCollection["fbQuestionId"];
                foreach (var fbQuestionId in fbQuestionIds)
                {
                    string fbOptionId = iformCollection["fbQuestion_" + fbQuestionId];
                    Response response = new Response()
                    {
                        DoId = existDo.DoId,
                        FbQuestionId = Convert.ToInt32(fbQuestionId),
                        SelectedOptionId = Convert.ToInt32(fbOptionId),
                    };
                    _context.Add(response);
                    _context.SaveChanges();
                }
            }


            return RedirectToAction("StudentFeedback");
        }
        public bool validFeedbackBelongStudent(int feedbackId)
        {
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            var canDo = _context.Dos.Where(d => d.FeedbackId == feedbackId && d.StudentId.Equals(roll)).FirstOrDefault();
            return canDo != null;
        }
        //[Authorize(Roles = "Student")]
        public IActionResult EditFeedback(int Id)
        {
           
            if (!validFeedbackBelongStudent(Id))
            {
                return RedirectToAction("StudentFeedback"); 
            }
            List<FbQuestion> questions = _context.Feedbacks.Include(f => f.FbQuestions)
                .ThenInclude(q => q.FbOptions)
                .FirstOrDefault(f => f.FeedbackId == Id).FbQuestions.ToList();
            ViewBag.CurrentFeedback = _context.Feedbacks.Where(f => f.FeedbackId == Id).FirstOrDefault();

            // Retrieve the selected options for the current student
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            var selectedOptions = _context.Dos.Include(d=>d.Responses).Where(d=> d.FeedbackId == Id && d.StudentId.Equals(roll))
                .FirstOrDefault().Responses.Select(r=>r.SelectedOptionId).ToList();

            ViewBag.SelectedOptions = selectedOptions;
            ViewBag.oldDo = _context.Dos.FirstOrDefault(d => d.FeedbackId == Id && d.StudentId.Equals(roll));
            return View(questions);
        }

        //[Authorize(Roles = "Student")]
        [HttpPost]
        public IActionResult EditFeedback(int id, IFormCollection iformCollection)
        {
            if (!validFeedbackBelongStudent(id))
            {
                return RedirectToAction("StudentFeedback");
            }

            int feedbackId = id;
            string doComment = iformCollection["doComment"];

            //update Do table  
            string roll = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.UserData)?.Value;
            Do existDo = _context.Dos.FirstOrDefault(d => d.FeedbackId == feedbackId && d.StudentId.Equals(roll));
                       
            if (existDo != null)
            {
                existDo.DoTime = DateTime.Now;
                existDo.DoComment = doComment;
                existDo.DoStatus = existDo.DoStatus + 1;
                _context.SaveChanges();

                //delete Response cũ, insert response mới 
                var oldResponse = _context.Dos.Include(d => d.Responses).Where(d => d.FeedbackId == feedbackId && d.StudentId.Equals(roll))
                .FirstOrDefault().Responses.ToList();
                _context.Responses.RemoveRange(oldResponse);

                string[] fbQuestionIds = iformCollection["fbQuestionId"];
                foreach (var fbQuestionId in fbQuestionIds)
                {
                    string fbOptionId = iformCollection["fbQuestion_" + fbQuestionId];
                    Response response = new Response()
                    {
                        DoId = existDo.DoId,
                        FbQuestionId = Convert.ToInt32(fbQuestionId),
                        SelectedOptionId = Convert.ToInt32(fbOptionId),
                    };
                    _context.Add(response);
                    _context.SaveChanges();
                }
            }

            existDo.DoStatus = existDo.DoStatus;
            return RedirectToAction("StudentFeedback");
        }
    }
}
