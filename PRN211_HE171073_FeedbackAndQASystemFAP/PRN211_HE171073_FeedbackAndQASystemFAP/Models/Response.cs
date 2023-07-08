using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Response
    {
        public int ResponseId { get; set; }
        public int? DoId { get; set; }
        public int? FbQuestionId { get; set; }
        public int? SelectedOptionId { get; set; }

        public virtual Do? Do { get; set; }
        public virtual FbQuestion? FbQuestion { get; set; }
        public virtual FbOption? SelectedOption { get; set; }
    }
}
