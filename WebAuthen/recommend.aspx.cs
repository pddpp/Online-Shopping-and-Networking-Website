using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class WebAuthen_personal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        SqlDataSource1.SelectCommand = "SELECT Recommend.Id, Recommend.Name, Recommend.[Desc], Recommend.Founder, Requested.Gid AS Req FROM (SELECT Groups.Id, Groups.Name, Groups.[Desc], Groups.Image, Groups.Founder, MemberOf.GID FROM Groups LEFT OUTER JOIN (SELECT GID FROM GroupMembers WHERE (UserName = '" + Page.User.Identity.Name + "')) AS MemberOf ON Groups.Id = MemberOf.GID WHERE (MemberOf.GID IS NULL)) AS Recommend LEFT OUTER JOIN (SELECT [User], Gid FROM GroupRequest WHERE ([User] = '" + Page.User.Identity.Name + "')) AS Requested ON Recommend.Id = Requested.Gid";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "RequestInvite")
        {
            SqlDataSource1.InsertCommand = "insert into GroupRequest([User], Gid) values ('" + Page.User.Identity.Name + "', " + e.CommandArgument.ToString() + ")";
            SqlDataSource1.Insert();
        }
        else if (e.CommandName == "DeleteRequest")
        {
            SqlDataSource1.DeleteCommand = "delete from grouprequest where [user] = '" + Page.User.Identity.Name + "' and gid = " + e.CommandArgument.ToString();
            SqlDataSource1.Delete();
        }
    }

    protected Boolean RequestShow(object o)
    {
        string req = o.ToString();
        if (req == "")
            return true;
        else
            return false;
    }

    protected Boolean RemoveShow(object o)
    {
        string req = o.ToString();
        if (req == "")
            return false;
        else
            return true;
    }
}