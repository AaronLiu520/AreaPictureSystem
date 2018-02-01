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
			<h3>${usersUploads.theme }》所有图片：        </h3>

					
	<button type="button" id="loading-example-btn"  onClick="javascript :history.back(-1);" class="label label-default" style="margin-top: 10px;">返回</button>





			<div class="col-md-12 contact-in">


				<!--  gallery 相册弹出层-->
				<div class="col-lg-12 gallery">
					<ul style="display: initial;">
						<c:forEach items="${usersUploads.listContestImages}" var="item"
							varStatus="status">

							<li style="list-style-type: none"><a target="_blank"
								href="${item.originalPath}">

									<div class="file-box">

										<div class="file">
												<div class=" col-md-4">
													<img alt="300x200" style="width: 300px; height: 200px;"
														src="${item.originalPath}" />
												</div>

										</div>
									</div>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>




		<!-- 分页功能-->
		<div class="col-lg-12 gallery" style="margin-bottom: 20px;float: left;">
		
		
		</div>





	</div>



	<!-- 登陆模态框（Modal） -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<form method="post" id="userLoginForm">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">登录投稿</h4>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label>账号：</label> <input type="text" placeholder="帐号"
								name="accountName" id="accountName" class="form-control "
								required>
						</div>

						<div class="form-group">
							<label>密码：</label> <input type="password" placeholder="密码"
								name="password" id="password" class="form-control " required>
						</div>

					</div>
					<div class="modal-footer">

						<!-- 	<a href="#">忘记密码？</a> -->
						<button type="button" id="userLoginFormclosed"
							style="display: none;" class="btn btn-default"
							data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>


				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
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
