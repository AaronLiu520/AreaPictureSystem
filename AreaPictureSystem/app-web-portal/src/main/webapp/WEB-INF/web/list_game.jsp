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
        <h3 class="tittle">摄影比赛投票</h3>
        <div class="news-article" style="margin-top: 1em;">



            <div class="clearfix"> </div>
        </div>

        <div class="slider-bottom" style="padding: 0px 0px 15px 0px;border-top: 0px solid #e8e8e8;">
            <div class="container">
                <div class="slider-grids">
                    <div class="col-md-12 slider-grid" style="padding-top: 15px;">
                        <h3>上海市奉贤区 - 人物摄影比赛 </h3>
                        <p> &nbsp;&nbsp;&nbsp;&nbsp;人像摄影与一般的人物摄影不同：人像摄影以刻画与表现被摄者的具体相貌和神态为自身的首要创作任务，
                            虽然有些人像摄影作品也包含一定的情节，但它仍以表现被照者的相貌为主，而且，相当一部分人像摄影
                            作品只交待被摄者的形象，并没有具体的情节。而人物摄影是以表现有被摄者参与的事件与活动为主，
                            它以表现具体的情节为主要任务，而不在于以鲜明的形象去表现被摄者的相貌和神态。这二者之间的重要区别，
                            在于是否具体描绘人物的相貌</p>
                        <a href="#" class="hvr-rectangle-in button">我要参与投票</a>
                        <a href="#" class="hvr-rectangle-in button">投票规则</a>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <br>
        <div class="slider-bottom" style="padding: 0px 0px 15px 0px;border-top: 0px solid #e8e8e8;">
            <div class="container">
                <div class="slider-grids">
                    <div class="col-md-12 slider-grid" style="padding-top: 15px;">
                        <h3>上海市奉贤区 - 风景摄影比赛 </h3>
                        <p> &nbsp;&nbsp;&nbsp;&nbsp;一般的人物摄影不同：人像摄影以刻画与表现被摄者的具体相貌和神态为自身的首要创作任务，
                            虽然有些人像摄影作品也包含一定的情节，但它仍以表现被照者的相貌为主，而且，相当一部分人像摄影
                            作品只交待被摄者的形象，并没有具体的情节。而人物摄影是以表现有被摄者参与的事件与活动为主，
                            它以表现具体的情节为主要任务，而不在于以鲜明的形象去表现被摄者的相貌和神态。这二者之间的重要区别，
                            在于是否具体描绘人物的相貌</p>
                        <a href="#" class="hvr-rectangle-out label-default">投票已结束</a>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
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
