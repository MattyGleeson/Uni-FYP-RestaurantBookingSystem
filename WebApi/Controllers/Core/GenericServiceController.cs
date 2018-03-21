using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApi.Controllers.Core
{
    /// <summary>
    /// Generic service controller.
    /// </summary>
    public class GenericServiceController : ApiController
    {
        /// <summary>
        /// Property of type GenericServiceFacade that the controllers will use.
        /// </summary>
        protected readonly Facades.Core.GenericServiceFacade _facade;

        /// <summary>
        /// Default constructor.
        /// </summary>
        public GenericServiceController() { }

        /// <summary>
        /// Constructor to define the facade used by the service controllers.
        /// </summary>
        /// <param name="facade"></param>
        public GenericServiceController(Facades.Core.GenericServiceFacade facade)
        {
            _facade = facade;
        }
    }
}
