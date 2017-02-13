<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="san-pham.aspx.cs" Inherits="cau_hoi_thuong_gap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphSite" runat="Server">
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
                <div class="item">
                    <img src="assets/images/slide-sub.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="assets/images/slide-sub.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="assets/images/slide-sub.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
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
                <ul>
                    <li><a href="#">Nam</a></li>
                    <li><a href="#">Nữ</a></li>
                </ul>
            </li>
            <li><a href="#">Chất liệu<span class="icon-right fa fa-caret-down"></span></a>
                <ul>
                    <li><a href="#">Vàng</a></li>
                    <li><a href="#">Bạc</a></li>
                    <li><a href="#">Bạch Kim</a></li>
                </ul>
            </li>
            <li><a href="#">Màu chất liệu<span class="icon-right fa fa-caret-down"></span></a>
                <ul>
                    <li><a href="#">Hai màu</a></li>
                    <li><a href="#">Màu Hồng</a></li>
                    <li><a href="#">Màu Trắng</a></li>
                    <li><a href="#">Màu Vàng</a></li>
                </ul>
            </li>
            <li><a href="#">Giá<span class="icon-right fa fa-caret-down"></span></a>
                <ul>
                    <li><a href="#"><span>0<sup>đ</sup></span> - <span>299.999<sup>đ</sup></span></a></li>
                    <li><a href="#"><span>300.000<sup>đ</sup></span> - <span>499.999<sup>đ</sup></span></a></li>
                    <li><a href="#"><span>500.000<sup>đ</sup></span> - <span>999.999<sup>đ</sup></span></a></li>
                    <li><a href="#"><span>1.000.000<sup>đ</sup></span> - <span>1.999.999<sup>đ</sup></span></a></li>
                    <li><a href="#"><span>2.000.000<sup>đ</sup></span> - <span>2.999.999<sup>đ</sup></span></a></li>
                    <li><a href="#"><span>4.000.000<sup>đ</sup></span> - <span>9.999.999<sup>đ</sup></span></a></li>
                    <li><a href="#"><span>10.000.000<sup>đ</sup></span> - <span>14.999.999<sup>đ</sup></span></a></li>
                    <li><a href="#"><span>15.000.000<sup>đ</sup></span> - trở lên</a></li>
                </ul>
            </li>
            <li><a href="#">Chủng loại<span class="icon-right fa fa-caret-down"></span></a>
                <ul>
                    <li><a href="#">Bông tai</a></li>
                    <li><a href="#">Dây chuyền</a></li>
                    <li><a href="#">Mặt dây chuyền</a></li>
                    <li><a href="#">Lắc</a></li>
                    <li><a href="#">Nhẫn</a></li>
                    <li><a href="#">Sản phẩm theo bộ</a></li>
                    <li><a href="#">Vòng</a></li>
                </ul>
            </li>
            <li><a href="#">Màu đá chính<span class="icon-right fa fa-caret-down"></span></a>
                <ul>
                    <li><a href="#">Hồng</a></li>
                    <li><a href="#">Tím</a></li>
                    <li><a href="#">Trắng</a></li>
                    <li><a href="#">Vàng</a></li>
                    <li><a href="#">Xanh</a></li>
                    <li><a href="#">Xanh Blue</a></li>
                    <li><a href="#">Đỏ</a></li>
                </ul>
            </li>
            <li><a href="#">Loại đá chính<span class="icon-right fa fa-caret-down"></span></a>
                <ul>
                    <li><a href="#">Amethyst</a></li>
                    <li><a href="#">Citrine</a></li>
                    <li><a href="#">Pearl</a></li>
                    <li><a href="#">Ruby</a></li>
                    <li><a href="#">Sapphire</a></li>
                    <li><a href="#">Tanzamite</a></li>
                    <li><a href="#">Topaz</a></li>
                    <li><a href="#">Tourmaline</a></li>
                </ul>
            </li>
            <li><a href="#">Tuổi vàng<span class="icon-right fa fa-caret-down"></span></a>
                <ul>
                    <li><a href="#">Vàng 18K (750)</a></li>
                    <li><a href="#">Vàng 14K (585)</a></li>
                </ul>
            </li>
        </ul>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="pro-cate-id">
        <h3>đá quý</h3>
        <div class="filter">
            <select>
                <option value="value" selected="selected">Sắp xếp theo</option>
                <option value="value">Sản phẩm ưa chuộng</option>
                <option value="value">Sản phẩm mới</option>
                <option value="value">Sản phẩm mua nhiều</option>
            </select>
        </div>
    </div>
    <div class="pro-cate trangdiem-cate">
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp1.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
                <%--<div class="new">
                            new
                        </div>--%>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp2.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp3.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp4.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp5.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp6.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
                <%--<div class="new">
                            new
                        </div>--%>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp7.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp8.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp9.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp10.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp11.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
                <%--<div class="new">
                            new
                        </div>--%>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp12.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp13.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp14.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp15.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp16.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp17.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp18.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp19.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="wrap-item">
                <div class="it-img">
                    <a href="#">
                        <img src="assets/images/sp20.png" alt="" />
                    </a>
                </div>
                <div class="it-content">
                    <a href="#">Nhẫn cưới kim cương vàng 24k </a>
                    <p class="pro-code">Mã SP : TSC3490</p>
                    <span>9.500.000<sup>đ</sup></span>
                </div>
                <div class="chitiet">
                    <a href="san-pham-chi-tiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <div class="clr"></div>
    </div>
    <div id="pagerp" class="pager none-border">
        <a href="#" class="first fa fa fa-backward"></a>
        <a href="#" class="prev fa fa-caret-left"></a>
        <a class="current" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#" class="next fa fa-caret-right"></a>
        <a href="#" class="last fa fa-forward"></a>
    </div>
</asp:Content>

