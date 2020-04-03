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
    public static dynamic GetProducts(int productId)
    {
        InventoryBL bl = new InventoryBL();
        var result = bl.GetProducts(productId);
        return result.Select(products => new
        {
            Product_ID = products.Product_ID,
            Product_Name = products.Product_Name,
            SKU = products.SKU,
            Supplier_Id = products.Supplier_Id,
            Product_Description = products.Product_Description,
            Product_Quantity = products.Product_Quantity,
            Price = products.Price,
            ExpiryDate = products.ExpiryDate.GetValueOrDefault().ToShortDateString(),
            Availability = products.Availability
        }).ToList();
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProduct.aspx");
    }
}