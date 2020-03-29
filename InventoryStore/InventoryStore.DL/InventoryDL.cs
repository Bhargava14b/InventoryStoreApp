using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryStore.DL
{
    public class InventoryDL
    {
        private InventoryStoreEntityConnection dbContext = new InventoryStoreEntityConnection();

        public dynamic GetDashboardDetails()
        {
            try
            {
                int activeBrandsCount = dbContext.tbl_Brands.Where(x => x.Brand_Status == true).Count();
                int activeCategoriesCount = dbContext.tbl_Categories.Where(x => x.Category_Status == true).Count();
                int activeStoresCount = dbContext.tbl_Stores.Where(x => x.Store_Status == true).Count();
                int orderCount = dbContext.tbl_Orders.Count();
                return new
                {
                    BrandsCount = activeBrandsCount,
                    CategoriesCount = activeCategoriesCount,
                    StoresCount = activeStoresCount,
                    OrdersCount = orderCount
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<tbl_Brands> GetBrands()
        {
            try
            {
                return dbContext.tbl_Brands.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ValidateBrand(tbl_Brands brand)
        {
            try
            {
                if (brand.Brand_Id > 0)
                    return dbContext.tbl_Brands.Any(x => x.Brand_Name == brand.Brand_Name && x.Brand_Id != brand.Brand_Id);
                else
                    return dbContext.tbl_Brands.Any(x => x.Brand_Name == brand.Brand_Name);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool SaveBrand(tbl_Brands brand)
        {
            try
            {
                if (brand.Brand_Id > 0)
                {
                    var exBrand = dbContext.tbl_Brands.FirstOrDefault(x => x.Brand_Id == brand.Brand_Id);
                    if (exBrand != null)
                    {
                        exBrand.Brand_Name = brand.Brand_Name;
                        exBrand.Brand_Status = brand.Brand_Status;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    dbContext.tbl_Brands.Add(new tbl_Brands() { Brand_Name = brand.Brand_Name, Brand_Status = brand.Brand_Status });
                }
                dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool DeleteBrand(int id)
        {
            try
            {
                var exBrand = dbContext.tbl_Brands.FirstOrDefault(x => x.Brand_Id == id);
                if (exBrand != null)
                {
                    dbContext.tbl_Brands.Remove(exBrand);
                    dbContext.SaveChanges();
                }
                else
                {
                    return false;
                }

                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<tbl_Categories> GetCategories()
        {
            try
            {
                return dbContext.tbl_Categories.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ValidateCategory(tbl_Categories category)
        {
            try
            {
                if (category.Category_Id > 0)
                    return dbContext.tbl_Categories.Any(x => x.Category_Name == category.Category_Name && x.Category_Id != category.Category_Id);
                else
                    return dbContext.tbl_Categories.Any(x => x.Category_Name == category.Category_Name);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool SaveCategory(tbl_Categories category)
        {
            try
            {
                dbContext.tbl_Categories.Add(category);
                dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<tbl_Stores> GetStores()
        {
            try
            {
                return dbContext.tbl_Stores.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ValidateStore(tbl_Stores store)
        {
            try
            {
                if (store.Store_Id > 0)
                    return dbContext.tbl_Stores.Any(x => x.Store_Name == store.Store_Name && x.Store_Id != store.Store_Id);
                else
                    return dbContext.tbl_Stores.Any(x => x.Store_Name == store.Store_Name);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool SaveStore(tbl_Stores store)
        {
            try
            {
                dbContext.tbl_Stores.Add(store);
                dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<tbl_Supplier> GetSuppliers()
        {
            try
            {
                return dbContext.tbl_Supplier.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ValidateSupplier(tbl_Supplier supplier)
        {
            try
            {
                if (supplier.Supplier_Id > 0)
                    return dbContext.tbl_Supplier.Any(x => x.Supplier_Name == supplier.Supplier_Name && x.Supplier_Id != supplier.Supplier_Id);
                else
                    return dbContext.tbl_Supplier.Any(x => x.Supplier_Name == supplier.Supplier_Name);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool SaveSupplier(tbl_Supplier supplier)
        {
            try
            {
                dbContext.tbl_Supplier.Add(supplier);
                dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Users

        public List<tbl_Users> GetUsers()
        {
            try
            {
                return dbContext.tbl_Users.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ValidateUserName(tbl_Users user)
        {
            try
            {
                return dbContext.tbl_Users.Any(x => x.User_Name == user.User_Name);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SaveUser(tbl_Users user)
        {
            try
            {
                //For staff default password
                if (user.Group_Id == 2)
                {
                    user.Password = "Password@123";
                }
                dbContext.tbl_Users.Add(user);
                dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public tbl_Users ValidateUserLogin(string userName, string password)
        {
            tbl_Users user;
            try
            {
                user = dbContext.tbl_Users.FirstOrDefault(x => x.User_Name == userName && x.Password == password);
                return user;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }
}
