<%@ Page Title="Personal Homepage" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="group.aspx.cs" Inherits="WebAuthen_personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="sidebar">
        <asp:Image ID="Image1" runat="server" Height="90px" Width="102px" />
    <ul>
        <li>        
            <asp:LinkButton ID="LinkButton4" runat="server" Width="139px"  OnClick="gotoNews">News Feed</asp:LinkButton>
        <img src="../Images/newsfeed.PNG"  />    
        </li>
        <li>
            <asp:LinkButton ID="LinkButton3" runat="server" Width="140px" OnClick="gotoDesc" Height="28px">Group Description</asp:LinkButton>
            <img src="../Images/descr.PNG" />
        </li>
        <li>
           <asp:LinkButton ID="LinkButton1" runat="server" OnClick="gotoNewsE" Width="143px" Height="28px">New Post</asp:LinkButton>
             <img src="../Images/sell.PNG" />
        </li>
        <li>
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="gotoProductE" Width="142px" Height="25px">Sell</asp:LinkButton>
            <img src="../Images/newpost.PNG" />
         </li>
    </ul>
</div>
<div class="content">
    <asp:Panel ID="Panel1" runat="server" Visible="true">
    <div class="news-area" id="news_area" runat="server">
    </div>
    </asp:Panel>
    <asp:Panel ID="Panel_desc" runat="server" Visible="false">
        <asp:Label ID="Label_desc" runat="server" Text=""></asp:Label>
    </asp:Panel>
</div>

     <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

