<%@ Page Title="" Language="C#" MasterPageFile="~/site-main.master" AutoEventWireup="true" CodeFile="dat-hang.aspx.cs" Inherits="dat_hang" %>

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
            <div class="register-left">
                <h1 class="tit-tb text-uppercase">Đặt hàng không cần đăng nhập</h1>
                <div class="register-info">
                    <div class="info-input">
                        <label class="info-lb">Họ tên<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtFullName" CssClass="info-textbox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Email<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtEmailRegister"
                                    CssClass="info-textbox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Địa chỉ<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtAddress" CssClass="info-area" runat="server" TextMode="MultiLine"
                                    Text=""></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Tỉnh/ Thành phố<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:DropDownList ID="DropDownList2" CssClass="selectb" runat="server">
                                    <asp:ListItem>Tp Hồ Chí Minh</asp:ListItem>
                                    <asp:ListItem>Tiền Giang</asp:ListItem>
                                    <asp:ListItem>Long An</asp:ListItem>
                                    <asp:ListItem>Bến Tre</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Quận/ Huyện<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:DropDownList ID="DropDownList1" CssClass="selectb" runat="server">
                                    <asp:ListItem>Tp Hồ Chí Minh</asp:ListItem>
                                    <asp:ListItem>Tiền Giang</asp:ListItem>
                                    <asp:ListItem>Long An</asp:ListItem>
                                    <asp:ListItem>Bến Tre</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Điện thoại<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtPhone" CssClass="info-textbox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <div class="info-btn">
                            <asp:Button ID="btnDatHang" runat="server" CssClass="btn-a" Text="Tiếp tục" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="register-right">
                <h1 class="tit-tb text-uppercase title-donhang">Thông tin đơn hàng</h1>
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
                    <asp:TextBox ID="TextBox4" CssClass="" runat="server" placeholder=""></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Sử dụng" />
                </div>
                <div class="tongtien">
                    <p>Tổng tiền: <span>19.000.000<sup>đ</sup></span></p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

