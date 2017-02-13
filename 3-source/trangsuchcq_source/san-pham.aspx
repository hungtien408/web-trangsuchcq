<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="san-pham.aspx.cs" Inherits="cau_hoi_thuong_gap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphSite" runat="Server">
    <asp:HiddenField ID="hdnSanPham" runat="server" />
    <a class="a-link-sp" href="<%= hdnSanPham.Value %>"></a>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <h3 class="text-uppercase">Tìm nhanh:</h3>
        <ul class="search-sp">
            <li><a href="#">Giới tính<span class="icon-right fa fa-caret-down"></span></a>
                <asp:ListView ID="lstProductGender" runat="server" DataSourceID="odsProductGender"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <li><a href='<%# "tim-kiem.aspx?sex=" + Eval("ProductGenderID") %>'><%# Eval("ProductGenderName") %></a></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductGender" runat="server" SelectMethod="ProductGenderSelectAll" TypeName="TLLib.ProductGender">
                    <SelectParameters>
                        <asp:Parameter Name="ProductGenderName" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        <asp:Parameter Name="ProductID" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </li>
            <li><a href="#">Chất liệu<span class="icon-right fa fa-caret-down"></span></a>
                <asp:ListView ID="lstProductMaterial" runat="server" DataSourceID="odsProductMaterial"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <li><a href='<%# "tim-kiem.aspx?mar=" + Eval("ProductMaterialID") %>'><%# Eval("ProductMaterialName") %></a></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductMaterial" runat="server" SelectMethod="ProductMaterialSelectAll" TypeName="TLLib.ProductMaterial">
                    <SelectParameters>
                        <asp:Parameter Name="ProductMaterialName" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        <asp:Parameter Name="ProductID" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </li>
            <li><a href="#">Màu chất liệu<span class="icon-right fa fa-caret-down"></span></a>
                <asp:ListView ID="lstProductMaterialColor" runat="server" DataSourceID="odsProductMaterialColor"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <li><a href='<%# "tim-kiem.aspx?marc=" + Eval("ProductMaterialColorID") %>'><%# Eval("ProductMaterialColorName") %></a></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductMaterialColor" runat="server" SelectMethod="ProductMaterialColorSelectAll" TypeName="TLLib.ProductMaterialColor">
                    <SelectParameters>
                        <asp:Parameter Name="ProductMaterialColorName" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        <asp:Parameter Name="ProductID" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </li>
            <li><a href="#">Giá<span class="icon-right fa fa-caret-down"></span></a>
                <ul>
                    <li><a href="tim-kiem.aspx?pf=0&pt=299999"><span>0<sup>đ</sup></span> - <span>299.999<sup>đ</sup></span></a></li>
                    <li><a href="tim-kiem.aspx?pf=300000&pt=499999"><span>300.000<sup>đ</sup></span> - <span>499.999<sup>đ</sup></span></a></li>
                    <li><a href="tim-kiem.aspx?pf=500000&pt=999999"><span>500.000<sup>đ</sup></span> - <span>999.999<sup>đ</sup></span></a></li>
                    <li><a href="tim-kiem.aspx?pf=1000000&pt=1999999"><span>1.000.000<sup>đ</sup></span> - <span>1.999.999<sup>đ</sup></span></a></li>
                    <li><a href="tim-kiem.aspx?pf=2000000&pt=2999999"><span>2.000.000<sup>đ</sup></span> - <span>2.999.999<sup>đ</sup></span></a></li>
                    <li><a href="tim-kiem.aspx?pf=4000000&pt=9999999"><span>4.000.000<sup>đ</sup></span> - <span>9.999.999<sup>đ</sup></span></a></li>
                    <li><a href="tim-kiem.aspx?pf=10000000&pt=14999999"><span>10.000.000<sup>đ</sup></span> - <span>14.999.999<sup>đ</sup></span></a></li>
                    <li><a href="tim-kiem.aspx?pf=15000000&pt="><span>15.000.000<sup>đ</sup></span> - trở lên</a></li>
                </ul>
            </li>
            <li><a href="#">Chủng loại<span class="icon-right fa fa-caret-down"></span></a>
                <asp:ListView ID="lstProductSpecies" runat="server" DataSourceID="odsProductSpecies"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <li><a href='<%# "tim-kiem.aspx?ps=" + Eval("ProductSpeciesID") %>'><%# Eval("ProductSpeciesName") %></a></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductSpecies" runat="server" SelectMethod="ProductSpeciesSelectAll" TypeName="TLLib.ProductSpecies">
                    <SelectParameters>
                        <asp:Parameter Name="ProductSpeciesName" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        <asp:Parameter Name="ProductID" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </li>
            <li><a href="#">Màu đá chính<span class="icon-right fa fa-caret-down"></span></a>
                <asp:ListView ID="lstProductStoneColor" runat="server" DataSourceID="odsProductStoneColor"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <li><a href='<%# "tim-kiem.aspx?psc=" + Eval("ProductStoneColorID") %>'><%# Eval("ProductStoneColorName") %></a></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductStoneColor" runat="server" SelectMethod="ProductStoneColorSelectAll" TypeName="TLLib.ProductStoneColor">
                    <SelectParameters>
                        <asp:Parameter Name="ProductStoneColorName" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        <asp:Parameter Name="ProductID" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </li>
            <li><a href="#">Loại đá chính<span class="icon-right fa fa-caret-down"></span></a>
                <asp:ListView ID="lstProductStoneCategory" runat="server" DataSourceID="odsProductStoneCategory"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <li><a href='<%# "tim-kiem.aspx?psca=" + Eval("ProductStoneCategoryID") %>'><%# Eval("ProductStoneCategoryName") %></a></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductStoneCategory" runat="server" SelectMethod="ProductStoneCategorySelectAll" TypeName="TLLib.ProductStoneCategory">
                    <SelectParameters>
                        <asp:Parameter Name="ProductStoneCategoryName" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        <asp:Parameter Name="ProductID" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </li>
            <li><a href="#">Tuổi vàng<span class="icon-right fa fa-caret-down"></span></a>
                <asp:ListView ID="lstProductGoldenAge" runat="server" DataSourceID="odsProductGoldenAge"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <li><a href='<%# "tim-kiem.aspx?pga=" + Eval("ProductGoldenAgeID") %>'><%# Eval("ProductGoldenAgeName") %></a></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductGoldenAge" runat="server" SelectMethod="ProductGoldenAgeSelectAll" TypeName="TLLib.ProductGoldenAge">
                    <SelectParameters>
                        <asp:Parameter Name="ProductGoldenAgeName" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        <asp:Parameter Name="ProductID" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </li>
        </ul>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="pro-cate-id">
                <h3>
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label></h3>
                <div class="filter">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="1">--Săp xếp theo--</asp:ListItem>
                        <asp:ListItem Value="2">Sản phẩm ưa chuộng</asp:ListItem>
                        <asp:ListItem Value="3">Sản phẩm mới</asp:ListItem>
                        <asp:ListItem Value="4">Sản phẩm mua nhiều</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="pro-cate trangdiem-cate">
                <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProduct"
                    EnableModelValidation="True">
                    <ItemTemplate>
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
                                <%--<div class="new">
                            new
                        </div>--%>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProduct" runat="server" SelectMethod="ProductSelectAll"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="PriceFrom" Type="String" />
                        <asp:Parameter Name="PriceTo" Type="String" />
                        <asp:QueryStringParameter DefaultValue="3" QueryStringField="pci" Name="CategoryID" Type="String" />
                        <asp:Parameter Name="ManufacturerID" Type="String" />
                        <asp:Parameter Name="OriginID" Type="String" />
                        <asp:Parameter Name="Tag" Type="String" />
                        <asp:Parameter Name="InStock" Type="String" />
                        <asp:Parameter Name="IsHot" Type="String" />
                        <asp:Parameter Name="IsNew" Type="String" />
                        <asp:Parameter Name="IsBestSeller" Type="String" />
                        <asp:Parameter Name="IsSaleOff" Type="String" />
                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                        <asp:Parameter Name="FromDate" Type="String" />
                        <asp:Parameter Name="ToDate" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="clr"></div>
            </div>
            <div id="pagerp" class="pager none-border">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="20" PagedControlID="lstProduct">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true"
                            ShowNextPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="first fa fa fa-backward"
                            RenderDisabledButtonsAsLabels="true" FirstPageText="" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false"
                            ShowNextPageButton="false" ShowPreviousPageButton="true" ButtonCssClass="prev fa fa-caret-left"
                            RenderDisabledButtonsAsLabels="true" PreviousPageText="" />
                        <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="numer-paging"
                            CurrentPageLabelCssClass="current" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false"
                            ButtonCssClass="next fa fa-caret-right" ShowNextPageButton="true" ShowPreviousPageButton="false"
                            RenderDisabledButtonsAsLabels="true" NextPageText="" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True"
                            ButtonCssClass="last fa fa-forward" ShowNextPageButton="false" ShowPreviousPageButton="false"
                            RenderDisabledButtonsAsLabels="true" LastPageText="" />
                    </Fields>
                </asp:DataPager>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

