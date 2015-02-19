using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class Sistema_Artigos_Actualizar : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            string ID = Request.QueryString["artigo"];
            int ArtigoID = Convert.ToInt32(ID);


            string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;

            SqlConnection cnn = new SqlConnection(cnnString);

            ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("MainContent");


            string seleccao = "SELECT * FROM Artigos WHERE Id_artigo ='" + ArtigoID + "'";
            SqlCommand cmd = new SqlCommand(seleccao, cnn);

            SqlDataReader rdr = null;

            cnn.Open();
            rdr = cmd.ExecuteReader();


            if (rdr.HasRows && rdr.Read())
            {

                if ((Convert.ToInt32(rdr.GetValue(3))) == 1)
                {
                    tipo_art.SelectedValue += 1;
                }
                if ((Convert.ToInt32(rdr.GetValue(3))) == 2)
                {
                    tipo_art.SelectedValue += 2;
                }
                if ((Convert.ToInt32(rdr.GetValue(3))) == 3)
                {
                    tipo_art.SelectedValue += 3;
                }
                if ((Convert.ToInt32(rdr.GetValue(3))) == 4)
                {
                    tipo_art.SelectedValue += 4;
                }

                nome_art.Text = Convert.ToString(rdr.GetValue(1));
                preco_art.Text = "" + Convert.ToDouble(rdr.GetValue(2));

            }
            else
                Response.Redirect("~/Sistema/Artigos/Listar.aspx", true);
                //Saida.Text = "<br/>Nao existem registos <br/>";

            rdr.Close();
            cnn.Close();
        
        }
        }



    public void Actualizar(object sender, EventArgs args)
    {

        string ID = Request.QueryString["artigo"];
        int ArtigoID = Convert.ToInt32(ID);


         if (tipo_art.SelectedItem == null || nome_art.Text=="" || preco_art.Text=="") { 
            Saida.Text += string.Format("ERRO!"); 
        }
        else
        {
                         

            //upload da imagem para a pasta
            if (UploadButton_Click(sender, args) == 0)
            {
                Saida.Text = "Nao ha imagem";
            }
            if (UploadButton_Click(sender, args) == -1)
            {
                Saida.Text = "Erro na imagem";
                return;
            }
            if (UploadButton_Click(sender, args) == 1)
            {
                Saida.Text = "Imagem ok";
            }


            Saida.Text = nome_art.Text;

            //actualizar dados na bd

            string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;
            
            SqlConnection cnn = new SqlConnection(cnnString);


            string inserir = "UPDATE Artigos SET Nome=@Nome, Preco=@Preco, Tipo=@Tipo, Imagem=@Imagem WHERE Id_artigo='"+ ArtigoID +"'";
            SqlCommand cmd = new SqlCommand(inserir, cnn);

            double preco=0;
            double.TryParse(preco_art.Text, out preco);

            if (preco == 0)
            {
                Saida.Text = "<font color=\"red\">Erro, preço mal introduzido!</font>";
                return;
            }
            
            cmd.Parameters.AddWithValue("@Nome", nome_art.Text);
            cmd.Parameters.AddWithValue("@Preco", preco);
            cmd.Parameters.AddWithValue("@Tipo", tipo_art.SelectedValue);             
  
            if (FileUploadControl.HasFile)
            {
                cmd.Parameters.AddWithValue("@Imagem", "~/Imagens/Artigos/" + tipo_art.SelectedItem.Text + "s/" + FileUploadControl.FileName); //~Imagens/Artigos/ TIPO_DE_ARTIGO / NOME_DO_ARTIGO
            }
            else
            {
                SqlConnection cnn2 = new SqlConnection(cnnString);
                string seleccao = "SELECT * FROM Artigos WHERE Id_artigo ='" + ArtigoID + "'";
                SqlCommand cmd2 = new SqlCommand(seleccao, cnn2);

                SqlDataReader rdr2 = null;

                cnn2.Open();
                rdr2 = cmd2.ExecuteReader();


                if (rdr2.HasRows && rdr2.Read())
                {                 
                    cmd.Parameters.AddWithValue("@Imagem", rdr2.GetValue(4));
                }
                cnn2.Close();
            }

            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();

            Saida.Text = "<br/><font color=\"green\">Artigo atualizado.</font>";

        } 

    }

    //protected void UploadButton_Click(object sender, EventArgs e)
    protected int UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            try
            {
                if (FileUploadControl.PostedFile.ContentType == "image/jpeg" || FileUploadControl.PostedFile.ContentType == "image/png" || FileUploadControl.PostedFile.ContentType == "image/jpg" || FileUploadControl.PostedFile.ContentType == "image/bmp")
                {
                    if (FileUploadControl.PostedFile.ContentLength < 1024000)
                    {
                      
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        //FileUploadControl.SaveAs(Server.MapPath("~/Imagens/Artigos/" + tipo_art.Text +"s/") + filename);
                        FileUploadControl.SaveAs(Server.MapPath("~/Imagens/Artigos/" + tipo_art.SelectedItem.Text + "s/") + filename);
                        StatusLabel.Text = "Upload status: Imagem alterada!";

                        return 1; //sucesso
                    }
                    else
                        StatusLabel.Text = "Upload status: <font color=\"red\">O ficheiro tem que ter menos de 1mb!</font>";
                }
                else
                    StatusLabel.Text = "Upload status: <font color=\"red\">Somente imagens JPEG/PNG/BMP são aceites!</font>";
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: <font color=\"red\">O ficheiro não foi enviado. Ocorreu o erro: </font>" + ex.Message;
            }
            return -1; //falha na imagem
        }

        return 0; //não há imagem
    }


}