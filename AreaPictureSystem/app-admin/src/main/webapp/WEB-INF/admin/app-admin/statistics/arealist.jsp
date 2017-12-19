<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>活动管理</title>


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
								<h5>统计分析</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a>

								</div>
							</div>





							<div class="ibox-content">
								<c:if test="${not empty errorImport }">
									<div class="alert alert-danger alert-dismissable">
										<button aria-hidden="true" data-dismiss="alert" class="close"
											type="button">×</button>
										${errorImport }
									</div>

								</c:if>
								<p>
									<!-- 添加区域帐号 onclick="addFormValue();"-->
									<a href="#modal-form" id="toModal-form" data-toggle="modal">
									</a>
									<button class="btn btn-primary " onclick="return save();"
										type="button">
										<i class="fa fa-plus"></i>&nbsp;添加
									</button>
								<p>
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>上传时间</th>
											<th>活动范围</th>
											<th>学校</th>
											<th>地址</th>
											<th>最大图片数</th>
											<td>活动时间</td>
											<td>创建者</td>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

									
									</tbody>

								</table>
							</div>
						</div>
					</div>


				</div>
			</div>
			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>




	<!-- 动态数据表格，前台查询 -->
	<script>
		$(document).ready(function() {
			$('.summernote').summernote({
				lang : 'zh-CN',
				onImageUpload : function(files, editor, $editable) {
					sendFile(files[0], editor, $editable);
				}
			});
			$('.dataTables-example').dataTable();//表格

		});
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="UTF-8"></script>






</body>
</html>
