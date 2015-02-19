<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Utilizadores.aspx.cs" Inherits="Sistema_Utilizadores_Utilizadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <h3><font color="gray">Sistema » Utilizadores » Selecione uma Opção:</font></h3>

<div align="center">
<br /><br />

    <asp:Button ID="Button1" runat="server" CssClass="botaoN" Text="Criar Utilizador" PostBackUrl="~/Sistema/Utilizadores/Criar.aspx" Width="200px"/><br /><br />
    <asp:Button ID="Button2" runat="server" CssClass="botaoN" Text="Lista Utilizadores" PostBackUrl="~/Sistema/Utilizadores/Listar.aspx" Width="200px"/><br />

    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Artigos" Runat="Server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Main2Content" Runat="Server">

<div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Sistema.aspx" CssClass="Botaovoltar" /></div>
</asp:Content>

