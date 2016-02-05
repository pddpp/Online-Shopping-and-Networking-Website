<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">

    <%--<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Modify this template to jump-start your ASP.NET application.</h2>
            </hgroup>
            <asp:Button style="background-color:#2dbd54" ID="Button1" runat="server" Text="Button" />
            g<p>
                To learn more about ASP.NET, visit <a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>. 
                The page features <mark>videos, tutorials, and samples</mark> to help you get the most from 
                ASP.NET. If you have any questions about ASP.NET visit 
                <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">our forums</a>.
            </p>
        </div>
    </section>
</asp:Content>--%>


     
<%--            <hr id="hr-top"/>
            <div class="ribbon">

            </div>--%>
<%--            <div class="ribbon-fix"></div>--%>



<%--            <table id="contact">
                <tr>
                    <td>
                        <img src="images/profile_picture.jpg" width="100px" height="100px"/>
                    </td>
                    <td>
                        <div id="full-name">
                            Marc Adam
                        </div>
                        <div id="address">
                            Computer Engineer & Scientist
                        </div>   
                    </td>
                </tr>
            </table>--%>


<%--            <hr id="hr-bottom"/>--%>


            <table id="content-table" CellPadding="30" <%--style="background-color:#d0e6b4; padding: 15px; border: 1px solid #333;"--%>>
                <tr class="content-row">
                    <td class="content-cell">
                        <div>
                            <p class="auto-style1">
                                Website Description
                            </p>
                            <p class="content-cell-text">
                                Our website is a <strong>combination</strong> of 
                                <br />
                                <ul>
                                    <li><strong>social network</strong> based on interest <strong>groups</strong>
                                </li>
                                     <li>   customer to customer <strong>trading platform</strong> designed for trading between <strong>friends</strong> 
                                </li>
                                         </ul>
                                    
                            
                        </div>
                    </td>
                    <td class="content-cell">
                        <div>
                            <p class="auto-style1">
                                How to get started
                            </p>
                                <ol>
                                    <li>
                                        <strong>Register</strong> and login
                                    </li>
                                    <li>
                                        Go to <strong>Recommend</strong> to choose groups that you would like to join.
                                    </li>
                                    <li>
                                        After accepted by a group, you can step inside it from the <strong>Personal Home Page</strong>.
                                    </li>
                                    <li>
                                        Find interesting things there and have a good time in your interest groups!
                                    </li>
                                </ol>
                        </div>
                    </td>
                    <%--<td class="content-cell">
                        <div>
                            <p class="content-cell-title">
                                Professional Goals
                            </p>
                            <p class="content-cell-text">
                                To obtain a R&D position that will enable me to use my strong computer skills and knowledge in algorithms, and ability to work well in teams.
                            </p>
                        </div>
                    </td>--%>
                </tr>
                <tr class="content-row" >
                    <td class="content-cell" style="width: 300px" >
                        <div>
                            <p class="auto-style1">
                                Contact us
                            </p>
                            <table id="photos" cellspacing="0px">
                                    <tr>
                                        <td >
                                            
                                            <img width="40px" height="40px" src="Images/xiahua.PNG" />
                                                                                    </td>
                                        <td>
                                            
                                            Xia Hua<br />
                                            xiahua@bu.edu</tr>
                                    <tr>
                                        <td >
                                            
                                                <img width="40px" height="40px" src="Images/andylin.PNG" />
                                            
                                            
                                        </td>
                                        <td>
                                            Andy Lin<br />
                                            wahoyaho@gmail.com</td>
                                    </tr>
                                <tr>
                                        <td>
                                            
                                                <img width="40px" height="40px" src="Images/yanpeng.PNG" />
                                            
                                            
                                        </td>
                                        <td>
                                            Yan Peng<br />
                                            pymary68@gmail.com<br />
                                        </td>
                                    </tr>
                                <tr>
                                        <td>
                                            
                                                <img width="40px" height="40px" src="Images/chuouzhang.PNG" />
                                            
                                            
                                        </td>
                                        <td>
                                            Chuou Zhang<br />
                                            cozhang@bu.edu</td>
                                    </tr>
                                </table>
                             </div>                 </td>
                    
                    <td class="content-cell">
                        <div>
                            <p class="auto-style1">
                                We are growing ...
                            </p>
                            <ul class="auto-style2">
                                <li>
                                    <p class="content-cell-text">
                                        <asp:label id="totalmembers" runat="server" text="123" Font-Bold="True" Font-Size="Large"></asp:label>
                                        &nbsp;registed users;
                                    </p>
                                </li>
                                <li>
                                    <p class="content-cell-text">
                                        <asp:label id="totalgroups" runat="server" text="123" Font-Bold="True" Font-Size="Large"></asp:label>
                                        &nbsp;interest groups;
                                    </p>
                                </li>
                                <li>
                                    <p class="content-cell-text">
                                        <asp:label id="totalitems" runat="server" text="123" Font-Bold="True" Font-Size="Large"></asp:label>
                                        &nbsp;items on sale;
                                    </p>
                                </li>
                                <li>
                                    <p class="content-cell-text">
                                        <asp:label id="totalnews" runat="server" text="123" Font-Bold="True" Font-Size="Large"></asp:label>
                                        &nbsp;news are spread by now.
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="Select Count(*) From Users"></asp:SqlDataSource>
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </table>





</asp:Content>


<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .newStyle1 {
            background-color: #d0e6b4;
            padding: 3px;
            margin: 4px;
        }
        .newStyle2 {
            margin: 20px;
        }
        .auto-style2 {
            list-style-type: square;
        }
    </style>
</asp:Content>



