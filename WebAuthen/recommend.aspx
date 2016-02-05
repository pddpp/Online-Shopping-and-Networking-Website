<%@ Page Title="Personal Homepage" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="recommend.aspx.cs" Inherits="WebAuthen_personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField><ItemTemplate><asp:Button Visible='<%# RequestShow(Eval("Req")) %>' runat="server" CommandName="RequestInvite" CommandArgument='<%# string.Format("{0}", Eval("Id")) %>' Text="Request Invite" Width="128px" />
                                             <asp:Button Visible='<%# RemoveShow(Eval("Req")) %>' runat="server" CommandName="DeleteRequest" CommandArgument='<%# string.Format("{0}", Eval("Id")) %>' Text="Delete Request" Width="128px" />
                               </ItemTemplate></asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Desc" HeaderText="Description" />
            <asp:BoundField DataField="Founder" HeaderText="Founder" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    
</asp:Content>

