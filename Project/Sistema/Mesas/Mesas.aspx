<%@ Page Title="Artigos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Mesas.aspx.cs" Inherits="Sistema_Mesas_Mesas"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Sistema - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<h3><font color="gray">Sistema » Mesas » Selecione uma opção:</font></h3>

<div align="center">

<br /><br />

<asp:Button CssClass="botaoN" ID="MesaAdd" Text="Adicionar Mesas" runat="server" PostBackUrl="~/Sistema/Mesas/Adicionar.aspx" Width="200px"/><br /><br />
  <asp:Button CssClass="botaoN" ID="ListarMesas" Text="Listar Mesas" runat="server" PostBackUrl="~/Sistema/Mesas/Listar.aspx" Width="200px"/><br />


    </div>  
 <asp:Label ID="Saida" runat="server"/>

 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Sistema.aspx" CssClass="Botaovoltar"/></div>

 </asp:Content>

