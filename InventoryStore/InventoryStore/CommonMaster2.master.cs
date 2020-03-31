using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CommonMaster2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            var user = (dynamic)Session["User"];
            string menu_access = Convert.ToString(user.GetType().GetProperty("MenuAccess").GetValue(user, null));
            string[] menus = menu_access.Split(',');
            //lnkBrands.Visible = menus.Contains("Brand");

        }
    }
}
