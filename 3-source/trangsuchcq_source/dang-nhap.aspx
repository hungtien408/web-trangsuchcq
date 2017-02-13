<%@ Page Title="" Language="C#" MasterPageFile="~/site-main.master" AutoEventWireup="true" CodeFile="dang-nhap.aspx.cs" Inherits="dang_ky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="site" class="corner">
        <div class="container">
            <a href="~/" runat="server">Trang chủ</a> <span class="fa fa-angle-right"></span><span>Đăn nhập</span>
        </div>
    </div>
    <div class="container">
        <div class="wrap-register wrap-dathang w760">
            <div class="register-left dangnhap-left">
                <h1 class="tit-tb text-uppercase">Đăng nhập</h1>
                <div class="wrap-form">
                    <div class="register-info login-info">
                        <div class="info-input">
                            <asp:radiobutton id="RadioButton2" runat="server" />
                            Tôi đã có tài khoản tại Lady Fashion<br />
                            <asp:radiobutton id="RadioButton1" runat="server" />
                            Đặt hàng không cần đăng nhập<br />
                            <br />
                        </div>
                        <div class="info-input">
                            <label class="info-lb">
                                Email<span class="error-lb">*</span></label>
                            <div class="info-text">
                                <div class="infow">
                                    <asp:textbox id="TextBox4"
                                        cssclass="info-textbox" runat="server"></asp:textbox>
                                </div>
                            </div>
                        </div>
                        <div class="info-input">
                            <label class="info-lb">
                                Mật khẩu<span class="error-lb">*</span></label>
                            <div class="info-text">
                                <div class="infow">
                                    <asp:textbox id="TextBox5" cssclass="info-textbox" textmode="Password"
                                        runat="server"></asp:textbox>
                                </div>
                            </div>
                        </div>
                        <div class="info-input">
                            <div class="info-btn">
                                <asp:button id="Button1" runat="server" cssclass="btn-a" validationgroup="Register" text="Đăng nhập" />
                            </div>
                        </div>
                        <div class="top-dn">
                            <p class="login-other"><span>Hoặc</span></p>
                            <p>
                                <span style="padding-right: 10px;">Đăng nhập bằng</span>
                                <a href="#">
                                    <img src="assets/images/dn-fb.png" alt="" /></a>
                                <a href="#">
                                    <img src="assets/images/dn-gg.png" alt="" /></a>
                            </p>
                        </div>
                        <div class="top-dn">
                            <p>
                                Bạn chưa có tài khoản?
                        <span><a href="#" class="dk-btn">Đăng ký ngay</a></span>
                            </p>
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
                        <asp:textbox id="TextBox1" cssclass="" runat="server" placeholder=""></asp:textbox>
                        <asp:button id="Button2" runat="server" text="Sử dụng" />
                    </div>
                    <div class="tongtien">
                        <p>Tổng tiền: <span>19.000.000<sup>đ</sup></span></p>
                    </div>
                </div>
        </div>
    </div>
    </div>
</asp:Content>

