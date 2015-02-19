<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Sistema_Utilizadores_Listar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server" >
  
</asp:Content>
  
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<h3><font color="gray">Sistema » Utilizadores » Lista:</font></h3>
<br /><br />
<div align="center">

<div class="GridviewDiv">
<asp:GridView ID="gvDetails" runat="server" CssClass="Gridview" AutoGenerateColumns="False" 
onrowdeleting="gvDetails_RowDeleting" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Height="206px" Width="292px" Font-Size="14px">
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="UserName" HeaderText="Utilizador:" ReadOnly="true"/>
<asp:BoundField DataField="Email" HeaderText="E-mail:" />
    <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ItemStyle-ForeColor="White" >
    <ItemStyle CssClass="remover" />
    </asp:CommandField>
</Columns>
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
<asp:Label ID="lblResult" runat="server" Font-Bold="true"/>
</div>


    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Artigos" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Main2Content" Runat="Server">

<div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Utilizadores/Utilizadores.aspx" CssClass="Botaovoltar"/></div>
</asp:Content>
