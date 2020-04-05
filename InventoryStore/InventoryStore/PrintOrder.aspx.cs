using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryStore
{
    public partial class PrintOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["OrderId"] != null ? Request.QueryString["OrderId"].ToString() : "0";
            if (!Page.IsPostBack)
            {
                LoadDropdowns();
                if (!string.IsNullOrEmpty(id))
                    LoadOrderDetails(Convert.ToInt32(id));
            }
        }

        public void LoadDropdowns()
        {
            InventoryBL bl = new InventoryBL();
            var products = bl.GetProducts(0);

            ddlProducts.Items.Add(new ListItem("Select", "0"));
            foreach (var item in products)
            {
                ddlProducts.Items.Add(new ListItem(item.Product_Name, item.Product_ID.ToString()));
            }

        }

        public void LoadOrderDetails(int orderId)
        {
            InventoryBL obj = new InventoryBL();
            var order = obj.GetOrderDetails(orderId);
            if (order != null)
            {
                txtCustName.Text = order.Customer_Name;
                txtCustPhone.Text = order.Customer_Phone;
                txtAddress.Text = order.Customer_Address;
                ddlProducts.SelectedItem.Value = order.Product_Id.ToString();
                ddlNumberOfItems.SelectedItem.Value = order.Items_Count.ToString();
                txtCost.Text = order.Product_Cost.ToString();
                txtAmount.Text = order.Amount.ToString();
                txtGrossAmount.Text = order.Gross_Amount.ToString();
                txtServiceCharge.Text = order.Service_Charge.ToString();
                txtVat.Text = order.Vat_Charge.ToString();
                txtNetAmount.Text = order.NetAmount.ToString();
            }
        }

        protected void btnSaveOrder_Click(object sender, EventArgs e)
        {
            InventoryBL bl = new InventoryBL();
            tbl_Orders order = new tbl_Orders()
            {
                Order_Id = 0,
                Product_Id = Convert.ToInt32(ddlProducts.SelectedItem.Value),
                Items_Count = Convert.ToInt32(ddlNumberOfItems.SelectedItem.Value),
                Product_Cost = Convert.ToInt32(txtCost.Text),
                Amount = Convert.ToInt32(txtAmount.Text),
                Customer_Name = txtCustName.Text,
                Customer_Address = txtAddress.Text,
                Customer_Phone = txtCustPhone.Text,
                Gross_Amount = Convert.ToInt32(txtGrossAmount.Text),
                Service_Charge = Convert.ToInt32(txtServiceCharge.Text),
                Vat_Charge = Convert.ToInt32(txtVat.Text),
                NetAmount = Convert.ToInt32(txtNetAmount.Text)
            };

            //if (!bl.ValidateProduct(product))
            //{
            bool result = bl.SaveOrder(order);
            if (result == true)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "product error", "alert('Order placed successfully!');", true);
                Response.Redirect("Orders.aspx");
            }

        }

        protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProductPriceDetails();
        }

        protected void ddlNumberOfItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProductPriceDetails();
        }

        public void LoadProductPriceDetails()
        {
            int numberOfItems = Convert.ToInt32(ddlNumberOfItems.SelectedItem.Value);
            int productId = Convert.ToInt32(ddlProducts.SelectedItem.Value);
            if (productId > 0 && numberOfItems > 0)
            {
                InventoryBL bl = new InventoryBL();
                var product = bl.GetProducts(productId).FirstOrDefault();
                if (product != null)
                {
                    if (product.Supplier_Id > 0)
                    {
                        var supplier = bl.GetSuppliers(product.Supplier_Id).FirstOrDefault();
                        if (supplier != null)
                        {
                            txtCost.Text = product.Price.ToString();
                            txtAmount.Text = (product.Price * numberOfItems).ToString();
                            txtGrossAmount.Text = (product.Price * numberOfItems).ToString();
                            txtServiceCharge.Text = supplier.Service_Charge_Value;
                            txtVat.Text = supplier.Vat_Charge_Value;
                            txtNetAmount.Text = ((product.Price * numberOfItems) + Convert.ToInt32(supplier.Service_Charge_Value) +
                                Convert.ToInt32(supplier.Vat_Charge_Value)).ToString();
                        }
                    }
                }
            }
        }
    }
}