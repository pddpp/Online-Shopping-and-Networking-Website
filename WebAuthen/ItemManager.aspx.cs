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
        SqlDataSource1.SelectCommand = "SELECT deriv.Id, deriv.Name, deriv.[Content], deriv.Price, deriv.Date, derivedtbl_1.interest FROM (SELECT Id, Name, [Content], Price, Date FROM NewsItems WHERE (Owner = '" + Page.User.Identity.Name + "') AND (Price IS NOT NULL)) AS deriv LEFT OUTER JOIN (SELECT Id, COUNT(Id) AS interest FROM ShoppingCart GROUP BY Id) AS derivedtbl_1 ON deriv.Id = derivedtbl_1.Id";
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
            SqlDataSource1.DeleteCommand = "delete from NewsItems where Id = " + e.CommandArgument.ToString();
            SqlDataSource1.Delete();
        }
    }
}