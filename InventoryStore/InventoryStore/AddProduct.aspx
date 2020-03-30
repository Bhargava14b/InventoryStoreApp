﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMaster.master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="InventoryStore.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrapper" class="d-flex flex-column">
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Add Product</h1>
            <div class="card shadow mb-4">
                <div class="card-body">
                    <form runat="server" id="fromAddProduct">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="validationTooltip01">Product name</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ID="txtProductName"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="validationTooltip02">SKU</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ID="txtSKU"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="validationTooltip01">Supplier</label>
                                <asp:DropDownList runat="server" required CssClass="form-control" ID="ddlSupplier"></asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label for="validationTooltip01">Category</label>
                                <asp:DropDownList runat="server" required CssClass="form-control" ID="ddlCategory"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="validationTooltip01">Brand</label>
                                <asp:DropDownList runat="server" required CssClass="form-control" ID="ddlBrand"></asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label for="validationTooltip01">Store</label>
                                <asp:DropDownList runat="server" required CssClass="form-control" ID="ddlStore"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12">
                                <label for="validationTooltip01">Description</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ID="txtDescription"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="validationTooltip01">Quantity</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ID="txtQuantity" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="validationTooltip01">Price</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ID="txtPrice" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="validationTooltip01">Expiry Date</label>
                                <asp:TextBox runat="server" required CssClass="form-control" ID="txtExpiryDate" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="validationTooltip01">Active</label>
                                <asp:DropDownList runat="server" required CssClass="form-control" ID="ddlActive">
                                    <asp:ListItem Value="true">Active</asp:ListItem>
                                    <asp:ListItem Value="false">Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <asp:Button runat="server" Text="Save" ID="btnSaveProduct" OnClick="btnSaveProduct_Click" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
