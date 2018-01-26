<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>关于我们</title>

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
								<h5>关于我们</h5>
							</div>
							<div class="ibox-content">

								<form role="form" id="signupForm"
									action="${pageContext.request.contextPath}/aboutUs/saveAboutUs"
									method="post" class="form-horizontal m-t"
									enctype="multipart/form-data">


									<div class="row">
										<div class="col-sm-8">
											<label class="col-sm-4 control-label">关于我们显示图片</label>
											<div class="col-sm-8 form-group">
												<input id="myfile" name="bananaImg" type="file">
												<!--  multiple="true" -->
											</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									
									<input type="hidden" value="${aboutUs.aboutUsPic }" name="aboutUsPic" id="aboutUsPic">

									<div class="row">

										<div class="col-sm-8">
											<label class="col-sm-4 control-label">关于我们描述</label>
											<div class="col-sm-8 form-group">
												<textarea rows="5" cols="7"
													style="resize: none; overflow: scroll;"
													placeholder="关于我们描述" name="aboutUsContent"
													id="aboutUsContent" class="form-control">${aboutUs.aboutUsContent}</textarea>
											</div>
										</div>
									</div>


									<div class="hr-line-dashed"></div>
									<div class="row">

										<div class="col-sm-8">
											<label class="col-sm-4 control-label">教师团队</label>
											<div class="col-sm-8 form-group">
												<input id="file" name="file" type="file" multiple>
											</div>
										</div>
									</div>


									<div class="hr-line-dashed"></div>


									<input type="hidden" name="editid" value="${aboutUs.id }">
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
		$("#myfile")
				.fileinput(
						{
							maxFileCount : 1, //表示允许同时上传的最大文件个数
							allowedFileExtensions : [ 'jpg', 'gif', 'png',
									'jpeg' ],//接收的文件后缀
							language : 'zh', //设置语言
							showUpload : false,//是否显示上传按钮
							showCaption : false,//是否显示标题
							showPreview : true,//显示预览
							browseClass : "btn btn-primary btn-lg",
							initialPreview : [

								<c:if test="${not empty aboutUs.aboutUsPic}">

									"<img src='${aboutUs.aboutUsPic}' class='file-preview-image' style='width:auto;height:160px;'>",
								</c:if>

							],
						});
		

	
		$('#file').fileinput({
			language : 'zh',
			uploadUrl : '#',
			allowedFileExtensions : [ 'jpg', 'png', 'gif', 'jpeg', 'bmp' ],
			dropZoneTitle : "请上传需要进行投稿的图片！",
			showUpload : false,// 是否显示上传按钮
			showCaption : false,// 是否显示标题
			showPreview : true,// 显示预览
			dropZoneEnabled : true,//是否显示拖拽区域
			maxFileSize : 1024 * 10, // 单位为kb，如果为0表示不限制文件大小
			// browseClass : "btn btn-primary btn-lg",//上传选择按钮样式
			overwriteInitial : false,
			initialPreviewAsData : false, // 配置上传后是否显示预览
			maxFileCount : 20, // 表示允许同时上传的最大文件个数
							initialPreview : [
								<c:if test="${not empty aboutUs.listTeachers}">
								
								<c:forEach items="${aboutUs.listTeachers }" var="item" varStatus="status">
							"<div class='kv-file-content'><img src='${item.originalPath}' class='kv-preview-data file-preview-image' title='p3.jpg' alt='p3.jpg' style='width:150px;height:150px;'></div>"+
							"<div class='file-thumbnail-footer'>"+
							"<div class='file-footer-caption'title='p3.jpg'>${item.originalName}</div>"+
							"<div class='file-thumb-progress hide'><div class='progress '></div></div>"+
							"<div class='file-actions'>"+
							"<div class='file-footer-buttons'>"+
							"<button type='button' class='kv-file-remove btn btn-xs btn-default' onclick=todelete('${item.id}','${aboutUs.id}'); title='Remove file'>"+
							"<i class='glyphicon glyphicon-trash text-danger'></i></button></div>"+ 
							"<div class='clearfix'></div></div></div>",		
								</c:forEach>

								</c:if>

							],
			
			// 解决上传图片大小不一
			previewSettings : {
				image : {
					width : "100px",
					height : "100px"
				},
			},
			// 去掉图片上的缩略图按钮
			layoutTemplates : {
				//actionDelete : '', //去除上传预览的缩略图中的删除图标
				actionUpload : '',//去除上传预览缩略图中的上传图片；
				//actionZoom : '' //去除上传预览缩略图中的查看详情预览的缩略图标。
			},

		})
		
		
		
		//执行删除图片
	function todelete(o,o2){
			
			window.location.href="delete?id="+o+"&editId="+o2;
		}	
		
		
		
		//点击删除按钮之后将图片所在input清空
		$(".fileinput-remove-button").click(function(e){
			$("#aboutUsPic").val('');
		})
		//点击删除按钮之后将图片所在input清空
		$(".fileinput-remove").click(function(e){
			$("#aboutUsPic").val('');
		})
		
		
		
		
		
		
		
		
		
	</script>


</body>
</html>