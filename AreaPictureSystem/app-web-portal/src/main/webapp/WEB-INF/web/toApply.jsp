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

<!-- fileInput 插件 -->
<link
	href="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />



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
	<div class="inner-banner"></div>


	<div class="contact">
		<div class="container">
			<h3 class="modal-title">${contest.contestName}报名投稿：</h3>




			<c:if test="${contest.maxPictureNum > 0}">
				<input type="hidden" id="maxPictureNum"
					value="${contest.maxPictureNum }">
			</c:if>
			<c:if test="${contest.maxPictureNum eq ''}">
				maxpictureNum<input type="text" id="maxPictureNum" value="9999">
			</c:if>


			<div class="col-md-12 contact-in">

				<p class="sed-para"></p>
				<p class="para1">${contest.content }</p>

				<div class="col-md-12 contact-grid"></div>
					<p>主办人:${contest.publisher }</p>
					<p>报名时间:${contest.startTime }~${contest.endTime }</p>
					<c:if test="${contest.openVote eq true}">
						<p>投票时间:${contest.voteStartTime }~${contest.voteEndTime }</p>
					</c:if>
					
<!-- 				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
 -->					<!-- <h4 class="modal-title" id="myModalLabel">您已经成功登录，可进行上传图片操作</h4> -->
					<br>
					<c:if test="${not empty contest.maxPictureNum }">
						<h5>当前比赛可支持同时上传${contest.maxPictureNum }张图片</h5>
					</c:if>
						<form method="post" id="uploadImgForm"
						action="${pageContext.request.contextPath}/web/addUsersUpload"
						enctype="multipart/form-data">

						<div class="modal-body">

							<div class="form-group">
								<label>主题：</label> <input type="text" placeholder="上传图片主题"
									name="theme" id="theme" class="form-control " required>
							</div>
							<!-- 活动ID  -->
							<input type="hidden" id="contestId" value="${contest.id }"
								name="contestId"> 
								<input type="hidden" id="editId"
								name="editId">


							<div class="form-group">
								<label>上传图片</label> <input id="file" name="file" type="file"
									multiple>
							</div>


							<div class="form-group">
								<label>图片背景：</label>
								<textarea placeholder="上传图片背景介绍" rows="5" cols="7"
									style="resize: none; overflow: scroll;" name="introduce"
									id="introduce" class="form-control " required></textarea>
							</div>

						</div>

						<div class="modal-footer">

							<a href="${pageContext.request.contextPath}/web/loginOut">注销</a>
							<button type="button" id="userLoginFormclosed"
								style="display: none;" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">保存</button>
						</div>
					</form>

					
					
				</div>
				<div class="clearfix"></div>

				<c:if test="${now > contest.startTime && now <  contest.endTime }">
					<a href="javascript:void(0)"
						style="margin-top: 10px; margin-bottom: 20px;" data-toggle="modal"
						data-target="#myModal1" class="hvr-rectangle-in button">注册投稿</a>
					<c:if test="${empty sessionScope.webUserSession.accountName }">
						<a href="javascript:void(0)" id="changeModal"
							onclick="return getUsersUploads('${contest.id}','type1');"
							style="margin-top: 10px; margin-bottom: 20px;"
							data-toggle="modal" data-target="#myModal2"
							class="hvr-rectangle-in button">直接投稿</a>
					</c:if>
					<c:if test="${not empty sessionScope.webUserSession.accountName }">
						<a href="javascript:void(0)" id="changeModal"
							onclick="return getUsersUploads('${contest.id}','type1');"
							style="margin-top: 10px; margin-bottom: 20px;"
							data-toggle="modal" data-target="#myModal3"
							class="hvr-rectangle-in button">直接投稿</a>
					</c:if>
				</c:if>
					<c:if test="${empty sessionScope.webUserSession.accountName }">
					<a href="javascript:void(0)" id="changeModal2"
							onclick="return getMyContestImages('${contest.id}','type2');"
							style="margin-top: 10px; margin-bottom: 20px;"
							data-toggle="modal" data-target="#myModal2"
							class="hvr-rectangle-in button">我的投稿</a>
					</c:if>
					<c:if test="${not empty sessionScope.webUserSession.accountName }">
						<a href="javascript:void(0)" id="changeModal2"
							onclick="return getMyContestImages('${contest.id}','type2');"
							style="margin-top: 10px; margin-bottom: 20px;"
							data-toggle="modal" data-target="#myModal4"
							class="hvr-rectangle-in button">我的投稿</a>
					</c:if>
				
				<input type="text" id="types" value="" name="types">
				
			</div>


		</div>


	</div>


	<!-- 模态框（Modal） 查看我上传的图片 -->
	<div class="modal fade showUpload" id="myModal4" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 80%; height: 200%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">比赛名称：${contest.contestName}</h4>
					<br>
					<c:if test="${not empty contest.maxPictureNum }">
						<h5>您已经投稿了上传${contest.maxPictureNum }张图片</h5>
					</c:if>
				</div>
				<div id="first">

						<div class="modal-body">



					<div class="lightBoxGallery">
                            <a href="img/p_big1.jpg" title="图片" data-gallery=""><img src="img/p1.jpg"></a>
                            <a href="img/p_big2.jpg" title="图片" data-gallery=""><img src="img/p2.jpg"></a>
                            <a href="img/p_big3.jpg" title="图片" data-gallery=""><img src="img/p3.jpg"></a>

					</div>





						</div>

						<div class="modal-footer">

							<a href="${pageContext.request.contextPath}/web/loginOut">注销</a>
							<button type="button" id="userLoginFormclosed"
								style="display: none;" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>


	<!-- 信息提示模态框（Modal） -->
	<div class="modal fade" id="titleModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="margin-top: 10%;">
		<div class="modal-dialog" style="width: 300px; height: 200px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="modelLabel"></h4>
				</div>
				<div class="modal-body" id="modelContent"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script
		src="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/js/fileinput.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/js/locales/zh.js"
		type="text/javascript"></script>
	<!-- 底部 -->
	<jsp:include page="public/botton.jsp" />











</body>
</html>
