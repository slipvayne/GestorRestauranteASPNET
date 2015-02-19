<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="meuPerfil.aspx.cs" Inherits="Sistema_Perfil_meuPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <h3><font color="gray">Sistema » O meu Perfil:</font></h3>

<div align="center">

<table style="background-color:#EEEEEE;">
                            <tr>
                                <td align="center" colspan="2" 
                                    style="color:White;background-color:#0066AA;font-weight:bold;">
                                    Dados do Utilizador:</td>
                            </tr>
<tr><td align='right'><b>Utilizador: </b> </td><td align="left"><asp:Label ID="Utilizador" runat="server" /></td></tr>
<tr align="right"><td><b>Nome:</b></td><td><asp:TextBox ID="Nome" runat="server" Width="300px" /></td></tr>
<tr align="right"><td><b>E-mail:</b></td><td><asp:TextBox ID="Email" runat="server" Width="300px"/></td></tr>

<tr align="right"><td><b>Morada:</b></td><td><asp:TextBox ID="Morada" runat="server" Width="300px" TextMode="MultiLine" Height="50px"/></td></tr>
<tr align="right"><td><b>Data Nascimento:</b></td><td> <asp:TextBox ID="Idade" runat="server" Width="300px" /></td></tr>
<tr align="right"><td><b>Telefone:</b></td><td><asp:TextBox ID="Telefone" runat="server" Width="300px"/></td></tr>
   
<tr align="right"><td></td><td>Criada em: <%=Membership.GetUser().CreationDate%></td></tr>
<tr align="right"><td></td><td><asp:Label ID="roleuser" runat="server"></asp:Label></td></tr>
</table>


<asp:Button ID="Submeter" runat="server" Text="Submeter Alterações" 
        onclick="Submeter_Click" /> 

         <asp:Label ID="Saida" runat="server"/> 

</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Artigos" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Main2Content" Runat="Server">
    <asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#F7F7DE" 
        BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" 
        Font-Names="Verdana" Font-Size="10pt">
        <ChangePasswordTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="center" colspan="2" 
                                    style="color:White;background-color:#0066AA;font-weight:bold;">
                                    Alterar a Password</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                        AssociatedControlID="CurrentPassword">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                        ControlToValidate="CurrentPassword" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="NewPasswordLabel" runat="server" 
                                        AssociatedControlID="NewPassword">Nova Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                        ControlToValidate="NewPassword" ErrorMessage="New Password is required." 
                                        ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                        AssociatedControlID="ConfirmNewPassword">Confirmar a Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                        ControlToValidate="ConfirmNewPassword" 
                                        ErrorMessage="Confirm New Password is required." 
                                        ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                        ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="As palavras-passe não são iguais!" 
                                        ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                            <td></td>
                                <td align="right">
                                    <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                        CommandName="ChangePassword" Text="Alterar" 
                                        ValidationGroup="ChangePassword1" />
                                </td>                              
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ChangePasswordTemplate>
        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
    </asp:ChangePassword>



<div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Sistema.aspx" CssClass="Botaovoltar"/></div>

</asp:Content>

