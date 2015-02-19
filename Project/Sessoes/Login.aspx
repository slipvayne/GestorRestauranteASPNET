<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<style type="text/css">
    /* CSS DA PAGINA DE LOGIN */
#mydiv 
{  
	position:absolute;
	top: 5%;
	left: 40%;
}
body
{
background-color:#DDDDDD;
}
.botaoN {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9) );
	background:-moz-linear-gradient( center top, #f9f9f9 5%, #e9e9e9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9');
	background-color:#f9f9f9;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#111111;
	font-family:arial;
	font-size:14px;
	font-weight:bold;
	padding:2px 6px;
	text-decoration:none;
	text-shadow:1px 1px 0px #ffffff;
}.botaoN:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9) );
	background:-moz-linear-gradient( center top, #e9e9e9 5%, #f9f9f9 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9');
	background-color:#e9e9e9;
}.botaoN:active {
	position:relative;
	top:1px;
}
</style>


<body>
    <form id="form1" runat="server">
    <div align="center"><asp:Image ID="Image1" runat="server" ImageUrl="~/Imagens/logo.png" ImageAlign="Middle"/></div>
    <div id="mydiv">
    <br /><br />
    <asp:Image ID="Llogo" ImageUrl="~/Imagens/Login.png" runat="server"  />

    <asp:Login TitleText="Login" FailureText="Username ou Password inválido(s)" 
            RememberMeText="Lembrar-me" runat="server" BackColor="#F7F6F3" BorderColor="#777777" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            Font-Size="1.0em" BorderPadding="4" ForeColor="#333333" Height="150px" 
            Width="293px" >
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LayoutTemplate>
            <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:150px;width:293px;">
                            <tr>
                                <td align="center" colspan="2" 
                                    style="color:White;background-color:#0066AA;font-weight:bold;">
                                    Autenticação</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Utilizador:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Font-Size="1em"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="Obrigatório introduzir o utilizador." 
                                        ToolTip="Obrigatório introduzir o utilizador." ValidationGroup="ctl104">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" Font-Size="1em" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Obrigatório introduzir a password." 
                                        ToolTip="Obrigatório introduzir a password." ValidationGroup="ctl104">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CssClass="botaoN" CommandName="Login" 
                                        Text="Iniciar Sessão" ValidationGroup="ctl104"  />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" ForeColor="#284775" />
        <TextBoxStyle Font-Size="1em" />
        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
        </asp:Login>

    </div>
    </form>
</body>
</html>
