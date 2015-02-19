using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Sistema : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(Roles.IsUserInRole("Empregado"))
        {
            Artigos.Enabled = false;
            Artigos.CssClass = "botaoDisabled"; //podia-se meter também .Visible = false;

            Utilizadores.Enabled = false;
            Utilizadores.CssClass = "botaoDisabled";

            Mesas.Enabled = false;
            Mesas.CssClass = "botaoDisabled";

        }

    }
}