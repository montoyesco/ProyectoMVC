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
    
    public partial class Estado
    {
        public long Id_Estado { get; set; }
        public System.DateTime Fecha_Estado { get; set; }
        public long Orden_Pedido { get; set; }
        public string Descripcion_Estado { get; set; }
    
        public virtual Pedido Pedido { get; set; }
    }
}
