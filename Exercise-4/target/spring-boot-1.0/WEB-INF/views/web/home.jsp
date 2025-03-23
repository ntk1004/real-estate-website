<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>

</head>

<body>
<div class="chat-button" onclick="toggleChat()">💬</div>
<div class="chat-box" id="chatBox">
    <h4>Tư vấn khách hàng</h4>
    <input type="text" placeholder="Họ và tên" id="customerName">
    <input type="tel" placeholder="Số điện thoại" id="customerPhone">
    <input type="text" placeholder="Email" id="customerEmail">
    <textarea placeholder="Nội dung cần tư vấn" id="customerMessage"></textarea>
    <button onclick="sendMessage()">Gửi yêu cầu</button>
</div>

<script>
    function toggleChat() {
        var chatBox = document.getElementById("chatBox");
        chatBox.style.display = chatBox.style.display === "block" ? "none" : "block";
    }

    function sendMessage() {
        var name = document.getElementById("customerName").value;
        var phone = document.getElementById("customerPhone").value;
        var message = document.getElementById("customerMessage").value;
        var email = document.getElementById("customerEmail").value;
        if (name && phone && message && email) {
            alert("Cảm ơn bạn! Chúng tôi sẽ liên hệ sớm.");
            document.getElementById("chatBox").style.display = "none";
        } else {
            alert("Vui lòng điền đầy đủ thông tin.");
        }
    }
</script>

<div class="page-wrapper">
    <div class="">

        <section id="slider">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://vinhomes.vn/sites/default/files/styles/images_1520_x_680/public/2021-06/3_1624089856.jpg?itok=3lwZzTfH"
                             class="d-block w-100" alt="...">
                        <div class="carousel-caption ">

                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://vinhomes.vn/sites/default/files/styles/images_870_x_530/public/2023-07/gDEHQfH0_1689751750.jpeg?itok=R6lbOml4"
                             class="d-block w-100" alt="...">
                        <div class="carousel-caption ">

                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://www.vinhomeland.com.vn/wp-content/uploads/2023/11/vinhomes-grand-park-dai-do-thi.jpg"
                             class="d-block w-100" alt="...">
                        <div class="carousel-caption ">

                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
        <!-- SLIDESHOW -->
        <div id="home-usp">
            <div id="block-trangchublock2">
                <div class="container">
                    <div class="slogan" style=" text-align: center;">

                        Vinhomes là thương hiệu bất động sản số 1 Việt Nam, hoạt động trong lĩnh vực phát triển, chuyển
                        nhượng và vận hành bất động sản
                    </div>
                    <div class="usp">
                        <div class="row">
                            <a rel="nofollow" href="/vinhomes/" class="col item" style="width: 360px">
                                <img src="https://gcp-cdn.vinhomes.vn/cms-data/medal_icon.png"
                                     alt="THƯƠNG HIỆU BẤT ĐỘNG SẢN GIÁ TRỊ NHẤT VIỆT NAM">
                                <div class="title">THƯƠNG HIỆU BẤT ĐỘNG SẢN GIÁ TRỊ NHẤT VIỆT NAM</div>
                                <div class="bg">

                                </div>
                            </a>
                            <a rel="nofollow" href="https://market.vinhomes.vn/" class="col-md-2 item"
                               style="width: 205px"> <img src="https://gcp-cdn.vinhomes.vn/cms-data/phone.png"
                                                          alt="MUA TRỰC TIẾP">
                                <div class="title">MUA TRỰC TIẾP</div>
                                <div class="bg"></div>
                            </a>
                            <a rel="nofollow" href="/tin-tuc" class="col-md-2 item" style="width: 205px">
                                <img src="https://gcp-cdn.vinhomes.vn/cms-data/warning_icon.png" alt="TIN TỨC MỚI NHẤT">
                                <div class="title">TIN TỨC <br> MỚI NHẤT</div>
                                <div class="bg"></div>
                            </a>
                            <a rel="nofollow" href="/vi/360" class="col-md-2 item" style="width: 205px">
                                <img src="https://gcp-cdn.vinhomes.vn/cms-data/360_icon.png" alt="VIRTUAL TOUR">
                                <div class="title">VIRTUAL <br> TOUR</div>
                                <div class="bg"></div>
                            </a>
                            <a rel="nofollow" href="/du-an#urban_map" class="col-md-2 item" style="width: 205px">
                                <img src="https://gcp-cdn.vinhomes.vn/cms-data/localtion_icon.png" alt="BẢN ĐỒ DỰ ÁN">
                                <div class="title">BẢN ĐỒ <br> DỰ ÁN</div>
                                <div class="bg">

                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="desc">Vinhomes sẽ không ngừng nỗ lực để kiến tạo nên những Khu đô thị đáng sống và đẳng
                        cấp bậc nhất Việt Nam với khát khao mang đến 1 cuộc sống tốt đẹp hơn cho tất cả mọi người.
                    </div>
                </div>
            </div>
        </div>


        <!-- CONTENT 1  -->
        <div class="content">
            <div class="content-title">
                <div class="title-cover">
                    <span id="title1">Một Số BĐS nổi bật</span>
                    <span id="title2">Tổng hợp các BĐS tại Hà Nội, Đà Nẵng, TP Hồ Chí Minh,... và các tỉnh thành
                            phố khác hot hiện tại</span>
                </div>
            </div>
            <div class="content-product ">
                <div class="container">
                    <div class="content1 justify-content-center">
                        <div class="row">
                            <div class="col-12 col-md-4">
                                <div class="product1 vip">
                                    <div class="product1-image new"></div>

                                    <div class="product1-conntent">
                                        <div class="product1-conntent-header">
                                            <a href="">Vinhomes Ocean Park - R1.021906</a>
                                        </div>
                                        <p class="des-product"><span>1<!-- --> ngủ</span>
                                            <span>1<!-- --> vệ sinh</span>
                                            <span>47.7<!-- --> m2</span>
                                            <span>TN</span>
                                        </p>
                                    </div>
                                    <div class="product1-footer">
                                        <span class="product1-footer-cost">2,5 Tỷ</span>
                                        <button class="product1-footer-detail"><a href="./ChiTiet.html"
                                                                                  style="color:#fff">Xem chi
                                            tiết</a></button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="product1 hot">
                                    <div class="product2-image new"></div>
                                    <div class="product1-conntent">
                                        <div class="product1-conntent-header">
                                            <a href="">Vinhomes Ocean Park - R3.021903</a>
                                        </div>
                                        <p class="des-product"><span>2<!-- --> ngủ</span>
                                            <span>1<!-- --> vệ sinh</span>
                                            <span>70.7<!-- --> m2</span>
                                            <span>TN</span>
                                        </p>
                                    </div>
                                    <div class="product1-footer">
                                        <span class="product1-footer-cost">2,9 Tỷ</span>
                                        <button class="product1-footer-detail"><a href="./ChiTiet.html"
                                                                                  style="color:#fff">Xem chi
                                            tiết</a></button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="product1 vip">
                                    <div class="product3-image new"></div>
                                    <div class="product1-conntent">
                                        <div class="product1-conntent-header">
                                            <a href="">Vinhomes Ocean Park - R5.042906</a>
                                        </div>
                                        <p class="des-product"><span>2<!-- --> ngủ</span>
                                            <span>4<!-- --> vệ sinh</span>
                                            <span>100 m2<!-- --> m2</span>
                                            <span>TN</span>
                                        </p>
                                    </div>
                                    <div class="product1-footer">
                                        <span class="product1-footer-cost">4,5 Tỷ</span>
                                        <button class="product1-footer-detail"><a href="./ChiTiet.html"
                                                                                  style="color:#fff">Xem chi
                                            tiết</a></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- CONTENT 2  -->
        <section class="section-why mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-12">
                        <div class="title_module_main a-center text-center">
                            <h2 style="margin-bottom: 15px;"><span>Vì sao bạn chọn bất động sản
                                        VinHomes ?</span>
                            </h2>
                            <p style="margin-bottom: 30px;">Chúng tôi cung cấp đầy đủ và chính xác
                                nhất thông tin
                                các dự án bất động sản trên
                                toàn quốc song hành với dịch vụ tư vấn nhanh chóng và hiệu quả</p>
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
                        <div class="wrap">
                            <div class="swiper_why swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-multirow">
                                <div class="swiper-wrapper">
                                    <div class="item swiper-slide swiper-slide-active">
                                        <div class="row section-why">
                                            <div class="col-12 col-md-4">
                                                <div class="wrap-temp d-flex">
                                                    <div class="ico">
                                                        <img class="img-responsive lazyload loaded"
                                                             src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why1.png?1676257083798"
                                                             data-src=""
                                                             alt="Chất lượng tốt nhất" data-was-processed="true">
                                                    </div>
                                                    <div class="content_p ml-4">
                                                        <h4><a href="#" class="why-title a-text">Chất lượng
                                                            tốt nhất</a>
                                                        </h4>
                                                        <p class="why-desc">Nghiên cứu, thiết kế và
                                                            đầu tư xây dựng
                                                            với hệ thống dịch
                                                            vụ
                                                            với chất
                                                            lượng tốt nhất</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-4">
                                                <div class="wrap-temp d-flex">
                                                    <div class="ico">
                                                        <img class="img-responsive lazyload loaded"
                                                             src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why2.png?1676257083798"
                                                             data-src="" alt=""
                                                             data-was-processed="true">
                                                    </div>
                                                    <div class="content_p ml-4">
                                                        <h4><a href="#" class="why-title a-text">Tìm kiếm
                                                            thông tin dễ
                                                            dàng</a></h4>
                                                        <p class="why-desc">Tìm kiếm bất động sản
                                                            bạn muốn theo danh
                                                            mục cực kì dễ
                                                            dàng</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-4">
                                                <div class="wrap-temp d-flex">
                                                    <div class="ico">
                                                        <img class="img-responsive lazyload loaded"
                                                             src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why3.png?1676257083798"
                                                             data-src="" alt=""
                                                             data-was-processed="true">
                                                    </div>
                                                    <div class="content_p ml-4">
                                                        <h4><a href="#" class="why-title a-text">Kết nối
                                                            với nhà đầu tư</a>
                                                        </h4>
                                                        <p class="why-desc">Nhà đầu tư sẽ mang đến
                                                            những sản phẩm và
                                                            dịch vụ tốt nhất
                                                            đáp ứng nhu cầu của bạn</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-4">
                                            <div class="wrap-temp d-flex">
                                                <div class="ico">
                                                    <img class="img-responsive lazyload loaded"
                                                         src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why4.png?1676257083798"
                                                         data-src=""
                                                         alt="Chất lượng tốt nhất" data-was-processed="true">
                                                </div>
                                                <div class="content_p ml-4">
                                                    <h4 class=""><a href="#" class="why-title a-text">Tối
                                                        ưu hóa dịch
                                                        vụ</a></h4>
                                                    <p class="why-desc">Nghiên cứu, thiết kế và đầu
                                                        tư xây dựng với
                                                        hệ thống dịch vụ
                                                        với chất
                                                        lượng tốt nhất</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="wrap-temp d-flex">
                                                <div class="ico">
                                                    <img class="img-responsive lazyload loaded"
                                                         src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why5.png?1676257083798"
                                                         data-src=""
                                                         alt="Chất lượng tốt nhất" data-was-processed="true">
                                                </div>
                                                <div class="content_p ml-4">
                                                    <h4><a href="#" class="why-title a-text">Đảm bảo quyền
                                                        lợi khách
                                                        hàng</a></h4>
                                                    <p>
                                                    <p class="why-desc">Thực hiện các chương trình
                                                        chăm sóc và gia
                                                        tăng lợi ích cho
                                                        khách hàng.</p>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="wrap-temp d-flex">
                                                <div class="ico">
                                                    <img class="img-responsive lazyload loaded"
                                                         src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why6.png?1676257083798"
                                                         data-src=""
                                                         alt="Chất lượng tốt nhất" data-was-processed="true">
                                                </div>
                                                <div class="content_p ml-4">
                                                    <h4><a href="#" class="why-title a-text">Tiết kiệm thời
                                                        gian và chi
                                                        phí</a></h4>
                                                    <p class="why-desc">Cập nhật giá cả nhanh chóng
                                                        và chính xác
                                                        giúp bạn tiết kiệm
                                                        chi phí hơn nhiều</p>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="container-content">
            <div class="hd">
                <img src="https://vinhomes.vn/themes/porto/img/vinhomes/kn/logo-vinhomes.png" alt="Cư Dân Vinhomes Logo"
                     class="logo-content">

                <h1>CƯ DÂN VINHOMES</h1>

            </div>
            <p class="description">
                Vinhomes mong muốn kết nối, xây dựng một môi trường sống văn minh,
                năng động cùng những giá trị tốt đẹp, góp phần nâng tầm chất lượng cuộc sống.
            </p>
            <div class="gallery">
                <div class="gallery-item">
                    <img src="https://vinhomes.vn/sites/default/files/styles/images_375_x_250/public/2021-06/smart_city.jpg?itok=yee4wo0l"
                         alt="Vinhomes Smart City">
                    <h3>Khu đô thị Vinhomes Smart City</h3>
                </div>
                <div class="gallery-item">
                    <img src="https://vinhomes.vn/sites/default/files/styles/images_375_x_250/public/2021-06/grand_park.jpg?itok=MytSL57M"
                         alt="Vinhomes Grand Park">
                    <h3>Khu đô thị Vinhomes Grand Park</h3>
                </div>
                <div class="gallery-item">
                    <img src="https://vinhomes.vn/sites/default/files/styles/images_375_x_250/public/2021-06/ocean_park_1.jpg?itok=BIY7-Kf1"
                         alt="Vinhomes Ocean Park">
                    <h3>Khu đô thị Vinhomes Ocean Park</h3>
                </div>
            </div>
            <button class="explore-button">XEM TẤT CẢ</button>
        </div>

        <!-- CONTENT 5 -->
        <section class="section-subscribe mt-5">
            <div class="container">
                <div class="row text-center">
                    <div class="title_module_main a-center">
                        <h2>Đăng ký tham quan dự án và căn hộ mẫu Vinhomes</h2>
                        <p class="mt-15">Để trải nghiệm trực tiếp "ngôi nhà mới "của bạn, mời Quý khách đăng ký tham
                            quan</p>
                    </div>
                </div>
                <div class="wrap-subscribe text-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2">
                            <div class="module-get">
                                <div class="inner-get">
                                    <div class="form-inner">
                                        <form class="a-center"
                                              action="//dkt.us13.list-manage.com/subscribe/post?u=0bafe4be7e17843051883e746&amp;id=3bdd6e9e3b"
                                              method="post" id="mc-embedded-subscribe-form"
                                              name="mc-embedded-subscribe-form" target="_blank">
                                            <input type="email" value="" placeholder="Nhập địa chỉ email của bạn.."
                                                   name="EMAIL" id="mail"
                                                   aria-label="general.newsletter_form.newsletter_email">
                                            <button class="button-subscribe button-45 subscribe" name="subscribe"
                                                    id="subscribe">Nhận Tin Nhắn
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- CONTENT 6 - NEW  -->

        <!-- FOOTER  -->


    </div>
</div>
<footer class="footer">
    <div class="container-fluid">
        <div class="top-footer text-center mt-0">
            <div class="logo logo-footer pt-5">
                <a href=""><img src="	https://vinhomes.vn/themes/porto/img/vinhomes/ht/vinhomes_logo.svg"
                                alt="logo-footer"></a>
                <p class="desc-logo-footer mt-3">Với hơn 50 năm kinh nghiệm, Vinhomes tự hào là sàn
                    mua
                    bán, giao dịch và quảng cáo
                    bất động sản hàng đầu tại Việt Nam</p>
                <div class="item-footer mt-5">
                    <div class="row">
                        <div class="col-12 col-md-4 text-center">
                            <div class="icon-footer">
                                <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_maps.png?1676257083798"
                                     alt="">
                            </div>
                            <div class="content-center-footer">
                                <p class="mb-1 mt-3">Trụ sở chính</p>
                                <p class="desc-footer">Trần Phú, Hà Đông, TP HN</p>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 text-center">
                            <div class="icon-footer">
                                <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_phone.png?1676257083798"
                                     alt="">
                            </div>
                            <div class="content-center-footer">
                                <p class="mb-1 mt-3">Hotline</p>
                                <p class="desc-footer"><a class="a-text" href="#" style="color: black;">098828</a></p>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 text-center">
                            <div class="icon-footer">
                                <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_email.png?1676257083798"
                                     alt="">
                            </div>
                            <div class="content-center-footer">
                                <p class="mb-1 mt-3">Email</p>
                                <p class="desc-footer"><a class="a-text" href="#"
                                                          style="color: black;">vsh@gmail.com</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <div class="border-bottom mb-5 mt-4"></div>
            </div>
        </div>
        <div class="bottom-footer container">
            <div class="row">
                <div class="col-12 col-md-3">
                    <h4 class="title-item-bottom-footer">Về VinHomes</h4>
                    <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                        chủ</a></p>
                    <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                    <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                        sản</a></p>

                </div>
                <div class="col-12 col-md-3">
                    <h4 class="title-item-bottom-footer">Bất Động Sản Bán</h4>
                    <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Mua Trực Tuyến</a></p>
                    <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự Án</a></p>
                    <p class="desc-item-bottom-footer"><a class="a-text" href="">BĐS Nghỉ Dưỡng</a></p>
                    <p class="desc-item-bottom-footer"><a class="a-text" href="">BĐS Khác</a></p>

                </div>
                <div class="col-12 col-md-3">
                    <h4 class="title-item-bottom-footer">Hỗ trợ khách hàng</h4>
                    <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Chắm Sóc Khách Hàng</a></p>
                    <p class="desc-item-bottom-footer"><a class="a-text" href="">Hotline Bán Hàng</a></p>

                </div>
                <div class="col-12 col-md-3">
                    <h4 class="title-item-bottom-footer">Tin Tức</h4>
                    <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Tin Tức-Sự Kiện</a></p>
                    <p class="desc-item-bottom-footer"><a class="a-text" href="">Ưu Đãi-Khuyến Mãi</a></p>

                </div>
            </div>
        </div>
    </div>
    <div class="bottom-footer-2" style="background-color: #f3bf6b;">
        <div class="text-center desc-bottom-footer-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-facebook"
                 viewBox="0 0 16 16" style="  margin-right: 20px;">
                <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-youtube"
                 viewBox="0 0 16 16" style="margin-right: 20px;">
                <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.01 2.01 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.01 2.01 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31 31 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.01 2.01 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A100 100 0 0 1 7.858 2zM6.4 5.209v4.818l4.157-2.408z"/>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-instagram"
                 viewBox="0 0 16 16" style="">
                <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.9 3.9 0 0 0-1.417.923A3.9 3.9 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.9 3.9 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.9 3.9 0 0 0-.923-1.417A3.9 3.9 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599s.453.546.598.92c.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.5 2.5 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.5 2.5 0 0 1-.92-.598 2.5 2.5 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233s.008-2.388.046-3.231c.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92s.546-.453.92-.598c.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92m-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217m0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334"/>
            </svg>
        </div>
    </div>
</footer>
<security:authorize access = "isAnonymous()">
<section class="vh-100 gradient-custom form-register">
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card text-white" style="border-radius: 3rem; background-color: #EEDFC2 ;">
                    <div class="card-body p-2 px-5 text-center" style="color: black;">
                        <div class="md-5 md-4 mt-4 pb-2">
                            <form:form modelAttribute="model" id="listForm" method="GET">
                                <h2 class="fw-bold mb-2 text-uppercase">Tạo Tài Khoản</h2>


                                <div class="row">

                                    <div class="col-md-6 mb-2">
                                        <div class="form-outline">
                                            <label class="form-label" for="form3Example1m">Full name</label>
                                            <form:input path="fullName"
                                                        class="form-control form-control-lg"/>
                                        </div>
                                    </div>

                                </div>

                                <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">
                                    <h6 class="mb-0 me-4">Giới Tính: </h6>

                                    <div class="form-check form-check-inline mb-0 me-4">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                               id="femaleGender" value="option1"/>
                                        <label class="form-check-label" for="femaleGender">Nam</label>
                                    </div>

                                    <div class="form-check form-check-inline mb-0 me-4">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                               id="maleGender" value="option2"/>
                                        <label class="form-check-label" for="maleGender">Nữ</label>
                                    </div>

                                    <div class="form-check form-check-inline mb-0">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                               id="otherGender" value="option3"/>
                                        <label class="form-check-label" for="otherGender">Khác</label>
                                    </div>
                                </div>
                                <div class="form-outline form-white mb-2">
                                    <label class="form-label" for="typePasswordX">Email</label>
                                    <form:input path="email" class="form-control form-control-lg"/>
                                </div>
                                <div class="form-outline form-white mb-2">
                                    <label class="form-label" for="typePasswordX">Tên Tài Khoản</label>
                                    <form:input path="userName" class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline form-white mb-2">
                                    <label class="form-label" for="typeEmailX">Mật Khẩu</label>
                                    <form:input type="password" path="password" class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline form-white mb-2">
                                    <label class="form-label" for="typeEmailX">Nhập Lại Mật Khẩu</label>
                                    <form:input type="password"  path="rePassword" class="form-control form-control-lg"/>
                                </div>

                                <div class="form-check d-flex justify-content-center mb-2">
                                    <input class="form-check-input me-2" type="checkbox" value=""
                                           id="form2Example3cg"/>
                                    <label class="form-check-label">
                                        Tôi đồng ý với toàn bộ điều khoản trên <a href="#!" class="text-body"></a>
                                    </label>
                                </div>


                                <button class="btn btn-outline-light btn-lg px-5" type="button"
                                        id="btnAddUsers" style="border-radius: 40px;">Đăng Ký
                                </button>

                                <div class="d-flex justify-content-center text-center mt-2 pt-1">
                                    <a href="#!" class="login-extension text-white"><i
                                            class="fab fa-facebook-f fa-lg"></i></a>
                                    <a href="#!" class="login-extension text-white"><i
                                            class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                    <a href="#!" class="login-extension text-white"><i
                                            class="fab fa-google fa-lg"></i></a>
                                </div>

                           <p id="errorMsg" style="color: red;"></p>
                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</security:authorize>
<script>
    $("#btnAddUsers").click(function (event) {
        event.preventDefault();
        var formData = $("#listForm").serializeArray();
        var dataArray = {};
        $.each(formData, function (i, v) {
            dataArray["" + v.name + ""] = v.value;
        });
        addUser(dataArray);
    });

    function addUser(data) {
        $.ajax({
            url: '/api/user/resign',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {

            },
            error: function (xhr) {
                if (xhr.responseJSON && xhr.responseJSON.error) {
                    errorMsg = xhr.responseJSON.error; // Lấy lỗi cụ thể từ backend
                }
                $("#errorMsg").text(errorMsg);
            }
        });
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

</body>

</html>