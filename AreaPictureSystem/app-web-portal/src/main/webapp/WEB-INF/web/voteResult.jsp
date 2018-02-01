<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
<!-- 
<link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css"
	rel="stylesheet"> -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />

<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet" type="text/css" media="all" />


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/Assets/css/zoom.css"
	media="all" />





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
	<jsp:include page="public/inner-banana.jsp" />


	<div class="contact">
		<div class="container">
			<h3>投票结果</h3>


			<button type="button" id="loading-example-btn"
				onClick="javascript :history.back(-1);" class="label label-default"
				style="margin-top: 10px;">返回</button>





			<div class="col-md-12 contact-in">

				<div class="bs-docs-example">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>票数</th>
								<th>姓名</th>
								<th>主题</th>
								<th>上传图片数</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listUsersUploads}" var="items"
								varStatus="status">

								<tr>
									<td>${items.poll }</td>
									<td>${items.users.name }</td>
									<td>${items.theme }</td>
									<td>${fn:length(items.listContestImages)}</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>

			</div>
		</div>

	</div>





	<!-- DROPZONE -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/dropzone/dropzone.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/Assets/js/zoom.min.js"></script>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/Assets/tooltip/javascripts/jquery.tooltip.js"></script>
	<script type="text/javascript">
		$j = jQuery.noConflict();
		$j(document).ready(function() {
			$j("div.item").tooltip();
		});
	</script>

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
