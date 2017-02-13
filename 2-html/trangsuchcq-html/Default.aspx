<%@ Page Title="" Language="C#" MasterPageFile="~/site-main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SuriCosmetics</title>
    <meta name="description" content="SuriCosmetics" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                    <img src="assets/images/slide.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="assets/images/slide.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="assets/images/slide.png" alt="" />
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
    <div class="shape">
        <div id="silderProduct" class="owl-carousel">
            <div class="item">
                <div class="item-img">
                    <a href="#">
                        <img src="assets/images/collection-1.png" alt="" /></a>
                </div>
            </div>
            <div class="item">
                <div class="item-img">
                    <a href="#">
                        <img src="assets/images/collection-2.png" alt="" /></a>
                </div>
            </div>
            <div class="item">
                <div class="item-img">
                    <a href="#">
                        <img src="assets/images/collection-3.png" alt="" /></a>
                </div>
            </div>
        </div>
    </div>
    <div class="clr"></div>
    <div class="wrap-show container">
        <section>
            <div class="title-menu">
                <div class="id-product mgb-10 mgt-10">
                    <h3 class="text-uppercase">Trang sức cưới</h3>
                </div>
                <div class="read-more text-uppercase">
                    <a href="#">Xem tất cả</a>
                </div>
            </div>
            <div class="pro-cate">
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
            </div>
        </section>
        <div class="clr"></div>
        <section>
            <div class="title-menu">
                <div class="id-product mgb-10 mgt-10">
                    <h3 class="text-uppercase">Trang sức vàng</h3>
                </div>
                <div class="read-more text-uppercase">
                    <a href="#">Xem tất cả</a>
                </div>
            </div>
            <div class="pro-cate">
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
            </div>
        </section>
        <div class="clr"></div>
        <section>
            <div class="title-menu">
                <div class="id-product mgb-10 mgt-10">
                    <h3 class="text-uppercase">Kim cương</h3>
                </div>
                <div class="read-more text-uppercase">
                    <a href="#">Xem tất cả</a>
                </div>
            </div>
            <div class="pro-cate">
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
            </div>
        </section>
        <div class="clr"></div>
        <section>
            <div class="title-menu">
                <div class="id-product mgb-10 mgt-10">
                    <h3 class="text-uppercase">Đá quý</h3>
                </div>
                <div class="read-more text-uppercase">
                    <a href="#">Xem tất cả</a>
                </div>
            </div>
            <div class="pro-cate">
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
                        <%--<div class="new">
                            new
                        </div>--%>
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
            </div>
        </section>
        <div class="clr"></div>
    </div>
    <div class="shape-foot">
        <div class="shape-content container pdt-10 text-left">
            <div class="title-video mgb-20 mgt-10">
                <h3 class="text-uppercase">Video nổi bật</h3>
            </div>
            <div class="ld-cate">
                <div class="item">
                    <div class="item-wrap">
                        <div class="it-img">
                            <a href="#">
                                <img src="assets/images/video-1.png" alt="Alternate Text" />
                                <span class="icon-lay"><span></span></span>
                            </a>
                            
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-wrap">
                        <div class="it-img">
                            <a href="#">
                                <img src="assets/images/video-2.png" alt="Alternate Text" />
                                <span class="icon-lay"><span></span></span>
                            </a>
                            
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-wrap">
                        <div class="it-img">
                            <a href="#">
                                <img src="assets/images/video-3.png" alt="Alternate Text" />
                                <span class="icon-lay"><span></span></span>
                            </a>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

