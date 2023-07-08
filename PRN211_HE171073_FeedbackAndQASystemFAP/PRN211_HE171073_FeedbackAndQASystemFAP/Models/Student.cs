using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Student
    {
        public Student()
        {
            Dos = new HashSet<Do>();
            Questions = new HashSet<Question>();
            Groups = new HashSet<Group>();
        }

        public string StudentId { get; set; } = null!;
        public string? StudentName { get; set; }
        public bool? Gender { get; set; }
        public string? StudentImage { get; set; }
        public string AccountId { get; set; } = null!;

        public virtual Account Account { get; set; } = null!;
        public virtual ICollection<Do> Dos { get; set; }
        public virtual ICollection<Question> Questions { get; set; }

        public virtual ICollection<Group> Groups { get; set; }
    }
}
