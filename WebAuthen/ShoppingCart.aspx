<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="WebAuthen_ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <strong> Products in cart: </strong>
    <br />
    <asp:GridView runat="server" ID="ShoppingCart" PageSize="5" Width="800px" AllowPaging="True" AutoGenerateColumns="False"
        BorderWidth="1px" DataSourceID="SqlDataSource1" OnRowCommand="ShoppingCart_RowCommand">
        <Columns>
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField ="Content" HeaderText="Content" SortExpression="Content" />
        <asp:BoundField DataField ="Price" HeaderText="Price" SortExpression="Price" />
        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />        

            <asp:TemplateField ShowHeader="false">
                <ItemTemplate>
                    <div style="vertical-align:central">
                    <asp:Button ID="ViewProductDetail" CommandName="ViewDetail" style="background-color:#2dbd54; color:#fff; border:none" CommandArgument='<%# Eval("Id") %>' Text="View Details" runat="server"></asp:Button>
                    <asp:Button ID="DeleteFromCart" CommandName="DeleteItem" style="background-color:#2dbd54; margin-left:30px; color:#fff;border:none" CommandArgument='<%# Eval("Id") %>' Text="Remove Item" runat="server"></asp:Button>
                    <asp:Button ID="OwnerDetail" CommandName="OwnerDetail" style="background-color:#2dbd54; color:#fff; border:none" CommandArgument='<%# Eval("Id") %>' Text="Contact Seller" runat="server"></asp:Button>
                    </div>
                        </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    <asp:Label ID="lbl_sellerinfo" runat="server" Visible="False"></asp:Label>
    
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name], [Price], [Content], [Date] FROM [NewsItems] INNER JOIN [ShoppingCart] ON NewsItems.Id = ShoppingCart.Id WHERE ShoppingCart.Buyer='mary'">
    </asp:SqlDataSource>
    
</asp:Content>
