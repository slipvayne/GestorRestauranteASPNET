<%@ Page Title="Sistema" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Sistema.aspx.cs" Inherits="Sistema"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Sistema - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <h3><font color="gray">Sistema » Selecione uma opção:</font></h3>

<div align="center">

   <asp:Button CssClass="botaoN" ID="Pefil" Text="O meu Perfil" runat="server" PostBackUrl="~/Sistema/Perfil/meuPerfil.aspx" Width="225px"/><br /><br />
   <h3>Gerência de:</h3>
<asp:Button CssClass="botaoN" ID="Artigos" Text="Artigos" runat="server" PostBackUrl="~/Sistema/Artigos/Artigos.aspx" Width="225px"/><br /><br />
 <asp:Button CssClass="botaoN" ID="Mesas" Text="Mesas" runat="server" PostBackUrl="~/Sistema/Mesas/Mesas.aspx" Width="225px"/><br /><br />
  <asp:Button CssClass="botaoN" ID="Utilizadores" Text="Contas de Utilizador" runat="server" PostBackUrl="~/Sistema/Utilizadores/Utilizadores.aspx" Width="225px"/><br /><br />
  

    </div>  
 <asp:Label ID="Saida" runat="server"/>

 
 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Inicio.aspx" CssClass="Botaovoltar" /></div>

 </asp:Content>
