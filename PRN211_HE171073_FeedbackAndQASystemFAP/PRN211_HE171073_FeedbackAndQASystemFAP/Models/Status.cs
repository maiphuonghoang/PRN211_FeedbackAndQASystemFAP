using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Status
    {
        public Status()
        {
            Questions = new HashSet<Question>();
        }

        public int StatusId { get; set; }
        public string? StatusName { get; set; }

        public virtual ICollection<Question> Questions { get; set; }
    }
}
