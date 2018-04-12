using AuthService.Auth;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace AuthService.Controllers
{
    public class AuthController : ApiController
    {
        private readonly AuthRepository _authRepo;

        public AuthController()
        {
            _authRepo = new AuthRepository();
        }

        [AllowAnonymous]
        [Route("Roles")]
        public IHttpActionResult GetRoles()
        {
            IList<string> result = _authRepo.GetRoles().Select(r => r.Name).ToList();

            return Ok(result);
        }
    }
}
