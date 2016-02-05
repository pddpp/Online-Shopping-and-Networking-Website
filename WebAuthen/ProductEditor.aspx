<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductEditor.aspx.cs" Inherits="WebAuthen_ProductEditor" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Descript your product here.</h2>
    <fieldset>
        <legend>Descript the product here</legend>
        <ol>
            <li>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="ItemName">Item Name</asp:Label>
                <asp:TextBox runat="server" ID="ItemName" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ItemName"
                    CssClass="field-validation-error" ErrorMessage="The item name field is required." />
            </li>
            <li>
                <asp:Label ID="Label2" runat="server" AssociatedControlID="Price">Price $ </asp:Label>
                <asp:TextBox runat="server" ID="Price" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Price" CssClass="field-validation-error" ErrorMessage="The price field is required." />
                <asp:RangeValidator ID="RangeValidator" runat="server" ControlToValidate="Price" CssClass="field-validation-error" ErrorMessage="Please enter a numeric value." MinimumValue="0" MaximumValue="99999" />
            </li>
            <li>
                <asp:Label ID="Label4" runat="server" Style="display: block; font-size: 1.2em; font-weight: 600;">Description </asp:Label>
                &nbsp;<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Description" CssClass="field-validation-error" ErrorMessage="The price field is required." />
                --%></li>
            <li>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Style="width: 500px; height: 200px; overflow: visible;"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                    CssClass="field-validation-error" ErrorMessage="Description for the item is required." />

                <br />
                <asp:CheckBox runat="server" ID="SecondHand" />
                <asp:Label ID="Label3" runat="server" AssociatedControlID="SecondHand" CssClass="checkbox">Second 

hand ?</asp:Label>
            </li>
        </ol>


        
        &nbsp;
        &nbsp;
        <asp:Label ID="Label5" runat="server" Text="You may upload multiple files."></asp:Label>
            <asp:Panel ID="Panel1" runat="server">
                
        </asp:Panel>
            <asp:FileUpload ID="FileUpload1" runat="server" Style="height: 40px; background-color: #d0e6b4" />
        &nbsp;&nbsp;&nbsp;
        
        <asp:Button ID="NewsEditorUpload" runat="server" OnClick="ProductEditorUpload_Click" Text="Upload" Style="background-color: #2dbd54; color: #fff" CausesValidation="false" />
        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1"
                ErrorMessage="必须是 jpg或者gif文件" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\W+)\$?)(\\(\W[\W].*))+(.jpg|.Jpg|.gif|.Gif|.JPG)$"></asp:RegularExpressionValidator>--%>
        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" CssClass="field-validation-error" ErrorMessage="Please select a image." />       --%>
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="ProductEditorCancel_Click" Text="  Cancel  " Style="background-color: #2dbd54; color: #fff; float: right" CausesValidation="false" />
        <asp:Button ID="Button1" runat="server" OnClick="ProductEditorPost_Click" Text="  Post  " Style="background-color: #2dbd54; color: #fff; float: right" />
    </fieldset>
    &nbsp;&nbsp;<%--<asp:Login ID="Login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
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


    <%--<section id="socialLoginForm">
        <h2>Use another service to log in.</h2>
        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
    </section>--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO NewsItems(Name, Owner, Price, SecondHand, [Content], GID) VALUES (@ItemName,, @Price, @Second, @Content,)" SelectCommand="SELECT * FROM [NewsItems]">
        <InsertParameters>
            <asp:ControlParameter ControlID="ItemName" Name="ItemName" PropertyName="Text" />
            <asp:ControlParameter ControlID="Price" DbType="Decimal" Name="Price" PropertyName="Text" />
            <asp:ControlParameter ControlID="SecondHand" Name="Second" PropertyName="Checked" />
            <asp:ControlParameter ControlID="TextBox1" Name="Content" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ItemName" Name="ItemName" PropertyName="Text" />
            <asp:ControlParameter ControlID="Price" Name="Price" PropertyName="Text" />
            <asp:ControlParameter ControlID="SecondHand" Name="Second" PropertyName="Checked" />
            <asp:ControlParameter ControlID="TextBox1" Name="Content" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>


