using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Mesas_info : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        string ID = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(ID);

        //Saida.Text = string.Format("<h1>Número da mesa: {0}<br/><br/>", MesaID);


        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

        SqlConnection cnn = new SqlConnection(cnnString);

        ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("MainContent");


        string seleccao = "SELECT * FROM Mesas WHERE Id_mesa ='" + MesaID + "'";
        SqlCommand cmd = new SqlCommand(seleccao, cnn);

        SqlDataReader rdr = null;

        cnn.Open();
        rdr = cmd.ExecuteReader();


        //CRIAR BOTOES==
        Button btn_libertar = new Button();
        btn_libertar.ID = "Libertar_mesa";
        btn_libertar.CssClass = "botaoN";
        btn_libertar.Text = "Libertar Mesa";  //Texto
        btn_libertar.PostBackUrl = "Mesas/MudarEstado.aspx?mesa=" + MesaID + "&arg=0";

        Button btn_ocupar = new Button();
        btn_ocupar.ID = "Ocupar_mesa";
        btn_ocupar.CssClass = "botaoN";
        btn_ocupar.Text = "Ocupar Mesa";  //Texto
        btn_ocupar.PostBackUrl = "Mesas/MudarEstado.aspx?mesa=" + MesaID+ "&arg=1";

        Button btn_reservar = new Button();
        btn_reservar.ID = "Reservar_mesa";
        btn_reservar.CssClass = "botaoN";
        btn_reservar.Text = "Reservar Mesa";  //Texto
        btn_reservar.PostBackUrl = "Mesas/MudarEstado.aspx?mesa=" + MesaID + "&arg=2";
        //==============

        if (rdr.HasRows && rdr.Read())
        {
            Num_mesa.Text += string.Format("<br/><br/><table class=\"Legenda\"><tr><td align='right'><font size=3><strong>Número da mesa:</strong></td><td><font size=3>{0}</font></td></font></tr>", rdr.GetValue(4));
            Num_lugares.Text += string.Format("<tr><td align='right'><font size=3><strong>Número de lugares:</td></strong> <td><font size=3>{0}</font></td></font></tr>", rdr.GetValue(1));

            if ((Convert.ToInt32(rdr.GetValue(2))) == 0)
            {
                Estado.Text = "<tr><td align='right'><font size=3><strong>Estado da Mesa:</strong></td><td><font color=\"#5CB811\" size='3'>Livre</td></font></font></tr>";

                //adicionar botoes
                content.Controls.Add(btn_ocupar);
                content.Controls.Add(btn_reservar);
            }
            if ((Convert.ToInt32(rdr.GetValue(2))) == 1)
            {
                Estado.Text = "<tr><td align='right'><font size=3><strong>Estado da Mesa:</strong></td><td><font color=\"#1E62D0\" size='3'>Ocupada</td></font></font></tr>";

                content.Controls.Add(btn_libertar);
            }
            if ((Convert.ToInt32(rdr.GetValue(2))) == 2)
            {
                Estado.Text = "<tr><td align='right'><font size=3><strong>Estado da Mesa:</strong></td><td><font color=\"#ffffff\" size='3'>Reservada</td></font></font></tr>";
                content.Controls.Add(btn_ocupar);
                content.Controls.Add(btn_libertar);
            }

            Empregado.Text += string.Format("<tr><td align='right'><font size='3'><strong>Empregado:</strong></td><td><font size=3>{0}</font></td></font></tr></table><br/><br/>", rdr.GetValue(3));

            //Saida.Text += string.Format(" Id_Mesa: {0} <br/> Numero Lugares {1} <br/> Estado {2} <br/> Id_Empregado {3} <br/> <br/>", rdr.GetValue(0), rdr.GetValue(1), rdr.GetValue(2), rdr.GetValue(3));
            
            if ( ((Convert.ToInt32(rdr.GetValue(2))) == 1) || ((Convert.ToInt32(rdr.GetValue(2))) == 2) ) 
            {
                             
                SqlConnection cnn2 = new SqlConnection(cnnString);
                string artigosTodos = "SELECT * FROM Pedidos WHERE Id_Mesa ='" + MesaID + "'";

                SqlCommand arts = new SqlCommand(artigosTodos, cnn2);    
                SqlDataReader rdr2 = null;
                cnn2.Open();
                rdr2 = arts.ExecuteReader();


                SqlConnection cnn3 = new SqlConnection(cnnString);

                if (rdr2.HasRows)
                {
                    Pedidos.Text = string.Format("<table class='pedidos'><tr><td><font color='black'>Pedido:</font></td><td><font color='black'>Preço:</font></td><td></td><td><font color='black'>Empregado:</font></td></tr>");
                }
               
                while (rdr2.HasRows && rdr2.Read())
                {                   

                    string nomeArtigo = "SELECT * FROM Artigos WHERE Id_Artigo ='" + rdr2.GetValue(1) + "'";
                    SqlCommand nomearts = new SqlCommand(nomeArtigo, cnn3);
                    SqlDataReader rdr3 = null;
                    cnn3.Open();
                    rdr3 = nomearts.ExecuteReader();

                    
                    if (rdr3.HasRows && rdr3.Read())
                    {
                        Pedidos.Text += string.Format("<tr><td>{0}</td>", rdr3.GetValue(1));                       
                        Pedidos.Text += string.Format("<td>{0}€</td>", rdr3.GetValue(2));
                       
                        Pedidos.Text += string.Format("<td><a href=\"CancelarPedido.aspx?mesa=" + MesaID + "&Id_artigo="+ rdr3.GetValue(0) +"\"><div class=\"botaoN\">Cancelar</div></a><br/></td>");
                    }

                   cnn3.Close();
                   rdr3.Close();
                   Pedidos.Text += string.Format("<td align='right'>{0}</td>", rdr2.GetValue(3));

                }
                Pedidos.Text += "</tr></table></br>";
                rdr2.Close();
                cnn2.Close();
            }
           
        }
        else
            Saida.Text += "<br/>Nao existem registos <br/>";
             
            rdr.Close();
            cnn.Close();


        }


    
}