using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Pedidos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }


    public void btnClickEntradas(Object sender, EventArgs e)
    {
        string Arg_mesa = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(Arg_mesa);

        Response.Redirect("~/MesasPedidos/Entradas/Entradas.aspx?mesa=" + MesaID);
    }

    public void btnClickPratos(Object sender, EventArgs e)
    {
        string Arg_mesa = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(Arg_mesa);

        Response.Redirect("~/MesasPedidos/Pratos/Pratos.aspx?mesa=" + MesaID);
    }

    public void btnClickCafetaria(Object sender, EventArgs e)
    {
        string Arg_mesa = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(Arg_mesa);

        Response.Redirect("~/MesasPedidos/Cafetaria/Cafetaria.aspx?mesa=" + MesaID);
    }

    public void btnClickBebidas(Object sender, EventArgs e)
    {
        string Arg_mesa = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(Arg_mesa);

        Response.Redirect("~/MesasPedidos/Bebidas/Bebidas.aspx?mesa=" + MesaID);
    }






}