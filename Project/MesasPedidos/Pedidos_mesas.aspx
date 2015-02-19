<%@ Page Title="Pedidos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Pedidos_mesas.aspx.cs" Inherits="Pedidos_mesas"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Mesas - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">



 <h3><font color="gray">Pedidos » Escolher uma mesa:</font></h3>


 <asp:Label ID="Saida" runat="server"/>


 </asp:Content>


 <asp:Content ID="Body2" runat="server" ContentPlaceHolderID="Main2Content">

 <br />

 <asp:Label ID="Legenda" runat="server" CssClass="Legenda"/> 


 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Inicio.aspx" CssClass="Botaovoltar"/></div>

 </asp:Content>
   
