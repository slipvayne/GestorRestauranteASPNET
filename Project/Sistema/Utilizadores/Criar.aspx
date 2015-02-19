<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Criar.aspx.cs" Inherits="Sistema_Utilizadores_Criar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<h3><font color="gray">Sistema » Utilizadores » Criar um novo Utilizador:</font></h3>
<br />
<div align="center">
 <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="Criar" 
        CreateUserButtonText="Criar Utilizador" BackColor="#F7F7DE" 
        BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" 
        Font-Names="Verdana" Font-Size="10pt">
        <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284775" />
        <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284775" />
        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
        <WizardSteps>
         <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
    <ContentTemplate>
        <table border="0" style="font-size: 100%; font-family: Verdana">
            <tr>
                <td align="center" colspan="2" style="font-weight: bold; color: white; background-color: #5d7b9d">
                    Registar um novo Utilizador</td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">
                        Nome de Utilizador:</asp:Label></td>
                <td>
                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">
                        Password:</asp:Label></td>
                <td>
                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">
                        Confirmar Password:</asp:Label></td>
                <td>
                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                        ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">
                        E-mail:</asp:Label></td>
                <td>
                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                        ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="NomeLabel" runat="server" AssociatedControlID="Nome" >
                        Nome:</asp:Label></td>                     
                <td>
                    <asp:TextBox ID="Nome" runat="server"></asp:TextBox>                   
                </td>
            </tr>

             <tr>
                <td align="right">
                    <asp:Label ID="IdadeLabel" runat="server" AssociatedControlID="Idade" >
                        Data Nascimento:</asp:Label></td>                     
                <td>
                    <asp:TextBox ID="Idade" runat="server"></asp:TextBox>                   
                </td>
            </tr>

              <tr>
                <td align="right">
                    <asp:Label ID="MoradaLabel" runat="server" AssociatedControlID="Morada">
                        Morada:</asp:Label></td>                     
                <td>
                    <asp:TextBox ID="Morada" runat="server" TextMode="MultiLine" Height="50px" Width="185px"></asp:TextBox>                   
                </td>
            </tr>

              <tr>
                <td align="right">
                    <asp:Label ID="TelefoneLabel" runat="server" AssociatedControlID="Telefone" >
                        Telefone:</asp:Label></td>                     
                <td>
                    <asp:TextBox ID="Telefone" runat="server"></asp:TextBox>                   
                </td>
            </tr>
            
                    <asp:TextBox ID="Question" runat="server" Visible="false" Text="null" />
               
                    <asp:TextBox ID="Answer" runat="server" Visible="false" Text="null" />

            <tr>
                <td align="center" colspan="2">
                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="color: red">
                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                </td>
            </tr>
        </table>
        <div align="left">
         <asp:RadioButtonList ID="Tipo_Funcionario" runat="server" AutoPostBack="false">
    <asp:ListItem Text="Empregado" Value="0"/>
     <asp:ListItem Text="Gerente" Value="1"/>
       </asp:RadioButtonList></div>
        
    </ContentTemplate>
</asp:CreateUserWizardStep>
<asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
    <ContentTemplate>
        <table border="0" style="font-size: 100%; font-family: Verdana" id="TABLE1" >
            <tr>
                <td align="center" colspan="2" style="font-weight: bold; color: white; background-color: #5d7b9d; height: 18px;">
                    Complete</td>
            </tr>
            <tr>
                <td>
                    A nova conta foi criada com sucesso!.<br />
                    <br />
                    <asp:Label ID="TipoFuncionario" runat="server"/><br />
            </tr>
            <tr>
                <td align="right" colspan="2">
                    &nbsp;<asp:Button ID="ContinueButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC"
                        BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" CommandName="Continue"
                        Font-Names="Verdana" ForeColor="#284775" Text="Continuar" ValidationGroup="CreateUserWizard1" PostBackUrl="~/Sistema/Utilizadores/Utilizadores.aspx" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:CompleteWizardStep>

        </WizardSteps>
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" 
            HorizontalAlign="Center" />
        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284775" />
        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" 
            ForeColor="#FFFFFF" />
        <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
            VerticalAlign="Top" />
        <StepStyle BorderWidth="0px" />
    </asp:CreateUserWizard>
   
    <asp:Label ID="Saida" runat="server"/>

    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Artigos" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Main2Content" Runat="Server">

<div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Perfil/meuPerfil.aspx" CssClass="Botaovoltar"/></div>
</asp:Content>

