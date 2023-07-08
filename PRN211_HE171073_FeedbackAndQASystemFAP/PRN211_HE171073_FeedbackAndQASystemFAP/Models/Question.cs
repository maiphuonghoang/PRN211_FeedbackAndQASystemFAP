using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Question
    {
        public Question()
        {
            Answers = new HashSet<Answer>();
        }

        public int QuestionId { get; set; }
        public string? QuestionTitle { get; set; }
        public string? QuestionDescription { get; set; }
        public DateTime? QuestionSentTime { get; set; }
        public string? FileUrl { get; set; }
        public string? StudentId { get; set; }
        public int? GroupId { get; set; }
        public int? QuestionStatus { get; set; }

        public virtual Group? Group { get; set; }
        public virtual Status? QuestionStatusNavigation { get; set; }
        public virtual Student? Student { get; set; }
        public virtual ICollection<Answer> Answers { get; set; }
    }
}
