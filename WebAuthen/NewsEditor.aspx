<%@ Page Title="News Editor" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewsEditor.aspx.cs" Inherits="WebAuthen_NewsEditor" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>

    <section id="NewsTextSection">
        <h2>Write everything here.</h2>
        <asp:TextBox ID="NewsText" runat="server" TextMode="MultiLine" style="width:500px; height:200px; overflow:visible;"></asp:TextBox>&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NewsText" CssClass="field-validation-error" ErrorMessage="News content can't be null." />
        <h2>Upload a cover Image.</h2>
        <div>
            <asp:Image ID="NewsEditorCoverImage" runat="server" style="height:200px;width:200px;" ImageUrl="~/Images/ImageDefault.png"/>
            &nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" style="height:40px;background-color:#d0e6b4"/>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="NewsEditorUpload" runat="server" OnClick="NewsEditorUpload_Click" Text="Upload" style="background-color:#2dbd54; color:#fff" CausesValidation="false" />
            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1"
                ErrorMessage="必须是 jpg或者gif文件" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\W+)\$?)(\\(\W[\W].*))+(.jpg|.Jpg|.gif|.Gif|.JPG)$"></asp:RegularExpressionValidator>--%>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" CssClass="field-validation-error" ErrorMessage="Please select a image." />       --%>
        </div>
        
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="NewsEditorCancel_Click" Text="  Cancel  " style="background-color:#2dbd54; color:#fff;float:right" CausesValidation="false" />
            <asp:Button ID="NewsEditorPost" runat="server" OnClick="NewsEditorPost_Click" Text="  Post  " style="background-color:#2dbd54; color:#fff;float:right" />
            
        </div>
        &nbsp;<%--<asp:Login ID="Login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset>
                    <legend>Log in Form</legend>
                    <ol>
                        <li>
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">User name</asp:Label>
                            <asp:TextBox runat="server" ID="UserName" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                        </li>
                        <li>
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="Password">Password</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                        </li>
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label ID="Label3" runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label>
                        </li>
                    </ol>
                    <asp:Button ID="Button1" style="background-color:#2dbd54; color:#fff" runat="server" CommandName="Login" Text="Log in" />
                </fieldset>
            </LayoutTemplate>
        </asp:Login>--%><br />
        <%--<p style="clear:both">
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
            if you don't have an account.
        </p>--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>">
        </asp:SqlDataSource>
    </section>

    <%--<section id="socialLoginForm">
        <h2>Use another service to log in.</h2>
        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
    </section>--%>
</asp:Content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    </asp:Content>


