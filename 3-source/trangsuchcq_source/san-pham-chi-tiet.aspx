<%@ Page Title="" Language="C#" MasterPageFile="~/site-main.master" AutoEventWireup="true" CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        function checkQuantitySize() {
            //alert($("[id$='ddlQuantity']").val());
            if ($("[id$='inQuantity']").val() == "0" || $("[id$='inQuantity']").val() == "") {
                alert("Bạn chưa chọn Số Lượng");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnSanPhamDetails" runat="server" />
    <a class="a-link-spct" href="<%= hdnSanPhamDetails.Value %>"></a>
    <div class="slide-df">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <%--<ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>--%>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <asp:ListView ID="lstBanner2" runat="server"
                    DataSourceID="odsBanner" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class='<%# (Container.DataItemIndex) == 0 ? "item active" : "item" %>'>
                            <img alt='<%# Eval("FileName") %>' src='<%# "~/res/advertisement/" + Eval("FileName") %>'
                                visible='<%# string.IsNullOrEmpty(Eval("FileName").ToString()) ? false : true %>' runat="server" />
                            <div class="carousel-caption">
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsBanner" runat="server"
                    SelectMethod="AdsBannerSelectAll"
                    TypeName="TLLib.AdsBanner">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter DefaultValue="6" Name="AdsCategoryID" Type="String" />
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="Website" Type="String" />
                        <asp:Parameter Name="FromDate" Type="String" />
                        <asp:Parameter Name="ToDate" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div class="clr"></div>
    <div class="site">
        <div class="container">
            <a href="~/" runat="server">Trang chủ</a> <span class="fa fa-angle-right"></span><a href="product.aspx">Sản phẩm</a> <span class="fa fa-angle-right"></span><span>Sản phẩm chi tiết</span>
        </div>
    </div>
    <div class="container">
        <asp:ListView ID="lstProductDetail" runat="server" DataSourceID="odsProductDetail"
            EnableModelValidation="True" OnItemCommand="lstProductDetail_ItemCommand">
            <ItemTemplate>
                <div class="product-detail-main">
                    <div class="product-left">
                        <div id="sliderGallery" class="gallery-slider">
                            <div class="slider-for">
                                <asp:ListView ID="lstImageBig" runat="server" DataSourceID="odsProductAlbum"
                                    EnableModelValidation="True">
                                    <ItemTemplate>
                                        <div class="slider-big">
                                            <div class="gallery-group">
                                                <div class="gallery-img">
                                                    <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/album/" + Eval("ImageName") %>'
                                                        visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                        runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <span runat="server" id="itemPlaceholder" />
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsProductAlbum" runat="server" SelectMethod="ProductImageSelectAll"
                                    TypeName="TLLib.ProductImage">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="pi" Name="ProductID" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div class="gallery-smalls">
                                <div class="slider-nav">
                                    <asp:ListView ID="lstImageSmall" runat="server" DataSourceID="odsProductAlbum"
                                        EnableModelValidation="True">
                                        <ItemTemplate>
                                            <div class="slider-small">
                                                <div class="gallery-small">
                                                    <div class="small-box">
                                                        <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/album/" + Eval("ImageName") %>'
                                                            visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                            runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <span runat="server" id="itemPlaceholder" />
                                        </LayoutTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-right">
                        <h1><%# Eval("ProductName") %></h1>
                        <div class="product-code">
                            Mã sản phẩm: <span><%# Eval("Tag") %></span>
                        </div>
                        <p><%# Eval("Description") %></p>
                        <p class="price"><%# !string.IsNullOrEmpty(Eval("Price").ToString()) ? (string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " <sup>đ</sup>") : "0"%> <span><%# !string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? (string.Format("{0:##,###.##}", Eval("SavePrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " <sup>đ</sup>") : "0"%></span></p>
                        <div class="number">
                            Số lượng:
                            <div class="sp-quantity">
                                <div class="sp-btn" id="sp-minus" data-id="sp-minus">-</div>
                                <div class="sp-input">
                                    <%--<input type="text" class="quntity-input" value="0" disabled="disabled">--%>
                                    <asp:TextBox ID="inQuantity" CssClass="quntity-input" runat="server" Text="0"></asp:TextBox>
                                    <asp:HiddenField ID="hdnIsQuantity" runat="server" />
                                </div>
                                <div class="sp-btn" id="sp-plus" data-id="sp-plus">+</div>
                            </div>
                        </div>
                        <asp:HiddenField ID="hdnProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                        <asp:HiddenField ID="hdnImageName" Value='<%# Eval("ImageName") %>' runat="server" />
                        <asp:HiddenField ID="hdnProductCode" Value='<%# Eval("Tag") %>' runat="server" />
                        <asp:HiddenField ID="hdnProductCategory" Value='<%# Eval("CategoryID") %>' runat="server" />
                        <asp:HiddenField ID="hdnPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                            runat="server" />
                        <asp:HiddenField ID="hdnSavePrice" Value='<%# string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? "0" : Eval("SavePrice") %>'
                            runat="server" />
                        <asp:Label ID="lblProductName" Visible="False" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        <asp:Label ID="lblProductNameEn" Visible="False" runat="server" Text='<%# Eval("ProductNameEn") %>'></asp:Label>
                        <div class="btn-in-cart">
                            <asp:LinkButton ID="lkbAddToCart" runat="server" OnClientClick="return checkQuantitySize()"
                                CommandName="AddToCart">Thêm vào giỏ</asp:LinkButton>
                            <asp:LinkButton ID="lnkBook" runat="server" OnClientClick="return checkQuantitySize()"
                                CommandName="BookProduct">Mua ngay</asp:LinkButton>
                        </div>
                        <%--<img src="assets/images/like-fb.png" alt="" class="like-fb">--%>
                        <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-layout="standard" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
                        <%--<div class="fb-like" data-href='<%# "http://www.fruityflowers.net/san-pham.aspx#" + Eval("ProductID") %>'
                                data-send="false" data-layout="button_count" data-width="50" data-show-faces="true">
                            </div>--%>
                    </div>
                </div>
                <div class="product-detail-left">
                    <div class="bot-sp">
                        <div class="id-wrap-main mgb-20">
                            <div class="id-product">
                                <h4>Thông tin sản phẩm</h4>
                            </div>
                        </div>
                        <div class="wrap-content-sp">
                            <%# Eval("InfoProduct") %>
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="bot-sp">
                        <div class="id-wrap-main mgb-20">
                            <div class="id-product">
                                <h4>Mô tả sản phẩm</h4>
                            </div>
                        </div>
                        <div class="wrap-content-sp">
                            <%# Eval("Content") %>
                        </div>
                        <div class="clr"></div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsProductDetail" runat="server" SelectMethod="ProductSelectOne"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="product-detail-right">
            <div class="aside-all">
                <div class="tite-aside">
                    <h1>SẢN PHẨM CÙNG LOẠI</h1>
                </div>
                <div class="product-same">
                    <div class="silderProductSame">
                        <asp:ListView ID="lstProductSame" runat="server" DataSourceID="odsProductSame"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="slide">
                                    <div class="item">
                                        <div class="wrap-item">
                                            <div class="it-img">
                                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                    <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                        visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                        runat="server" />
                                                </a>
                                            </div>
                                            <div class="it-content">
                                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'><%# Eval("ProductName") %></a>
                                                <p class="pro-code">Mã SP : <%# Eval("Tag") %></p>
                                                <span><%# !string.IsNullOrEmpty(Eval("Price").ToString()) ? (string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " <sup>đ</sup>") : "0"%></span>
                                            </div>
                                            <div class="chitiet">
                                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsProductSame" runat="server" SelectMethod="ProductSameSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="10" Name="RerultCount" Type="String" />
                                <asp:QueryStringParameter DefaultValue="" Name="ProductID" QueryStringField="pi" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

