using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class WebAuthen_ProductEditor : System.Web.UI.Page
{
    public List<string> all_files = new List<string>();
    public List<string> rel_paths = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    { 
        Session.Add("GID", Session["GID"].ToString());

        /*
        try {
            List<string> all_files = ViewState["all_files"] as List<string>;
            List<string> rel_paths = ViewState["rel_paths"] as List<string>;

            foreach (string path in rel_paths)
            {
                Image img = new Image();
                img.Width=new Unit("200px");
                img.Height=new Unit("200px");
                img.ImageUrl=path;

                Panel1.Controls.Add(img);
            }
        }
        catch { }*/

        if (ViewState["all_files"] != null)
            all_files = ViewState["all_files"] as List<string>;
        else
            ViewState["all_files"] = all_files;

        if (ViewState["rel_paths"] != null)
            rel_paths = ViewState["rel_paths"] as List<string>;
        else
            ViewState["rel_paths"] = rel_paths;
        
        for (int i = 0; i < rel_paths.Count; i++)
        {
            Image img = new Image();
            img.Width = new Unit("200px");
            img.Height = new Unit("200px");
            img.ImageUrl = rel_paths[i];

            LinkButton del = new LinkButton();
            del.CommandArgument = i.ToString();
            del.Text = "Remove Image";
            del.CausesValidation = false;
            del.Command += new CommandEventHandler(DelImage);

            Panel1.Controls.Add(img);
            Panel1.Controls.Add(del);
        }
    }

    protected void DelImage(object sender, CommandEventArgs e)
    {
        int i = Convert.ToInt16(e.CommandArgument);
        File.Delete(all_files[i]);
        all_files.RemoveAt(i);
        rel_paths.RemoveAt(i);
        Panel1.Controls.RemoveAt(2 * i + 2);
        Panel1.Controls.RemoveAt(2 * i + 1);
    }

    protected void ProductEditorUpload_Click(object sender, EventArgs e)
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

            all_files.Add(path);        
            rel_paths.Add("~/Images/" + Page.User.Identity.Name + "/" + filename_save);
            
            
            Image img = new Image();
            img.Width = new Unit("200px");
            img.Height = new Unit("200px");
            img.ImageUrl = "~/Images/" + Page.User.Identity.Name + "/" + filename_save;

            LinkButton del = new LinkButton();
            del.Text = "Remove Image";
            del.CausesValidation = false;
            del.Command += new CommandEventHandler(DelImage);

            Panel1.Controls.Add(img);
            Panel1.Controls.Add(del);

            ViewState["all_files"] = all_files;
            ViewState["rel_paths"] = rel_paths;
            FileUpload1.SaveAs(path);              
        }        
    }

    protected void ProductEditorPost_Click(object sender, EventArgs e)
    {        
        SqlDataSource1.InsertCommand = "INSERT INTO NewsItems(Name, Owner, Price, SecondHand, [Content], GID) VALUES (@ItemName, '" + Page.User.Identity.Name + "', @Price, @Second, @Content, " + Convert.ToInt16(Session["GID"]) + ")";
        SqlDataSource1.Insert();
        if (rel_paths.Count > 0)
        {
            SqlDataSource1.SelectCommand = "select Id from NewsItems where Name = @ItemName AND Owner = '" + Page.User.Identity.Name + "' AND Price = @Price AND SecondHand = @Second AND Content = @Content AND GID = " + Convert.ToInt16(Session["GID"]) + "Order By Id Desc";
            DataView im = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (string path in rel_paths)
            {
                SqlDataSource1.InsertCommand = "Insert Into NewsItemsImages(Id, Image) Values (" + im.Table.Rows[0][0] + ", '" + path + "')";
                SqlDataSource1.Insert();
            }
        }
        Server.Transfer("group.aspx");
    }

    protected void ProductEditorCancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("group.aspx");
    }
}