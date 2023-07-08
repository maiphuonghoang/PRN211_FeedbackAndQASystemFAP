using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class FbOption
    {
        public FbOption()
        {
            Responses = new HashSet<Response>();
        }

        public int FbOptionId { get; set; }
        public string? FbOptionContent { get; set; }
        public int? FbOptionGpa { get; set; }
        public int? FbQuestionId { get; set; }

        public virtual FbQuestion? FbQuestion { get; set; }
        public virtual ICollection<Response> Responses { get; set; }
    }
}
