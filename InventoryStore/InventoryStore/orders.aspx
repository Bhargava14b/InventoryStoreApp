<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMaster.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrapper" class="d-flex flex-column">
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Manage Orders</h1>
            <div style="clear: both; padding: 10px 0px 10px 0px">
                <asp:Button runat="server" ID="btnAddOrder" CssClass="btn-primary" Text="Add Order" OnClick="btnAddOrder_Click" />
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
                                    <th>Gross Amount</th>
                                    <th>Service Charge</th>
                                    <th>Vat</th>
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
                                //$("#dataTable tbody").append("<tr><td>" + result.d[i].Order_Name + "</td><td>" + (result.d[i].Brand_Status ? "Active" : "Inactive") + "</td>" +
                                //    "<td><button class='btn btn-primary btn-Show-Save' onclick='openSaveModal(" + result.d[i].Brand_Id + ",this);' btn-save-model='" + JSON.stringify(result.d[i]) + "'>Edit</button>&nbsp" +
                                //    "<button class='btn btn-danger btn-Show-delete' onclick='openDeleteConfirmation(" + result.d[i].Brand_Id + ");'> Delete</button ></td></tr>");
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

