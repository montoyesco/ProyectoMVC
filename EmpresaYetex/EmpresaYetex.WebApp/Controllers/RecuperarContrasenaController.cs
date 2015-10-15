using EmpresaYetex.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmpresaYetex.WebApp.Controllers
{
    public class RecuperarContrasenaController : Controller
    {
        private EmpresaYetexModelFactory bd = new EmpresaYetexModelFactory();
        
        // GET: RecuperarContrasena
        public ActionResult Index()
        {
            return View();
        }
    }
}