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
    <div id="content-wrapper" style="overflow: auto !important;" class="d-flex flex-column">
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
                                    <%--<th>Supplier</th>--%>
                                    <%--<th>Category</th>--%>
                                    <%--<th>Brand</th>--%>
                                    <%--<th>Store</th>--%>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Expiry Date</th>
                                    <th>Availability</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
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
                addEditProduct(0);
            });

            function addEditProduct(productId) {
                window.location.href = '<%= ResolveUrl("AddProduct.aspx") %>' + '?ProductId=' + productId;
            }

            function loadProducts() {
                $.ajax({
                    type: "POST",
                    url: '<%= ResolveUrl("Products.aspx/GetProducts") %>',
                    data: JSON.stringify({ productId: 0 }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    },
                    success: function (result) {
                        $("#dataTable tbody").html("");
                        if (result && result.d && result.d.length > 0) {
                            for (var i = 0; i < result.d.length; i++) {
                                $("#dataTable tbody").append("<tr>" +
                                    "<td>" + result.d[i].Product_Name + "</td>" +
                                    //"<td>" + result.d[i].Supplier_Name + "</td>" +
                                    //"<td>" + result.d[i].Category_Name + "</td>" +
                                    //"<td>" + result.d[i].Brand_Name + "</td>" +
                                    //"<td>" + result.d[i].Store_Name + "</td>" +
                                    "<td>" + result.d[i].Product_Quantity + "</td>" +
                                    "<td>" + result.d[i].Price + "</td>" +
                                    "<td>" + result.d[i].ExpiryDate + "</td>" +
                                    "<td>" + (result.d[i].Availability ? "Active" : "Inactive") + "</td>" +
                                    "<td><button class='btn btn-primary btn-Show-Save' onclick='addEditProduct(" + result.d[i].Product_ID + ");' btn-save-model='" + JSON.stringify(result.d[i]) + "'>Edit</button>&nbsp" +
                                    "<button class='btn btn-danger btn-Show-delete' onclick='openDeleteConfirmation(" + result.d[i].Product_ID + ");'> Delete</button ></td></tr>");
                            }
                        }
                        else {
                            $("#dataTable tbody").append('<tr><td colspan="12">No records found!</td><td>');
                        }
                        $('#dataTable').DataTable();
                        //alert("We returned: " + JSON.stringify(result));
                    }
                });
            }
        });
    </script>
</asp:Content>

