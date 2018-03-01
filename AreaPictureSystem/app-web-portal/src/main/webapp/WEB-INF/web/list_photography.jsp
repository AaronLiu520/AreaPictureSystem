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

<style type="text/css">
.inner-banner {
	background: url('${webIndexBanana.photographybanana}') no-repeat 0px 0px;
	background-size: cover;
	-webkit-background-size: cover;
	-o-background-size: cover;
	-ms-background-size: cover;
	-moz-background-size: cover;
	min-height: 150px;
}
</style>



</head>
<body>
		<!-- 菜单头部 -->
	<jsp:include page="public/top.jsp" />
	<!-- banner -->
	<div class="inner-banner"></div>
<!--摄影作品展内容-->
<div class="news">
    <div class="container">
        <h3 class="tittle">教工摄影作品展</h3>
        <div class="news-article">
        
        
        
        
        
        
        <c:forEach items="${pageList.datas }" var="items" varStatus="status">
        
         <div class="col-md-6 article-post">
                <div class="col-md-3 post-meta">
                    <div class="meta-icon">
                        <div class="pic">
                            <a href="${pageContext.request.contextPath}/web/listGallery?id=${items.id}" > <i class="glyphicon glyphicon-picture"></i></a>
                        </div>
                    </div>
                    <ul class="ad-info">
                        <li>${items.createDate }</li>
                        <li> <a href="#">${items.users.name }</a></li>
                        <li> <a href="#">${items.poll } 票</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-9 post-details">
                    <a href="${pageContext.request.contextPath}/web/listGallery?id=${items.id}" class="mask">
                        <img src="${items.listContestImages[0].originalPath}" alt="image"
                             class="img-responsive zoom-img"></a>

                    <a href="${pageContext.request.contextPath}/web/listGallery?id=${items.id}"><h4>${items.theme }</h4></a>
                    <p>
                     ${items.introduce }
                    </p>
                    <div class="read two">
                        <a class="button" href="${pageContext.request.contextPath}/web/listGallery?id=${items.id}"><img src="${pageContext.request.contextPath}/assets/images/read.png" alt="" /></a>
                    </div>
                </div>
                <!--post-details-->
                <div class="clearfix"> </div>
            </div>
        
        </c:forEach>
        
           

            <div class="clearfix"> </div>
        </div>
        
        
        
        
        
        
        
        
        
     	<!-- 分页功能-->
			<div class="blog-pagenat" style="margin-bottom: 20px;">
				<ul>
					<li
						class="frist <c:if test="${pageList.pageNo  eq 1}">disabled</c:if>"><a
						<c:if test="${pageList.pageNo  eq 1 }">href="javascript:void(0)"</c:if>
						href="${pageContext.request.contextPath}/web/listPhotography?pageNo=${pageList.upPage}">
							上一页 </a></li>
					<li><c:forEach items="${pageList.navigatepageNums}" var="nav">
							<c:choose>
								<c:when test="${nav == pageList.pageNo}">
									<a class="active">${nav}</a>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/web/listPhotography?pageNo=${nav}">${nav}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach></li>
					<li><a
						href="${pageContext.request.contextPath}/web/listPhotography?pageNo=${pageList.nextPage}"
						class="last"> 下一页 </a></li>
				</ul>
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