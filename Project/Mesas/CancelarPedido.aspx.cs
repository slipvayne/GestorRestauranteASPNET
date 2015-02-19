using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Mesas_CancelarPedido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        ViewState["PreviousPage"] = Request.UrlReferrer;


        string ID = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(ID);
        string ID2 = Request.QueryString["Id_artigo"];
        int ArtigoID = Convert.ToInt32(ID2);


        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

        SqlConnection cnn = new SqlConnection(cnnString);


        string seleccao = "SELECT * FROM Pedidos WHERE Id_mesa ='" + MesaID + "' AND Id_Artigo='" + ArtigoID + "'";
        //string seleccao = "SELECT * FROM Pedidos";
        SqlCommand cmd = new SqlCommand(seleccao, cnn);

        SqlDataReader rdr = null;

        cnn.Open();
        rdr = cmd.ExecuteReader();



        if (rdr.HasRows && rdr.Read())
        {
            if ((Convert.ToInt32(rdr.GetValue(2))) == MesaID)
            {
                if ((Convert.ToInt32(rdr.GetValue(1))) == ArtigoID)
                {

                    string cancelar = "DELETE FROM Pedidos WHERE Id_Pedido='" + Convert.ToString(rdr.GetValue(0)) + "' AND Id_Mesa ='" + MesaID + "' AND Id_Artigo='" + ArtigoID + "'";
                    SqlCommand cmd2 = new SqlCommand(cancelar, cnn);

                    cmd2.CommandText = cancelar;
                    cmd2.Connection = cnn;
                    rdr.Close();
                    cmd2.ExecuteNonQuery();

                    cnn.Close();

                    if (ViewState["PreviousPage"] != null)
                    {
                        Response.Redirect(ViewState["PreviousPage"].ToString());
                    }

                    return;
                }
            }

        }
        
        cnn.Close();

    }
}