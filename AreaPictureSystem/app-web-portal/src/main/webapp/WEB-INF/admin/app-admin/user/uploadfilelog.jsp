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
								

							
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
										  <tr>
                                    	<th>上传时间</th>
                                        <th>上传图片名</th>
                                        <th>上传位置</th>
                                        <th>图片大小(单位) MB</th>
                                    </tr>
										</tr>
									</thead>
									<tbody>

							    <c:forEach items="${uploadLogList}" var="item" varStatus="status">
                                         <tr class="gradeX">
                                    	<td>${item.date}</td>
                                        <td>${item.name}</td>
                                        <td>${item.place}</td>
                                        <td>${item.imgSize}</td>
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

