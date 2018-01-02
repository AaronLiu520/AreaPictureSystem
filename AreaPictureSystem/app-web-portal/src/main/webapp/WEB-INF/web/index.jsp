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
<jsp:include page="public/banana.jsp"/>

<!-- 首页新闻 -->
<div class="welcome">
    <div class="container">
        <h2>最新公告</h2>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;随着的发展，人们在摄影中不断地增加艺术的元素，开始产生艺术摄影。录摄影的区别在于艺术性的多少与高低，
            而无绝对的界限。例如：我们去照张像作身份证或留个纪念，一般照相馆拍摄的照片，最多有点资料或记录价值。
            可是，郑景康先生给齐白石先生拍的人像，50年过去了，至今仍是世界二十幅最优秀的人像作品之一。
        </p>
    </div>
</div>

<!--优秀做品展-->
<div class="top-games-section">
    <div class="container">
        <!--sreen-gallery-cursual-->
        <div class="top-games">
            <h3>摄影优秀作品展</h3>
            <!--
            <p>人像摄影以刻画与表现被摄者的具体相貌和神态为自身的首要创作任务，
                虽然有些人像摄影作品也包含一定的情节，
                但它仍以表现被照者的相貌为主，而且，相当一部分人像摄影作品只交待被摄者的形象，并没有具体的情节。
            </p>-->
        </div>
        <div class="g-views">
            <ul id="flexiselDemo3">
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_9.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_9.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy1">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_2.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy1">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_2.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy2">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_3.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy2">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_3.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy4">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_11.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy4">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_11.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy5">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_13.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy5">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_13.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy6">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_7.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy6">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_7.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy7">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_14.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy7">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_14.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="biseller-column">
                        <a class="lightbox" href="#goofy3">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_4.jpg"/>
                        </a>
                        <div class="lightbox-target" id="goofy3">
                            <img src="${pageContext.request.contextPath}/assets/images/zp_4.jpg"/>
                            <a class="lightbox-close" href="#"> </a>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </li>
            </ul>
            <script type="text/javascript">
                $(window).load(function () {
                    $("#flexiselDemo3").flexisel({
                        visibleItems: 4,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: false,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 3
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 3
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 3
                            }
                        }
                    });

                });
            </script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.flexisel.js"></script>
        </div>
    </div>
</div>

<!-- 摄影比赛通知 -->
<div class="slider-bottom">
    <div class="container">
        <div class="slider-grids">
            <div class="col-md-6 slider-grid">
                <h3>上海市奉贤区 - 人物摄影比赛 </h3>
                <p> &nbsp;&nbsp;&nbsp;&nbsp;人像摄影与一般的人物摄影不同：人像摄影以刻画与表现被摄者的具体相貌和神态为自身的首要创作任务，
                    虽然有些人像摄影作品也包含一定的情节，但它仍以表现被照者的相貌为主，而且，相当一部分人像摄影
                    作品只交待被摄者的形象，并没有具体的情节。而人物摄影是以表现有被摄者参与的事件与活动为主，
                    它以表现具体的情节为主要任务，而不在于以鲜明的形象去表现被摄者的相貌和神态。这二者之间的重要区别，
                    在于是否具体描绘人物的相貌</p>
                <a href="#" class="hvr-rectangle-in button">我要参与投票</a>
                <a href="#" class="hvr-rectangle-out button">投票规则</a>
            </div>
            <div class="col-md-6 slider-grid">
                <h3>奉贤区教摄影投票规划 </h3>
                <p class="para-text"> &nbsp;&nbsp;&nbsp;&nbsp;一致同意规则是指一项政策或议案，须经全体投票人一致赞同才能通过的一种投票规则，
                    这是最符合公共利益要求的投票规则，但因其实质是一票否决制，故在现实生活中很难实施；
                    多数票规则是指一项政策或议案，须经半数以上投票人赞同才能通过的一种投票规则，
                    有氛围简单多数票规则和比例多数票规则，多数票规则往往导致循环投票并且不能反映个人的偏好程度，容易造成政府失灵。</p>

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<!-- 最新摄影作品展 -->
<div class="article">
    <div class="container">
        <h3>最新摄影作品</h3>
    </div>
</div>
<div class="article-grids">
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p10.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p9.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p5.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p6.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p7.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p12.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p8.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p4.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p3.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p2.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p1.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="col-md-3 article-grid">
        <a href="single.html"><img src="${pageContext.request.contextPath}/assets/images/p11.jpg" alt=""/></a>
        <div class="article-info">
            <p>幸福永远不会过时.</p>
            <p>2017年 12月 21日<a href="single.html" class="plus">
                <span class="glyphicon glyphicon-plus"></span></a>
            </p>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!-- 最新摄影作品 -->

<!-- 底部 -->
<jsp:include page="public/botton.jsp"/>


<!-- smooth scrolling -->
<script type="text/javascript">
    $(document).ready(function () {
        $().UItoTop({easingType: 'easeOutQuart'});
    });
</script>
<!-- //smooth scrolling -->

</body>
</html>
