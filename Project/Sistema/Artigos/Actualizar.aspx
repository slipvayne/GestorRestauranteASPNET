<%@ Page Title="Artigos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Actualizar.aspx.cs" Inherits="Sistema_Artigos_Actualizar" %>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Sistema - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <h3><font color="gray">Sistema » Artigos » Editar:</font></h3>

<div align="center">


   <br /> <br />





<h1><b>Tipo:</b></h1>
<asp:RadioButtonList ID="tipo_art" runat="server" AutoPostBack="false" CssClass="pedidos">
    <asp:ListItem Text="Bebida" Value="3"/>
    <asp:ListItem Text="Cafetaria" Value="4"/>
    <asp:ListItem Text="Entrada" Value="1"/>
    <asp:ListItem Text="Prato" Value="2"/>
</asp:RadioButtonList>
<p></p>

<table class="Legenda">
    <tr><td align="right"> <b>Nome:</b>  </td>
    <td align="left">
    <asp:TextBox runat="server" ID="nome_art"/>
   </td></tr>
    <tr><td align="right">
      <b>Preço:</b>  </td>
    <td align="left"><asp:TextBox runat="server" ID="preco_art"  ValidationGroup="check" Width="30px"/>€
    <font color="red">
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="preco_art"
ErrorMessage="Obs: Use somente números! e com vírgula, ex: 1,5 </font>" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>
</font><br />
    </td>
    </tr>   
     <tr><td align="right"> <b>Imagem:</b>   </td>
 <td align="left"><asp:Label ID="Upload_Img" runat="server"/><asp:FileUpload id="FileUploadControl" runat="server" /></td>
   </tr>

    <!-- upload button-->
    <tr><td></td></tr>
    <br /> <br />
    <tr><td></td><td align="left">
    <asp:Button ID="MesaAdd" Text="Atualizar dados" runat="server" OnClick="Actualizar" CssClass="confirmar"/>
     </tr>

     </table>
      <asp:Label ID="Label2" runat="server"/> 

<p></p>

 <asp:Label ID="Saida" runat="server" /><br />
 <asp:Label ID="StatusLabel" runat="server" />
 
 <br />

    </div>
 <asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Artigos/Listar.aspx" CssClass="Botaovoltar"/>

 
 </asp:Content>