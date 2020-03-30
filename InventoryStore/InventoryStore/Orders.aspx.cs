using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
    [WebMethod]
    public static List<tbl_Orders> GetOrders()
    {
        InventoryBL bl = new InventoryBL();
        int userid = HttpContext.Current.Session["UserId"] != null ? Convert.ToInt32(HttpContext.Current.Session["UserId"]) : 0;
        return bl.GetOrders(userid);
    }
    
    protected void btnAddOrder_Click(object sender, EventArgs e)
    {


    }
}