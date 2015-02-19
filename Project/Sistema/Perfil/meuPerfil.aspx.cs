using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Sistema_Perfil_meuPerfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Utilizador.Text = "<font size='3'>" + Membership.GetUser().UserName + "</font>";

            Nome.Text = Profile.Nome;

            Email.Text = Membership.GetUser().Email;
            Morada.Text = Profile.Morada;
            Idade.Text = Convert.ToString(Profile.Idade);
            Telefone.Text = Convert.ToString(Profile.Telefone);

            if(Roles.IsUserInRole("Gerente"))
            {
                roleuser.Text = "Role: Gerente";
            }
            else { roleuser.Text = "Role: Empregado"; }
        }

    }
    protected void Submeter_Click(object sender, EventArgs e)
    {
        MembershipUser u;
        u = Membership.GetUser(User.Identity.Name);

        Profile.Nome = Nome.Text;
        u.Email = Email.Text;
        
        Profile.Morada = Morada.Text;
        Profile.Idade = Convert.ToString(Idade.Text);
        Profile.Telefone = Convert.ToDouble(Telefone.Text);

        Membership.UpdateUser(u);


    }
}