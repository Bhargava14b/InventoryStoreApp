using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryStore.DL
{
    public class InventoryBL : IInventoryStore
    {
        InventoryDL dl;

        public InventoryBL()
        {
            dl = new InventoryDL();
        }

        public bool SaveBrand(tbl_Brands brand)
        {
            return dl.SaveBrand(brand);
        }

        public bool DeleteBrand(int id)
        {
            return dl.DeleteBrand(id);
        }

        public bool SaveCategory(tbl_Categories category)
        {
            return SaveCategory(category);
        }

        public bool SaveStore(tbl_Stores store)
        {
            return dl.SaveStore(store);
        }

        public bool SaveSupplier(tbl_Supplier supplier)
        {
            return dl.SaveSupplier(supplier);
        }

        public bool SaveUser(tbl_Users user)
        {
            return dl.SaveUser(user);
        }

        public List<tbl_Brands> GetBrands()
        {
            return dl.GetBrands();
        }

        public List<tbl_Categories> GetCategories()
        {
            return dl.GetCategories();
        }

        public dynamic GetDashboardDetails()
        {
            return dl.GetDashboardDetails();
        }

        public List<tbl_Stores> GetStores()
        {
            return dl.GetStores();
        }

        public List<tbl_Supplier> GetSuppliers()
        {
            return dl.GetSuppliers();
        }

        public List<tbl_Users> GetUsers()
        {
            return dl.GetUsers();
        }

        public bool ValidateBrand(tbl_Brands brand)
        {
            return dl.ValidateBrand(brand);
        }

        public bool ValidateCategory(tbl_Categories category)
        {
            return dl.ValidateCategory(category);
        }

        public bool ValidateStore(tbl_Stores store)
        {
            return dl.ValidateStore(store);
        }

        public bool ValidateSupplier(tbl_Supplier supplier)
        {
            return dl.ValidateSupplier(supplier);
        }

        public tbl_Users ValidateUserLogin(string userName, string password)
        {
            return dl.ValidateUserLogin(userName, password);
        }

        public bool ValidateUserName(tbl_Users user)
        {
            return dl.ValidateUserName(user);
        }
    }
}
