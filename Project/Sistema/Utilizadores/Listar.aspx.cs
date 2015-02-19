//http://www.aspdotnet-suresh.com/2012/01/editupdatedelete-user-account-details.html
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Drawing;

public partial class Sistema_Utilizadores_Listar : System.Web.UI.Page
{
    private string username;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridview();
        }
    }
    // This Method is used to bind gridview
    protected void BindGridview()
    {
        gvDetails.DataSource = Membership.GetAllUsers();
        gvDetails.DataBind();
    }
    
    // This event is used to delete our gridview records
    protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        username = gvDetails.Rows[e.RowIndex].Cells[1].Text;
        Membership.DeleteUser(username);
        lblResult.Text = string.Format("{0} Eliminado com sucesso!", username);
        lblResult.ForeColor = Color.Green;
        BindGridview();
    }
   
}