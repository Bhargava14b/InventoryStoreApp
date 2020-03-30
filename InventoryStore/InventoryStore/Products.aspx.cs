using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
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
    public static List<tbl_Products> GetProducts()
    {
        InventoryBL bl = new InventoryBL();
        return bl.GetProducts();
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProduct.aspx");
    }
}