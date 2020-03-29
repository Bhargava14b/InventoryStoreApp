using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryStore.DL
{
    interface IInventoryStore
    {
        dynamic GetDashboardDetails();

        List<tbl_Brands> GetBrands();

        bool ValidateBrand(tbl_Brands brand);

        bool SaveBrand(tbl_Brands brand);

        bool DeleteBrand(int id);

        List<tbl_Categories> GetCategories();

        bool ValidateCategory(tbl_Categories category);

        bool SaveCategory(tbl_Categories category);

        List<tbl_Stores> GetStores();

        bool ValidateStore(tbl_Stores store);

        bool SaveStore(tbl_Stores store);

        List<tbl_Supplier> GetSuppliers();

        bool ValidateSupplier(tbl_Supplier supplier);

        bool SaveSupplier(tbl_Supplier supplier);

        List<tbl_Users> GetUsers();

        bool ValidateUserName(tbl_Users user);

        bool SaveUser(tbl_Users user);

        tbl_Users ValidateUserLogin(string userName, string password);
    }
}
