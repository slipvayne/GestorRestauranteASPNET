using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Mesas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

        SqlConnection cnn = new SqlConnection(cnnString);

        ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("MainContent");
        SqlDataReader rdr = null;
      

        //criar um botao para cada mesa
            int idmesa,nummesa;
            int estado = -1;
            // string selectMesa = "SELECT * FROM Mesas WHERE Id_mesa ='" + i + "'";
            string selectMesa = "SELECT * FROM Mesas";
            SqlCommand cmd2 = new SqlCommand(selectMesa, cnn);
            cnn.Open();

            rdr = cmd2.ExecuteReader();
            while (rdr.HasRows && rdr.Read())
            {
                estado = Convert.ToInt32(rdr.GetValue(2));
                nummesa = Convert.ToInt32(rdr.GetValue(4));
                idmesa = Convert.ToInt32(rdr.GetValue(0));



                Button btn = new Button();
                if (estado == 0)
                {
                    btn.CssClass = "botaomesaLivre";
                }
                if (estado == 1)
                {
                    btn.CssClass = "botaomesaOcupada";
                }
                if (estado == 2)
                {
                    btn.CssClass = "botaomesaReservada";
                }


                // 0-> livre | 1-> ocupada | 2->reservada
                //  btn.CssClass = "botaomesaLivre"; -> VERDE
                //                  botaomesaReservada"; -> BRANCO
                //                  botaomesaOcupada"; -> AZUL

                btn.ID = "" + idmesa; //ID
                if (nummesa <= 9) //so para alinhar bem nos quadrados
                {
                    btn.Text = "Mesa   " + nummesa;  //Texto
                }
                else { btn.Text = "Mesa " + nummesa; }

                btn.PostBackUrl = "Mesas/Mesas_info.aspx?mesa=" + btn.ID;
                content.Controls.Add(btn);
            }
            rdr.Close();
            cnn.Close();

            Legenda.Text = "<b><font color=\"#5CB811\">Verde = Livre</font> <br /><font color=\"#1E62D0\">Azul = Ocupada</font> <br /><font color=\"#CCCCCC\">Branco = Reservada</font><br/></b>";

    }

    

}