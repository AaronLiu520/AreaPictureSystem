<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
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

<!--摄影作品展内容-->
<!--single-->
<div class="single">
    <div class="container">
        <h3 class="tittle">${news.newsTitle }</h3>
        <div class="article-post two">
            <div class="col-md-3 post-meta">
                <div class="meta-icon">
                    <div class="pic">
                        <a href="#" > <i class="glyphicon glyphicon-picture"></i></a>
                    </div>
                </div>
                <ul class="ad-info">
                    <li>${news.newsDate }</li>
                    <li> <a href="#">${news.author }</a></li>
                    <li> <a href="#">${news.visit} 评论数量</a></li>
                </ul>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-9 post-details s-page">
            <c:if test="${not empty news.picture }">
                <a href="#" class="mask">
                    <img src="${news.picture}" alt="image" class="img-responsive zoom-img" style="width: 50%;height: 50%;">
                </a>
            </c:if>
              	<p>
              	${news.content }
                </p>
            </div>
            <!--post-details-->
            <div class="clearfix"> </div>
        </div>

       <!--  <div class="top-single">

            <div class="top-comments">
                <h3>224 评论数量</h3>
                <div class="met">
                    <div class="code-in">
                        <p class="smith"><a href="#">111</a>
                            <span>2017-09-09 15:20</span></p>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="comments-top-top">
                        <div class="men" >
                            <span class="glyphicon glyphicon-user"></span>
                        </div>
                        <p class="men-it">李荣安教授的报告给了我们很好的启示，为我们打开了国际视野，指明了研究方向和实施路径，
                            我们期待6日的“2017教育综改背景下的中小学德育创新论坛”李教授能给我们带来更完整更精彩的呈现！</p>
                        <div class="clearfix"> </div>
                    </div>
                </div>

                <div class="met">
                    <div class="code-in">
                        <p class="smith"><a href="#">郭建波</a> <span>2017-07-09 15:20</span></p>

                        <div class="clearfix"> </div>
                    </div>
                    <div class="comments-top-top">
                        <div class="men" >
                            <span class="glyphicon glyphicon-user"></span>
                        </div>
                        <p class="men-it">李荣安教授的报告给了我们很好的启示，为我们打开了国际视野，指明了研究方向和实施路径，
                            我们期待6日的“2017教育综改背景下的中小学德育创新论坛”李教授能给我们带来更完整更精彩的呈现！ </p>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>



            <div class="leave">
                <h3>我要评论</h3>
                <form>
                    <div class="single-grid">
                        <div class="single-us">
                            <input type="text" value="姓名" onFocus="this.value='';" onBlur="if (this.value == '') {this.value = '姓名';}">
                            <input type="text" value="邮箱号" onFocus="this.value='';" onBlur="if (this.value == '') {this.value = '邮箱';}">
                            <textarea  value=" " onFocus="this.value='';" onBlur="if (this.value == '') {this.value = '评论';}">评论</textarea>
                            <input type="submit" value="发送" >
                        </div>
                      </div>
                </form>
            </div>
        </div> -->
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