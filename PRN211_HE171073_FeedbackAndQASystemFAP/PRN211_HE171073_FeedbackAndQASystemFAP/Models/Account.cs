using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Models
{
    public partial class Account
    {
        public Account()
        {
            Roles = new HashSet<Role>();
        }

        [Required(ErrorMessage = "Username is not empty")]
        [EmailAddress]
        public string Username { get; set; } = null!;

        [Required(ErrorMessage = "Password is not empty")]
        [DataType(DataType.Password)]
        public string Password { get; set; } = null!;

        public virtual Instructor? Instructor { get; set; }
        public virtual Student? Student { get; set; }

        public virtual ICollection<Role> Roles { get; set; }
    }
}
