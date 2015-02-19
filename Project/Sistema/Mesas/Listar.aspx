<%@ Page Title="Artigos" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Sistema_Mesas_Listar" %>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">

    <title>Sistema - Gestor de Restaurante - PW/MD</title>
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h3><font color="gray">Sistema » Mesas » Lista:</font></h3>

<div align="center">

<br />


 <asp:SqlDataSource runat="server" ID="SqlDataSource"
        ConnectionString="<%$ ConnectionStrings:BaseDados %>" 
        SelectCommand="SELECT * FROM [Mesas]"
        UpdateCommand="Update Mesas Set Num_lugares=@Num_lugares,Num_mesa=@Num_mesa Where Id_mesa=@Id_mesa"
        DeleteCommand="Delete From Mesas Where Id_mesa=@Id_mesa"
        />


  <asp:GridView ID="MyGridView" DataSourceID="SqlDataSource" Runat="Server" 
        DataKeyNames="Id_mesa" AutoGenerateColumns="False" AllowPaging="True" 
        PageSize="25" CellPadding="4" ForeColor="#333333" GridLines="None" 
        AllowSorting="True">
      <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" 
            ShowEditButton="True" UpdateText="Actualizar" 
            ControlStyle-CssClass="botaoN"  >
<ControlStyle CssClass="botaoN"></ControlStyle>
        </asp:CommandField>
        <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" 
            ShowDeleteButton="True" ControlStyle-CssClass="botaoN"  >
<ControlStyle CssClass="botaoN"></ControlStyle>
        </asp:CommandField>
        <asp:BoundField DataField="Num_mesa" HeaderText="Nº da Mesa" />
        <asp:BoundField HeaderText="Nº de lugares" DataField="Num_lugares" />
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



    <br />
    
    
    </div>    
    
     
 <asp:Label ID="Saida" runat="server"/>


 <div align="left"><asp:Button ID="Retornar" Text="« Voltar" runat="server" PostBackUrl="~/Sistema/Mesas/Mesas.aspx"  CssClass="Botaovoltar"/></div>

 </asp:Content>

