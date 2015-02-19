<%@ Page Title="Mesas Info" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Mesas_info.aspx.cs" Inherits="Mesas_info"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Mesa Info - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <h3><font color="gray">Mesas » Informação da Mesa:</font></h3>

<div align="center">
 <asp:Label ID="Num_mesa" runat="server" />
 <asp:Label ID="Num_lugares" runat="server" />
 <asp:Label ID="Estado" runat="server" />
 <asp:Label ID="Empregado" runat="server" />


 


<asp:Label ID="Pedidos" runat="server" />


 <asp:Label ID="Saida" runat="server"/>


 </asp:Content>


 <asp:Content ID="Body2" runat="server" ContentPlaceHolderID="Main2Content" BorderWidth="2px" BackColor="Gray" Font-Size="16px">

     <asp:Label ID="Legenda" runat="server" /> 
     </div>

<div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Mesas/Mesas.aspx" CssClass="Botaovoltar" /></div>

 </asp:Content>