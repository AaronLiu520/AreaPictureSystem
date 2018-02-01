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
			<h3 class="tittle">${contest.contestName}报名投稿：</h3>
<button type="button" id="loading-example-btn"  onClick="javascript :history.back(-1);" class="label label-default" style="margin-top: 10px;">返回</button>


<input type="hidden" id="contestId" value="${contest.id }" name="contestId"> 



			<div class="col-md-12 contact-in">

				<p class="sed-para"></p>
				<p class="para1">${contest.content }</p>

				<div class="col-md-12 contact-grid"></div>
				<div class="address-left">
					<p>主办人:${contest.publisher }</p>
					<p>报名时间:${contest.startTime }~${contest.endTime }</p>
					<c:if test="${contest.openVote eq true}">
						<p>投票时间:${contest.voteStartTime }~${contest.voteEndTime }</p>
					</c:if>
				</div>
				<div class="clearfix"></div>

				<c:if test="${now > contest.startTime && now <  contest.endTime }">
					<a href="javascript:void(0)"
						style="margin-top: 10px; margin-bottom: 20px;" data-toggle="modal"
						data-target="#myModal1" class="hvr-rectangle-in button">注册投稿</a>
				<%-- 	<c:if test="${empty sessionScope.webUserSession.accountName }"> --%>
						<a href="javascript:void(0)" id="changeModal"
							style="margin-top: 10px; margin-bottom: 20px;"
							data-toggle="modal" data-target="#toLogin"
							class="hvr-rectangle-in button">登录投稿</a>
			<%-- 		</c:if> --%>
			<%-- 		<c:if test="${not empty sessionScope.webUserSession.accountName }">
						<a href="${pageContext.request.contextPath}/web/toApply?contestId=${contest.id}&type=${sessionScope.checkMenu}" 
							style="margin-top: 10px; margin-bottom: 20px;"
							class="hvr-rectangle-in button">登录投稿</a>
					</c:if> --%>
				</c:if>
				
				
			</div>


		</div>


	</div>


	<!-- 注册模态框（Modal） -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<form method="post" id="signupForm">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">注册投稿</h4>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label>姓名：</label> <input type="text" placeholder="姓名"
								name="name" id="name" class="form-control " required>
						</div>

						<div class="form-group">
							<label>所属学校：</label> <input type="text" placeholder="所属学校"
								name="school" id="school" class="form-control " required>
						</div>

						<div class="form-group">
							<label>邮箱地址：</label> <input type="text" placeholder="邮箱地址"
								name="email" id="email" class="form-control" required>
						</div>
				<button type="button" onclick="return registerSendEmail();" disabled="disabled"  class="btn registerSendEmail"  style="padding-top: 5px;">获取验证码</button>
					
						<div class="form-group" style="margin-top: 20px;">
							<label>验证码：</label> <input type="text" placeholder="验证码"
								name="code" id="registerCode" class="form-control " 
								required>
						</div>
					
					<!-- onblur="return checkCode();" onkeyup="return checkCode();" -->
						<div class="form-group">
							<label>手机号：</label> <input type="text" placeholder="手机号"
								name="phone" id="phone" class="form-control " required>
						</div>

						<div class="form-group">
							<label>帐号：</label> <input type="text" placeholder="帐号"
								name="accountName" id="accountName" class="form-control "
								required>
						</div>

						<div class="form-group">
							<label>密码：</label> <input type="password" placeholder="密码"
								name="password" id="password" class="form-control " required>
						</div>

						<div class="form-group">
							<label>确认密码：</label> <input type="password" placeholder="确认密码"
								name="password1" id="password1" class="form-control " required>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" id="closed" class="btn btn-default"
							data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">注册</button>
					</div>


				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>


	<!-- 登陆模态框（Modal） -->
	<div class="modal fade" id="toLogin" tabindex="-1" role="dialog"
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

				<input type="hidden" id="loginType" value="${sessionScope.checkMenu}" name="type">
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

					 	<a href="#" data-toggle="modal" data-target="#RetrievePassword">忘记密码？</a>
						<button type="button" id="userLoginFormclosed"
							style="display: none;" class="btn btn-default"
							data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">登录</button>
					</div>


				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	
	<!-- 登陆模态框（Modal） -->
	<div class="modal fade" id="RetrievePassword" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<form method="post" id="RetrievePasswordForm">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">密码找回</h4>
					</div>
				<input type="hidden" id="loginType" value="${sessionScope.checkMenu}" name="type">
					<div class="modal-body">
						
						<div class="form-group">
							<label>邮箱：</label> <input type="text" placeholder="请输入邮箱地址"
								name="checkemail" id="checkemail"  class="form-control"
								required>
						</div>
						<button type="button" onclick="return sendEmail();"  class="btn getEmailCode" style="padding-top: 5px;">获取验证码</button>
						
						     
						<div class="form-group" style="margin-top: 20px;">
							<label>验证码：</label> <input type="text" placeholder="验证码"
								name="code" id="code" class="form-control "
								required>
						</div>

						<div class="form-group">
							<label>密码：</label> <input type="password" placeholder="密码"
								name="newpassword1" id="newpassword1" class="form-control " required>
						</div>
						<div class="form-group">
							<label>确认密码：</label> <input type="password" placeholder="确认密码"
								name="newpassword2" id="newpassword2" class="form-control " required>
						</div>
						<input type="hidden" id="id">
					</div>
					<div class="modal-footer">

						<button type="button" id="userLoginFormclosed"
							style="display: none;" class="btn btn-default"
							data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">保存</button>
					</div>


				</form>
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
