﻿<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="hoan-thanh-dat-hang.aspx.cs" Inherits="hoan_thanh_dat_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="hoanthanh-dathang">
            <h2>Đặt hàng thành công</h2>
            <p>Quý khách vừa đặt thành công sản phẩm của LADYfashion, mã đơn hàng của quý khách là: <b><%= Session["OrderNumber"].ToString() %></b>.
            <div class="tieptuc">
                <a href="~/" runat="server">Tiếp tục mua sắm</a>
            </div>
        </div>
    </div>
</asp:Content>
