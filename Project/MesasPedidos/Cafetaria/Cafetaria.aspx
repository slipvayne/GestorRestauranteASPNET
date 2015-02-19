
<%@ Page Title="Cafetaria" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cafetaria.aspx.cs" Inherits="Cafetaria"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Cafetaria - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <h3><font color="gray">Pedidos » Adicionar Pedido à Mesa:</font></h3>
 <br />

<div align="center">

   <asp:Button CssClass="Botaopedidos" ID="Entrada" Text="Entradas" runat="server" onclick="btnClickEntradas"/>
  <asp:Button CssClass="Botaopedidos" ID="Prato" Text="Pratos" runat="server" onclick="btnClickPratos"/>
   <asp:Button CssClass="Botaopedidos" ID="Bebida" Text="Bebidas" runat="server" onclick="btnClickBebidas"/>
    <asp:Button CssClass="Botaopedidos" ID="Cafetarias" Text="Cafetaria" runat="server" onclick="btnClickCafetaria"/>


    </div>  
 <asp:Label ID="Saida" runat="server"/>

 
 </asp:Content>

 <asp:Content ID="Artigos2" runat="server" ContentPlaceHolderID="Artigos" />


 <asp:Content ID="ArtigosContent" runat="server" ContentPlaceHolderID="Main2Content">

  <asp:Label ID="Artigos" runat="server"/>

   <asp:ListBox ID="ListaArtigos" runat="server" Width="220" Height="200" /><asp:Button ID="Remover_artigos" runat="server" Text="X" OnClick="RemoverArtigo" CssClass="remover"/>
 
 <p><asp:Button ID="Confirmar_artigos" runat="server" Text="Confirmar" OnClick="AdicionarArtigosMesa" CssClass="confirmar" /></p>
 


 
 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/MesasPedidos/Pedidos_mesas.aspx" CssClass="Botaovoltar"/></div>

 </asp:Content>
   