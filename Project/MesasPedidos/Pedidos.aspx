
<%@ Page Title="Pedidos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Pedidos.aspx.cs" Inherits="Pedidos"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Pedidos - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <h3><font color="gray">Pedidos » Adicionar Pedido à Mesa:</font></h3>
 <br />

<div align="center">

   <asp:Button CssClass="Botaopedidos" ID="Entrada" Text="Entradas" runat="server" onclick="btnClickEntradas"/>
  <asp:Button CssClass="Botaopedidos" ID="Prato" Text="Pratos" runat="server" onclick="btnClickPratos"/>
   <asp:Button CssClass="Botaopedidos" ID="Bebida" Text="Bebidas" runat="server" onclick="btnClickBebidas"/>
    <asp:Button CssClass="Botaopedidos" ID="Cafetaria" Text="Cafetaria" runat="server" onclick="btnClickCafetaria"/>



    </div>  
 <asp:Label ID="Saida" runat="server"/>

 
 </asp:Content>

 <asp:Content ID="Artigos2" runat="server" ContentPlaceHolderID="Artigos" />


 <asp:Content ID="ArtigosContent" runat="server" ContentPlaceHolderID="Main2Content">

  <asp:Label ID="Artigos" runat="server"/>



 
 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/MesasPedidos/Pedidos_mesas.aspx" CssClass="Botaovoltar"/></div>

 </asp:Content>
   
