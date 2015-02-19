using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inicial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void UpdateTimer_Tick(object sender, EventArgs e)
    {
        DateStampLabel.Text = "<br/><div class=\"pedidos\"><font size=\"4\"><font color='black'> Data:</font> " + DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year + "<br/><font color='black'>Hora:</font> " + DateTime.Now.Hour + ":" + DateTime.Now.Minute + ":" + DateTime.Now.Second + "</font></div>";
    }
}