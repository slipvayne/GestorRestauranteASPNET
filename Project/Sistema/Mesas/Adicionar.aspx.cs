using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Sistema_Mesas_Adicionar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

            SqlConnection cnn2 = new SqlConnection(cnnString);

            ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("MainContent");
            SqlDataReader rdr2 = null;


            string selectMesa = "SELECT * FROM Mesas";
            SqlCommand cmd2 = new SqlCommand(selectMesa, cnn2);
            cnn2.Open();

            int nummesa = 0;
            rdr2 = cmd2.ExecuteReader();
            while (rdr2.HasRows && rdr2.Read())
            {
                nummesa = Convert.ToInt32(rdr2.GetValue(4));
            }

            rdr2.Close();
            cnn2.Close();

            num_mesa.Text = Convert.ToString(++nummesa);
        }

    }


    public void AdicionarMesa(object sender, EventArgs e)
    {
        int numesa = 0, lugares2 = 0;
        int.TryParse(num_mesa.Text, out numesa);
        int.TryParse(lugares.Text, out lugares2);

        if (lugares.Text == "" || numesa == 0)
        {
            Saida.Text = "<font color=\"red\">Erro, tem de dizer quantos lugares a mesa vai ter.</font>";
            return;
        }

        if (num_mesa.Text == "" || lugares2 == 0)
        {
            Saida.Text = "<font color=\"red\">Erro, tem que introduzir o número da mesa.</font>";
            return;
        }

        string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

            SqlConnection cnn2 = new SqlConnection(cnnString);

            ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("MainContent");
            SqlDataReader rdr2 = null;
                   


            string selectMesa = "SELECT * FROM Mesas";
            SqlCommand cmd2 = new SqlCommand(selectMesa, cnn2);
            cnn2.Open();

            rdr2 = cmd2.ExecuteReader();
            while (rdr2.HasRows && rdr2.Read())
            {
                if (Convert.ToInt32(rdr2.GetValue(4)) == Convert.ToInt32(num_mesa.Text))
                {
                    Saida.Text = "<font color=\"red\">Erro, já existe uma mesa com esse número.</font>";
                    return;
                }

            }

        //inserir dados na bd
        SqlConnection cnn = new SqlConnection(cnnString);


        string inserir = "INSERT INTO Mesas (Num_lugares, Estado, Id_empregado, Num_mesa)";
        inserir += "VALUES(@Num_lugares, @Estado, @Id_empregado, @Num_mesa);";

        SqlCommand cmd = new SqlCommand(inserir, cnn);


        cmd.Parameters.AddWithValue("@Num_lugares", lugares2);
        cmd.Parameters.AddWithValue("@Estado", 0);
        cmd.Parameters.AddWithValue("@Id_empregado", 0);
        cmd.Parameters.AddWithValue("@Num_mesa", numesa);

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();

        lugares.Text = "";
        Saida.Text = "<font color=\"green\">Mesa adicionada.</font>";



    }

}