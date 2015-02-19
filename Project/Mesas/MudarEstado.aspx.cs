using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Mesas_MudarEstado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        ViewState["PreviousPage"] = Request.UrlReferrer;


        string ID = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(ID);
        string ID2 = Request.QueryString["arg"];
        int EstadoID = Convert.ToInt32(ID2);

        string Empregado = Profile.UserName;

        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;
        SqlConnection cnn = new SqlConnection(cnnString);



        string mudar_estado = "UPDATE Mesas SET Estado='"+ EstadoID +"', Id_Empregado='"+ Empregado +"' WHERE Id_mesa='"+ MesaID +"'";

        SqlCommand cmd = new SqlCommand(mudar_estado, cnn);


        cnn.Open();
        int n = cmd.ExecuteNonQuery();
        cnn.Close();

        Saida.Text += n;


        if (ViewState["PreviousPage"] != null)
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());
        }


    }
}