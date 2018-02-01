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
	<jsp:include page="public/inner-banana.jsp" />


	<div class="contact">
		<div class="container">
			<h3 class="modal-title">${contest.contestName}报名投稿：</h3>
			<button type="button" id="loading-example-btn"
				onClick="javascript :history.back(-1);" class="label label-default"
				style="margin-top: 10px;">返回</button>


			<div class="col-md-12 contact-in">

				<p class="sed-para"></p>

				<div class="col-md-12 contact-grid"></div>
				<p>主办人:${contest.publisher }</p>
				<p>报名时间:${contest.startTime }~${contest.endTime }</p>
				<c:if test="${contest.openVote eq true}">
					<p>投票时间:${contest.voteStartTime }~${contest.voteEndTime }</p>
				</c:if>

				<div class="modal-header">
					<!-- 			<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
 -->
					<!-- <h4 class="modal-title" id="myModalLabel">您已经成功登录，可进行上传图片操作</h4> -->
					<br>
					<c:if test="${not empty contest.maxPictureNum }">
						<h5>当前比赛可支持同时上传${contest.maxPictureNum }张图片</h5>
					</c:if>
					<form method="post" id="uploadImgForm"
						action="${pageContext.request.contextPath}/web/addUsersUpload"
						enctype="multipart/form-data">
						<!-- checkmenu选中 -->
						<input type="hidden" id="loginType"
							value="${sessionScope.checkMenu}" name="type">
						<div class="modal-body">

							<div class="form-group">
								<label>主题：</label> <input type="text" placeholder="上传图片主题"
									name="theme" id="theme" class="form-control"
									value="${usersUploads.theme }" required>
							</div>
							<!-- 活动ID  -->
							<input type="hidden" id="contestId" value="${contest.id }"
								name="contestId"> <input type="hidden" id="editId"
								value="${usersUploads.id}" name="editId">

							<div class="form-group">
								<label>投稿图片</label> <input id="file" name="file" type="file"
									multiple>
							</div>


							<div class="form-group">
								<label>图片背景：</label>
								<textarea placeholder="上传图片背景介绍" rows="5" cols="7"
									maxlength="200"
									onchange="this.value=this.value.substring(0, 200)"
									onkeydown="this.value=this.value.substring(0, 200)"
									onkeyup="this.value=this.value.substring(0, 200)"
									style="resize: none; overflow: scroll;" name="introduce"
									id="introduce" class="form-control " required>${usersUploads.introduce }</textarea>
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
			</div>


		</div>


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
	<c:if test="${not empty status }">
		<script type="text/javascript">
		
		$(function(){
			 $('#titleModel').modal('show');
				$("#modelLabel").html("信息提示");
				 $("#modelContent").html("<center>"+'${status}'+"</center>");			})
		</script>
	
	</c:if>
	



	<script type="text/javascript">

	//执行删除图片
	function todelete(o,o2){
			
		window.location.href="delete?id="+o+"&editId="+o2+"&contestId="+$("#contestId").val()+"&type="+$("#loginType").val();
		}	
		








$('#file').fileinput({
    language: 'zh',
    uploadUrl: '#',
	allowedFileExtensions : [ 'jpg', 'png', 'gif', 'jpeg', 'bmp' ],
	dropZoneTitle : "请上传需要进行投稿的图片！",
	showUpload : false,// 是否显示上传按钮
	showCaption : true,// 是否显示标题
	showPreview : true,// 显示预览
	dropZoneEnabled: true,//是否显示拖拽区域
	maxFileSize : 1024 * 10, // 单位为kb，如果为0表示不限制文件大小
	// browseClass : "btn btn-primary btn-lg",//上传选择按钮样式
	overwriteInitial : false,
	initialPreviewAsData : false, // 配置上传后是否显示预览
	maxFileCount :20, // 表示允许同时上传的最大文件个数
	
	initialPreview : [
	<c:if test="${not empty usersUploads.listContestImages}">
		
		<c:forEach items="${usersUploads.listContestImages }" var="item" varStatus="status">
	"<div class='kv-file-content'><img src='${item.originalPath}' class='kv-preview-data file-preview-image' title='p3.jpg' alt='p3.jpg' style='width:150px;height:150px;'></div>"+
	"<div class='file-thumbnail-footer'>"+
	"<div class='file-footer-caption'title='p3.jpg'>${item.originalName}</div>"+
	"<div class='file-thumb-progress hide'><div class='progress '></div></div>"+
	"<div class='file-actions'>"+
	"<div class='file-footer-buttons'>"+
	"<button type='button' class='kv-file-remove btn btn-xs btn-default' onclick=todelete('${item.id}','${usersUploads.id}'); title='Remove file'>"+
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
		actionDelete:'', //去除上传预览的缩略图中的删除图标
		actionUpload:'',//去除上传预览缩略图中的上传图片；
		actionZoom:''   //去除上传预览缩略图中的查看详情预览的缩略图标。
	},
	
	
})

</script>







</body>
</html>
