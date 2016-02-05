using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class WebAuthen_GroupManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            DropDownList1.DataSourceID = "";

        SqlDataSource1.SelectCommand = "select name, id from groups where founder = '" + Page.User.Identity.Name + "'";

        if (DropDownList1.SelectedIndex == 0)
            ListBox1.DataSourceID = "";
        else
        {
            SqlDataSource2.SelectCommand = "select username from groupmembers where gid = " + DropDownList1.SelectedValue;
            ListBox1.DataSourceID = "SqlDataSource2";
        }
    }
    protected void GroupPictureUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                if (ViewState["prev_file"].ToString() != "")
                    File.Delete(ViewState["prev_file"].ToString());
            }
            catch { }

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
            ViewState["prev_file"] = path;
            string relative_path = "~/Images/" + Page.User.Identity.Name + "/" + filename_save;
            Image1.ImageUrl = relative_path;

            ViewState["rel_path"] = relative_path;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
        {
            SqlDataSource1.SelectCommand = "select image from groups where id = " + DropDownList1.SelectedValue;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Table.Rows[0][0].ToString() != "")
                File.Delete(Server.MapPath("..") + dv.Table.Rows[0][0].ToString().TrimStart('~'));

            string name = GroupName.Text.Replace("'", "''");
            string desc = GroupDescription.Text.Replace("'", "''");
            SqlDataSource1.UpdateCommand = "update groups set [name] = '" + name + "', [desc] = '" + desc + "', [image] = '" + ViewState["rel_path"] + "' where id = " + DropDownList1.SelectedValue;
            SqlDataSource1.Update();
            Server.Transfer("GroupManager.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("personal.aspx");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
        {
            SqlDataSource1.SelectCommand = "select name, [desc], image from groups where id = " + DropDownList1.SelectedValue;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            GroupName.Text = dv.Table.Rows[0][0].ToString();
            GroupDescription.Text = dv.Table.Rows[0][1].ToString();
            Image1.ImageUrl = dv.Table.Rows[0][2].ToString();
        }
    }
    protected void DeleteMember_Click(object sender, EventArgs e)
    {
        SqlDataSource1.DeleteCommand = "delete from groupmembers where gid = " + DropDownList1.SelectedValue + " and username = '" + ListBox1.SelectedValue + "'";
        Label1.Text = SqlDataSource1.DeleteCommand;
        SqlDataSource1.Delete();
    }
}