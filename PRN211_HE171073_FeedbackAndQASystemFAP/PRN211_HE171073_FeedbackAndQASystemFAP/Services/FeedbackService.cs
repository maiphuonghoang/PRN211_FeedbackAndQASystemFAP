using PRN211_HE171073_FeedbackAndQASystemFAP.Models;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Services
{
    public class FeedbackService
    {
        private readonly PRN211_FeedbackAndQASystemContext _context;

        public FeedbackService(PRN211_FeedbackAndQASystemContext context)
        {
            _context = context;
        }
        public string GetStatusForFeedback(int feedbackId)
        {
            DateTime today = DateTime.Now;
            Feedback f = _context.Feedbacks.FirstOrDefault(f => f.FeedbackId == feedbackId);
            if (f != null && f.FeedbackOpenDay <= today && today <= f.FeedbackCloseDay)
            {
                return "Opening";
            }
            else if(f != null && today > f.FeedbackCloseDay)
            {
                return "closed"; // You might want to return some default value or handle other cases accordingly
            }
            else
            {
                return "Future";
            }
        }
    }
}
