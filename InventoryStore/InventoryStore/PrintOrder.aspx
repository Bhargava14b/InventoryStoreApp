﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMaster.master" AutoEventWireup="true" CodeBehind="PrintOrder.aspx.cs" Inherits="InventoryStore.PrintOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrapper" class="d-flex flex-column">
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Inventary Store - Order Invoice</h1>
            <div class="card shadow mb-4" style="margin-bottom: 0px !important;">
                <div class="card-body">
                    <form runat="server" id="fromAddOrder">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label>Customer Name</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ReadOnly="true" ID="txtCustName"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Phone</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ReadOnly="true" ID="txtCustPhone"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12">
                                <label>Address</label>
                                <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtAddress"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <label>Product</label>
                                <asp:DropDownList runat="server" required CssClass="form-control" ReadOnly="true" AutoPostBack="true" ID="ddlProducts" OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label>Number Of items</label>
                                <asp:DropDownList runat="server" required CssClass="form-control" AutoPostBack="true" ReadOnly="true" ID="ddlNumberOfItems" OnSelectedIndexChanged="ddlNumberOfItems_SelectedIndexChanged">
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <label>Product Cost</label>
                                <asp:TextBox runat="server" TextMode="Number" required CssClass="form-control" ID="txtCost" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Amount</label>
                                <asp:TextBox runat="server" TextMode="Number" required CssClass="form-control" ID="txtAmount" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <label>Gross Amount</label>
                                <asp:TextBox runat="server" TextMode="Number" required CssClass="form-control" ID="txtGrossAmount" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Service Charge</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ID="txtServiceCharge" TextMode="Number" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <label>Vat</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ID="txtVat" TextMode="Number" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Net Amount</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ID="txtNetAmount" TextMode="Number" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <%--<div class="form-row" id="dvPrintBtn">
                            <div class="col-md-12">
                                <button type="button" class="btn btn-primary" id="btnPrintInvoice" onclick="printInvoice()">Print</button>
                            </div>
                        </div>--%>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex flex-column">
        <div class="container-fluid">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="row" id="dvPrintBtn1" style="text-align: right;">
                        <div class="col-md-12">
                            <button type="button" class="btn btn-primary" id="btnPrintInvoice1" onclick="printInvoice()">Print</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .card-body label {
            padding-top: 15px;
        }
    </style>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        function printInvoice() {
            var printContents = document.getElementById('content-wrapper').innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
        $(document).ready(function () {
            var printContents = document.getElementById('content-wrapper').innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            //printInvoice();

            $("#btnPrintInvoice").click(function () {
                $("#dvPrintBtn").hide();
                printInvoice();
                $("#dvPrintBtn").show();
            });
        });
    </script>
</asp:Content>