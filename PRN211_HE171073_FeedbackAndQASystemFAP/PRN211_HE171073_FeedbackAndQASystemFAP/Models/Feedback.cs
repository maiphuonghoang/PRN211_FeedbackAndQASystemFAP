using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Feedback
    {
        public Feedback()
        {
            Dos = new HashSet<Do>();
            FbQuestions = new HashSet<FbQuestion>();
        }

        public int FeedbackId { get; set; }
        public DateTime? FeedbackOpenDay { get; set; }
        public DateTime? FeedbackCloseDay { get; set; }
        public int? GroupId { get; set; }

        public virtual Group? Group { get; set; }
        public virtual ICollection<Do> Dos { get; set; }

        public virtual ICollection<FbQuestion> FbQuestions { get; set; }
    }
}
