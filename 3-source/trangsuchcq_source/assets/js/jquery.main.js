(function ($) {
    $(window).load(function () {
        EqualSizer('.pro-cate .item .wrap-item');
        height_pop();
    });
    $(window).resize(function () {
        //setHeight();
        //location.reload();
        //alert($(window).width());
        height_pop();
        asideRe();
    });
    $(function () {
        mymap();
        myfunload();
        sp_quantity();
        asideRe();
        menu_df();

    });
})(jQuery);
//function===============================================================================================
/*=============================fun=========================================*/
function myfunload() {
    $(".panel-a").mobilepanel();
    $("#menu > li").not(".home").clone().appendTo($("#menuMobiles"));
    $("#menuMobiles input").remove();
    $("#menuMobiles > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    $("#menuMobiles li li a").append('<span class="fa fa-angle-right iconl"></span>');
    $("#menu > li:last-child").addClass("last");
    $("#menu > li:first-child").addClass("fisrt");

    $("#menu > li").find("ul").addClass("menu-level");

    $('#menu li').hover(function () {
        $(this).children('.sub-menu').stop(true, false, true).slideToggle(300);
    });

    /*=====  =====*/
    $('.carousel-inner').find('.item').first().addClass('active');
    $('.carousel-indicators li').first().addClass('active');

    $('.popup-content').mCustomScrollbar({
        autoHideScrollbar: true,
        theme: "dark-thick",
    });

    $('.clean-td').click(function () {
        $(this).parents('.item').remove();
    });


    $('#silderProduct').owlCarousel({
        margin: 15,
        loop: true,
        autoplaySpeed: 4000,
        nav: false,
        arrows: false,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 2
            },
            500: {
                items: 2
            },
            700: {
                items: 3
            },
            1000: {
                items: 3
            },
            1200: {
                items: 3
            },
        }
    });

    $('.silderProductSame').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        vertical: true,
        dots: false,
        arrows: false,
        autoplaySpeed: 2000,
        responsive: [
        {
            breakpoint: 992,
            settings: {
                vertical: false,
                arrows: true,
                slidesToShow: 3
            }
        },

         {
             breakpoint: 700,
             settings: {
                 vertical: false,
                 arrows: true,
                 slidesToShow: 2
             }
         },
        {
            breakpoint: 450,
            settings: {
                vertical: false,
                arrows: false,
                slidesToShow: 1
            }
        }
        ]
    });

    /* accodion tin van */
    $(".cauhoi-content").hide();
    $(".cau-hoi").append('<i class="fa fa-plus"></i>')
    // Áp dụng sự kiện click vào thẻ h3
    $(".cau-hoi").click(function () {
        // chọn .accordion (do phần tử đi đi ngay sau phần tử h3 nên ta dùng .next())
        $(".cau-hoi").removeClass('active');
        $(".cau-hoi i").removeClass('fa-minus');
        $(this).children("i").addClass('fa-minus');
        $(this).addClass('active');
        $accordion = $(this).next();
        // Kiểm tra nếu đang ẩn thì sẽ hiện và ẩn các phần tử khác
        // Nếu đang hiện thì click vào h3 sẽ ẩn
        if ($accordion.is(':hidden') === true) {
            $(".cauhoi-content").slideUp();
            $accordion.slideDown();
            $(this).addClass('active');
            $(this).children("i").addClass('fa-minus');
        } else {
            $accordion.slideUp();
            $(".cau-hoi").removeClass('active');
            $(".cau-hoi i").removeClass('fa-minus');
        }
    });
}

/* set 'data-slide-to' indicators Bootstrap*/
//$(window).ready(function () {
//    
//    var n = $('.carousel-indicators li').length;
//    //console.log(n);
//    for (var x = 0; x < n; x++) {
//        $('.carousel-indicators li:nth-of-type(' + (x + 1) + ')').attr('data-slide-to', x);
//    }
//});

$('#sliderGallery .slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    asNavFor: '#sliderGallery .slider-nav'
});
$('#sliderGallery .slider-nav').slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    asNavFor: '#sliderGallery .slider-for',
    dots: false,
    arrows: true,
    focusOnSelect: true,
    vertical: true,
    responsive: [
        {
            breakpoint: 992,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
                vertical: false,
            }
        },
        // You can unslick at a given breakpoint now by adding:
        // settings: "unslick"
        // instead of a settings object
    ]
});

/*=========================================================================*/
//================== scroll top
$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.scroll-to-top').fadeIn();
    } else {
        $('.scroll-to-top').fadeOut();
    }
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 138) {
        $('.bot-head').addClass('bot-head-scroll');
    }
    else {
        $('.bot-head').removeClass('bot-head-scroll');
    }
});

$('.scroll-to-top').on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({ scrollTop: 0 }, 800);
    return false;
});


function DoEqualSizer(myclass) {
    var heights = $(myclass).map(function() {
        $(this).height('auto');
        return $(this).height();
    }).get(),
    maxHeight = Math.max.apply(null, heights);
    $(myclass).height(maxHeight);
};
function EqualSizer_1(myclass) {
    $(document).ready(DoEqualSizer(myclass));
    window.addEventListener('resize', function () {
        DoEqualSizer(myclass);
    });
};
function EqualSizer(myclass) {
    $(document).ready(DoEqualSizer(myclass));
    window.addEventListener('resize', function() { 
        DoEqualSizer(myclass); 
    });
};
//==================
function mymap() {
    mympp();
    var timeout;
    $(window).resize(function () {
        clearTimeout(timeout);
        setTimeout(function () {
            mympp();
        }, 500);
    });
}
function mympp() {
    $('#mapwrap').remove();
    if ($(window).width() > 768) {
        $('#mapshow').append('<div id="mapwrap"><iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
    }
}
/** popup **/
//$('.dk').click(function () {
//    $('#main-content').append('<div id="overlay-screen-active">');
//    $('.popup .popup-content').css('top', '30px');
//});
//$(document).on('click', ".popup-btn-close, #overlay-screen-active", function () {
//    $('.popup-content').css('top', '-250%');
//    $('#overlay-screen-active').fadeOut();
//    $('#overlay-screen-active').remove();
//    return false;
//});
//$(document).ready(function () {
//    $(window).resize(function () {
//        var winwidth = $(window).width();
//        $('.dk').click(function () {
//            $('#main-content').append('<div id="overlay-screen-active">');
//            $('#overlay-screen-active').remove();
//            $('.popup .popup-content').css('top', '30px');
//        });
//        $(document).on('click', ".popup-btn-close, #overlay-screen-active", function () {
//            $('.popup-content').css('top', '-250%');
//            $('#overlay-screen-active').fadeOut();
//            $('#overlay-screen-active').remove();
//            return false;
//        });
//    }).resize();
//});

//$('.dn').click(function () {
//    $('#main-content').append('<div id="overlay-screen-active">');
//    $('.popup_1 .popup-content').css('top', '30px');
//});
//$(document).ready(function () {
//    $(window).resize(function () {
//        var winwidth = $(window).width();
//        $('.dn').click(function () {
//            $('#main-content').append('<div id="overlay-screen-active">');
//            $('#overlay-screen-active').remove();
//            $('.popup_1 .popup-content').css('top', '30px');
//        });
//    }).resize();
//});

function height_pop() {
    var n = $(window).height();
    $('.scroll-popup').each(function () {
        var x = $(this).children('.popup-content').height();
        if (x > n) {
            $(this).children('.popup-content').css('max-height', n - 50);
            //$(this).children('.popup-content').css('height', 'auto');
        }
        else {
            $(this).children('.popup-content').css('max-height', n - 50);
        }
    })
    //$('.popup-content').css('max-height', n - 50);
}
function sp_quantity() {
    $(".sp-btn").on("click", function () {
        var $button = $(this),
            $input = $button.closest('.sp-quantity').find("input.quntity-input");
        var oldValue = $input.val(),
            newVal;
        console.log(oldValue);

        if ($(this).attr('data-id') == 'sp-plus') {
            newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $input.val(newVal);
    });
}

function asideRe() {
    if ($(window).width() <= 991) {
        $('.aside section > ul').hide();
        $('.aside section h3 i').remove();
        $('.aside section h3').append('<i class="fa fa-plus"></i>');
        $('.aside section h3 i').click(function () {
            var n = $(this).parent();
            n.next('ul').stop(true, false, true).slideToggle(300);
        });
        //$('.aside section ul li a').attr('href', 'javascript:void(0);');
    }
    else {
        $('.aside section ul').show();
        $('.aside section h3 i').remove();
    }
}
 
function menu_df() {
    $('.search-sp > li > ul').hide();
    $('.search-sp > li > a').click(function (e) {
        e.preventDefault(); // function tro toi href bo dau #
        //$('.aside section li ul').hide();
        m = $(this).parent();
        //console.log(m);
        if (m.hasClass('show')) {
            m.children('ul').slideUp();
            m.removeClass('show')
        }
        else {
            m.children('ul').slideDown();
            m.addClass('show')
        }

    });
}

$('.cart').click(function () {
    $('#main-content').append('<div id="overlay-screen-active">');
    $('.popup_cart .popup-content').css('top', '30px');
});
    $(document).on('click', ".popup-btn-close, #overlay-screen-active", function () {
        $('.popup-content').css('top', '-250%');
        $('#overlay-screen-active').fadeOut();
        $('#overlay-screen-active').remove();
        return false;
    });
    $(document).ready(function () {
        $(window).resize(function () {
            var winwidth = $(window).width();
            $('.cart').click(function () {
                $('#main-content').append('<div id="overlay-screen-active">');
                $('#overlay-screen-active').remove();
                $('.popup_cart .popup-content').css('top', '30px');
            });
        }).resize();
    });
