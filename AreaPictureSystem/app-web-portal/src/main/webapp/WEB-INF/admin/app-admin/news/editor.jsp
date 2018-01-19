<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>新闻管理</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
</head>

<!-- 动态表格 -->
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />
	<link
	href="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

<body>
	<div id="wrapper">
		<!-- .aside left menu -->
		<%@include file="../../public/left.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="../../public/top.jsp"%>
			<div class="wrapper wrapper-content">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5 id="add-title">新闻发布</h5>
							</div>
							<div class="ibox-content">
								<div class="modal-body">
									<p>
									<form id="signupForm"
										action="${pageContext.request.contextPath}/news/createOrUpdateToFind"
										method="POST" class="form-horizontal"
										enctype="multipart/form-data">
										<div class="form-group">
											<label class="col-sm-2 control-label">标题</label>
											<div class="col-sm-10">
												<input type="text" name="newsTitle" id="newsTitle" value="${news.newsTitle }"
													class="form-control" placeholder="标题" required="required">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">作者</label>
											<div class="col-sm-10">
												<input type="text" name="author" id="author" value="${news.author }"
													class="form-control" placeholder="作者" required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">排序</label>
											<div class="col-sm-10">
											<input type="text" name="sort" id="sort" value="${news.sort }" class="form-control" placeholder="排序">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">状态</label>
											<div class="col-sm-10">
										
												<select class="form-control m-b" name="status">
													<option value="false"<c:if test="${news.status eq false }">selected </c:if>>启用</option>
													<option value="true"<c:if test="${news.status eq true }">selected </c:if>>禁用</option>
												</select>
												
												
											</div>
										</div>
												
												
										
										<div class="form-group">
											<label class="col-sm-2 control-label">创建时间</label>
											<div class="col-sm-10">
											
											<input type="text" placeholder="活动时间"
										name="newsDate" id="newsDate" readonly="readonly" value="${news.newsDate }"
										class="form-control datainput" data-date-format="yyyy-mm-dd" required>
											</div>
										</div>


										<div class="hr-line-dashed"></div>
										<div class="form-group">
											<label class="col-sm-2 control-label">显示图片</label>
											<div class="col-sm-10">
												<input id="myfile" name="pictureFile" type="file" 
													multiple="true">
											</div>
										</div>
										
										<input type="hidden" name="picture" id="picture" value="${news.picture }">


										<div class="hr-line-dashed"></div>
										<div class="form-group" style="margin-bottom: 10%;">
											<textarea name="content" id="content" style="display: none;"></textarea>
											<input type="hidden" id="edit-id" /> <label
												class="col-sm-2 control-label">内容</label>
											<div class="col-sm-10">
												<div class="summernote">${news.content }</div>
											</div>
										</div>

											<input type="hidden" name="editid" value="${news.id }">
										<div class="form-group">
											<div class="text-right">
												<button type="submit" class="btn btn-primary btn-lg"
													id="add-news-btn">保存</button>
											</div>
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>



			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>

	<!-- 删除弹出层提示 -->
	<div class="modal inmodal fade" id="deleteModal6" tabindex="-1"
		role="dialog" aria-hidden="true" style="padding: 15%">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<span style="float: left; color: red; font-size: 18px;">删除提示</span>
				</div>
				<div class="modal-body">
					<h3>您确认是否要删除此记录吗?</h3>
				</div>
				<input type="hidden" id="delete-id">
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="button" onclick="deleteById();"
						class="btn btn-primary delete-confirm-btn">确认</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		var deleteId;
		//删除提示窗口
		function deleteAlert(id) {
			$('#deleteModal6').modal('show');
			deleteId = id;

		}
		//删除记录
		function deleteById() {
			window.location.href = "delete?id=" + deleteId;
		}
	</script>







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
		    	<c:if test="${not empty news.picture}">
		    	"<img src='${news.picture}' class='file-preview-image' style='width:auto;height:160px;'>",  
		    	</c:if>
		
    ], 
		});

 
	</script>



	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
		$('.datainput').datetimepicker({
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	</script>




</body>
</html>
