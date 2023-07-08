using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Course
    {
        public Course()
        {
            Groups = new HashSet<Group>();
        }

        public string CourseId { get; set; } = null!;
        public string? CourseName { get; set; }

        public virtual ICollection<Group> Groups { get; set; }
    }
}
