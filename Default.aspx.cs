using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "Select Count(*) From Memberships";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        totalmembers.Text = dv.Table.Rows[0][0].ToString();

        SqlDataSource1.SelectCommand = "Select Count(*) From Groups";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        totalgroups.Text = dv.Table.Rows[0][0].ToString();

        SqlDataSource1.SelectCommand = "Select Count(*) From NewsItems Where Price IS NOT NULL";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        totalitems.Text = dv.Table.Rows[0][0].ToString();

        SqlDataSource1.SelectCommand = "Select Count(*) From NewsItems Where Price IS NULL";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        totalnews.Text = dv.Table.Rows[0][0].ToString();
    }
}