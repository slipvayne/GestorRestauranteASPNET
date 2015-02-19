<%@ Page Title="Adicionar Artigos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Adicionar.aspx.cs" Inherits="Adicionar"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

<title>Adicionar Artigos - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <h3><font color="gray">Sistema » Artigos » Adicionar Novo:</font></h3>

 <div align="center">

 <br /> <br />


<h3>Selecionar o tipo:</h3>  

    <asp:RadioButtonList ID="tipo_art" runat="server" AutoPostBack="true" CssClass="pedidos">
    <asp:ListItem Text="Bebida" Value="3"/>
     <asp:ListItem Text="Cafetaria" Value="4"/>
      <asp:ListItem Text="Entrada" Value="1"/>
       <asp:ListItem Text="Prato" Value="2"/>
       </asp:RadioButtonList>
    <p></p> 

<table class="Legenda">
    <tr><td align="right"> <asp:Label ID="Text_Nome_Art" runat="server"/>  </td>
    <td align="left">
    <asp:TextBox runat="server" ID="nome_art" Visible="false"/> 
   </td></tr>
    <tr><td align="right">
      <asp:Label ID="Preco_Nome_Art" runat="server"/>  </td>
    <td align="left"><asp:TextBox runat="server" ID="preco_art" Visible="false" ValidationGroup="check" Width="30px"/><asp:Label ID="Euro" runat="server"/> 
    <font color="red">
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="preco_art"
ErrorMessage="Obs: Use somente números! e com vírgula, ex: 1,5 </font>" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>
</font><br />
    </td>
    </tr>
     <tr><td> <asp:Label ID="Upload_Img" runat="server"/>   </td>
 <td align="left"><asp:FileUpload id="FileUploadControl" runat="server" Visible="false"/></td>
   </tr>

    <!-- upload button-->
    <tr><td>
    <asp:Label runat="server" id="StatusLabel" text="" Visible="false"/></td></tr>
    <br /> <br />
    <tr><td></td><td align="left">
     <asp:Button ID="enviar" runat="server" Text="Adicionar Novo Artigo" OnClick = "Processar" Visible="false" CssClass="confirmar"/></td>
     </tr>

     </table>
      <asp:Label ID="Saida" runat="server"/> 

   
   </div>
 
 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Artigos/Artigos.aspx" CssClass="Botaovoltar"/></div>

 </asp:Content>