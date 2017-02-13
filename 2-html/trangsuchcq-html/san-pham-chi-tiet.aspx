<%@ Page Title="" Language="C#" MasterPageFile="~/site-main.master" AutoEventWireup="true" CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    <div class="site">
        <div class="container">
            <a href="~/" runat="server">Trang chủ</a> <span class="fa fa-angle-right"></span><a href="product.aspx">Sản phẩm</a> <span class="fa fa-angle-right"></span><span>Sản phẩm chi tiết</span>
        </div>
    </div>
    <div class="container">
        <div class="product-detail-main">
            <div class="product-left">
                <div id="sliderGallery" class="gallery-slider">
                    <div class="slider-for">
                        <div class="slider-big">
                            <div class="gallery-group">
                                <div class="gallery-img">
                                    <img src="assets/images/img1-big.jpg" alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="slider-big">
                            <div class="gallery-group">
                                <div class="gallery-img">
                                    <img src="assets/images/img1-big.jpg" alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="slider-big">
                            <div class="gallery-group">
                                <div class="gallery-img">
                                    <img src="assets/images/img1-big.jpg" alt="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="gallery-smalls">
                        <div class="slider-nav">
                            <div class="slider-small">
                                <div class="gallery-small">
                                    <div class="small-box">
                                        <img src="assets/images/img1-small.jpg" />
                                    </div>
                                </div>
                            </div>
                            <div class="slider-small">
                                <div class="gallery-small">
                                    <div class="small-box">
                                        <img src="assets/images/img2-small.jpg" />
                                    </div>
                                </div>
                            </div>
                            <div class="slider-small">
                                <div class="gallery-small">
                                    <div class="small-box">
                                        <img src="assets/images/img3-small.jpg" />
                                    </div>
                                </div>
                            </div>
                            <div class="slider-small">
                                <div class="gallery-small">
                                    <div class="small-box">
                                        <img src="assets/images/img3-small.jpg" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-right">
                <h1>Set váy bút chì túi xéo + Áo bèo peplum</h1>
                <div class="product-code">
                    Mã sản phẩm: <span>A0015</span>
                </div>
                <p>True Color Lipstick Farmasi là dòng son với nhiều màu sắc ấn tượng, tha hồ để các bạn lựa chọn theo sở thích, trang phục hay tâm trạng. Loại son này đặc biệt thích hợp cho ban ngày, tạo vẻ tươi trẻ và quyến rũ.</p>
                <p class="price">370.000đ <span>360.000đ</span></p>
                <div class="number">
                    Số lượng:
                    <div class="sp-quantity">
                        <div class="sp-btn" id="sp-minus" data-id="sp-minus">-</div>
                        <div class="sp-input">
                            <input type="text" class="quntity-input" value="0" disabled="disabled">
                        </div>
                        <div class="sp-btn" id="sp-plus" data-id="sp-plus">+</div>
                    </div>
                </div>
                <div class="btn-in-cart">
                    <a href="#">Thêm vào giỏ</a>
                    <a href="#">Mua ngay</a>
                </div>
                <img src="assets/images/like-fb.png" alt="" class="like-fb">
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
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th colspan="2">Bộ sản phẩm Ruby vàng trắng 14k</th>
                            </tr>
                            <tr>
                                <td>
                                    <div class="tdLeft">Mã sản phẩm</div>
                                    <div class="tdRight">DQ236598</div>
                                </td>
                                <td>
                                    <div class="tdLeft">Hình dáng đá</div>
                                    <div class="tdRight">Tròn</div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="tdLeft">Chủng loại</div>
                                    <div class="tdRight">Sản phẩm theo bộ</div>
                                </td>
                                <td>
                                    <div class="tdLeft">Màu đá chính</div>
                                    <div class="tdRight">Đỏ</div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="tdLeft">Giới tính</div>
                                    <div class="tdRight">Nữ</div>
                                </td>
                                <td>
                                    <div class="tdLeft">Giác cắt đá</div>
                                    <div class="tdRight">Facet</div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="tdLeft">Tuổi Vàng</div>
                                    <div class="tdRight">14k(585)</div>
                                </td>
                                <td>
                                    <div class="tdLeft">Loại đá phụ</div>
                                    <div class="tdRight">ECZ</div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="tdLeft">Màu chất liệu</div>
                                    <div class="tdRight">Màu trắng</div>
                                </td>
                                <td>
                                    <div class="tdLeft">Hình đá phụ</div>
                                    <div class="tdRight">Tròn</div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="tdLeft">Loại Đá Chính</div>
                                    <div class="tdRight">Ruby</div>
                                </td>
                                <td>
                                    <div class="tdLeft">Màu đá phụ</div>
                                    <div class="tdRight">Trắng</div>
                                </td>
                            </tr>
                        </table>
                    </div>
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
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer luctus magna ac tincidunt tincidunt. Suspendisse aliquam erat eget enim aliquet, a cursus sapien accumsan. Nam pharetra auctor sem, quis semper tellus lacinia ac. Proin dictum aliquam elit ut auctor. Nulla molestie ligula at risus hendrerit, sit amet varius lectus pulvinar.                    
                    <br />
                        <br />
                        <img src="assets/images/sp-dt.png" alt="" />
                        <br />
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer luctus magna ac tincidunt tincidunt. Suspendisse aliquam erat eget enim aliquet, a cursus sapien accumsan. Nam pharetra auctor sem, quis semper tellus lacinia ac. Proin dictum aliquam elit ut auctor. Nulla molestie ligula at risus hendrerit, sit amet varius lectus pulvinar.                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer luctus magna ac tincidunt tincidunt. Suspendisse aliquam erat eget enim aliquet, a cursus sapien accumsan. Nam pharetra auctor sem, quis semper tellus lacinia ac. Proin dictum aliquam elit ut auctor. Nulla molestie ligula at risus hendrerit, sit amet varius lectus pulvinar. Vivamus vitae mi dolor. Fusce tellus libero, mattis ut placerat vel, sollicitudin vel mi. Nunc dignissim, velit vel suscipit varius, augue augue dapibus ante, id fermentum ipsum ipsum vel leo. Aliquam eget maximus ligula. Sed hendrerit id massa eget iaculis. Curabitur convallis massa et urna condimentum cursus. Nam at sem pellentesque, varius augue sit amet, finibus velit.
                    </p>
                </div>
                <div class="clr"></div>
            </div>
        </div>
        <div class="product-detail-right">
            <div class="aside-all">
                <div class="tite-aside">
                    <h1>SẢN PHẨM CÙNG LOẠI</h1>
                </div>
                <div class="product-same">
                    <div class="silderProductSame">
                        <div class="slide">
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
                        </div>
                        <div class="slide">
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
                        </div>
                        <div class="slide">
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
                                </div>
                            </div>
                        </div>
                        <div class="slide">
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
                        </div>
                        <div class="slide">
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
                        <div class="slide">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

