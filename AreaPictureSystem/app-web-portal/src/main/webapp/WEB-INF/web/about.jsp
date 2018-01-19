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

<!--奉贤区教工摄影介绍-->
<div class="about two">
    <div class="container">
        <h3 class="tittle">关于我们</h3>
        <div class="about-top">
            <div class="col-md-7 about-top-right">
                <h4>奉贤区教育学院摄影教工</h4>
                <p>
                    学院正在深化管理体制，促进办学模式创新，加强师资队伍建设，加大教师领军人物的培养和系列院本课程的建设，
                    不断提高专业服务水平，使学院成为奉贤地区中小学教师培训、教育研究、
                    改革实验的基地和教师继续教育工作资源开发、统筹管理、咨询服务的中心。
                </p>
                <p>
                    目前，我院教师120人，中学高级教师59人，中级教师35人，初级教师8人，
                    中共党员62人，民主党派8人，无党派人士1人，研究生7人，本科生89人，
                    大专12人，特级教师和特级校长5人，知名教师6人。校舍占地16.8亩，
                    建筑面积10632.26m2。多媒体教室4间，普通教室14间，1500平方米的报告厅一个。
                    图书资料55617册，报刊种类210种。
                </p>
            </div>
            <div class="col-md-5 about-top-left">
                <img src="${pageContext.request.contextPath}/assets/images/ab.jpg" class="img-responsive" alt=""/>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>



<!--top-games-section-->
<div class="top-games-section">
    <div class="container">
        <!--sreen-gallery-cursual-->
        <div class="top-games">
            <h3>教工摄影团队</h3>
        </div>
        <div class="g-views">
            <ul id="flexiselDemo3">
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy">
                            <img src="${pageContext.request.contextPath}/assets/images/s1.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy">
                            <img src="${pageContext.request.contextPath}/assets/images/s1.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy1">
                            <img src="${pageContext.request.contextPath}/assets/images/s2.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy1">
                            <img src="${pageContext.request.contextPath}/assets/images/s2.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy2">
                            <img src="${pageContext.request.contextPath}/assets/images/s3.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy2">
                            <img src="${pageContext.request.contextPath}/assets/images/s3.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy3">
                            <img src="${pageContext.request.contextPath}/assets/images/s4.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy3">
                            <img src="${pageContext.request.contextPath}/assets/images/s4.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy4">
                            <img src="${pageContext.request.contextPath}/assets/images/s5.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy4">
                            <img src="${pageContext.request.contextPath}/assets/images/s5.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy5">
                            <img src="${pageContext.request.contextPath}/assets/images/s6.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy5">
                            <img src="${pageContext.request.contextPath}/assets/images/s6.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy6">
                            <img src="${pageContext.request.contextPath}/assets/images/s7.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy6">
                            <img src="${pageContext.request.contextPath}/assets/images/s7.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy7">
                            <img src="${pageContext.request.contextPath}/assets/images/s8.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy7">
                            <img src="${pageContext.request.contextPath}/assets/images/s8.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </li>
            </ul>
            <script type="text/javascript">
                $(window).load(function() {
                    $("#flexiselDemo3").flexisel({
                        visibleItems:4,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: false,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint:480,
                                visibleItems:3
                            },
                            landscape: {
                                changePoint:640,
                                visibleItems:3
                            },
                            tablet: {
                                changePoint:768,
                                visibleItems:3
                            }
                        }
                    });

                });
            </script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.flexisel.js"></script>
        </div>
    </div>
</div>


<!-- 底部 -->
<jsp:include page="public/botton.jsp"/>

<!-- smooth scrolling -->
<script type="text/javascript">
    $(document).ready(function() {

        $().UItoTop({ easingType: 'easeOutQuart' });
    });
</script>

</body>
</html>
