<%@ Page Title="Artigos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Adicionar.aspx.cs" Inherits="Sistema_Mesas_Adicionar" %>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Sistema - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <h3><font color="gray">Sistema » Mesas » Adicionar Nova Mesa:</font></h3>

<div align="center">


   <br /> <br />


<b>Número da Mesa:</b> 
<asp:TextBox ID="num_mesa" runat="server" Width="30px" ValidationGroup="check"/>
<font color="red">
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="num_mesa"
ErrorMessage="Só números!</font>" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>
</font>
<p></p>

<b>Núm. de Lugares:</b>
<asp:TextBox ID="lugares" runat="server" Width="30px" ValidationGroup="check2"/>
<font color="red">
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="lugares"
ErrorMessage="Só números!</font>" ValidationExpression="^\d+$" ValidationGroup="check2"></asp:RegularExpressionValidator>
</font>
<p></p>



<asp:Button CssClass="confirmar" ID="MesaAdd" Text="Adicionar Mesa" runat="server" OnClick="AdicionarMesa"/>


<p></p><p></p>

 <asp:Label ID="Saida" runat="server" />

    </div>


<div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Mesas/Mesas.aspx"  CssClass="Botaovoltar"/></div>

 
 </asp:Content>