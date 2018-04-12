using AuthService.Data;
using AuthService.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace AuthService.Auth
{
    public class AuthRepository : IDisposable
    {
        private AuthContext _ctx;

        private UserManager<IdentityUser> _userManager;
        private RoleManager<IdentityRole> _roleManager;

        public AuthRepository()
        {
            _ctx = new AuthContext();
            _userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>(_ctx));
            _roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(_ctx));
        }

        public async Task<IdentityResult> RegisterUser(UserModel userModel)
        {
            IdentityUser user = new IdentityUser
            {
                UserName = userModel.UserName
            };

            var result = await _userManager.CreateAsync(user, userModel.Password);

            return result;
        }

        public async Task<IdentityUser> FindUser(string userName, string password)
        {
            IdentityUser user = await _userManager.FindAsync(userName, password);

            return user;
        }

        public async Task<bool> AssignRole(string id, string role)
        {
            var res = await _userManager.AddToRoleAsync(id, role);
            return true;
        }

        public async Task<IList<string>> GetRoles(string userId)
        {
            return await _userManager.GetRolesAsync(userId);
        }

        public IList<IdentityRole> GetRoles()
        {
            return _roleManager.Roles.ToList();
        }

        public void Dispose()
        {
            _ctx.Dispose();
            _userManager.Dispose();
            _roleManager.Dispose();
        }
    }
}