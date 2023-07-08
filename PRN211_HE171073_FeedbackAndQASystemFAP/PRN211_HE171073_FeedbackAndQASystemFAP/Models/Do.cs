using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Do
    {
        public Do()
        {
            Responses = new HashSet<Response>();
        }

        public int DoId { get; set; }
        public bool? DoStatus { get; set; }
        public int? FeedbackId { get; set; }
        public string? StudentId { get; set; }
        public DateTime? DoTime { get; set; }
        public string? DoComment { get; set; }

        public virtual Feedback? Feedback { get; set; }
        public virtual Student? Student { get; set; }
        public virtual ICollection<Response> Responses { get; set; }
    }
}
