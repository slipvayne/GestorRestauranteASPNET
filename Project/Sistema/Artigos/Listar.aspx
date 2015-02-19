<%@ Page Title="Artigos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Sistema_Artigos_Listar"%>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

    <title>Sistema - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h3><font color="gray">Sistema » Artigos » Lista:</font></h3>

<div align="center">

<br />

  <asp:Label ID="Artigos" runat="server" />

 <asp:SqlDataSource ID="DataSource" runat="server" 
   ConnectionString="<%$ ConnectionStrings:BaseDados %>" 
   ProviderName="System.Data.SqlClient" 
   SelectCommand="SELECT * FROM Artigos"
   DeleteCommand="Delete From Artigos Where Id_artigo=@Id_artigo"> 
</asp:SqlDataSource>


 <asp:GridView ID="MyGridView" DataSourceID="DataSource" Runat="Server" 
        DataKeyNames="Id_artigo" AutoGenerateColumns="False" AllowPaging="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="6">
     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
     <Columns>
         <asp:CommandField DeleteText="Eliminar" ShowDeleteButton="True" 
             ControlStyle-CssClass="botaoN" >
<ControlStyle CssClass="botaoN"></ControlStyle>
         </asp:CommandField>
        <asp:BoundField HeaderText="Nº Artigo" DataField="Id_artigo" />
        <asp:BoundField HeaderText="Nome" DataField="Nome" />
        <asp:BoundField HeaderText="Preço" DataField="Preco" DataFormatString="{0}€" />
        <asp:BoundField HeaderText="Tipo" DataField="Tipo" />       
        <asp:ImageField HeaderText="Imagem" DataImageUrlField="Imagem" 
             DataImageUrlFormatString="{0}" ControlStyle-CssClass="imagensArtPequeno" ControlStyle-Height="60" ControlStyle-Width="60">
<ControlStyle CssClass="imagensArtPequeno"></ControlStyle>
         </asp:ImageField>
         <asp:HyperLinkField DataNavigateUrlFields="Id_artigo" 
             DataNavigateUrlFormatString="Actualizar.aspx?artigo={0}" Text="Editar" ControlStyle-CssClass="botaoN"  ControlStyle-ForeColor="Black"/>
    </Columns>
     <EditRowStyle BackColor="#999999" />
     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
     <SortedAscendingCellStyle BackColor="#E9E7E2" />
     <SortedAscendingHeaderStyle BackColor="#506C8C" />
     <SortedDescendingCellStyle BackColor="#FFFDF8" />
     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>


    </div>  
 <asp:Label ID="Saida" runat="server"/>

 

 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Artigos/Artigos.aspx" CssClass="Botaovoltar"/></div>

 </asp:Content>