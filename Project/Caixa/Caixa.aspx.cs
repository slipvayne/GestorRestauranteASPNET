using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class Caixa_Caixa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ID = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(ID);
        double preco = 0;

        //Saida.Text = string.Format("<h1>Número da mesa: {0}<br/><br/>", MesaID);


        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

        SqlConnection cnn = new SqlConnection(cnnString);


        string contar_produtos = "SELECT count(*) FROM Pedidos WHERE Id_mesa ='" + MesaID + "'";
        SqlCommand cmd_contar = new SqlCommand(contar_produtos, cnn);

        cnn.Open();
        int temp = Convert.ToInt32(cmd_contar.ExecuteScalar());
        cnn.Close();

        if (temp == 0)
        {
            Saida.Text = "<i>Não existem produtos adicionados a esta mesa</i>";
            Pagamento.Visible = false;
            return;
        }


        string seleccao = "SELECT * FROM Mesas WHERE Id_mesa ='" + MesaID + "'";
        SqlCommand cmd = new SqlCommand(seleccao, cnn);

        SqlDataReader rdr = null;

        cnn.Open();
        rdr = cmd.ExecuteReader();

        if (rdr.HasRows && rdr.Read())
        {

            //Saida.Text += string.Format(" Id_Mesa: {0} <br/> Numero Lugares {1} <br/> Estado {2} <br/> Id_Empregado {3} <br/> <br/>", rdr.GetValue(0), rdr.GetValue(1), rdr.GetValue(2), rdr.GetValue(3));

            if ((Convert.ToInt32(rdr.GetValue(2))) == 1)
            {

                SqlConnection cnn2 = new SqlConnection(cnnString);
                string artigosTodos = "SELECT * FROM Pedidos WHERE Id_Mesa ='" + MesaID + "'";

                SqlCommand arts = new SqlCommand(artigosTodos, cnn2);
                SqlDataReader rdr2 = null;
                cnn2.Open();
                rdr2 = arts.ExecuteReader();


                SqlConnection cnn3 = new SqlConnection(cnnString);

                Pedidos.Text += string.Format("<table border=\"0\" class=\"pedidos\"><tr><td><strong><font color='black'>Pedidos:</font> &nbsp; </strong></td><td><strong><font color='black'>Preço:</font></strong></td>");

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
                        Pedidos.Text += string.Format("<td>{0}€<br/></td>", rdr3.GetValue(2));
                        preco += Convert.ToDouble(rdr3.GetValue(2));


                    }

                    cnn3.Close();
                    rdr3.Close();

                }
                Pedidos.Text += "</tr></table>";
                Saida.Text += string.Format("<br/><div class='preco'><b>Preço Total:</b> {0}€</div>", preco);
                rdr2.Close();
                cnn2.Close();
            }

        }
        else
            Saida.Text += "<br/>Nao existem registos <br/>";
        rdr.Close();
        cnn.Close();



    }


    public double getPrecoArtigo(int num_artigo)
    {
        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

        SqlConnection cnn = new SqlConnection(cnnString);
        SqlDataReader rdr = null;

        string seleccao = "Select * from Artigos WHERE Id_artigo='"+ num_artigo +"';";
        SqlCommand cmd = new SqlCommand(seleccao, cnn);

        cnn.Open();

        double preco_produto = 0;

        rdr = cmd.ExecuteReader();
        if (rdr.HasRows && rdr.Read())
        {
            preco_produto = Convert.ToDouble(rdr.GetValue(2));

        }

        rdr.Close();
        cnn.Close();

        return preco_produto;
    }


 

    public void Pagar(object sender, EventArgs e)
    {

        string ID = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(ID);

        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;
        SqlConnection cnn = new SqlConnection(cnnString);

        //escrever ficheiro de log
        EscreverLog();

     //APAGAR OS PEDIDOS DA MESA x
        string remover = "DELETE FROM Pedidos WHERE Id_Mesa='" + MesaID + "';";
        SqlCommand cmd = new SqlCommand(remover, cnn);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
     
   //LIMPAR MESA x
        string update = "UPDATE Mesas SET Estado='0', Id_Empregado='0' WHERE Id_Mesa='" + MesaID + "';";
        SqlCommand cmd2 = new SqlCommand(update, cnn);

        cnn.Open();
        cmd2.ExecuteNonQuery();
        cnn.Close();

        Pagamento.Visible = false;
        Pedidos.Text = " ";
        Artigos.Text = " ";
        Saida.Text = "<font color=\"green\"> Conta paga.</br> A mesa está livre.</font>";
    }


    public void EscreverLog()
    {
        string ID = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(ID);

        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;
        SqlConnection cnn = new SqlConnection(cnnString);


        //ESCREVER INFO NO FICHEIRO
        string sHour = DateTime.Now.Hour.ToString();
        string sMinute = DateTime.Now.Minute.ToString();
        string sSecond = DateTime.Now.Second.ToString();
        string sYear = DateTime.Now.Year.ToString();
        string sMonth = DateTime.Now.Month.ToString();
        string sDay = DateTime.Now.Day.ToString();
        string ficheiro_log = "" + sDay + "d" + sMonth + "m" + sYear + "a_-_" + sHour + "h" + sMinute + "m" + sSecond + "s_Mesa-" + MesaID + ".txt";
        
        using (StreamWriter sw = new StreamWriter(Server.MapPath("~/Logs/" + ficheiro_log), true)) 
        {
            sw.Write("Mesa número: " + MesaID + "\r\n\r\n");
            sw.Write("Data(dia/mês/ano): " + sDay + "/" + sMonth + "/" + sYear + "\r\n");
            sw.Write("Hora: " + sHour + ":" + sMinute + ":" + sSecond + "\r\n");



            double preco = 0;

            string seleccao = "SELECT * FROM Mesas WHERE Id_mesa ='" + MesaID + "'";
            SqlCommand cmd = new SqlCommand(seleccao, cnn);

            SqlDataReader rdr = null;

            cnn.Open();
            rdr = cmd.ExecuteReader();

            if (rdr.HasRows && rdr.Read())
            {


                if ((Convert.ToInt32(rdr.GetValue(2))) == 1)
                {

                    SqlConnection cnn2 = new SqlConnection(cnnString);
                    string artigosTodos = "SELECT * FROM Pedidos WHERE Id_Mesa ='" + MesaID + "'";

                    SqlCommand arts = new SqlCommand(artigosTodos, cnn2);
                    SqlDataReader rdr2 = null;
                    cnn2.Open();
                    rdr2 = arts.ExecuteReader();


                    SqlConnection cnn3 = new SqlConnection(cnnString);

                    sw.Write("\r\nArtigo - Preço\r\n\r\n");


                    while (rdr2.HasRows && rdr2.Read())
                    {

                        string nomeArtigo = "SELECT * FROM Artigos WHERE Id_Artigo ='" + rdr2.GetValue(1) + "'";
                        SqlCommand nomearts = new SqlCommand(nomeArtigo, cnn3);
                        SqlDataReader rdr3 = null;
                        cnn3.Open();
                        rdr3 = nomearts.ExecuteReader();

                        if (rdr3.HasRows && rdr3.Read())
                        {
                            sw.Write("{0} - {1}€\r\n", rdr3.GetValue(1), rdr3.GetValue(2));
                            preco += Convert.ToDouble(rdr3.GetValue(2));
                        }

                        cnn3.Close();
                        rdr3.Close();

                    }
                    sw.Write("\r\nPreco total: {0}€", preco);
                    rdr2.Close();
                    cnn2.Close();
                }

            }
            else
                sw.Write("\rErro na escrita de dados para o ficheiro");
            rdr.Close();
            cnn.Close();




            sw.Flush();
            sw.Close();
        }


    }


}