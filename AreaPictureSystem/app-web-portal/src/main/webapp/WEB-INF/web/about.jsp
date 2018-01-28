<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-ControMl" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />

<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!--fonts-->
<style type="text/css">
.inner-banner {
	background: url('${index.banana}') no-repeat 0px 0px;
	background-size: cover;
	-webkit-background-size: cover;
	-o-background-size: cover;
	-ms-background-size: cover;
	-moz-background-size: cover;
	min-height: 150px;
}
</style>
<!--//fonts-->
<script type="application/x-javascript">
	 addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } 
</script>
<!-- //for-mobile-apps -->
<!-- js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<!-- js -->
<!-- start-smooth-scrolling -->
<!-- responsiveslides -->
<script
	src="${pageContext.request.contextPath}/assets/js/responsiveslides.min.js"></script>
<script>
	// You can also use "$(window).load(function() {"
	$(function() {
		// Slideshow 4
		$("#slider4").responsiveSlides({
			auto : true,
			pager : true,
			nav : true,
			speed : 500,
			namespace : "callbacks",
			before : function() {
				$('.events').append("<li>before event fired.</li>");
			},
			after : function() {
				$('.events').append("<li>after event fired.</li>");
			}
		});
	});
</script>
<!-- responsiveslides -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/move-top.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start-smooth-scrolling -->
</head>
<body>
	<!-- 菜单头部 -->
	<jsp:include page="public/top.jsp" />
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
						${aboutus.aboutUsContent }
					</p>
				</div>
				<div class="col-md-5 about-top-left">
					<img src="${aboutus.aboutUsPic }" style="width:355px;height: 355px;"
						class="img-responsive" alt="" />
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
			<div class="g-views" style="margin-bottom: 20px;">
				<ul id="flexiselDemo3">
				
				<c:forEach items="${aboutus.listTeachers }" var="item" varStatus="status">
					<li>
						<div class="biseller-column">
							<a class="lightbox" href="#goofy"> <img style="width: 256px;height: 177px;"
								src="${item.originalPath}" />
							</a>
							<div class="lightbox-target" id="goofy">
								<img
									src="${item.originalPath}" />
								<a class="lightbox-close" href="#"> </a>

								<div class="clearfix"></div>
							</div>
						</div>
					</li>
					</c:forEach>
					
				</ul>
				<script type="text/javascript">
					$(window).load(function() {
						$("#flexiselDemo3").flexisel({
							visibleItems : 4,
							animationSpeed : 1000,
							autoPlay : true,
							autoPlaySpeed : 3000,
							pauseOnHover : false,
							enableResponsiveBreakpoints : true,
							responsiveBreakpoints : {
								portrait : {
									changePoint : 480,
									visibleItems : 3
								},
								landscape : {
									changePoint : 640,
									visibleItems : 3
								},
								tablet : {
									changePoint : 768,
									visibleItems : 3
								}
							}
						});
					});
				</script>
				<script type="text/javascript"
					src="${pageContext.request.contextPath}/assets/js/jquery.flexisel.js"></script>
			</div>
		</div>
	</div>


	<!-- 底部 -->
	<jsp:include page="public/botton.jsp" />

	<!-- smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>

</body>
</html>
