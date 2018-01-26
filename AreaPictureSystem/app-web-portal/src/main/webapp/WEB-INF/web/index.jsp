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
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet" type="text/css" media="all" />


<!--fonts-->

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

<!-- 模态框 -->
<script
	src="${pageContext.request.contextPath}/assets/admin/js/jquery-2.1.1.min.js"></script>
<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"
	type="text/javascript"></script>
<script
	src="http://apps.bdimg.com/libs/fancybox/2.1.5/jquery.fancybox.js"
	type="text/javascript"></script>

</head>
<body>
	<!-- 菜单头部 -->
	<jsp:include page="public/top.jsp" />

	<!-- banner -->
	<jsp:include page="public/banana.jsp" />
	<!-- 首页新闻 -->
	<div class="welcome">
		<div class="container">
			<h2>最新公告</h2>
			<p>${index.toPublic }</p>
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
							<a class="lightbox" href="#goofy"> <img
								src="${pageContext.request.contextPath}/assets/images/zp_9.jpg" />
							</a>
							<div class="lightbox-target" id="goofy">
								<img
									src="${pageContext.request.contextPath}/assets/images/zp_9.jpg" />
								<a class="lightbox-close" href="#"> </a>

								<div class="clearfix"></div>
							</div>
						</div>
					</li>
					<li>
						<div class="biseller-column">
							<a class="lightbox" href="#goofy1"> <img
								src="${pageContext.request.contextPath}/assets/images/zp_2.jpg" />
							</a>
							<div class="lightbox-target" id="goofy1">
								<img
									src="${pageContext.request.contextPath}/assets/images/zp_2.jpg" />
								<a class="lightbox-close" href="#"> </a>

								<div class="clearfix"></div>
							</div>
						</div>
					</li>
					<li>
						<div class="biseller-column">
							<a class="lightbox" href="#goofy2"> <img
								src="${pageContext.request.contextPath}/assets/images/zp_3.jpg" />
							</a>
							<div class="lightbox-target" id="goofy2">
								<img
									src="${pageContext.request.contextPath}/assets/images/zp_3.jpg" />
								<a class="lightbox-close" href="#"> </a>

								<div class="clearfix"></div>
							</div>
						</div>
					</li>

					<li>
						<div class="biseller-column">
							<a class="lightbox" href="#goofy4"> <img
								src="${pageContext.request.contextPath}/assets/images/zp_11.jpg" />
							</a>
							<div class="lightbox-target" id="goofy4">
								<img
									src="${pageContext.request.contextPath}/assets/images/zp_11.jpg" />
								<a class="lightbox-close" href="#"> </a>

								<div class="clearfix"></div>
							</div>
						</div>
					</li>
					<li>
						<div class="biseller-column">
							<a class="lightbox" href="#goofy5"> <img
								src="${pageContext.request.contextPath}/assets/images/zp_13.jpg" />
							</a>
							<div class="lightbox-target" id="goofy5">
								<img
									src="${pageContext.request.contextPath}/assets/images/zp_13.jpg" />
								<a class="lightbox-close" href="#"> </a>

								<div class="clearfix"></div>
							</div>
						</div>
					</li>
					<li>
						<div class="biseller-column">
							<a class="lightbox" href="#goofy6"> <img
								src="${pageContext.request.contextPath}/assets/images/zp_7.jpg" />
							</a>
							<div class="lightbox-target" id="goofy6">
								<img
									src="${pageContext.request.contextPath}/assets/images/zp_7.jpg" />
								<a class="lightbox-close" href="#"> </a>

								<div class="clearfix"></div>
							</div>
						</div>
					</li>
					<li>
						<div class="biseller-column">
							<a class="lightbox" href="#goofy7"> <img
								src="${pageContext.request.contextPath}/assets/images/zp_14.jpg" />
							</a>
							<div class="lightbox-target" id="goofy7">
								<img
									src="${pageContext.request.contextPath}/assets/images/zp_14.jpg" />
								<a class="lightbox-close" href="#"> </a>

								<div class="clearfix"></div>
							</div>
						</div>
					</li>
					<li>
						<div class="biseller-column">
							<a class="lightbox" href="#goofy3"> <img
								src="${pageContext.request.contextPath}/assets/images/zp_4.jpg" />
							</a>
							<div class="lightbox-target" id="goofy3">
								<img
									src="${pageContext.request.contextPath}/assets/images/zp_4.jpg" />
								<a class="lightbox-close" href="#"> </a>

								<div class="clearfix"></div>
							</div>
						</div>
					</li>
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

	<c:if test="${not empty contest }">
		<!-- 摄影比赛通知 -->
		<div class="slider-bottom">
			<div class="container">
				<div class="slider-grids">
					<div class="col-md-12 slider-grid">
						<h3>${contest.contestName }</h3>
						<a href="javascript:void(0);" data-toggle="modal" data-target="#myModal3">查看详情</a>
						<div
							style="height: 200px; width: 100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
							<p class="para-text">${contest.content }</p>

						</div>
							<div>
					<%-- 		
							
							<c:if test="${now > contest.startTime && now <  contest.endTime }">
									<a href="javascript:void(0)"
										class="hvr-rectangle-in button">我要报名</a>
								</c:if> --%>
						<c:if test="${contest.openVote eq true}">
							<c:if
								test="${now > contest.voteStartTime && now <  contest.voteEndTime }">
								<a href="#" class="hvr-rectangle-in button">我要参与投票</a>
							</c:if>

							<c:if test="${now > contest.voteEndTime }">
								<a href="#" class="hvr-rectangle-out label-default">投票已结束(查看结果)</a>
							</c:if>
						<a href="#" class="hvr-rectangle-in button" data-toggle="modal"
								data-target="#myModal2">投票规则详情</a>
						</c:if>
					</div>


					</div>
			
					<div class="clearfix"></div>
				</div>
			</div>
		</div>

	</c:if>

	<!-- 投票规则模态框（Modal） -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 500px; height: 500px;">
			<div class="modal-content">
			<div class="modal-header">
					${contest.contestName }投票规则
				</div>
			<div class="modal-body">
			
				${contest.intro }
			
			</div>
			
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<!-- 投票规则模态框（Modal） -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
			<div class="modal-header">
					${contest.contestName } 详细信息
				</div>
			<div class="modal-body">
				
				${contest.content }
			
			</div>
			
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
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
	<!-- //smooth scrolling -->

</body>
</html>
