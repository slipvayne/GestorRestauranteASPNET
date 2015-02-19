<%@ Page Title="Caixa" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Caixa.aspx.cs" Inherits="Caixa_Caixa" %>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Pedidos - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<h3><font color="gray">Pedidos » Conta da Mesa:</font></h3>

<div align="center">

 <asp:Label ID="Pedidos" runat="server" />


 <asp:Label ID="Saida" runat="server"/>

   <asp:Label runat="server" ID="Total_conta" />
   <p></p>

   <asp:Button ID="Pagamento" Text="Efectuar Pagamento" runat="server" OnClick="Pagar" CssClass="confirmar"/>


    </div>  
 

 
 </asp:Content>

 <asp:Content ID="Artigos2" runat="server" ContentPlaceHolderID="Artigos" />


 <asp:Content ID="ArtigosContent" runat="server" ContentPlaceHolderID="Main2Content">

  <asp:Label ID="Artigos" runat="server"/>

 
 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Caixa/Caixa_mesas.aspx" CssClass="Botaovoltar" /></div>

 </asp:Content>
   
