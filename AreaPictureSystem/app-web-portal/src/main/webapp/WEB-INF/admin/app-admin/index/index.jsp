<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>编缉信息</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/logo_title.png"
	type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />



</head>
<body>
	<div id="wrapper">
		<!-- .aside left menu -->
		<%@include file="../../public/left.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="../../public/top.jsp"%>
			<div class="wrapper wrapper-content">
				<div class="row">
					<!-- 内容 -->
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>网站首页配置</h5>
							</div>
							<div class="ibox-content">
								<form role="form" id="signupForm"
									action="${pageContext.request.contextPath}/index/saveIndex"
									method="post" class="form-horizontal m-t"
									enctype="multipart/form-data">


									<div class="row">
										<div class="col-sm-8">
											<label class="col-sm-4 control-label">网站首页banana</label>
											<div class="col-sm-8 form-group">
												<input id="myfile" name="bananaImg" type="file">
												<!--  multiple="true" -->
											</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>

									<div class="row">

										<div class="col-sm-8">
											<label class="col-sm-4 control-label">banana描述</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="bananaTitle"
													value="${index.bananaTitle}" name="bananaTitle"
													class="form-control" placeholder="">
											</div>
										</div>
									</div>


									<div class="hr-line-dashed"></div>
									<div class="row">

										<div class="col-sm-8">
											<label class="col-sm-4 control-label">banana内容设置</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="bananaContent"
													value="${index.bananaContent}" name="bananaContent"
													class="form-control" placeholder="">
											</div>
										</div>
									</div>

									<div class="hr-line-dashed"></div>
									<div class="row">
										<div class="col-sm-8">
											<label class="col-sm-4 control-label">公告</label>
											<div class="col-sm-8 form-group">
												<textarea rows="5" cols="7"
													style="resize: none; overflow: scroll;" placeholder="描述"
													name="toPublic" id="toPublic" class="form-control">${index.toPublic }</textarea>
											</div>
										</div>
									</div>


									<div class="hr-line-dashed"></div>


									<input type="hidden" name="editid" value="${index.id }">
									<div class="col-sm-8">
										<div class="modal-footer" style="margin-top: 20px;">
											<button type="submit" id="save-btn-news"
												class="btn btn-primary">保存</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>


	<!-- Jquery Validate -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/js/fileinput.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/js/fileinput_locale_zh.js"
		type="text/javascript"></script>



	<script>
	$("#myfile").fileinput({
			 maxFileCount : 1, //表示允许同时上传的最大文件个数
			allowedFileExtensions : [ 'jpg', 'gif', 'png', 'jpeg' ],//接收的文件后缀
			language : 'zh', //设置语言
			showUpload : false,//是否显示上传按钮
			showCaption : false,//是否显示标题
			showPreview : true,//显示预览
			browseClass : "btn btn-primary btn-lg",
		    initialPreview: [
		    	"<img src='${index.banana}' class='file-preview-image' style='width:auto;height:160px;'>",  
		
    ], 
		});





 
	</script>


</body>
</html>