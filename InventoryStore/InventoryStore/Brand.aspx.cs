using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryStore
{
    public partial class Brand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            //InventoryBL bl = new InventoryBL();
            //tbl_Brands brand = new tbl_Brands()
            //{
            //    Brand_Name = txtName.Text,
            //    Brand_Status = ddlStatus.SelectedValue == "1" ? true : false
            //};
            //if (bl.ValidateBrand(brand))
            //{
            //    bool result = bl.AddBrand(brand);
            //}
        }

        protected void dataTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        [WebMethod]
        public static List<tbl_Brands> GetBrands()
        {
            InventoryBL bl = new InventoryBL();
            return bl.GetBrands();
        }

        [WebMethod]
        public static bool SaveBrand(string id, string name, string status)
        {
            InventoryBL bl = new InventoryBL();
            tbl_Brands brand = new tbl_Brands()
            {
                Brand_Id = Convert.ToInt32(id),
                Brand_Name = name,
                Brand_Status = status == "1" ? true : false
            };
            if (!bl.ValidateBrand(brand))
            {
                bool result = bl.SaveBrand(brand);
                return result;
            }
            return false;
        }

        [WebMethod]
        public static bool DeleteBrand(string id)
        {
            InventoryBL bl = new InventoryBL();
            bool result = bl.DeleteBrand(Convert.ToInt32(id));
            return result;
        }
    }
}