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


<!--摄影作品展内容-->
<div class="news">
    <div class="container">
        <h3 class="tittle">新闻列表</h3>
        <div class="news-article">
        
        <c:forEach items="${pageList.datas }" var="items">
         <div class="col-md-6 article-post">
                <div class="col-md-3 post-meta">
                    <div class="meta-icon">
                        <div class="pic">
                            <a href="${pageContext.request.contextPath}/web/newsDetail?id=${items.id}" > <i class="glyphicon glyphicon-picture"></i></a>
                        </div>
                    </div>
                    <ul class="ad-info">
                        <li>${items.newsDate }</li>
                        <li> ${items.author }</li>
                        <li> ${items.visit } 浏览数量</li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-9 post-details">
                    <a href="${pageContext.request.contextPath}/web/newsDetail?id=${items.id}" class="mask">
                        <img src="${items.picture }" alt="image"  style="width: 417px;height: 268px;"
                             class="img-responsive zoom-img"></a>

                    <a href="${pageContext.request.contextPath}/web/page"><h4>${items.newsTitle}</h4></a>
              <!--       <p>
                    </p> -->
               <%--      <div class="read two">
                        <a class="button" href="single.html"><img src="${pageContext.request.contextPath}/assets/images/read.png" alt="" /></a>
                    </div> --%>
                </div>
                <!--post-details-->
                <div class="clearfix"> </div>
            </div>
        
        
        </c:forEach>
           
           
           
           
           
           
           
            
            <div class="clearfix"> </div>
        </div>
        
        
        
        
        
        
        
        <div class="blog-pagenat">
				<ul>
						<li class="frist <c:if test="${pageList.pageNo  eq 1}">disabled</c:if>"><a
						<c:if test="${pageList.pageNo  eq 1 }">href="javascript:void(0)"</c:if>
						href="${pageContext.request.contextPath}/web/listNews?pageNo=${pageList.upPage}">
						上一页 </a></li>
						
						
						
						<li><c:forEach items="${pageList.navigatepageNums}" var="nav">
												<c:choose>
													<c:when test="${nav == pageList.pageNo}">
														<a class="active">${nav}</a>
													</c:when>
													<c:otherwise>
														<a
															href="${pageContext.request.contextPath}/web/listNews?pageNo=${nav}"
															>${nav}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
						</li>
						
						
						

				<li><a href="${pageContext.request.contextPath}/web/listNews?pageNo=${pageList.nextPage}" class="last">
																		下一页 </a></li>
					<div class="clearfix"></div>
				</ul>
			</div>
        

    </div>
</div>






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
