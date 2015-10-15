using EmpresaYetex.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmpresaYetex.WebApp.Controllers
{
    public class HomeController : Controller
    {
        private EmpresaYetexModelFactory bd = new EmpresaYetexModelFactory();
        
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.Message = TempData["showMessage"];
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection form)
        {
            string usuario = form["txtUsuario"].ToString();
            string clave = form["txtContrasena"].ToString();

            var login = bd.Usuario.ToList().Where(u => u.Login.Equals(usuario) && u.Password.Equals(clave));
            if (login.Count() > 0)
            {
                return RedirectToAction("Index", "Pedido");
            }

            TempData["showMessage"] = "Usuario o clave invalida";
            return RedirectToAction("Index");
        }
    }
}