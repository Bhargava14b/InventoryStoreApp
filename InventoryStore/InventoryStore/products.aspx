<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMaster.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 123%;
            margin-left: auto;
            margin-right: auto;
            padding-left: 1.5rem;
            padding-right: 1.5rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrapper" class="d-flex flex-column">
        <div class="auto-style1">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Manage Products</h1>
            <div style="clear: both; padding: 10px 0px 10px 0px">
                <button type="button" id="btnAddProduct" class="btn-primary">Add Product</button>
                <%--<asp:Button runat="server" ID="btnAddProduct" CssClass="btn-primary" Text="Add Product" OnClick="btnAddProduct_Click" />--%>
            </div>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="table-responsive-sm">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
<th>Product_ID</th>
<th>Product_Name</th>
<th>SKU</th>
<th>Supplier_Id</th>
<th>Category_Id</th>
<th>Brand_Id</th>
<th>Store_Id</th>
<th>Product_Description</th>
<th>Product_Quantity</th>
<th>Price</th>
<th>ExpiryDate</th>
<th>Availability</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                                                       <td>
                                        <button class="btn btn-primary">Edit</button>
                                        <button class="btn btn-danger">Delete</button>
                                    </td>
                                </tr>
                                

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            loadProducts();

            $("#btnAddProduct").click(function () {
                window.location.href = "AddProduct.aspx";
            });

            function loadProducts() {
                $.ajax({
                    type: "POST",
                    url: '<%= ResolveUrl("Products.aspx/GetProducts") %>',
                    data: {},
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    },
                    success: function (result) {
                        $("#dataTable tbody").html("");
                        if (result && result.d && result.d.length > 0) {
                            for (var i = 0; i < result.d.length; i++) {
                                $("#dataTable tbody").append("<tr><td>" + result.d[i].Product_ID + "</td><td>" +
result.d[i].Product_Name + "</td><td>" +result.d[i].SKU + "</td><td>" +result.d[i].Supplier_Id + "</td><td>" +
result.d[i].Category_Id + "</td><td>" +result.d[i].Brand_Id + "</td><td>" +result.d[i].Store_Id + "</td><td>" +
result.d[i].Product_Description + "</td><td>" +result.d[i].Product_Quantity + "</td><td>" +
result.d[i].Price + "</td><td>" +result.d[i].ExpiryDate + "</td><td>" +(result.d[i].Availability ? "Active" : "Inactive") + "</td>" +

                                    "<td><button class='btn btn-primary btn-Show-Save' onclick='openSaveModal(" + result.d[i].Brand_Id + ",this);' btn-save-model='" + JSON.stringify(result.d[i]) + "'>Edit</button>&nbsp" +
                                    "<button class='btn btn-danger btn-Show-delete' onclick='openDeleteConfirmation(" + result.d[i].Brand_Id + ");'> Delete</button ></td></tr>");
                                                               
                                
                                
                                
                            }
                        }
                        else {
                            $("#dataTable tbody").append('<tr><td colspan="3">No records found!</td><td>');
                        }
                        $('#dataTable').DataTable();
                        //alert("We returned: " + JSON.stringify(result));
                    }
                });
            }
});
    </script>
</asp:Content>

