using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class WebAuthen_ProductDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int itemid = Convert.ToInt16(Session["ItemID"]);

        SqlDataSource1.SelectCommand = "select image from newsitemsimages where id = " + itemid;
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count != 0)
        {            
            Panel big_img = new Panel();
            big_img.Style.Add("float", "left");
            big_img.ID = "bigimg";
            Image big_img_url = new Image();
            big_img_url.ImageUrl = dv.Table.Rows[0][0].ToString();
            big_img.Controls.Add(big_img_url);
            picture.Controls.Add(big_img);
        }
        if (dv.Table.Rows.Count > 1) {
            Panel small_img = new Panel();
            small_img.Style.Add("float", "left");
            small_img.Style.Add("height", "70px");
            small_img.Style.Add("width", "255px");
            small_img.Style.Add("overflow-y", "scroll");
            small_img.ID = "smallimg";

            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                HyperLink link = new HyperLink();
                link.NavigateUrl = "#";
                Image small_img_url = new Image();
                small_img_url.ImageUrl = dv.Table.Rows[i][0].ToString();
                link.Controls.Add(small_img_url);
                small_img.Controls.Add(link);
    
                //smallimg.Controls.Add(small_img); <div id="smallimg" style="float: left; height: 70px; width: 255px; overflow-y: scroll">
            }
            picture.Controls.Add(small_img);
        }

        SqlDataSource1.SelectCommand = "select content, price, gid, name from NewsItems where id = " + itemid;
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        Div1.InnerText = dv.Table.Rows[0][0].ToString();
        Label3.Text = "$" + dv.Table.Rows[0][1].ToString();
        product_name.InnerText = "Product Detail for " + dv.Table.Rows[0][3];

        Session.Add("GID", dv.Table.Rows[0][2]);

        SqlDataSource1.SelectCommand = "select Poster, Content from comments where PostID = " + itemid + " order by Date DESC";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow comment in dv.Table.Rows)
        {
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
    protected void AddToCart_Click(object sender, EventArgs e)
    {
        int itemid = Convert.ToInt16(Session["ItemID"]);
        SqlDataSource1.SelectCommand = "select * from shoppingcart where id = " + itemid + " and buyer = '" + Page.User.Identity.Name + "'";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count > 0)
            Server.Transfer("CartItemExisted.aspx");
        else
        {
            SqlDataSource1.InsertCommand = "insert into shoppingcart(id, buyer) values (" + Session["ItemID"] + ", '" + Page.User.Identity.Name + "')";
            SqlDataSource1.Insert();
            Server.Transfer("AddToCartConfirmed.aspx");
        }
    }

    protected void btn_GoBack_Click(object sender, EventArgs e)
    {
        Server.Transfer("group.aspx");
    }
}