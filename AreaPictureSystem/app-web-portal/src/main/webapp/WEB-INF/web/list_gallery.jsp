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
    <!-- //for-mobile-apps -->
    <!-- js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/modernizr.custom.97074.js"></script>
    <!-- js -->
    <!-- start-smooth-scrolling -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/move-top.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!-- start-smooth-scrolling -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.chocolat.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/chocolat.css" type="text/css" media="screen" charset="utf-8">
    <!--light-box-files -->
    <script type="text/javascript" charset="utf-8">
        $(function() {
            $('.gallery a').Chocolat();
        });
    </script>
</head>
<body>
<!-- 菜单头部 -->
<jsp:include page="public/top.jsp"/>
<!-- banner -->
<div class="inner-banner"></div>

<!--相册内容-->
<div class="gallery">
    <div class="container">
        <h3 class="tittle">摄影相册</h3>
        <section>
            <ul id="da-thumbs" class="da-thumbs">
                <li>
                    <a href="${pageContext.request.contextPath}/assets/images/p2.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${pageContext.request.contextPath}/assets/images/p2.jpg" alt="" />
                        <div>
                            <h5>模特 1 </h5>
                            <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/assets/images/p3.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${pageContext.request.contextPath}/assets/images/p3.jpg" alt="" />
                        <div>
                            <h5>模特 2 </h5>
                            <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/assets/images/p12.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${pageContext.request.contextPath}/assets/images/p12.jpg" alt="" />
                        <div>
                            <h5>模特 3 </h5>
                            <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/assets/images/p7.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${pageContext.request.contextPath}/assets/images/p7.jpg" alt="" />
                        <div>
                            <h5>模特 4 </h5>
                            <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/assets/images/p8.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${pageContext.request.contextPath}/assets/images/p8.jpg" alt="" />
                        <div>
                            <h5>模特 5 </h5>
                            <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/assets/images/p4.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${pageContext.request.contextPath}/assets/images/p4.jpg" alt="" />
                        <div>
                            <h5>模特 6 </h5>
                            <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/assets/images/p10.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${pageContext.request.contextPath}/assets/images/p10.jpg" alt="" />
                        <div>
                        <h5>模特 7 </h5>
                        <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                    </div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/assets/images/p11.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${pageContext.request.contextPath}/assets/images/p11.jpg" alt="" />
                        <div>
                            <h5>模特 8 </h5>
                            <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/assets/images/p1.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${pageContext.request.contextPath}/assets/images/p1.jpg" alt="" />
                        <div>
                            <h5>模特 9 </h5>
                            <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                        </div>
                    </a>
                </li>
                <div class="clearfix"> </div>
            </ul>
        </section>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.hoverdir.js"></script>
        <script type="text/javascript">
            $(function() {
                $(' #da-thumbs > li ').each( function() { $(this).hoverdir(); } );
            });
        </script>
    </div>

</div>


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
