<%@ Page Title="Personal Homepage" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="personal.aspx.cs" Inherits="WebAuthen_personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="personalcontent">
    <div class="cont-left" id="groups_info" runat="server">
        <h1 id="welcome" runat="server"></h1>
    </div>
    <div class="cont-right">
        <div>
            <h2>Message Box</h2>
            <asp:table id="messagebox" runat="server">
            </asp:table>
        </div>
        <div>
            <h2>Other Functions</h2>
            <table>
                <tr>
                    <td style="text-align:center; vertical-align:middle">
                        <asp:LinkButton Id="LinkButton3" runat="server" Text="My Sell List" Font-Bold="True" Font-Size="Small" Font-Underline="True" PostBackUrl="~/WebAuthen/ItemManager.aspx"></asp:LinkButton>
                    </td>
                    <td style="text-align:center; vertical-align:middle">
                        <asp:LinkButton Id="LinkButton4" runat="server" Text="Creat a Group" Font-Bold="True" Font-Size="Small" Font-Underline="True" PostBackUrl="~/WebAuthen/GroupEditor.aspx"></asp:LinkButton>
                    </td>
                     <td style="text-align:center; vertical-align:middle">
                        <asp:LinkButton Id="LinkButton5" runat="server" Text="Manage My Group(s)" Font-Bold="True" Font-Size="Small" Font-Underline="True" PostBackUrl="~/WebAuthen/GroupManager.aspx"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <h2>Account Info</h2>
            <table aria-multiline="True" aria-setsize="100px 100px">
                <tr><td rowspan="2" width="100px" ><asp:Image ID="profile_pic" runat="server" size="100px 100px" height="100px" width="100px" /></td><td><b>Name</b></td><td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="130px"></asp:TextBox></td></tr>
                <tr><td><b>Email</b></td><td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="130px">XXXXXXX@bu.edu</asp:TextBox></td></tr>
                <tr><td>
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="100px" Height="30px" /></td><td>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click1" Font-Underline="True">Upload Image</asp:LinkButton>
                        </td><td>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Font-Underline="True">Save Revised Information</asp:LinkButton>
                    </td></tr>
            </table>
        </div>
    </div>
</div>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
        </asp:SqlDataSource>
    </p>
</asp:Content>

