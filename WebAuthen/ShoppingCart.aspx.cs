using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class WebAuthen_ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_sellerinfo.Visible = false;
        SqlDataSource1.SelectCommand = "SELECT NewsItems.Id, NewsItems.Name, NewsItems.[Content], NewsItems.Price, NewsItems.Date FROM NewsItems INNER JOIN (SELECT Id FROM ShoppingCart WHERE (Buyer = '" + Page.User.Identity.Name + "')) AS derivedtbl_1 ON NewsItems.Id = derivedtbl_1.Id";
    }
    protected void ShoppingCart_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ShoppingCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString() == "ViewDetail")
        {
            Session.Add("ItemID", e.CommandArgument.ToString());
            Server.Transfer("ProductDetail.aspx");
        }
        else if (e.CommandName.ToString() == "DeleteItem")
        {
            SqlDataSource1.DeleteCommand = "delete from ShoppingCart where Id = " + e.CommandArgument.ToString() + " and [Buyer] = '" + Page.User.Identity.Name + "'";
            SqlDataSource1.Delete();
        }
        else if (e.CommandName.ToString() == "OwnerDetail")
        {
            SqlDataSource1.SelectCommand = "SELECT Memberships.Email FROM (SELECT Users.UserId FROM ShoppingCart INNER JOIN NewsItems ON ShoppingCart.Id = NewsItems.Id INNER JOIN Users On NewsItems.Owner = Users.UserName WHERE ShoppingCart.Id = " + e.CommandArgument.ToString() + ") AS derivedtbl_1 INNER JOIN Memberships ON derivedtbl_1.UserId = Memberships.UserId";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            SqlDataSource1.SelectCommand = "SELECT NewsItems.Id, NewsItems.Name, NewsItems.[Content], NewsItems.Price, NewsItems.Date FROM NewsItems INNER JOIN (SELECT Id FROM ShoppingCart WHERE (Buyer = '" + Page.User.Identity.Name + "')) AS derivedtbl_1 ON NewsItems.Id = derivedtbl_1.Id";
            //Response.Write("<SCRIPT language=\"javascript\">open('mailto:" + dv.Table.Rows[0][0] + "','_blank','top=0,left=0,status=yes,resizable=yes,scrollbars=yes');</script>");
            lbl_sellerinfo.Text = "You may contact the seller at his email address: " + dv.Table.Rows[0][0];
            lbl_sellerinfo.Visible = true;
        }
    }
}