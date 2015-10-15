using EmpresaYetex.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmpresaYetex.WebApp.Controllers
{
    public class GestionUsuariosController : Controller
    {
        private EmpresaYetexModelFactory bd = new EmpresaYetexModelFactory();
        
        // GET: GestionUsuarios
        public ActionResult Index()
        {
            return View();
        }
    }
}