using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;


public partial class WebAuthen_NewsEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Add("GID", Session["GID"].ToString());
    }

    protected void NewsEditorPost_Click(object sender, EventArgs e)
    {
        string text = NewsText.Text.Replace("'", "''");

        SqlDataSource1.InsertCommand = "INSERT INTO NewsItems(Owner, [Content], GID) VALUES ('" + Page.User.Identity.Name + "', '" + text + "', "  + Convert.ToInt16(Session["GID"]) + ")";
        SqlDataSource1.Insert();
        if (ViewState["rel_path"] != "")
        {
            SqlDataSource1.SelectCommand = "select Id from NewsItems where owner = '" + Page.User.Identity.Name + "' AND Content = '" + NewsText.Text + "' AND GID = " + Convert.ToInt16(Session["GID"]) + "Order BY Id DESC";
            DataView im = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            SqlDataSource1.InsertCommand = "Insert Into NewsItemsImages(Id, Image) values (" + im.Table.Rows[0][0] + ", '" + ViewState["rel_path"] + "')";
            SqlDataSource1.Insert();                
        }
        Server.Transfer("group.aspx");
    }

    protected void NewsEditorUpload_Click(object sender, EventArgs e)
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
            NewsEditorCoverImage.ImageUrl = relative_path;

            ViewState["rel_path"] = relative_path;
        }
    }

    protected void NewsEditorCancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("group.aspx");
    }
}