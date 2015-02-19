using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections;

public partial class Pratos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["ExisteDados"] == "1")
        {
            ArrayList arrLstMT = (ArrayList)Session["ListBoxValue"];
            for (int z = 0; z < arrLstMT.Count; z++)
            {
                ListaArtigos.Items.Add(new ListItem(arrLstMT[z].ToString(), arrLstMT[++z].ToString()));
            }
            Session["ExisteDados"] = "0";
        }

        ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("Artigos");

        Artigos.Text = "<br/><br/><font color=\"black\">Pratos adicionados:</font><br/><br/>";

        int tipo = 2;
        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

        SqlConnection cnn = new SqlConnection(cnnString);

        string seleccao = "Select count(*) from Artigos WHERE tipo='" + tipo + "'";
        //string seleccao = "Select count(*) from Artigos";
        SqlCommand cmd = new SqlCommand(seleccao, cnn);

        cnn.Open();

        int num_artigos = Convert.ToInt32(cmd.ExecuteScalar()); //numero de artigos

        cnn.Close();

        SqlDataReader rdr = null;

        string nome_artigo = "";
        string url_imagem = "";

        int numBotoesCriados = 0;
        int i = 0;

        while (numBotoesCriados < num_artigos)
        {
            i++;

            string selectArtigoCount = "Select count(*) from Artigos WHERE Id_artigo ='" + i + "' AND Tipo='" + tipo + "'";
            //string selectArtigoCount = "Select count(*) from Artigos WHERE Id_artigo ='" + i + "'";
            SqlCommand cmd_count = new SqlCommand(selectArtigoCount, cnn);

            cnn.Open();

            int num_resultados_count = Convert.ToInt32(cmd_count.ExecuteScalar()); //numero de artigos com id=i; (1 ou 0)

            cnn.Close();

            if (num_resultados_count == 0)
            {
                continue;
            }
            else
            {
                //fazer query
                string selectArtigo = "SELECT * FROM Artigos WHERE Id_artigo ='" + i + "' AND Tipo='" + tipo + "'";
                SqlCommand cmd2 = new SqlCommand(selectArtigo, cnn);
                cnn.Open();

                rdr = cmd2.ExecuteReader();
                if (rdr.HasRows && rdr.Read())
                {
                    nome_artigo = Convert.ToString(rdr.GetValue(1));
                    url_imagem = Convert.ToString(rdr.GetValue(4));

                }


                rdr.Close();
                cnn.Close();

                //criar botao

                ImageButton btn = new ImageButton();

                btn.ID = nome_artigo + "_" + (i); //ID
                btn.AlternateText = "" + nome_artigo;  //Texto 
                //   btn.AlternateText = VerticalAlign = "middle";
                btn.ImageUrl = url_imagem;
                btn.ToolTip = nome_artigo;

                btn.CssClass = "imagensArt";
                // btn.CssClass = "botoes";
            
                content.Controls.Add(btn);
                if(IsPostBack)
      {
                btn.CommandArgument = Convert.ToString(i);
               // btn.Click += AdicionarArtigo(i);
                btn.Command += new CommandEventHandler(AdicionarArtigo);
      }

                numBotoesCriados++;

            }
        }
    }



    public void AdicionarArtigo(Object sender, CommandEventArgs e)
    {
        int id_artigo = Convert.ToInt32(e.CommandArgument.ToString());
        
        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

        SqlConnection cnn = new SqlConnection(cnnString);

        string seleccao = "Select Nome from Artigos WHERE Id_Artigo='" + id_artigo + "'";
        SqlCommand cmd = new SqlCommand(seleccao, cnn);

        cnn.Open();

        String nome_artigo = Convert.ToString(cmd.ExecuteScalar());

        ListaArtigos.Items.Add(new ListItem(nome_artigo, Convert.ToString(id_artigo)));

        cnn.Close();


      //  return null;

    }

    public void RemoverArtigo(Object sender, EventArgs e)
    {
        ListaArtigos.Items.Remove(ListaArtigos.SelectedItem);
    }

    /*public void AdicionarArtigosMesa()
    {
        //percorrer a listbox e adicionar os artigos à mesa do cliente
    }
     */

    public void AdicionarArtigosMesa(Object sender, EventArgs e)
    {
        //percorrer a listbox e adicionar os artigos à mesa do cliente
        //Saida.Text += ListaArtigos.Items.Count;

        int total_artigos = ListaArtigos.Items.Count;

        if (total_artigos <= 0)
        {
            return;
        }


        string Arg_mesa = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(Arg_mesa);


        //inserir dados na bd

        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

        SqlConnection cnn = new SqlConnection(cnnString);


        for (int i = 0; i < total_artigos; i++)
        {


            string inserir = "INSERT INTO Pedidos (Id_Artigo, Id_Mesa, Id_Empregado)";
            inserir += "VALUES(@Id_Artigo, @Id_Mesa, @Id_Empregado);";
            SqlCommand cmd = new SqlCommand(inserir, cnn);


            string item = ListaArtigos.Items[i].ToString();

            //Saida.Text += "<br/> " + item + "--" + ListaArtigos.Items[i].Value.ToString();


            cmd.Parameters.AddWithValue("@Id_Artigo", Convert.ToInt32(ListaArtigos.Items[i].Value.ToString()));
            cmd.Parameters.AddWithValue("@Id_Mesa", MesaID);
            //cmd.Parameters.AddWithValue("@Id_Mesa", 2);
            cmd.Parameters.AddWithValue("@Id_Empregado", Profile.UserName); 

            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();


        }

        ListaArtigos.Items.Clear();
        Saida.Text += "<center><br/><font color=\"green\"><b>Pedido(s) adicionados à mesa com sucesso!</b></font></center>";

    }

    public void btnClickEntradas(Object sender, EventArgs e)
    {
        ArrayList arrSecndLstValues = new ArrayList();

        foreach (ListItem li in ListaArtigos.Items)
        {
            arrSecndLstValues.Add(li.Text);
            arrSecndLstValues.Add(li.Value);
            Session["ExisteDados"] = "1";
        }
        Session["ListBoxValue"] = arrSecndLstValues;

        string Arg_mesa = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(Arg_mesa);

        Response.Redirect("~/MesasPedidos/Entradas/Entradas.aspx?mesa=" + MesaID);
    }

    public void btnClickPratos(Object sender, EventArgs e)
    {
        ArrayList arrSecndLstValues = new ArrayList();

        foreach (ListItem li in ListaArtigos.Items)
        {
            arrSecndLstValues.Add(li.Text);
            arrSecndLstValues.Add(li.Value);
            Session["ExisteDados"] = "1";
        }
        Session["ListBoxValue"] = arrSecndLstValues;

        string Arg_mesa = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(Arg_mesa);

        Response.Redirect("~/MesasPedidos/Pratos/Pratos.aspx?mesa=" + MesaID);
    }

    public void btnClickCafetaria(Object sender, EventArgs e)
    {
        ArrayList arrSecndLstValues = new ArrayList();

        foreach (ListItem li in ListaArtigos.Items)
        {
            arrSecndLstValues.Add(li.Text);
            arrSecndLstValues.Add(li.Value);
            Session["ExisteDados"] = "1";
        }
        Session["ListBoxValue"] = arrSecndLstValues;

        string Arg_mesa = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(Arg_mesa);

        Response.Redirect("~/MesasPedidos/Cafetaria/Cafetaria.aspx?mesa=" + MesaID);
    }

    public void btnClickBebidas(Object sender, EventArgs e)
    {
        ArrayList arrSecndLstValues = new ArrayList();


        foreach (ListItem li in ListaArtigos.Items)
        {
            arrSecndLstValues.Add(li.Text);
            arrSecndLstValues.Add(li.Value);
            Session["ExisteDados"] = "1";
        }
        Session["ListBoxValue"] = arrSecndLstValues;

        string Arg_mesa = Request.QueryString["mesa"];
        int MesaID = Convert.ToInt32(Arg_mesa);

        Response.Redirect("~/MesasPedidos/Bebidas/Bebidas.aspx?mesa=" + MesaID);
    }



}


  