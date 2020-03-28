//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace InventoryStore.DL
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Orders
    {
        public int Order_Id { get; set; }
        public Nullable<int> Product_Id { get; set; }
        public Nullable<int> Items_Count { get; set; }
        public Nullable<decimal> Product_Cost { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public string Bill_No { get; set; }
        public string Customer_Name { get; set; }
        public string Customer_Address { get; set; }
        public string Customer_Phone { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<decimal> Gross_Amount { get; set; }
        public Nullable<decimal> Service_Charge { get; set; }
        public Nullable<decimal> Vat_Charge { get; set; }
        public Nullable<decimal> Discount { get; set; }
        public Nullable<decimal> NetAmount { get; set; }
        public Nullable<int> Paid_Status { get; set; }
        public Nullable<int> User_Id { get; set; }
    
        public virtual tbl_Products tbl_Products { get; set; }
        public virtual tbl_Users tbl_Users { get; set; }
    }
}
