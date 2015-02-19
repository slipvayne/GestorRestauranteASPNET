<%@ Page Title="Início" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="inicial.aspx.cs" Inherits="inicial" %>

<asp:Content ID="HeadCont" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Início - Gestor de Restaurante - PW/MD</title>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
   <div align='center'>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:BaseDados %>" 
           SelectCommand="SELECT TOP 50 [Nome], [Preco], [Imagem] FROM [Artigos] ORDER BY [Id_artigo] DESC">
       </asp:SqlDataSource>

       <table cellpadding='50'>
       <tr><td></td><td align='center' ><h1 class='Legenda'><font size='4'>Bem-vindo, <%= Profile.Nome %>!</font></h1></td></tr>

       <tr><td align='center' class='Legenda'><h1><font color="gray">Últimos Artigos:</font> </h1>

       <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" 
           DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
           AutoGenerateColumns="False" PageSize="5">
           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
           <Columns>         

               <asp:BoundField DataField="Nome" HeaderText="Nome" HeaderStyle-Font-Bold="true" >
               <HeaderStyle HorizontalAlign="Left" />
               </asp:BoundField>
               <asp:BoundField DataField="Preco" HeaderText="Preço" DataFormatString="{0}€"  HeaderStyle-Font-Bold="true" >

               <ItemStyle HorizontalAlign="Right" />
               </asp:BoundField>

           <asp:ImageField DataImageUrlField="Imagem" 
             DataImageUrlFormatString="{0}" ControlStyle-CssClass="imagensArtPequeno" 
                   ControlStyle-Height="25" ControlStyle-Width="25">
<ControlStyle CssClass="imagensArtPequeno"></ControlStyle>
               <ItemStyle HorizontalAlign="Right" />
         </asp:ImageField>
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
       </td>

       <td align="center">
       
       
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
           BorderColor="Black" Font-Names="Verdana" 
           Font-Size="9pt" ForeColor="Black" Height="250px" 
           Width="330px" BorderStyle="Solid" CellSpacing="1" NextPrevFormat="ShortMonth">
           <DayHeaderStyle ForeColor="#333333" 
               Height="8pt" Font-Bold="True" Font-Size="8pt" />
            <DayStyle BackColor="#CCCCCC" />
           <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
           <OtherMonthDayStyle ForeColor="#999999" />
           <SelectedDayStyle BackColor="#333399" ForeColor="White" />
           <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
               Font-Size="12pt" ForeColor="White" Height="12pt" />
           <TodayDayStyle BackColor="#999999" ForeColor="White" />
       </asp:Calendar><br />

       <b>Utilizadores Online:</b> <%= Membership.GetNumberOfUsersOnline()%> 
         
       
       </td>

       <td align="center" class='Legenda'><h1><font color="gray">Últimas Mesas Activas:</font></h1>
    

       <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BaseDados %>" 
        SelectCommand="SELECT TOP 50 [Id_mesa], [Num_lugares], [Estado], [Num_mesa], [Id_empregado] FROM [Mesas] WHERE ([Estado] = @Estado)">
           <SelectParameters>
               <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32"/>
           </SelectParameters>
    </asp:SqlDataSource>


       <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
        ForeColor="#333333" GridLines="None" PageSize="5">
           <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
           <Columns>
               <asp:HyperLinkField DataTextField="Num_mesa" HeaderStyle-Font-Bold="true" 
                    HeaderText="Mesa" DataNavigateUrlFormatString="~/Mesas/Mesas_info.aspx?mesa={0}" DataNavigateUrlFields="Id_mesa" >
               <ItemStyle CssClass="botaomesaOcupadaPeq" Height="30px" BorderStyle="None" 
                   HorizontalAlign="Center" VerticalAlign="Middle" />
               </asp:HyperLinkField>
               
               <asp:BoundField DataField="Num_lugares" HeaderText="Lugares" 
                   HeaderStyle-Font-Bold="true" 
                   >
<HeaderStyle Font-Bold="True"  ></HeaderStyle>
               </asp:BoundField>
               <asp:BoundField DataField="Id_empregado" HeaderText="Funcionário" 
                   HeaderStyle-Font-Bold="true">
<HeaderStyle Font-Bold="True"  ></HeaderStyle>
               </asp:BoundField>
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
       </td></tr>
       <tr align="center">
       <td align="center" class='Legenda'><h1><font color="gray">Últimos Pedidos:</font></h1>
       
           <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
               ConnectionString="<%$ ConnectionStrings:BaseDados %>" 
               SelectCommand="SELECT TOP 50 [Id_Pedido], [Id_Artigo], [Id_Mesa], [Id_Empregado] FROM [Pedidos] ORDER BY [Id_Pedido] DESC"></asp:SqlDataSource>
       
       
           <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
               CellPadding="4" DataKeyNames="Id_Pedido" DataSourceID="SqlDataSource4" 
               ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="5">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               <Columns>
                     <asp:BoundField DataField="Id_Artigo" HeaderText="Artigo" 
                       SortExpression="Id_Artigo" />
                   <asp:BoundField DataField="Id_Mesa" HeaderText="Mesa" 
                       SortExpression="Id_Mesa" />
                   <asp:BoundField DataField="Id_Empregado" HeaderText="Funcionário" 
                       SortExpression="Id_Empregado" />
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
       
       
       
       
       
       </td><td align='center'>  <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer runat="server" id="UpdateTimer" interval="500" ontick="UpdateTimer_Tick" />
        <asp:UpdatePanel runat="server" id="TimedPanel" updatemode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger controlid="UpdateTimer" eventname="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:Label runat="server" id="DateStampLabel" />
            </ContentTemplate>
        </asp:UpdatePanel></td>
        
        
        <td align="center" class='Legenda'><h1><font color="gray">Mesas Reservadas:</font></h1>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BaseDados %>" 
                SelectCommand="SELECT TOP 50 [Num_mesa], [Id_mesa], [Num_lugares], [Estado], [Id_empregado] FROM [Mesas] WHERE ([Estado] = 2)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>    
             <asp:GridView ID="GridView3" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" 
        ForeColor="#333333" GridLines="None" Width="50px">
           <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
           <Columns>
               <asp:HyperLinkField DataTextField="Num_mesa"  HeaderStyle-Font-Bold="true" 
                    HeaderText="Mesa" DataNavigateUrlFormatString="~/Mesas/Mesas_info.aspx?mesa={0}" DataNavigateUrlFields="Id_mesa" >
               <ItemStyle CssClass="botaomesaReservadaPeq" Height="30px" BorderStyle="None" 
                   HorizontalAlign="Center" VerticalAlign="Middle" />
               </asp:HyperLinkField>
               
               <asp:BoundField DataField="Num_lugares" HeaderText="Lugares" 
                    HeaderStyle-Font-Bold="true" 
                   >
<HeaderStyle Font-Bold="True"  ></HeaderStyle>
               </asp:BoundField>
               <asp:BoundField DataField="Id_empregado" HeaderText="Funcionário" 
                    HeaderStyle-Font-Bold="true" 
                    >
<HeaderStyle Font-Bold="True"  ></HeaderStyle>
               </asp:BoundField>
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
       </asp:GridView></td>
        
        </tr>
       
       </table>

   </div>
  


 
</asp:Content>
