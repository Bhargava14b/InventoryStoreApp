<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMaster.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="InventoryStore.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrapper" class="d-flex flex-column">
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Manage Users</h1>
            <div style="clear: both; padding: 10px 0px 10px 0px">
                <button class="btn-primary" type="button">Add User</button>
            </div>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        <%--<asp:Table ID="dataTable" runat="server" CssClass="table table-bordered">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell>First Name</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Last Name</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Gender</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Phone</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                        </asp:Table>--%>
                        <asp:GridView ID="dataTable" runat="server" AutoGenerateColumns="false" DataKeyNames="User_Id" CssClass="table table-bordered"
                             OnRowCommand="dataTable_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button Text="Edit" CssClass="btn-primary" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <%--<table class="table table-bordered" runat="server" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Gender</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $('#<%= dataTable.ClientID %>').DataTable();

            //$.ajax({
            //    type: "GET",
            //    url: "Users.aspx/GetdUsers",
            //    data: '',
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (response) {
            //        alert(JSON.stringify(response));
            //        $('#dataTable').DataTable();
            //    },
            //    failure: function (response) {
            //        alert(response.d);
            //    }
            //});
        });

    </script>
</asp:Content>
