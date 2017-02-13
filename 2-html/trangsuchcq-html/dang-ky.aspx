<%@ Page Title="" Language="C#" MasterPageFile="~/site-main.master" AutoEventWireup="true" CodeFile="dang-ky.aspx.cs" Inherits="dang_ky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="site" class="corner">
        <div class="container">
            <a href="~/" runat="server">Trang Chủ</a> <span class="fa fa-chevron-right"></span><span>Đăng ký</span>
        </div>
    </div>
    <div class="container">
        <div class="wrap-register w760">
            <div class="register-left">
                <h1 class="title-2">Đăng ký tài khoản</h1>
                <div class="register-info">
                    <h2 class="tit-tb">Thông tin liên lạc</h2>
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
                            Điện thoại<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtPhone" CssClass="info-textbox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <h2 class="tit-tb">Thông tin tài khoản truy cập</h2>
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
                            Mật khẩu<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtPasswordRegister" CssClass="info-textbox" TextMode="Password"
                                    runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Nhập lại mật khẩu<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtConfirmPassWordRegister" TextMode="Password" CssClass="info-textbox"
                                    runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Mã an toàn<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtVerifyCode" CssClass="info-textbox" runat="server"></asp:TextBox>
                                <%--<asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                        WatermarkText="--Mật khẩu--" TargetControlID="txtConfirmPassWordRegister">
                    </asp:TextBoxWatermarkExtender>
                    <asp:RadCaptcha ID="RadCaptcha1" ForeColor="Red" Font-Bold="true" ValidationGroup="Register"
                        runat="server" ErrorMessage="+ Mã an toàn: không chính xác." ValidatedTextBoxID="txtVerifyCode"
                        Display="Dynamic">
                        <CaptchaImage Width="155" RenderImageOnly="True" />
                    </asp:RadCaptcha>--%>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <div class="info-btn check-text">
                            <p class="w-check">
                                <asp:CheckBox ID="ckbSuccess" runat="server" Text="Tôi đồng ý với các quy định của GLAM.SPAR"
                                    CssClass="check-ok checksucess" />
                            </p>
                        </div>
                    </div>
                    <div class="info-input">
                        <div class="info-btn">
                            <asp:Button ID="btnRegister"
                                runat="server" CssClass="btn-a" ValidationGroup="Register" Text="Đăng ký" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="register-right">
                <h1 class="title-2">Bạn đã có tài khoản ?</h1>
                <div class="register-info">
                    <p class="fsi">Nếu bạn đã đăng ký tài khoản thành viên tại GLAM.SPAR hãy đăng nhập ngay:</p>
                    <div class="info-input">
                        <label class="info-lb">
                            Email<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="TextBox4"
                                    CssClass="info-textbox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Mật khẩu<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="TextBox5" CssClass="info-textbox" TextMode="Password"
                                    runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <div class="info-btn">
                            <asp:Button ID="Button1" runat="server" CssClass="btn-a" ValidationGroup="Register" Text="Đăng nhập" />
                        </div>
                    </div>
                    <div class="top-dn">
                        <p class="login-other"><span>Hoặc</span></p>
                        <p><span style="padding-right: 10px;"> Đăng nhập bằng</span>
                        <a href="#">
                            <img src="assets/images/dn-fb.png" alt="" /></a>
                        <a href="#">
                            <img src="assets/images/dn-gg.png" alt="" /></a>
                            </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

