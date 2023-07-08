using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class FbQuestion
    {
        public FbQuestion()
        {
            FbOptions = new HashSet<FbOption>();
            Responses = new HashSet<Response>();
            Feedbacks = new HashSet<Feedback>();
        }

        public int FbQuestionId { get; set; }
        public string? FbQuestionTitle { get; set; }
        public string? FbQuestionContent { get; set; }

        public virtual ICollection<FbOption> FbOptions { get; set; }
        public virtual ICollection<Response> Responses { get; set; }

        public virtual ICollection<Feedback> Feedbacks { get; set; }
    }
}
