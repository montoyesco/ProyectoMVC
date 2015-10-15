using EmpresaYetex.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmpresaYetex.WebApp.Controllers
{
    public class GestionPedidosController : Controller
    {
        private EmpresaYetexModelFactory bd = new EmpresaYetexModelFactory();
        
        // GET: GestionPedidos
        public ActionResult Index()
        {
            return View();
        }
    }
}