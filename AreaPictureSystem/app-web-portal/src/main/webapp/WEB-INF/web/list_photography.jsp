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

<!--摄影作品展内容-->
<div class="news">
    <div class="container">
        <h3 class="tittle">教工摄影作品展</h3>
        <div class="news-article">
            <div class="col-md-6 article-post">
                <div class="col-md-3 post-meta">
                    <div class="meta-icon">
                        <div class="pic">
                            <a href="${pageContext.request.contextPath}/web/page" > <i class="glyphicon glyphicon-picture"></i></a>
                        </div>
                    </div>
                    <ul class="ad-info">
                        <li>2017-03-04</li>
                        <li> <a href="#">谭剑英</a></li>
                        <li> <a href="#">224 评论数量</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-9 post-details">
                    <a href="${pageContext.request.contextPath}/web/page" class="mask">
                        <img src="${pageContext.request.contextPath}/assets/images/e7.jpg" alt="image"
                             class="img-responsive zoom-img"></a>

                    <a href="${pageContext.request.contextPath}/web/page"><h4>李荣安为奉贤区教育学院作报告</h4></a>
                    <p>
                        因此，面对未来，我们需要一种以“未来”为取向的公民道德观，针对“软实力”的要求，
                        公民道德的教育重点是帮助学生面对不可知的状况，使其能有坚韧的应变能力、适应能力和创造能力，
                        此种能力也应该是德育赋予个体的一种面对急变社会的选择能力，以及保守重要价值观的能力。
                    </p>
                    <div class="read two">
                        <a class="button" href="single.html"><img src="${pageContext.request.contextPath}/assets/images/read.png" alt="" /></a>
                    </div>
                </div>
                <!--post-details-->
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-6 article-post">
                <div class="col-md-3 post-meta">
                    <div class="meta-icon">
                        <div class="pic">
                            <a href="single.html" > <i class="glyphicon glyphicon-picture"></i></a>
                        </div>
                    </div>
                    <ul class="ad-info">
                        <li>2017-02-11</li>
                        <li> <a href="#">王进</a></li>
                        <li> <a href="#">214 评论数量</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-9 post-details">
                    <a href="single.html" class="mask">
                        <img src="${pageContext.request.contextPath}/assets/images/e8.jpg" alt="image"
                             class="img-responsive zoom-img">
                    </a>

                    <a href="single.html"><h4>上海市野生动物园一角</h4></a>
                    <p>
                        那些主要表现人物的活动与情节，反映的是一定的生活主题，被摄者的相貌并不很突出的摄影作品，
                        不管它是近景也好，全身也好，只能属于人物摄影的范畴。当然，从广义上来说，人像摄影拍的是人
                        ，它也属于人物摄影。人像摄影以刻画和描绘被摄者的外貌与神态为自己的表现任务，应人物相貌鲜明。
                    </p>
                    <div class="read two">
                        <a class="button" href="single.html">
                            <img src="${pageContext.request.contextPath}/assets/images/read.png" alt="" />
                        </a>
                    </div>
                </div>
                <!--post-details-->
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-6 article-post">
                <div class="col-md-3 post-meta">
                    <div class="meta-icon">
                        <div class="pic">
                            <a href="single.html" > <i class="glyphicon glyphicon-picture"></i></a>
                        </div>
                    </div>
                    <ul class="ad-info">
                        <li>2017-12-15</li>
                        <li> <a href="#">李春华</a></li>
                        <li> <a href="#">19 评论数量</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-9 post-details">
                    <a href="" class="mask">
                        <img src="${pageContext.request.contextPath}/assets/images/e1.jpg" alt="image"
                             class="img-responsive zoom-img">
                    </a>
                    <a href=""><h4>欧洲女模摄影艺术</h4></a>
                    <p>
                        那些主要表现人物的活动与情节，反映的是一定的生活主题，被摄者的相貌并不很突出的摄影作品，
                        不管它是近景也好，全身也好，只能属于人物摄影的范畴。当然，从广义上来说，人像摄影拍的是人
                        ，它也属于人物摄影。人像摄影以刻画和描绘被摄者的外貌与神态为自己的表现任务，应人物相貌鲜明。
                    </p>
                    <div class="read two">
                        <a class="button" href="single.html">
                            <img src="${pageContext.request.contextPath}/assets/images/read.png" alt="" /></a>
                    </div>
                </div>
                <!--post-details-->
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-6 article-post">
                <div class="col-md-3 post-meta">
                    <div class="meta-icon">
                        <div class="pic">
                            <a href="single.html" > <i class="glyphicon glyphicon-picture"></i></a>
                        </div>
                    </div>
                    <ul class="ad-info">
                        <li>2017-06-11</li>
                        <li> <a href="#">谭剑英</a></li>
                        <li> <a href="#">24 评论数量</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-9 post-details">
                    <a href="#" class="mask">
                        <img src="${pageContext.request.contextPath}/assets/images/e2.jpg" alt="image"
                             class="img-responsive zoom-img">
                    </a>
                    <a href="#"><h4>中国男模平面摄影图</h4></a>
                    <p>
                        那些主要表现人物的活动与情节，反映的是一定的生活主题，被摄者的相貌并不很突出的摄影作品，
                        不管它是近景也好，全身也好，只能属于人物摄影的范畴。当然，从广义上来说，人像摄影拍的是人
                        ，它也属于人物摄影。人像摄影以刻画和描绘被摄者的外貌与神态为自己的表现任务，应人物相貌鲜明。
                    </p>
                    <div class="read two">
                        <a class="button" href="#">
                            <img src="${pageContext.request.contextPath}/assets/images/read.png" alt="" />
                        </a>
                    </div>
                </div>
                <!--post-details-->
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-6 article-post">
                <div class="col-md-3 post-meta">
                    <div class="meta-icon">
                        <div class="pic">
                            <a href="single.html" > <i class="glyphicon glyphicon-picture"></i></a>
                        </div>
                    </div>
                    <ul class="ad-info">
                        <li>2017-05-19</li>
                        <li> <a href="#">陈平华</a></li>
                        <li> <a href="#">100 评论数量</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-9 post-details">
                    <a href="single.html" class="mask">
                        <img src="${pageContext.request.contextPath}/assets/images/e3.jpg" alt="image"
                             class="img-responsive zoom-img">
                    </a>

                    <a href="single.html"><h4>美国40岁模特的人生记录</h4></a>
                    <p>
                        那些主要表现人物的活动与情节，反映的是一定的生活主题，被摄者的相貌并不很突出的摄影作品，
                        不管它是近景也好，全身也好，只能属于人物摄影的范畴。当然，从广义上来说，人像摄影拍的是人
                        ，它也属于人物摄影。人像摄影以刻画和描绘被摄者的外貌与神态为自己的表现任务，应人物相貌鲜明。
                    </p>
                    <div class="read two">
                        <a class="button" href="single.html"><img src="${pageContext.request.contextPath}/assets/images/read.png" alt="" /></a>
                    </div>
                </div>
                <!--post-details-->
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-6 article-post">
                <div class="col-md-3 post-meta">
                    <div class="meta-icon">
                        <div class="pic">
                            <a href="single.html" > <i class="glyphicon glyphicon-picture"></i></a>
                        </div>
                    </div>
                    <ul class="ad-info">
                        <li>2017-04-09</li>
                        <li> <a href="#">谭剑英</a></li>
                        <li> <a href="#">124 评论数量</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-9 post-details">
                    <a href="single.html" class="mask">
                        <img src="${pageContext.request.contextPath}/assets/images/e4.jpg" alt="image"
                             class="img-responsive zoom-img"></a>

                    <a href="single.html"><h4>上海奉贤区车展会摄影</h4></a>
                    <p>
                        那些主要表现人物的活动与情节，反映的是一定的生活主题，被摄者的相貌并不很突出的摄影作品，
                        不管它是近景也好，全身也好，只能属于人物摄影的范畴。当然，从广义上来说，人像摄影拍的是人
                        ，它也属于人物摄影。人像摄影以刻画和描绘被摄者的外貌与神态为自己的表现任务，应人物相貌鲜明。
                    </p>
                    <div class="read two">
                        <a class="button" href="single.html">
                            <img src="${pageContext.request.contextPath}/assets/images/read.png" alt="" />
                        </a>
                    </div>
                </div>
                <!--post-details-->
                <div class="clearfix"> </div>
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
