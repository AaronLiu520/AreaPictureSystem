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
        <h3 class="tittle">李荣安为奉贤区教育学院作报告</h3>
        <div class="article-post two">
            <div class="col-md-3 post-meta">
                <div class="meta-icon">
                    <div class="pic">
                        <a href="#" > <i class="glyphicon glyphicon-picture"></i></a>
                    </div>
                </div>
                <ul class="ad-info">
                    <li>2017-03-04</li>
                    <li> <a href="#">谭剑英</a></li>
                    <li> <a href="#">224 评论数量</a></li>
                </ul>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-9 post-details s-page">
                <a href="#" class="mask">
                    <img src="${pageContext.request.contextPath}/assets/images/e7.jpg" alt="image" class="img-responsive zoom-img">
                </a>
                <!--
                <a >
                    <h4></h4>
                </a>-->
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   对“为什么要进行公民教育”，李教授作了比较详细的阐述。列举了17个要进行公民教育的原因，
                    根据亚洲教育界领袖眼中的价值教育和公民素质，李教授认为最重要的原因有三：一为精神发展打下基础；
                    二为增加个人责任感；三为帮助青年人形成反思和自律的人格，由此强调公民课程的第一重要点为道德、
                    公民和个人自主与反思。

                </p>
                <p class="eget">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    李教授表示21世纪是知识建构的时代，“软实力”更为重要。因此，面对未来，我们需要一种以“未来”为取向的公民道德观，
                    针对“软实力”的要求，公民道德的教育重点是帮助学生面对不可知的状况，使其能有坚韧的应变能力、适应能力和创造能力，
                    此种能力也应该是德育赋予个体的一种面对急变社会的选择能力，以及保守重要价值观的能力。
                </p>
                <a href="#" class="mask">
                    <img src="${pageContext.request.contextPath}/assets/images/e7_1.jpg" alt="image" class="img-responsive zoom-img">
                </a>
                <p class="eget">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   教育学院院长蒋东标充分肯定了李教授的报告。就国内的公民道德教育，蒋院也谈了自己的看法，认为中国传统文化价值
                    观教育于未来孩子的发展，于他们应对21世纪的变化是有积极意义的；认为中西方由于传统价值观和思维方式的不同，
                    对道德品质教育有不同的着力点，我们在坚守要义的基础上要注重汲取西方对于社会公共价值的理论；认为一个孩子能
                    否很好地应对21世纪，除了技能之外，更重要的根本是他的价值观，是他的信念和坚守，因此，我们的公民道德教育
                    要不忘本来，注重外来，面向未来。
                    </b>
                </p>
            </div>
            <!--post-details-->
            <div class="clearfix"> </div>
        </div>

        <div class="top-single">

            <div class="top-comments">
                <h3>224 评论数量</h3>
                <div class="met">
                    <div class="code-in">
                        <p class="smith"><a href="#">刘晓庆</a>
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
                </form>
            </div>
        </div>
    </div>
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