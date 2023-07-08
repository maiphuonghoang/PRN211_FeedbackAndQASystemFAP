using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Answer
    {
        public int AnswerId { get; set; }
        public int? QuestionId { get; set; }
        public DateTime? AnswerTime { get; set; }
        public string? AnswerContent { get; set; }
        public string? FileUrl { get; set; }

        public virtual Question? Question { get; set; }
    }
}
