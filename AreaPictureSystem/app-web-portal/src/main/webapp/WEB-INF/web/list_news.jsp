<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <title>奉贤区教工摄影网站</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="index">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="apple-mobile-web-app-title" content="WeChat"/>

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--fonts-->

    <!--//fonts-->
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <!-- js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- js -->
    <!-- start-smooth-scrolling -->
    <!-- responsiveslides -->
    <script src="${pageContext.request.contextPath}/assets/js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 4
            $("#slider4").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });
        });
    </script>
    <!-- responsiveslides -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/move-top.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <!-- start-smooth-scrolling -->
</head>
<body>
<!-- 菜单头部 -->
<jsp:include page="public/top.jsp"/>
<!-- banner -->
<div class="inner-banner"></div>

<!--新闻公告-->
<div class="news">
    <div class="container">
        <h3 class="tittle">新闻公告</h3>
        <div class="news-article" style="margin-top: 1em;">

            <div class="met">
                <div class="comments-top-top">
                    <div class="men" >
                        <span class="glyphicon glyphicon-news" style="color:#ffffff;">2017.07.01</span>
                    </div>
                    <p class="men-it">李荣安教授的报告给了我们很好的启示，为我们打开了国际视野，指明了研究方向和实施路径，
                        我们期待6日的“2017教育综改背景下的中小学德育创新论坛”李教授能给我们带来更完整更精彩的呈现！
                    </p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="met">
                <div class="comments-top-top">
                    <div class="men" >
                        <span class="glyphicon glyphicon-news" style="color:#ffffff;">2017.07.01</span>
                    </div>
                    <p class="men-it">李荣安教授的报告给了我们很好的启示，为我们打开了国际视野，指明了研究方向和实施路径，
                        我们期待6日的“2017教育综改背景下的中小学德育创新论坛”李教授能给我们带来更完整更精彩的呈现！
                    </p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="met">
                <div class="comments-top-top">
                    <div class="men" >
                        <span class="glyphicon glyphicon-news" style="color:#ffffff;">2017.07.01</span>
                    </div>
                    <p class="men-it">李荣安教授的报告给了我们很好的启示，为我们打开了国际视野，指明了研究方向和实施路径，
                        我们期待6日的“2017教育综改背景下的中小学德育创新论坛”李教授能给我们带来更完整更精彩的呈现！
                    </p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="met">
                <div class="comments-top-top">
                    <div class="men" >
                        <span class="glyphicon glyphicon-news" style="color:#ffffff;">2017.07.01</span>
                    </div>
                    <p class="men-it">李荣安教授的报告给了我们很好的启示，为我们打开了国际视野，指明了研究方向和实施路径，
                        我们期待6日的“2017教育综改背景下的中小学德育创新论坛”李教授能给我们带来更完整更精彩的呈现！
                    </p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="met">
                <div class="comments-top-top">
                    <div class="men" >
                        <span class="glyphicon glyphicon-news" style="color:#ffffff;">2017.07.01</span>
                    </div>
                    <p class="men-it">李荣安教授的报告给了我们很好的启示，为我们打开了国际视野，指明了研究方向和实施路径，
                        我们期待6日的“2017教育综改背景下的中小学德育创新论坛”李教授能给我们带来更完整更精彩的呈现！
                    </p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="met">
                <div class="comments-top-top">
                    <div class="men" >
                        <span class="glyphicon glyphicon-news" style="color:#ffffff;">2017.07.01</span>
                    </div>
                    <p class="men-it">李荣安教授的报告给了我们很好的启示，为我们打开了国际视野，指明了研究方向和实施路径，
                        我们期待6日的“2017教育综改背景下的中小学德育创新论坛”李教授能给我们带来更完整更精彩的呈现！
                    </p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="met">
                <div class="comments-top-top">
                    <div class="men" >
                        <span class="glyphicon glyphicon-news" style="color:#ffffff;">2017.07.01</span>
                    </div>
                    <p class="men-it">李荣安教授的报告给了我们很好的启示，为我们打开了国际视野，指明了研究方向和实施路径，
                        我们期待6日的“2017教育综改背景下的中小学德育创新论坛”李教授能给我们带来更完整更精彩的呈现！
                    </p>
                    <div class="clearfix"> </div>
                </div>
            </div>

            <div class="clearfix"> </div>
        </div>
        <!-- 分页功能-->
        <div class="blog-pagenat">
            <ul>
                <li><a class="frist" href="#">Prev</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li><a class="last" href="#">Next</a></li>
                <div class="clearfix"> </div>
            </ul>
        </div>
        <!--//End-分页功能-->

    </div>
</div>


<!-- 底部 -->
<jsp:include page="public/botton.jsp"/>


<!-- smooth scrolling -->
<script type="text/javascript">
    $(document).ready(function() {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */
        $().UItoTop({ easingType: 'easeOutQuart' });
    });
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->

</body>
</html>
