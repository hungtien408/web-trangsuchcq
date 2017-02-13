<%@ Page Title="" Language="C#" MasterPageFile="~/site-main.master" AutoEventWireup="true" CodeFile="dat-hang.aspx.cs" Inherits="dat_hang" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="site" class="corner">
        <div class="container">
            <a href="~/" runat="server">Trang Chủ</a> <span class="fa fa-chevron-right"></span><span>Đặt hàng</span>
        </div>
    </div>
    <div class="container">
        <div class="wrap-register wrap-dathang w760">
            <div class="register-left">
                <asp:Panel ID="pnlDangNhap" runat="server">
                    <h1 class="tit-tb text-uppercase">Đặt hàng</h1>
                    <div class="register-info">

                        <asp:ListView ID="lstAddressBook" runat="server"
                            DataSourceID="OdsAddressBook" EnableModelValidation="True" DataKeyNames="AddressBookID" OnItemDataBound="lstAddressBook_ItemDataBound">
                            <ItemTemplate>
                                <div class="info-input">
                                    <label class="info-lb">Họ tên<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="txtFullName" CssClass="info-textbox" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                                Display="Dynamic" ValidationGroup="InfoGet" ControlToValidate="txtFullName"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Email<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="txtEmail" CssClass="info-textbox" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                                Display="Dynamic" ValidationGroup="InfoGet" ControlToValidate="txtEmail"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator2"
                                                runat="server" ValidationGroup="InfoGet" ControlToValidate="txtEmail"
                                                ErrorMessage="Sai định dạng email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Địa chỉ<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="txtAddress" CssClass="info-area" runat="server" TextMode="MultiLine" Text='<%# Eval("Address1") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                                Display="Dynamic" ValidationGroup="InfoGet" ControlToValidate="txtAddress"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Tỉnh/ Thành phố<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:DropDownList ID="ddlProvince" AutoPostBack="true" DataSourceID="OdsProvince"
                                                DataTextField="ProvinceName" DataValueField="ProvinceID"
                                                runat="server">
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hdnProvinceID" Value='<%# Eval("ProvinceID")%>' runat="server" />
                                            <asp:ObjectDataSource ID="OdsProvince" runat="server" SelectMethod="ProvinceSelectAll"
                                                TypeName="TLLib.Province">
                                                <SelectParameters>
                                                    <asp:Parameter Name="ProvinceID" Type="String" />
                                                    <asp:Parameter Name="ProvinceName" Type="String" />
                                                    <asp:Parameter Name="ShortName" Type="String" />
                                                    <asp:Parameter Name="CountryID" Type="String" />
                                                    <asp:Parameter Name="Priority" Type="String" />
                                                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Quận/ Huyện<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:DropDownList ID="ddlDistrict" DataSourceID="OdsDistrict" DataTextField="DistrictName"
                                                DataValueField="DistrictID" CssClass="box-select" runat="server">
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hdnDistrictID" Value='<%# Eval("DistrictID")%>' runat="server" />
                                            <asp:ObjectDataSource ID="OdsDistrict" runat="server" SelectMethod="DistrictSelectAll"
                                                TypeName="TLLib.District">
                                                <SelectParameters>
                                                    <asp:Parameter Name="DistrictName" Type="String" />
                                                    <asp:ControlParameter ControlID="ddlProvince" Name="ProvinceIDs" PropertyName="SelectedValue"
                                                        Type="String" />
                                                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                    <asp:Parameter Name="Priority" Type="String" />
                                                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Điện thoại<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="txtPhone" CssClass="info-textbox" runat="server" Text='<%# Eval("HomePhone") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                                Display="Dynamic" ValidationGroup="InfoGet" ControlToValidate="txtPhone"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <div class="info-input">
                            <div class="info-btn">
                                <asp:Button ID="btnDatHangDangNhap" runat="server" CssClass="btn-a" Text="Tiếp tục" OnClick="btnDatHangDangNhap_Click" />
                            </div>
                        </div>
                        <asp:ObjectDataSource ID="OdsAddressBook" runat="server" SelectMethod="AddressBookSelectAll"
                            TypeName="TLLib.AddressBook">
                            <SelectParameters>
                                <asp:Parameter Name="AddressBookID" Type="String" />
                                <asp:Parameter Name="FirstName" Type="String" />
                                <asp:Parameter Name="LastName" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="HomePhone" Type="String" />
                                <asp:Parameter Name="CellPhone" Type="String" />
                                <asp:Parameter Name="Fax" Type="String" />
                                <asp:SessionParameter Name="UserName" SessionField="UserName" DefaultValue="-1" Type="String" />
                                <asp:Parameter Name="Company" Type="String" />
                                <asp:Parameter Name="Address1" Type="String" />
                                <asp:Parameter Name="Address2" Type="String" />
                                <asp:Parameter Name="ZipCode" Type="String" />
                                <asp:Parameter Name="City" Type="String" />
                                <asp:Parameter Name="CountryID" Type="String" />
                                <asp:Parameter Name="ProvinceID" Type="String" />
                                <asp:Parameter Name="DistrictID" Type="String" />
                                <asp:Parameter Name="IsPrimary" Type="String" />
                                <asp:Parameter Name="IsPrimaryBilling" Type="String" />
                                <asp:Parameter Name="IsPrimaryShipping" Type="String" />
                                <asp:Parameter Name="RoleName" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>

                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlKhongDangNhap" runat="server">
                    <h1 class="tit-tb text-uppercase">Đặt hàng không cần đăng nhập</h1>
                    <div class="register-info">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="info-input">
                                    <label class="info-lb">Họ tên<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="txtFullName2" CssClass="info-textbox" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator8" runat="server"
                                                Display="Dynamic" ValidationGroup="InfoGet2" ControlToValidate="txtFullName2"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Email<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="txtEmail2" CssClass="info-textbox" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator9" runat="server"
                                                Display="Dynamic" ValidationGroup="InfoGet2" ControlToValidate="txtEmail2"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator10"
                                                runat="server" ValidationGroup="InfoGet2" ControlToValidate="txtEmail2"
                                                ErrorMessage="Sai định dạng email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Địa chỉ<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="txtAddress2" CssClass="info-area" runat="server" TextMode="MultiLine" Text='<%# Eval("Address1") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator11" runat="server"
                                                Display="Dynamic" ValidationGroup="InfoGet2" ControlToValidate="txtAddress2"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Tỉnh/ Thành phố<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:DropDownList ID="ddlProvince2" AutoPostBack="true" DataSourceID="OdsProvince2"
                                                DataTextField="ProvinceName" DataValueField="ProvinceID"
                                                runat="server">
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hdnProvinceID2" Value='<%# Eval("ProvinceID")%>' runat="server" />
                                            <asp:ObjectDataSource ID="OdsProvince2" runat="server" SelectMethod="ProvinceSelectAll"
                                                TypeName="TLLib.Province">
                                                <SelectParameters>
                                                    <asp:Parameter Name="ProvinceID" Type="String" />
                                                    <asp:Parameter Name="ProvinceName" Type="String" />
                                                    <asp:Parameter Name="ShortName" Type="String" />
                                                    <asp:Parameter Name="CountryID" Type="String" />
                                                    <asp:Parameter Name="Priority" Type="String" />
                                                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Quận/ Huyện<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:DropDownList ID="ddlDistrict2" DataSourceID="OdsDistrict2" DataTextField="DistrictName"
                                                DataValueField="DistrictID" CssClass="box-select" runat="server">
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hdnDistrictID2" Value='<%# Eval("DistrictID")%>' runat="server" />
                                            <asp:ObjectDataSource ID="OdsDistrict2" runat="server" SelectMethod="DistrictSelectAll"
                                                TypeName="TLLib.District">
                                                <SelectParameters>
                                                    <asp:Parameter Name="DistrictName" Type="String" />
                                                    <asp:ControlParameter ControlID="ddlProvince2" Name="ProvinceIDs" PropertyName="SelectedValue"
                                                        Type="String" />
                                                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                    <asp:Parameter Name="Priority" Type="String" />
                                                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Điện thoại<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="txtPhone2" CssClass="info-textbox" runat="server" Text='<%# Eval("HomePhone") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator12" runat="server"
                                                Display="Dynamic" ValidationGroup="InfoGet2" ControlToValidate="txtPhone2"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <div class="info-btn">
                                        <asp:Button ID="btnDatHangKhongDangNhap" runat="server" CssClass="btn-a" ValidationGroup="InfoGet2" Text="Tiếp tục" OnClick="btnDatHangKhongDangNhap_Click" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </asp:Panel>
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
                        <asp:ListView ID="lstCart" runat="server" DataSourceID="odsCart"
                            EnableModelValidation="True" OnDataBound="lstCart_DataBound">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ProductName") %></td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td><span><%# !string.IsNullOrEmpty(Eval("ProductPrice").ToString()) ? (string.Format("{0:##,###.##}", Eval("ProductPrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " <sup>đ</sup>") : "0"%></span></td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsCart" runat="server" SelectMethod="Cart" TypeName="ShoppingCart"></asp:ObjectDataSource>
                    </table>
                </div>
                <div class="tamtinh">
                    <p>
                        Tạm tính: <span>
                            <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnTotalPrice" runat="server" />
                        </span>
                    </p>
                </div>
                <div class="phivanchuyen">
                    <p>
                        Phí vận chuyển: <span>
                            <asp:Label ID="lblShippingPrice" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnShippingPrice" runat="server" />
                        </span>
                    </p>
                </div>
                <div class="phivanchuyen">
                    <p>
                        Giảm giá: <span>
                            <asp:Label ID="lblSavePrice" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnSavePrice" runat="server" />
                        </span>
                    </p>
                </div>
                <div class="code_giamgia">
                    <p>Mã giảm giá</p>
                    <asp:TextBox ID="txtInputVoucher" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="txtInputVoucher_WatermarkExtender" runat="server" Enabled="True"
                        WatermarkText="NHẬP MÃ GIẢM GIÁ" TargetControlID="txtInputVoucher">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CustomValidator ID="validateVoucher" runat="server"
                        Display="Dynamic" CssClass="lb-error"></asp:CustomValidator>
                    <asp:Button ID="btnVoucher" runat="server" Text="Sử dụng" OnClick="btnVoucher_Click" />
                </div>
                <div class="tongtien">
                    <p>
                        Tổng tiền: <span>
                            <asp:Label ID="lblSumTotalPrice" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnSumTotalPrice" runat="server" />
                        </span>
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

