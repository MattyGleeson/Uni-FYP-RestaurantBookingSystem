using AuthService.Auth;
using AuthService.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Http;

namespace AuthService.Controllers
{
    [RoutePrefix("api/Account")]
    public class AccountController : ApiController
    {
        private AuthRepository _repo = null;

        public AccountController()
        {
            _repo = new AuthRepository();
        }

        // POST api/Account/Register

        //{
        //        "userName": "user",
        //        "password": "password",
        //        "confirmPassword": "password"
        //}

        [AllowAnonymous]
        [Route("Register")]
        public async Task<IHttpActionResult> Register(UserModel userModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            IdentityResult result = await _repo.RegisterUser(userModel);

            IHttpActionResult errorResult = GetErrorResult(result);

            if (errorResult != null)
            {
                return errorResult;
            }

            return Ok();
        }

        [HttpGet]
        [Authorize]
        [Route("UserInfo")]
        public async Task<IHttpActionResult> UserInfo()
        {
            var identity = User.Identity as ClaimsIdentity;

            var id = identity.Claims.Where(c => c.Type == "UserId").Select(c => c.Value).FirstOrDefault();

            if (id != null)
            {
                return Ok(new { UserId = id });      
            }
            else
            {
                return NotFound();
            }
        }

        [Authorize]
        [Route("AddCustomerRole")]
        public async Task<IHttpActionResult> AddCustomerRole()
        {
            var identity = User.Identity as ClaimsIdentity;

            var id = identity.Claims.Where(c => c.Type == "UserId").Select(c => c.Value).FirstOrDefault();

            if (id != null)
            {
                var res = await _repo.AssignRole(id, "Customer");

                return Ok();
            }
            else
            {
                return NotFound();
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                //_repo.Dispose();
            }

            base.Dispose(disposing);
        }

        private IHttpActionResult GetErrorResult(IdentityResult result)
        {
            if (result == null)
            {
                return InternalServerError();
            }

            if (!result.Succeeded)
            {
                if (result.Errors != null)
                {
                    foreach (string error in result.Errors)
                    {
                        ModelState.AddModelError("", error);
                    }
                }

                if (ModelState.IsValid)
                {
                    // No ModelState errors are available to send, so just return an empty BadRequest.
                    return BadRequest();
                }

                return BadRequest(ModelState);
            }

            return null;
        }
    }
}
