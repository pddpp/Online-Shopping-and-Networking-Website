using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class WebAuthen_GroupEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
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
            img_Group.ImageUrl = relative_path;

            ViewState["rel_path"] = relative_path;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("personal.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string name = GroupName.Text.Replace("'", "''");
        string desc = GroupDescription.Text.Replace("'", "''");
        SqlDataSource1.InsertCommand = "insert into groups([name], [desc], [image], [founder]) values ('" + name + "', '" + desc + "', '" + ViewState["rel_path"] + "', '" + Page.User.Identity.Name + "')";
        SqlDataSource1.Insert();
        SqlDataSource1.InsertCommand = "insert into groupmembers(gid, username) values ((select max(id) from groups), '" + Page.User.Identity.Name + "')";
        SqlDataSource1.Insert();
        Response.Redirect("personal.aspx");
    }
}