using System;
using System.Collections.Generic;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Account
    {
        public Account()
        {
            Roles = new HashSet<Role>();
        }

        public string Username { get; set; } = null!;
        public string Password { get; set; } = null!;

        public virtual Instructor? Instructor { get; set; }
        public virtual Student? Student { get; set; }

        public virtual ICollection<Role> Roles { get; set; }
    }
}
