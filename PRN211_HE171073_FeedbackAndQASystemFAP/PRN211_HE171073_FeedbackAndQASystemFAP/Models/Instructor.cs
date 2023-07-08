using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Instructor
    {
        public Instructor()
        {
            Groups = new HashSet<Group>();
        }

        public string InstructorId { get; set; } = null!;
        public string? InstructorName { get; set; }
        public bool? Gender { get; set; }
        public string? InstructorImage { get; set; }
        public string AccountId { get; set; } = null!;

        public virtual Account Account { get; set; } = null!;
        public virtual ICollection<Group> Groups { get; set; }
    }
}
