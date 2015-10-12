using EmpresaYetex.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmpresaYetex.WebApp.Controllers
{
    public class PrendaController : Controller
    {
        // GET: Prenda
        private EmpresaYetexModelFactory bd = new EmpresaYetexModelFactory();

        public ActionResult Index()
        {
            return View();
        }
    }
}