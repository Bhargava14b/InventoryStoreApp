
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
    
public partial class tbl_Supplier
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public tbl_Supplier()
    {

        this.tbl_Products = new HashSet<tbl_Products>();

    }


    public int Supplier_Id { get; set; }

    public string Supplier_Name { get; set; }

    public string Service_Charge_Value { get; set; }

    public string Vat_Charge_Value { get; set; }

    public string Address { get; set; }

    public string Phone { get; set; }

    public string Country { get; set; }

    public string Message { get; set; }

    public string Currency { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<tbl_Products> tbl_Products { get; set; }

}

}
