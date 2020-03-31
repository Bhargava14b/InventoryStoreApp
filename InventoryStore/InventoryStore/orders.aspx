<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMaster.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrapper" class="d-flex flex-column">
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Manage Orders</h1>
            <div style="clear: both; padding: 10px 0px 10px 0px">
                <button type="button" id="btnAddOrder" class="btn-primary">Add Order</button>
            </div>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Amount</th>
                                    <th>Net Amount</th>
                                    <th>Service Charge</th>
                                    <th>Vat</th>
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
            loadOrders();

            function loadOrders() {
                $.ajax({
                    type: "POST",
                    url: '<%= ResolveUrl("Orders.aspx/GetOrders") %>',
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
                                $("#dataTable tbody").append("<tr>" +
                                    "<td>" + result.d[i].Customer_Name + "</td>" +
                                    "<td>" + result.d[i].tbl_Products.Product_Name + "</td>" +
                                    "<td>" + result.d[i].Items_Count + "</td>" +
                                    "<td>" + result.d[i].NetAmount + "</td>" +
                                    "<td>" + result.d[i].Service_Charge + "</td>" +
                                    "<td>" + result.d[i].Vat_Charge + "</td>" +
                                    "<td><button class='btn btn-danger btn-Show-delete' onclick='openDeleteConfirmation(" + result.d[i].Order_Id + ");'>Delete</button></td></tr>");
                            }
                            $('#dataTable').DataTable();
                        }
                        else {
                            $("#dataTable tbody").append('<tr><td colspan="7">No records found!</td><td>');
                        }
                        //alert("We returned: " + JSON.stringify(result));
                    }
                });
            }

            $("#btnAddOrder").click(function () {
                window.location.href = '<%= ResolveUrl("AddOrder.aspx") %>';
            });

        });
    </script>
</asp:Content>

