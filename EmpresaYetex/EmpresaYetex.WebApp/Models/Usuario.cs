//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EmpresaYetex.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Usuario
    {
        public long Cedula { get; set; }
        public string Nombre { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public int Id_Tipo_Usuario { get; set; }
    
        public virtual Tipo_Usuario Tipo_Usuario { get; set; }
    }
}
