using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;



public partial class Adicionar : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {
        if (tipo_art.SelectedItem != null)
        {
            Text_Nome_Art.Text = string.Format("<strong>Nome:</strong");
            Preco_Nome_Art.Text = string.Format("<strong>Preço:</strong");
            nome_art.Visible = true;
            preco_art.Visible = true;
            enviar.Visible = true;
            FileUploadControl.Visible = true;           
            Upload_Img.Text = string.Format("<strong>Upload de Imagem:</strong");
            Euro.Text = "€";

        }



    }

    public void Processar(object sender, EventArgs args)


    {

        if (tipo_art.SelectedItem == null || nome_art.Text=="" || preco_art.Text=="") { 
            Saida.Text += string.Format("ERRO!"); 
        }
        else
        {

            /*//Saida.Text += string.Format("Tipo Artigo: {0} <br/>", tipo_art.Text);
            Saida.Text += string.Format("Tipo Artigo: {0} <br/>", tipo_art.SelectedItem.Text);
            //Saida.Text += string.Format("Tipo Artigo: {0} <br/>", tipo_art.SelectedValue);
            Saida.Text += string.Format("Nome do Artigo {0}<br/>", nome_art.Text);
            Saida.Text += string.Format("Preço: {0}<br/>", preco_art.Text);
            Saida.Text += "Nome da imagem:" + FileUploadControl.FileName;
            */
             
            

            //upload da imagem para a pasta
            if (UploadButton_Click(sender, args) == 0)
            {
                Saida.Text = "Não há imagem!";
            }
            if (UploadButton_Click(sender, args) == -1)
            {
                Saida.Text = "Erro na imagem!";
                return;
            }
            if (UploadButton_Click(sender, args) == 1)
            {
                Saida.Text = "Imagem ok!";
            }

            //inserir dados na bd

            string cnnString = ConfigurationManager.ConnectionStrings["BaseDados"].ConnectionString;
            
            SqlConnection cnn = new SqlConnection(cnnString);


            string inserir = "INSERT INTO Artigos (Nome, Preco, Tipo, Imagem)";
                   inserir +="VALUES(@Nome, @Preco, @Tipo, @Imagem);";
            //string inserir = "INSERT INTO Artigos (Nome, Preco, Tipo, Imagem) VALUES ('" + nome_art.Text + "', '" + preco_art.Text + "', '" + tipo_art.SelectedValue + "', '" + FileUploadControl.FileName + "')";
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
            cmd.Parameters.AddWithValue("@Imagem", "~/Imagens/Artigos/" + tipo_art.SelectedItem.Text + "s/" + FileUploadControl.FileName); //~Imagens/Artigos/ TIPO_DE_ARTIGO / NOME_DO_ARTIGO
           
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();



            nome_art.Text = "";
            preco_art.Text = "";     

            Saida.Text = "<br/><font color=\"green\">Artigo adicionado.</font>";

        } 

    }

  /*  void ProcessItemChanged(object sender, EventArgs args)
    {
        tipoArt.Text = " ";
        if (tipoArt.SelectedItem.Text != "Seleccione")
            tipoArt.Text += tipoArt.SelectedItem.Text;
    }*/



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
                        StatusLabel.Text = "Upload status: Imagem Enviada!";

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