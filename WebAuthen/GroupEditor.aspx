<%@ Page Title="Group Creater" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GroupEditor.aspx.cs" Inherits="WebAuthen_GroupEditor" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>

    <section id="loginForm">
        <h2>Create your group here..</h2>
        <fieldset>
            <legend>Create a new group</legend>
            <ol>
                <li>
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="GroupName">Group name</asp:Label>
                    &nbsp&nbsp&nbsp<asp:TextBox runat="server" ID="GroupName" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="GroupName" CssClass="field-validation-error" ErrorMessage="The group name field is required." />
                </li>
                <li>
                    <asp:Label ID="Label2" runat="server" AssociatedControlID="GroupDescription">Describe your group...</asp:Label>
                    <asp:TextBox runat="server" ID="GroupDescription" TextMode="MultiLine" Height="150px" Width="380px" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator" ValidationExpression="^.{10,250}$" runat="server" ControlToValidate="GroupDescription" CssClass="field-validation-error" ErrorMessage="The description should be between 10 and 250 letters."></asp:RegularExpressionValidator>
                </li>
                <li>
                    <asp:Label ID="Label3" runat="server" AssociatedControlID="GroupName">Upload a logo for your group...</asp:Label>
                    &nbsp&nbsp&nbsp<asp:Image ID="img_Group" runat="server" style="margin-top:5px; width:102px; height:90px;" ImageUrl="~/Images/ImageDefault.png" />
                    <asp:FileUpload ID="FileUpload1" runat="server" style="margin:8px; float:left; width:300px" />
                     <asp:Button ID="GroupPictureUpload" runat="server" Text="Upload" style="float:left;background-color:#2dbd54; color:#fff" OnClick="GroupPictureUpload_Click" CausesValidation="false" />
                </li>
                </ol>
                <br />
        </fieldset>
        <div style="clear:both">
        
        <br />
            <asp:Button ID="Button2" style="background-color:#2dbd54; float:right; margin-right:20px; color:#fff" runat="server" Text="  Cancel  " CausesValidation ="false" OnClick="Button2_Click" />
            <asp:Button ID="Button1" style="background-color:#2dbd54; color:#fff; margin-right:10px;float:right" runat="server" Text="  Submit  " OnClick="Button1_Click" />
        </div>
            <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
        </asp:SqlDataSource>
    </section>
</asp:Content>

