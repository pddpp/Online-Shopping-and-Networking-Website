<%@ Page Title=" Group Manager" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GroupManager.aspx.cs" Inherits="WebAuthen_GroupManager" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>

    <section id="loginForm">
        <h2>Manage your group here..
        </h2>
        
        <fieldset>
            <legend>Create a new group</legend>
            <ol>
                <li>
                    &nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium">Select a group</asp:Label>
                    &nbsp&nbsp&nbsp<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" Height="30px" Width="270px">
            <asp:ListItem Selected="True" Text="" Value=""></asp:ListItem>
            </asp:DropDownList>
                </li>
                <li id="5">
                    <br />

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
                    &nbsp&nbsp&nbsp<asp:Image ID="Image1" runat="server" style="margin-top:5px; width:102px; height:90px;" ImageUrl="~/Images/ImageDefault.png" />
                    <asp:FileUpload ID="FileUpload1" runat="server" style="margin:8px; float:left; width:300px" />
                     <asp:Button ID="GroupPictureUpload" runat="server" Text="Upload" style="float:left;background-color:#2dbd54; color:#fff" OnClick="GroupPictureUpload_Click" />
                </li>
                </ol>
                <br />
        </fieldset>
        
        <div style="clear:both">
        
        <br />
            <asp:Button ID="Button2" style="background-color:#2dbd54; float:right; margin-right:20px; color:#fff" runat="server" Text="  Cancel  " OnClick="Button2_Click" CausesValidation="false" />
            <asp:Button ID="Button1" style="background-color:#2dbd54; color:#fff; margin-right:10px;float:right" runat="server" Text="  Submit  " OnClick="Button1_Click" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>"></asp:SqlDataSource>
        </div>
            <br />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>"></asp:SqlDataSource>
        
    </section>
    <section id="RemoveMember">
        <h3 style="margin-top:70px">Remove current member of this group:<br />
            <asp:ListBox ID="ListBox1" runat="server" DataTextField="username" DataValueField="username" Width="250px"></asp:ListBox>
            <asp:Button ID="DeleteMember" style="background-color:#2dbd54; float:right; margin-right:20px; color:#fff" runat="server" Text="  Delete Member  " OnClick="DeleteMember_Click" CausesValidation="false" />
        </h3>
    </section>
    
</asp:Content>


