using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Profile;

public partial class Sistema_Utilizadores_Criar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    public void Criar(object sender, EventArgs e)
    {
        TextBox userNameTextBox = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("UserName");
        MembershipUser utilizador = Membership.GetUser(userNameTextBox.Text);
        string user = Convert.ToString(utilizador);

        RadioButtonList tipoEscolhido = (RadioButtonList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Tipo_Funcionario");

        if (tipoEscolhido.SelectedValue == "0")
        {
            Roles.AddUserToRole(user, "Empregado");
            Saida.Text += "<br/>Foi criada uma conta de <b>Empregado!</b><br/> ";
        }

        if (tipoEscolhido.SelectedValue == "1")
        {
            Roles.AddUserToRole(user, "Gerente");
            Saida.Text += "<br/>Foi criada uma conta de <b>Gerente</b>!<br/> ";
        }

        TextBox Morada = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("Morada");
        TextBox Nome =   (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("Nome");
        TextBox Idade = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("Idade");
        TextBox Telefone = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("Telefone");


        dynamic profile = ProfileBase.Create(user);

         
        profile.Morada = Morada.Text;
        profile.Nome = Nome.Text;
        profile.Idade = Convert.ToString(Idade.Text);
        profile.Telefone = Convert.ToDouble(Telefone.Text);

        profile.Save();

        Saida.Text += "<br/>Dados:<br/>" + user + "<br/>" + Morada.Text + "<br/>" + Nome.Text + "<br/>" + Idade.Text + "<br/>" + Telefone.Text; 
    }

}