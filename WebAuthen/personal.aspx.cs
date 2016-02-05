using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class WebAuthen_personal : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand="SELECT Groups.Name, Groups.Id, Groups.[Desc] FROM Groups INNER JOIN (SELECT GID FROM GroupMembers WHERE (UserName = '" + Page.User.Identity.Name + "')) AS ON Groups.Id = derivedtbl_1.GID";
        welcome.InnerHtml = "Hello, " + Page.User.Identity.Name + "!";

        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            Panel group_area = new Panel();
            group_area.CssClass = "group-area";
            groups_info.Controls.Add(group_area);

            Panel group_name = new Panel();
            group_name.CssClass = "group-name";
            group_area.Controls.Add(group_name);

            LinkButton group_link = new LinkButton();
            group_link.CssClass = "group-link";
            group_link.Text = dv.Table.Rows[i][0].ToString();
            group_link.CommandArgument = dv.Table.Rows[i][1].ToString();
            group_link.Command += new CommandEventHandler(gotoGroupPage);
            group_name.Controls.Add(group_link);

            Panel group_content = new Panel();
            group_content.CssClass = "group-content";
            Label group_content_lbl = new Label();
            group_content_lbl.Text = dv.Table.Rows[i][2].ToString();
            group_content.Controls.Add(group_content_lbl);
            group_area.Controls.Add(group_content);                
       }

        SqlDataSource1.SelectCommand="SELECT Groups.Name, GroupRequest.[User], Groups.Id FROM Groups INNER JOIN GroupRequest ON Groups.Id = GroupRequest.Gid WHERE (Groups.Founder = '" + Page.User.Identity.Name + "')";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            TableRow row = new TableRow();
            messagebox.Rows.Add(row);
            TableCell cell = new TableCell();
            Label lbl = new Label();
            LinkButton linka = new LinkButton();
            LinkButton linkd = new LinkButton();
            
            lbl.Text = dv.Table.Rows[i][1] + " has requested membership for " + dv.Table.Rows[i][0] + " ";
            linka.Command += new CommandEventHandler(AcceptDeny);
            linka.Text = "Accept";
            linka.CommandName = "Accept";
            linka.CommandArgument = dv.Table.Rows[i][1].ToString() + "," + dv.Table.Rows[i][2].ToString();
            linkd.Command += new CommandEventHandler(AcceptDeny);
            linkd.Text = "Deny";
            linkd.CommandName = "Deny";
            linkd.CommandArgument = dv.Table.Rows[i][1].ToString() + "," + dv.Table.Rows[i][2].ToString();
            cell.Controls.Add(lbl);
            cell.Controls.Add(linka);
            cell.Controls.Add(linkd);
            row.Cells.Add(cell);
        }

        SqlDataSource1.SelectCommand = "select realname, image from users where username = '" + Page.User.Identity.Name + "'";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (!IsPostBack)
        {
            if (dv.Table.Rows[0][0].ToString() != "")
                TextBox1.Text = dv.Table.Rows[0][0].ToString();
            if (dv.Table.Rows[0][1].ToString() != "")
                profile_pic.ImageUrl = ".." + dv.Table.Rows[0][1].ToString().TrimStart('~');
            else
                profile_pic.ImageUrl = "../Images/no_profile_pic.png";
            
            SqlDataSource1.SelectCommand = "select email from memberships inner join users on memberships.userid = users.userid where users.username = '" + Page.User.Identity.Name + "'";
            dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            TextBox2.Text = dv.Table.Rows[0][0].ToString();
        }
    }

    protected void AcceptDeny(object o, CommandEventArgs e)
    {
        string[] arg = e.CommandArgument.ToString().Split(',');

        if (e.CommandName == "Accept")
        {
            SqlDataSource1.InsertCommand = "insert into GroupMembers(GID, UserName) values (" + arg[1] + ", '" + arg[0] + "')";
            SqlDataSource1.Insert();
        }

        SqlDataSource1.DeleteCommand = "delete from GroupRequest where [User] = '" + arg[0]  + "' AND gid = " + arg[1];
        SqlDataSource1.Delete();

        Response.Redirect("personal.aspx");
    }

    protected void gotoGroupPage(object o, CommandEventArgs e)
    {
        Session.Add("GID", e.CommandArgument.ToString());

        Server.Transfer("group.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string realname = TextBox1.Text.Replace("'", "''");
        SqlDataSource1.UpdateCommand = "Update users set realname = '" + realname + "' where username = '" + Page.User.Identity.Name + "'";
        SqlDataSource1.Update();
        string email = TextBox2.Text.Replace("'", "''");
        SqlDataSource1.UpdateCommand = "Update memberships set email = '" + email + "' where userid = (select userid from users where username = '" + Page.User.Identity.Name + "')";
        SqlDataSource1.Update();
    }

    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string folder = Server.MapPath("~/Images/" + Page.User.Identity.Name + "/");
            if (!System.IO.Directory.Exists(folder))
                System.IO.Directory.CreateDirectory(folder);

            string filename_save = "";
            string path = "";

            do
            {
                filename_save = Path.GetFileNameWithoutExtension(FileUpload1.FileName) + "_" + Path.GetRandomFileName().Replace(".", "") + Path.GetExtension(FileUpload1.FileName);
                path = Path.Combine(folder, filename_save);
            } while (System.IO.File.Exists(path));

            FileUpload1.SaveAs(path);
            string relative_path = "~/Images/" + Page.User.Identity.Name + "/" + filename_save;
            profile_pic.ImageUrl = relative_path;

            SqlDataSource1.SelectCommand = "select image from users where username = '" + Page.User.Identity.Name + "'";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Table.Rows[0][0].ToString() != "")
                File.Delete(Server.MapPath("..") + dv.Table.Rows[0][0].ToString().TrimStart('~'));
            SqlDataSource1.UpdateCommand = "Update users set image = '" + relative_path + "' where username = '" + Page.User.Identity.Name + "'";
            SqlDataSource1.Update();
        }
    }
}