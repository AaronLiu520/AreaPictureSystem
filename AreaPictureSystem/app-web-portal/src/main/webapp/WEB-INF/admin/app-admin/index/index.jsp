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
									
								<input type="hidden" value="${index.banana }" name="banana" id="banana">
									
									
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
											<label class="col-sm-4 control-label">新闻动态banana</label>
											<div class="col-sm-8 form-group">
												<input id="newsbananafile" name="newsbananaImg" type="file">
												<!--  multiple="true" -->
											</div>
										</div>
									</div>
									
									
									
									<div class="hr-line-dashed"></div>
									
										<div class="row">
										<div class="col-sm-8">
											<label class="col-sm-4 control-label">摄影作品banana</label>
											<div class="col-sm-8 form-group">
												<input id="photographybananafile" name="photographybananaImg" type="file">
												<!--  multiple="true" -->
											</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									
									
										<div class="row">
										<div class="col-sm-8">
											<label class="col-sm-4 control-label">摄影比赛banana</label>
											<div class="col-sm-8 form-group">
												<input id="contestbananafile" name="contestbananaImg" type="file">
												<!--  multiple="true" -->
											</div>
										</div>
									</div>
									
									
									
									<div class="hr-line-dashed"></div>
									
									
										<div class="row">
										<div class="col-sm-8">
											<label class="col-sm-4 control-label">关于我们banana</label>
											<div class="col-sm-8 form-group">
												<input id="aboutUsbananafile" name="aboutUsbananaImg" type="file">
												<!--  multiple="true" -->
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
		language : 'zh',
		uploadUrl : '#',
		allowedFileExtensions : [ 'jpg', 'png', 'gif', 'jpeg', 'bmp' ],
		showUpload : false,//是否显示上传按钮
		showCaption : false,//是否显示标题
		showPreview : true,//显示预览
		showRemove:false,
		dropZoneEnabled : false,//是否显示拖拽区域
		maxFileSize : 1024 * 10, // 单位为kb，如果为0表示不限制文件大小
		// browseClass : "btn btn-primary btn-lg",//上传选择按钮样式
		overwriteInitial : false,
		initialPreviewAsData : false, // 配置上传后是否显示预览
						initialPreview : [
							<c:if test="${not empty index.banana }">
							<c:forEach items="${index.banana }" var="item" varStatus="status">
						"<div class='kv-file-content'><img src='${index.banana}' class='kv-preview-data file-preview-image' title='p3.jpg' alt='p3.jpg' style='width:600px;height:200px;'></div>"+
						"<div class='file-thumbnail-footer'>"+
						"<div class='file-thumb-progress hide'><div class='progress '></div></div>"+
						"<div class='file-actions'>"+
						"<div class='file-footer-buttons'>"+
						"<button type='button' class='kv-file-remove btn btn-xs btn-default' onclick=todelete('banana'); title='Remove file'>"+
						"<i class='glyphicon glyphicon-trash text-danger'></i></button></div>"+ 
						"<div class='clearfix'></div></div></div>",		
							</c:forEach>

							</c:if>

						],
						previewSettings : {
							image : {
								width : "600px",
								height : "200px"
							},
						},
		// 去掉图片上的缩略图按钮
		layoutTemplates : {
			//actionDelete : '', //去除上传预览的缩略图中的删除图标
			actionUpload : '',//去除上传预览缩略图中的上传图片；
			//actionZoom : '' //去除上传预览缩略图中的查看详情预览的缩略图标。
		},

		});
	
	
	
	
	
	
	
	
	$("#newsbananafile").fileinput({
		language : 'zh',
		uploadUrl : '#',
		allowedFileExtensions : [ 'jpg', 'png', 'gif', 'jpeg', 'bmp' ],
		showUpload : false,//是否显示上传按钮
		showCaption : false,//是否显示标题
		showPreview : true,//显示预览
		showRemove:false,
		dropZoneEnabled : false,//是否显示拖拽区域
		maxFileSize : 1024 * 10, // 单位为kb，如果为0表示不限制文件大小
		// browseClass : "btn btn-primary btn-lg",//上传选择按钮样式
		overwriteInitial : false,
		initialPreviewAsData : false, // 配置上传后是否显示预览
						initialPreview : [
							<c:if test="${not empty index.newsbanana }">
							<c:forEach items="${index.newsbanana }" var="item" varStatus="status">
						"<div class='kv-file-content'><img src='${index.newsbanana}' class='kv-preview-data file-preview-image' title='p3.jpg' alt='p3.jpg' style='width:600px;height:200px;'></div>"+
						"<div class='file-thumbnail-footer'>"+
						"<div class='file-thumb-progress hide'><div class='progress '></div></div>"+
						"<div class='file-actions'>"+
						"<div class='file-footer-buttons'>"+
						"<button type='button' class='kv-file-remove btn btn-xs btn-default' onclick=todelete('newsbanana'); title='Remove file'>"+
						"<i class='glyphicon glyphicon-trash text-danger'></i></button></div>"+ 
						"<div class='clearfix'></div></div></div>",		
							</c:forEach>

							</c:if>

						],
						previewSettings : {
							image : {
								width : "600px",
								height : "200px"
							},
						},
		// 去掉图片上的缩略图按钮
		layoutTemplates : {
			//actionDelete : '', //去除上传预览的缩略图中的删除图标
			actionUpload : '',//去除上传预览缩略图中的上传图片；
			//actionZoom : '' //去除上传预览缩略图中的查看详情预览的缩略图标。
		},

		});
	
	
	
	
	
	$("#photographybananafile").fileinput({
		language : 'zh',
		uploadUrl : '#',
		allowedFileExtensions : [ 'jpg', 'png', 'gif', 'jpeg', 'bmp' ],
		showUpload : false,//是否显示上传按钮
		showCaption : false,//是否显示标题
		showPreview : true,//显示预览
		showRemove:false,
		dropZoneEnabled : false,//是否显示拖拽区域
		maxFileSize : 1024 * 10, // 单位为kb，如果为0表示不限制文件大小
		// browseClass : "btn btn-primary btn-lg",//上传选择按钮样式
		overwriteInitial : false,
		initialPreviewAsData : false, // 配置上传后是否显示预览
						initialPreview : [
							<c:if test="${not empty index.photographybanana }">
							<c:forEach items="${index.photographybanana }" var="item" varStatus="status">
						"<div class='kv-file-content'><img src='${index.photographybanana}' class='kv-preview-data file-preview-image' title='p3.jpg' alt='p3.jpg' style='width:600px;height:200px;'></div>"+
						"<div class='file-thumbnail-footer'>"+
						"<div class='file-thumb-progress hide'><div class='progress '></div></div>"+
						"<div class='file-actions'>"+
						"<div class='file-footer-buttons'>"+
						"<button type='button' class='kv-file-remove btn btn-xs btn-default' onclick=todelete('photographybanana'); title='Remove file'>"+
						"<i class='glyphicon glyphicon-trash text-danger'></i></button></div>"+ 
						"<div class='clearfix'></div></div></div>",		
							</c:forEach>

							</c:if>

						],
						previewSettings : {
							image : {
								width : "600px",
								height : "200px"
							},
						},
		// 去掉图片上的缩略图按钮
		layoutTemplates : {
			//actionDelete : '', //去除上传预览的缩略图中的删除图标
			actionUpload : '',//去除上传预览缩略图中的上传图片；
			//actionZoom : '' //去除上传预览缩略图中的查看详情预览的缩略图标。
		},

		});
	
	
	
	
	
	$("#contestbananafile").fileinput({
		language : 'zh',
		uploadUrl : '#',
		allowedFileExtensions : [ 'jpg', 'png', 'gif', 'jpeg', 'bmp' ],
		showUpload : false,//是否显示上传按钮
		showCaption : false,//是否显示标题
		showPreview : true,//显示预览
		showRemove:false,
		dropZoneEnabled : false,//是否显示拖拽区域
		maxFileSize : 1024 * 10, // 单位为kb，如果为0表示不限制文件大小
		// browseClass : "btn btn-primary btn-lg",//上传选择按钮样式
		overwriteInitial : false,
		initialPreviewAsData : false, // 配置上传后是否显示预览
						initialPreview : [
							<c:if test="${not empty index.contestbanana }">
							<c:forEach items="${index.contestbanana }" var="item" varStatus="status">
						"<div class='kv-file-content'><img src='${index.contestbanana}' class='kv-preview-data file-preview-image' title='p3.jpg' alt='p3.jpg' style='width:600px;height:200px;'></div>"+
						"<div class='file-thumbnail-footer'>"+
						"<div class='file-thumb-progress hide'><div class='progress '></div></div>"+
						"<div class='file-actions'>"+
						"<div class='file-footer-buttons'>"+
						"<button type='button' class='kv-file-remove btn btn-xs btn-default' onclick=todelete('contestbanana'); title='Remove file'>"+
						"<i class='glyphicon glyphicon-trash text-danger'></i></button></div>"+ 
						"<div class='clearfix'></div></div></div>",		
							</c:forEach>

							</c:if>

						],
						previewSettings : {
							image : {
								width : "600px",
								height : "200px"
							},
						},
		// 去掉图片上的缩略图按钮
		layoutTemplates : {
			//actionDelete : '', //去除上传预览的缩略图中的删除图标
			actionUpload : '',//去除上传预览缩略图中的上传图片；
			//actionZoom : '' //去除上传预览缩略图中的查看详情预览的缩略图标。
		},

		});
	
	
	
	$("#aboutUsbananafile").fileinput({
		language : 'zh',
		uploadUrl : '#',
		allowedFileExtensions : [ 'jpg', 'png', 'gif', 'jpeg', 'bmp' ],
		showUpload : false,//是否显示上传按钮
		showCaption : false,//是否显示标题
		showPreview : true,//显示预览
		showRemove:false,
		dropZoneEnabled : false,//是否显示拖拽区域
		maxFileSize : 1024 * 10, // 单位为kb，如果为0表示不限制文件大小
		// browseClass : "btn btn-primary btn-lg",//上传选择按钮样式
		overwriteInitial : false,
		initialPreviewAsData : false, // 配置上传后是否显示预览
						initialPreview : [
							<c:if test="${not empty index.aboutUsbanana }">
							<c:forEach items="${index.aboutUsbanana }" var="item" varStatus="status">
						"<div class='kv-file-content'><img src='${index.aboutUsbanana}' class='kv-preview-data file-preview-image' title='p3.jpg' alt='p3.jpg' style='width:600px;height:200px;'></div>"+
						"<div class='file-thumbnail-footer'>"+
						"<div class='file-thumb-progress hide'><div class='progress '></div></div>"+
						"<div class='file-actions'>"+
						"<div class='file-footer-buttons'>"+
						"<button type='button' class='kv-file-remove btn btn-xs btn-default' onclick=todelete('aboutUsbanana'); title='Remove file'>"+
						"<i class='glyphicon glyphicon-trash text-danger'></i></button></div>"+ 
						"<div class='clearfix'></div></div></div>",		
							</c:forEach>

							</c:if>

						],
						previewSettings : {
							image : {
								width : "600px",
								height : "200px"
							},
						},
		// 去掉图片上的缩略图按钮
		layoutTemplates : {
			//actionDelete : '', //去除上传预览的缩略图中的删除图标
			actionUpload : '',//去除上传预览缩略图中的上传图片；
			//actionZoom : '' //去除上传预览缩略图中的查看详情预览的缩略图标。
		},

		});
	
	
	
	
	
	
	
	
	
	
	
	
	
	//执行删除图片
	function todelete(o){
			
			window.location.href="delete?type="+o;
		}	
		

 
	</script>


</body>
</html>