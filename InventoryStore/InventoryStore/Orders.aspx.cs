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
    public static dynamic GetOrders()
    {
        InventoryBL bl = new InventoryBL();
        int userid = HttpContext.Current.Session["UserId"] != null ? Convert.ToInt32(HttpContext.Current.Session["UserId"]) : 0;
        int groupId = HttpContext.Current.Session["GroupId"] != null ? Convert.ToInt32(HttpContext.Current.Session["GroupId"]) : 0;
        return bl.GetOrders(userid, groupId).Select(x => new
        {
            Order_Id = x.Order_Id,
            Customer_Name = x.Customer_Name,
            Product_Name = x.tbl_Products != null ? x.tbl_Products.Product_Name : "",
            Items_Count = x.Items_Count,
            NetAmount = x.NetAmount,
            Service_Charge = x.Service_Charge,
            Vat_Charge = x.Vat_Charge
        }).ToList();
    }

    protected void btnAddOrder_Click(object sender, EventArgs e)
    {


    }
}