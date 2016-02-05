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
        string gid = Session["GID"].ToString();
        Session.Add("GID", gid);

        SqlDataSource1.SelectCommand = "SELECT Image, [Desc] FROM Groups WHERE (Id = " + gid + ")";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        Image1.ImageUrl = dv.Table.Rows[0][0].ToString();
        Label_desc.Text = dv.Table.Rows[0][1].ToString();

        SqlDataSource1.SelectCommand = "Select Id, Content, Price, Image, Owner from NewsItems inner join Users on owner = username Where GID = " + gid + "ORDER BY Date Desc";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            bool product = false;

            Panel face = new Panel();
            face.CssClass = "face-area";
            Image face_img = new Image();
            face_img.ImageUrl = dv.Table.Rows[i][3].ToString();
            face.Controls.Add(face_img);            
            news_area.Controls.Add(face);

            Panel news = new Panel();
            news.CssClass = "news-right";
            Panel content = new Panel();
            content.CssClass = "news-content";
            if (dv.Table.Rows[i][2].ToString() != "")
            {
                Label price_lbl = new Label();
                price_lbl.Text = "Price: $" + dv.Table.Rows[i][2].ToString();
                content.Controls.Add(price_lbl);
                product = true;
            }

            SqlDataSource1.SelectCommand = "Select Image from NewsItemsImages where Id = " + dv.Table.Rows[i][0];
            DataView im = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (im.Table.Rows.Count != 0)
            {
                Panel cover = new Panel();
                cover.CssClass = "news-img";
                Image news_img = new Image();
                news_img.ImageUrl = ".." + im.Table.Rows[0][0].ToString().TrimStart('~');
                cover.Controls.Add(news_img);
                content.Controls.Add(cover);
            }

            Panel text = new Panel();
            text.CssClass = "text";
            Label text_lbl = new Label();
            text_lbl.Text = dv.Table.Rows[i][1].ToString();
            text.Controls.Add(text_lbl);
            content.Controls.Add(text);

            LinkButton details = new LinkButton();
            details.Text = "Details";
            details.CommandArgument = dv.Table.Rows[i][0].ToString();
            if (product == true)
                details.CommandName = "Product";
            else
                details.CommandName = "News";
            details.Command += new CommandEventHandler(Redirect_Details);
            Label name = new Label();
            name.Text = "Posted by " + dv.Table.Rows[i][4].ToString();
            content.Controls.Add(details);
            content.Controls.Add(name);

            news.Controls.Add(content);
            news_area.Controls.Add(news);
        }
    }

    protected void gotoNewsE(object sender, EventArgs e)
    {
        Server.Transfer("NewsEditor.aspx");
    }
    protected void gotoProductE(object sender, EventArgs e)
    {
        Server.Transfer("ProductEditor.aspx");
    }
    protected void gotoDesc(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel_desc.Visible = true;
    }
    protected void gotoNews(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel_desc.Visible = false;
    }

    protected void Redirect_Details(object o, CommandEventArgs e)
    {
        Session.Add("ItemID", e.CommandArgument.ToString());

        if (e.CommandName.ToString() == "Product")
            Server.Transfer("ProductDetail.aspx");
        else
            Server.Transfer("NewsDetail.aspx");
    }
}