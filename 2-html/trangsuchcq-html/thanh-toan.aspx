<%@ Page Title="" Language="C#" MasterPageFile="~/site-main.master" AutoEventWireup="true" CodeFile="thanh-toan.aspx.cs" Inherits="dat_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="site" class="corner">
        <div class="container">
            <a href="~/" runat="server">Trang Chủ</a> <span class="fa fa-chevron-right"></span><a href="#">Đá quý</a> <span class="fa fa-chevron-right"></span><a href="#">Bộ sản phẩm Ruby vàng trắng 14K</a> <span class="fa fa-chevron-right"></span><a href="#">Giỏ hàng</a> <span class="fa fa-chevron-right"></span><span>Thanh toán</span>
        </div>
    </div>
    <div class="container">
        <div class="wrap-register wrap-dathang w760">
            <div class="register-left thanhtoan-left">
                <h1 class="tit-tb text-uppercase">Thanh toán & Vận chuyển</h1>
                <div class="wrap-form">
                    <div class="vc-top">
                        <h2 class="tit-tb">Phương thức vận chuyển</h2>
                        <p>• <span style="color: red;">Miễn phí</span> vận chuyển và phí bảo hiểm cho đơn hàng trên 200.000 đ </p>
                        <p>• Thời gian giao hàng: </p>
                        <p>
                            - Tối đa 2 ngày trong khu vực nội thành TP.HCM, Hà Nội, Đà Nẵng.<br />
                            - Từ 2 - 4 ngày cho các Tỉnh Thành khác.
                        </p>
                    </div>
                    <div class="vc-bot">
                        <h2 class="tit-tb">Phương thức thanh toán</h2>
                        <asp:radiobutton id="RadioButton2" runat="server" />
                        Trả bằng tiền mặt khi nhận hàng<br />
                        <asp:radiobutton id="RadioButton1" runat="server" />
                        Chuyển khoản Ngân Hàng<br /><br />
                        <p style="font-weight:bold;">Chủ tài khoản:Công ty Cổ Phần Vàng Bạc Đá Quý Phú Nhuận</p>
                        <p>NH Á Châu - ACB : 1036868</p>
                        <p>Vietcombank : 0071. 00000.8313</p>
                        <p>Sacombank: 0600.1576.0292</p>
                    </div>
                    <div class="info-input">
                        <div class="info-btn">
                            <asp:Button ID="btnDatHang" runat="server" CssClass="btn-a" Text="Đặt hàng" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="register-right">
                <h1 class="tit-tb text-uppercase title-donhang">Thông tin đơn hàng</h1>
                <div class="wrap-form">
                    <div class="register-info">
                        <table class="tb-cart">
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                            </tr>
                            <tr>
                                <td>Bộ sản phẩm Ruby Vàng 18K</td>
                                <td>1</td>
                                <td><span>9.500.000<sup>đ</sup></span></td>
                            </tr>
                            <tr>
                                <td>Bộ sản phẩm Ruby Vàng 18K</td>
                                <td>1</td>
                                <td><span>9.500.000<sup>đ</sup></span></td>
                            </tr>
                        </table>
                    </div>
                    <div class="tamtinh">
                        <p>Tạm tính: <span>19.000.000<sup>đ</sup></span></p>
                    </div>
                    <div class="phivanchuyen">
                        <p>Phí vận chuyển: <span>0<sup>đ</sup></span></p>
                    </div>
                    <div class="phivanchuyen">
                        <p>Giảm giá: <span>0<sup>đ</sup></span></p>
                    </div>
                    <div class="code_giamgia">
                        <p>Mã giảm giá</p>
                        <asp:textbox id="TextBox4" cssclass="" runat="server" placeholder=""></asp:textbox>
                        <asp:button id="Button1" runat="server" text="Sử dụng" />
                    </div>
                    <div class="tongtien">
                        <p>Tổng tiền: <span>19.000.000<sup>đ</sup></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

