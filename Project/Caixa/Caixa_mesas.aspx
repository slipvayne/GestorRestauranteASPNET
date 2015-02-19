<%@ Page Title="Caixa" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Caixa_mesas.aspx.cs" Inherits="Caixa_Caixa_mesas"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Mesas - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


  <h3><font color="gray">Caixa » Escolher uma mesa:</font></h3>


 <asp:Label ID="Saida" runat="server"/>


 </asp:Content>


 <asp:Content ID="Body2" runat="server" ContentPlaceHolderID="Main2Content">

 <br />

 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Inicio.aspx" CssClass="Botaovoltar" /></div>

 </asp:Content>
   