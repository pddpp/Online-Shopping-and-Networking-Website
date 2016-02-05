<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewsDetail.aspx.cs" Inherits="WebAuthen_NewsDetail" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>News Detail</h2>
    <section id="NewsDetailSection" style="height:600px;">
        <div runat="server" id="picture" style="width: 240px; height: 300px; float: left; margin: 8px;"></div>
        <div id="Div1" runat="server" style="margin: 8px; width: 350px; height: 250px; float: right; margin-right: 80px; overflow-y: scroll"></div>
        <div style="width:350px;height:320px"></div>
        <div style="width: 250px; height: 180px;float:left">
            <label id="label2" runat="server" cssstyleclass="label">Your Comments here.</label>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Style="width: 250px; height: 150px; overflow: visible; /*position: absolute; top: 550px; left: 50px*/"></asp:TextBox>
        </div>
        <div style="width: 363px; height: 180px; padding-left: 10px; float: left;margin-left:15px">
            <label id="label1" runat="server" cssstyleclass="label" > Other&#39;s Comments<br /></label>
            <div style="width: 363px; height: 150px; overflow-y: scroll;">
                <asp:Table ID="comment_table" runat="server"></asp:Table>
            </div>
        </div><br />

        <asp:Button ID="NewsDetailComment" runat="server" OnClick="NewsDetailComment_Click" Text="Comment " Style="background-color: #2dbd54; color: #fff; float:left; margin-left:170px" />
        <asp:Button ID="btn_GoBack" runat="server" OnClick="btn_GoBack_Click" Text="Go To Group" Style="background-color: #2dbd54; color: #fff; float:left; margin-left:170px" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>"></asp:SqlDataSource>

    </section>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

