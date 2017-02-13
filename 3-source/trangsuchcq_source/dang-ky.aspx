<%@ Page Title="" Language="C#" MasterPageFile="~/site-main.master" AutoEventWireup="true" CodeFile="dang-ky.aspx.cs" Inherits="dang_ky" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function checkSuccess() {
            if ($(".checksucess :checked").length == 0) {
                alert("Vui lòng chọn đồng ý các điều khoản của GLAM.SPAR");
                return false;
            }
            return true;
        }
    </script>
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
                                <asp:TextBox ID="txtFullNameRegister" CssClass="info-textbox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtFullNameRegister"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Địa chỉ<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtAddressRegister" CssClass="info-area" runat="server" TextMode="MultiLine"
                                    Text=""></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtAddressRegister"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Điện thoại<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtPhoneRegister" CssClass="info-textbox" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtPhoneRegister"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <h2 class="tit-tb">Thông tin tài khoản truy cập</h2>
                    <div class="info-input">
                        <label class="info-lb">
                            Email<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtEmailRegister" CssClass="info-textbox" runat="server" AutoPostBack="True" OnTextChanged="txtEmail_TextChanged"></asp:TextBox>
                                <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator2"
                                    runat="server" ValidationGroup="Register" ControlToValidate="txtEmailRegister"
                                    ErrorMessage="Sai định dạng email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtEmailRegister"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidator2" ValidationGroup="Register" runat="server"
                                    ControlToValidate="txtEmailRegister" Display="Dynamic"></asp:CustomValidator>
                                <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Register" runat="server"
                                    ControlToValidate="txtEmailRegister" Display="Dynamic"></asp:CustomValidator>
                                <asp:Label ID="lblEmailMessage" runat="server" ForeColor="Green"></asp:Label>
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
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator6" runat="server"
                                    Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtPasswordRegister"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator3"
                                    runat="server" ValidationGroup="Register" ControlToValidate="txtPasswordRegister"
                                    ErrorMessage="Vui lòng nhập ít nhất 6 ký tự" ValidationExpression="^.*(?=.{6,}).*$"
                                    Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
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
                                <asp:CompareValidator ID="CompareValidator1" Font-Bold="true" ValidationGroup="Register"
                                    runat="server" ErrorMessage="Xác nhận mật khẩu sai" ControlToCompare="txtPasswordRegister"
                                    ControlToValidate="txtConfirmPassWordRegister" Display="Dynamic" CssClass="lb-error"></asp:CompareValidator>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Mã an toàn<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtVerifyCode" CssClass="info-textbox" runat="server"></asp:TextBox>
                                <asp:RadCaptcha ID="RadCaptcha1" ForeColor="Red" Font-Bold="true" ValidationGroup="Register"
                                    runat="server" ErrorMessage="+ Mã an toàn: không chính xác." ValidatedTextBoxID="txtVerifyCode"
                                    Display="Dynamic" CssClass="captcha">
                                    <CaptchaImage Width="155" RenderImageOnly="True" />
                                </asp:RadCaptcha>
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
                            <asp:Button ID="btnRegister" OnClick="btnRegister_Click" OnClientClick="return checkSuccess()"
                                runat="server" CssClass="btn-a" ValidationGroup="Register" Text="ĐĂNG KÝ" />
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
                                <asp:TextBox ID="txtUserName" CssClass="info-textbox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Mật khẩu<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtPassword" CssClass="info-textbox" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <asp:Label ID="lblErrorLogin" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                    <div class="info-input">
                        <div class="info-btn">
                            <asp:Button ID="LoginButton" CssClass="btn-a" CommandName="Login" runat="server" Text="Đăng nhập" ValidationGroup="LoginUserValidationGroup" OnClick="LoginButton_Click" />
                        </div>
                    </div>
                    <%--<div class="top-dn">
                        <p class="login-other"><span>Hoặc</span></p>
                        <p>
                            <span style="padding-right: 10px;">Đăng nhập bằng</span>
                            <a href="#">
                                <img src="assets/images/dn-fb.png" alt="" /></a>
                            <a href="#">
                                <img src="assets/images/dn-gg.png" alt="" /></a>
                        </p>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

