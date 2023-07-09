using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using PRN211_HE171073_FeedbackAndQASystemFAP.Models;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;

namespace PRN211_HE171073_FeedbackAndQASystemFAP.Controllers
{
    public class AccountsController : Controller
    {
        private readonly PRN211_FeedbackAndQASystemContext _context;

        public AccountsController(PRN211_FeedbackAndQASystemContext context)
        {
            _context = context;
        }
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string Username, string Password)
        {
            var user = _context.Accounts.Include("Roles").Where(u => u.Username.Equals(Username) && u.Password.Equals(Password)).FirstOrDefault();

            if (user == null)
            {
                ViewBag.Msg = "Login failed";
                return View();
            }
            var roleNames = user.Roles.Select(r => r.RoleName).ToList();
            string role = user.Roles.Any(r => r.RoleId == 2) ? "Instructor" : "Student";
            var claims = new List<Claim>
        {
            new Claim(ClaimTypes.Name, user.Username),
            new Claim(ClaimTypes.Role, role),
        };
            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            HttpContext.SignInAsync(
            CookieAuthenticationDefaults.AuthenticationScheme,
            new ClaimsPrincipal(claimsIdentity));

            return RedirectToAction("Index", "Home");
        }
        public IActionResult Logout()
        {
            HttpContext.SignOutAsync();
            return View("Login");
        }
    }
}

