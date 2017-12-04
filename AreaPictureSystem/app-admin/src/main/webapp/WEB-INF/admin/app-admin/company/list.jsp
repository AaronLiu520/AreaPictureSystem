<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>企业单位</title>


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
								<h5>企业单位管理</h5>
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
									<a href="editor">
										<button class="btn btn-primary " type="button">
											<i class="fa fa-plus"></i>&nbsp;添加
										</button>
									</a> <a href="#modal-Company" data-toggle="modal">
										<button class="btn btn-success" type="button">
											<i class="fa fa-upload"></i>&nbsp;批量导入
										</button>
									</a>


								</p>

								<p>
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>名称</th>
											<th>地址</th>
											<th>联系人</th>
											<td>联系电话</td>
											<th>管理帐号</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${pageList}" var="item" varStatus="status">
											<tr class="gradeX">
												<td>${item.name}</td>
												<td>${item.address}</td>
												<td>${item.contacts}</td>
												<td>${item.telPhone}</td>
												<td>${item.name}</td>
												<td class="center"><a href="editor?id=${item.id}">
														<button type="button"
															class="btn btn-primary btn-xs edit-news" data-id="1">编辑</button>
												</a>
													<button type="button"
														class="btn btn-danger btn-xs delete-news" data-id="1"
														onclick="deleteAlert('${item.id}')">删除</button></td>
											</tr>
										</c:forEach>
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


	<!-- 导入模态框start-->
	<div id="modal-Company" class="modal fade" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<h3 class="m-t-none m-b">导入企业信息</h3>
						<div class="col-sm-12">
							<form role="form" class="form-horizontal m-t" id="signupForm"
								action="${pageContext.request.contextPath}/adminCompany/upload"
								enctype="multipart/form-data" method="post">
								<div class="ibox float-e-margins">

									<div class="ibox-content">
										<div id="file-pretty">

											<div class="form-group">
												<div class="col-sm-10">
													<input type="file" style="display: none;" name="upload"
														id="upload" onchange="checkfiletype(this);"
														class="form-control" data-icon="false">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label">模版下载</label>
												<div class="col-sm-10" style="margin-top: 8px;">
													<a
														href="${pageContext.request.contextPath}/adminCompany/download"><font
														color="blue">企业信息导入模版.xls</font></a>
												</div>
											</div>
											<div style="position: relative">
												<div style="position: absolute; left: 0; top: 0">
													<div id="proBartext"></div>
												</div>

												<div class="progress progress-striped active">
													<div id="proBar" class="progress-bar progress-bar-danger">
													</div>
												</div>
											</div>

										</div>

									</div>
								</div>
								<div>


									<button class="btn btn-sm btn-primary pull-right m-t-n-xs"
										type="submit" id="submitCompany">
										<strong>导入</strong>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 导入模态框end -->

	<!-- Prettyfile -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>







	<!-- 删除 -->
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

	<script type="text/javascript">
		$('#file-pretty input[type="file"]').prettyFile();
		//判断上传文件后缀名
		function checkfiletype(o) {
			var file1 = $(o).val();
			if (file1 != null) {
				var file1type = file1.substring(file1.lastIndexOf('.') + 1);
				if (file1type == "xls" || file1type == "xlsx") {
					var size = (o.files[0].size / 1024).toFixed(2);
					if (file1type == "xls" || file1type == "xlsx") {
						if (size > 20480) {
							alert("上传文件过大");
							$(o).val("");
							$("#submit").attr("disabled", true);
							return;
						} else {
							$("#submit").attr("disabled", false);
						}
					}
				} else {
					alert("上传文件格式错误");
					$(o).val("");
					$("#submit").attr("disabled", true);
					return;
				}
			}
		}
	</script>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#submitCompany')
									.bind(
											'click',
											function() {
												var eventFun = function() {
													$
															.ajax({
																type : 'GET',
																url : '${pageContext.request.contextPath}/adminCompany/uploadprocess',
																data : {},
																dataType : 'json',
																success : function(
																		data) {
																	$("#proBar")
																			.attr(
																					"style",
																					"width:"
																							+ (data.nownum / data.allnum)
																							* 100
																							+ '%');
																	$('#proBar')
																			.css(
																					'aria-valuenow',
																					data.nownum
																							+ '%');
																	$('#proBar')
																			.css(
																					'aria-valuemax',
																					data.allnum
																							+ '%');
																	$(
																			'#proBartext')
																			.text(
																					"正在导入第"
																							+ data.nownum
																							+ "条记录，总共"
																							+ data.allnum
																							+ "条记录");
																	if (data.nownum == data.allnum) {
																		window
																				.clearInterval(intId);
																	}
																}
															});
												};
												var intId = window.setInterval(
														eventFun, 100);
											});
						});
	</script>

</body>
</html>
