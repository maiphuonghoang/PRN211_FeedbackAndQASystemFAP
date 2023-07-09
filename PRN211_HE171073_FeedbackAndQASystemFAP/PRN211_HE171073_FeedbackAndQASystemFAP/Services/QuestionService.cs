using Microsoft.EntityFrameworkCore;
using PRN211_HE171073_FeedbackAndQASystemFAP.Models;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Services
{
    public class QuestionService
    {
        private readonly PRN211_FeedbackAndQASystemContext _context;

        public QuestionService(PRN211_FeedbackAndQASystemContext context)
        {
            _context = context;
        }


        public List<Question> GetQuestions(string roll, int GroupId, int Offset, int Count)
        {
            var questions = _context.Questions
                    .Include(q => q.Student)
                        .ThenInclude(s => s.Groups)
                        .ThenInclude(g => g.Course)
                    .Include(q => q.Answers)
                    .Where(q => q.Group.InstructorId.Equals(roll))
                    .OrderBy(q => q.QuestionStatus)
                    .ThenByDescending(q => q.QuestionSentTime);
            if (GroupId == 0)//get questions in all group 
            {

                return questions.Skip(Offset - 1).Take(Count).ToList();
            }
            else
            {
                return questions.Where(x => x.GroupId == GroupId)
                    .Skip(Offset - 1).Take(Count).ToList();
            }
        }
        public int GetNumberOfQuestions(string roll, int GroupId)
        {

            var questions = _context.Questions
                       .Include(q => q.Student)
                           .ThenInclude(s => s.Groups)
                           .ThenInclude(g => g.Course)
                       .Include(q => q.Answers)
                       .Where(q => q.Group.InstructorId.Equals(roll))
                       .OrderBy(q => q.QuestionStatus)
                       .ThenByDescending(q => q.QuestionSentTime);
            if (GroupId == 0)//get product in all categories 
            {
                return questions.Count();
            }
            else
            {
                return questions.Where(x => x.GroupId == GroupId).Count();

            }
        }
    }
}

