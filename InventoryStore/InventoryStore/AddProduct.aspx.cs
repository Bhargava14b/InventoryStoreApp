using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryStore
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadDropdowns();
        }
        
        public void LoadDropdowns()
        {
            InventoryBL bl = new InventoryBL();
            var supplier = bl.GetSuppliers();
            var categories = bl.GetCategories();
            var brands = bl.GetBrands();
            var stores = bl.GetStores();

            foreach(var sup in supplier)
            {
                ddlSupplier.Items.Add(new ListItem(sup.Supplier_Name, sup.Supplier_Id.ToString()));
            }
            foreach (var item in categories)
            {
                ddlCategory.Items.Add(new ListItem(item.Category_Name, item.Category_Id.ToString()));
            }
            foreach (var item in brands)
            {
                ddlBrand.Items.Add(new ListItem(item.Brand_Name, item.Brand_Id.ToString()));
            }
            foreach (var item in stores)
            {
                ddlStore.Items.Add(new ListItem(item.Store_Name, item.Store_Id.ToString()));
            }

        }

        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            InventoryBL bl = new InventoryBL();
            tbl_Products product = new tbl_Products()
            {
                Product_ID = 0,
                Product_Name = txtProductName.Text,
                SKU = txtSKU.Text,
                Supplier_Id = Convert.ToInt32(ddlSupplier.SelectedValue),
                Category_Id = Convert.ToInt32(ddlCategory.SelectedValue),
                Brand_Id = Convert.ToInt32(ddlBrand.SelectedValue),
                Store_Id = Convert.ToInt32(ddlStore.SelectedValue),
                Product_Description = txtDescription.Text,
                Product_Quantity = Convert.ToInt32(txtQuantity.Text),
                Price = Convert.ToInt32(txtPrice.Text),
                ExpiryDate = !string.IsNullOrEmpty(txtExpiryDate.Text) ? Convert.ToDateTime(txtExpiryDate.Text) : DateTime.MaxValue,
                Availability =Convert.ToBoolean(ddlActive.SelectedValue)
            };
            
            //if (!bl.ValidateProduct(product))
            //{
                bool result = bl.SaveProduct(product);
                if (result==true)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "product error", "alert('Product Saved successfully!');", true);
                    Response.Redirect("products.aspx");
                }
           // }
         
    
        }


    }
}