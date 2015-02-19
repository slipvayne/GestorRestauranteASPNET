<%@ Page Title="Artigos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Artigos.aspx.cs" Inherits="Artigos"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Sistema - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <h3><font color="gray">Sistema » Artigos » Selecione uma Opção:</font></h3>

<div align="center">
<br />
<asp:Button CssClass="botaoN" ID="ArtigosAdd" Text="Adicionar Artigos" runat="server" PostBackUrl="~/Sistema/Artigos/Adicionar.aspx" Width="200px"/><br /><br />
  <asp:Button CssClass="botaoN" ID="Button1" Text="Listar Artigos" runat="server" PostBackUrl="~/Sistema/Artigos/Listar.aspx" Width="200px"/>

  <p></p><p></p><p></p>

    </div>  
 <asp:Label ID="Saida" runat="server"/>

 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Sistema.aspx" CssClass="Botaovoltar"  /></div>

 </asp:Content>
