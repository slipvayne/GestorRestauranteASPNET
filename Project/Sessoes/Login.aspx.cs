using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

   /* protected void DoLogin(object sender, EventArgs e)
    {
        if (FormsAuthentication.Authenticate(login_nome.Text, login_password.Text))
            FormsAuthentication.RedirectFromLoginPage(login_nome.Text, false);

        login_label.Text = "Falha no login.";
        return;
    }
    * */

}