using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class WebAuthen_NewsDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int itemid = Convert.ToInt16(Session["ItemID"]);

        SqlDataSource1.SelectCommand = "select image from NewsItemsImages where id = " + itemid;
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count > 0)
        {
            Panel pic = new Panel();
            pic.Style.Add("float", "left");
            pic.Style.Add("width", "240px");
            pic.Style.Add("height", "240px");
            pic.Style.Add("padding", "0px");
            Image pic_img = new Image();
            pic_img.Style.Add("width", "240px");
            pic_img.Style.Add("height", "240px");
            pic_img.ImageUrl=dv.Table.Rows[0][0].ToString();
            pic.Controls.Add(pic_img);
            picture.Controls.Add(pic);
        }

        SqlDataSource1.SelectCommand = "select content from NewsItems where id = " + itemid;
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        Div1.InnerText = dv.Table.Rows[0][0].ToString();

        SqlDataSource1.SelectCommand = "select Poster, Content from comments where PostID = " + itemid + " order by Date DESC";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow comment in dv.Table.Rows) {
            TableRow row = new TableRow();
            TableCell name = new TableCell();
            TableCell text = new TableCell();
            name.Text = comment[0].ToString();
            text.Text = comment[1].ToString();
            row.Cells.Add(name);
            row.Cells.Add(text);
            comment_table.Rows.Add(row); 
        }
    }
    protected void NewsDetailComment_Click(object sender, EventArgs e)
    {
        string comment = TextBox1.Text.Replace("'", "''");
        SqlDataSource1.InsertCommand = "insert into comments(poster, postid, content) values ('" + Page.User.Identity.Name + "', " + Session["ItemID"] + ", '" + comment + "')";
        SqlDataSource1.Insert();

        Response.Redirect(Request.RawUrl);
    }

    protected void btn_GoBack_Click(object sender, EventArgs e)
    {
        Server.Transfer("group.aspx");
    }
}