using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Group
    {
        public Group()
        {
            Feedbacks = new HashSet<Feedback>();
            Questions = new HashSet<Question>();
            Students = new HashSet<Student>();
        }

        public int GroupId { get; set; }
        public string? GroupName { get; set; }
        public string? CourseId { get; set; }
        public string? InstructorId { get; set; }

        public virtual Course? Course { get; set; }
        public virtual Instructor? Instructor { get; set; }
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<Question> Questions { get; set; }

        public virtual ICollection<Student> Students { get; set; }
    }
}
