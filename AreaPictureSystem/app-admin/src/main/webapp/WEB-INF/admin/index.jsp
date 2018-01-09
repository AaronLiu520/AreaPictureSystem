<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>管理后台</title>

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
<style type="text/css">
.box {
	width: 650px;
	height: 500px;
	overflow: hidden;
	margin: 0 auto;
}
</style>
</head>
<!-- 动态表格 -->
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

<body>
	<div id="wrapper">
		<!-- .aside left menu-->
		<%@include file="public/left.jsp"%>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="public/top.jsp"%>
			<div class="wrapper wrapper-content">
				<div class="ibox-content">
					<div class="row">
						<div class="clients-list">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#tab-1"
									id="a"><i class="fa fa-folder-open-o"></i>最新活动列表</a></li>
								<li class=""><a data-toggle="tab" href="#tab-2" id="b"><i
										class="fa fa-bar-chart-o"></i>上传统计</a></li>
							</ul>
							<div class="tab-content">

								<div id="tab-1" class="tab-pane active">

									<div class="row">
										<div class="col-sm-12">
											<div class="ibox float-e-margins">
												<div class="ibox-content">
													<c:forEach items="${resourcelist.datas}" var="item"
														varStatus="status">
														<a class="fancybox"
															href="${pageContext.request.contextPath}/file/getImg/${item.id}?type=min"
															title="图片名称：${item.originalName }<br/>上传者：${item.uploadPerson }">
															<img alt="image"
															src="${pageContext.request.contextPath}/file/getImg/${item.id}?type=min" />
														</a>

													</c:forEach>


												</div>
											</div>
										</div>

									</div>
								</div>
								<div id="tab-2" class="tab-pane">


									<div class="ibox-content" style="margin-top: 10px;">
										<div class="row">

											<div class="col-md-3">

												<div class="form-group">
													<label class="col-sm-4 control-label"
														style="margin-top: 10px;">统计月数：</label>

													<div class="col-sm-8">
														<select class="form-control m-b" name="month" id="month">
															<option value=""></option>
															<option value="1">1个月</option>
															<option value="2">2个月</option>
															<option value="3">3个月</option>
															<option value="4">4个月</option>
															<option value="5">5个月</option>
															<option value="6">6个月</option>
															<option value="7">7个月</option>
															<option value="8">8个月</option>
															<option value="9">9个月</option>
															<option value="10">10个月</option>
															<option value="11">11个月</option>
															<option value="12">12个月</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-3">

												<div class="form-group">
													<a class="btn btn-white btn-bitbucket flip" id="more"
														onclick="return more();"> <i class="fa fa-toggle-down">&nbsp;&nbsp;更多查询条件</i>
													</a>
													<button class="btn btn-primary" type="button"
														onclick="return tosearch();">查询</button>

												</div>
											</div>
										</div>


										<div class="row panel" style="display: none;" id="more_panel">

											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<div class="col-sm-6">
															<select class="form-control" name="searchQuery1"
																id="searchQuery1" onchange="return search1();">
																<option value="">----请选择查询条件----</option>
																<option value="forderActivityName">活动名称</option>
																<option value="companyName">企业名称</option>
															</select>
														</div>

														<div class="col-sm-6" id="search1" style="display: none;">

															<input type="text" placeholder="请输入查询条件"
																name="searchVal1" id="searchVal1" class="form-control "
																style="display: none"> <select
																class="form-control" name="searchCompany1"
																id="searchCompany1" style="display: none">
																<option value="">----请选择要查询的企业----</option>
																<c:forEach items="${companyList }" var="company"
																	varStatus="status">
																	<option value="${company.id }">${company.name}</option>
																</c:forEach>

															</select>
														</div>
													</div>
												</div>

											</div>


											<div class="row" style="margin-top: 10px;">
												<div class="col-md-4">
													<div class="form-group">
														<div class="col-sm-6">
															<input type="text" placeholder="开始时间" name="start"
																id="start" readonly="readonly"
																class="form-control datainput"
																data-date-format="yyyy-mm-dd">
														</div>

														<div class="col-sm-6">
															<input type="text" placeholder="结束时间" name="end" id="end"
																readonly="readonly" class="form-control datainput"
																data-date-format="yyyy-mm-dd">
														</div>
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<button class="btn  btn-white" onclick="return toclean();">
															<i class="fa fa-times"> </i>清除日期
														</button>
													</div>
												</div>
											</div>

										</div>


									</div>
									<div class="ibox-content">

										<div class="row">
											<table
												class="table table-striped table-bordered table-hover dataTables-example">
												<thead>
													<tr>
														<th>上传排行榜</th>
														<th>上传者</th>
														<th>所属单位</th>
														<th>上传数量</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listsort}" var="item"
														varStatus="status">
														<tr>
															<th>${item.sortnum }</th>
															<th>${item.name }</th>
															<th>${item.adminUser.adminCompany.name }</th>
															<th>${item.uploadnum }</th>
														</tr>
													</c:forEach>
												</tbody>

											</table>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>

				</div>



			</div>


		</div>
		<!-- end message center-->

		<%@include file="public/botton.jsp"%>
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




	<script type="text/javascript">
		$(document).ready(function() {
			$(".flip").click(function() {
				$(".panel").slideToggle("slow");
			});

		});
	</script>

	<script type="text/javascript">
		function search1() {
			var search1val = $("#searchQuery1").find("option:selected").val();
			if (search1val == "") {
				$("#search1").hide();
				$("#searchVal1").hide();
				$("#searchCompany1").hide();
				$("#searchCompany1").val('');
				$("#searchVal1").val('');
			} else if (search1val == 'companyName') {

				$("#search1").show();
				$("#searchVal1").hide();
				$("#searchVal1").val('');
				$("#searchCompany1").show();

			} else {

				$("#search1").show();
				$("#searchVal1").show();
				$("#searchCompany1").hide();
				$("#searchCompany1").val('');

			}
		}

		function toclean() {
			$("#start").attr("placeholder", "开始时间");
			$("#start").val('');
			$("#end").attr("placeholder", "结束时间");
			$("#end").val('');
		}

		function tosearch() {
			var month = $("#month").val();
			var searchQuery1 = $("#searchQuery1").val();
			var search1val = null;
			if (searchQuery1 == 'companyName') {
				search1val = $("#searchCompany1").find("option:selected").val();
			} else {
				search1val = $("#searchVal1").val();
			}
			var start = $("#start").val();
			var end = $("#end").val();

			var data = "month=" + month + "&" + searchQuery1 + "=" + search1val
					+ "&start=" + start + "&end=" + end + "&type=1";

			window.location.href = "index?" + data;

		}
	</script>


	<script type="text/javascript">
		var companyId = '${companyId}';
		var forderActivityName = '${forderActivityName}';
		var month = '${month}';
		var start = '${start}';
		var end = '${end}';
		if(month!=""){
			$("#month").find("option[value=" + month + "]").attr("selected",
			"selected");
		}


		if (companyId != "" || forderActivityName != "" || start != ""
				|| end != "") {
			$(".panel").show();
			$("#search1").show();
			if (companyId != "") {
				$("#searchCompany1").show();
				$("#searchQuery1").find("option[value=companyName]").attr(
						"selected", "selected");
				$("#searchCompany1").find("option[value=" + companyId + "]")
						.attr("selected", "selected");
			}
			if (forderActivityName != "") {
				$("#searchQuery1").find("option[value=forderActivityName]")
						.attr("selected", "selected");
				$("#searchVal1").show();
				$("#searchVal1").val(forderActivityName)
			}

			$("#start").val(start);
			$("#end").val(end);
		}
	</script>


	${triggerClick }


</body>
</html>
