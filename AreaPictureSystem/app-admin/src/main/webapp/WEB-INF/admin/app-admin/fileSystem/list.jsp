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

<link
	href="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">


<script type="text/javascript">
	function edit(o) {
		if (o != null) {
			var forderActivityName = "#" + o + "_forderActivityName";
			var address = "#" + o + "_address";
		/* 	var sumPotoCount = "#" + o + "_sumPotoCount"; */
			var id = "#" + o + "_id";
			var boundId = "#" + o + "_boundId";
			var type = "#" + o + "_type";
			var description = "#" + o + "_description";
			var activityTime = "#" + o + "_activityTime";
			var boundCompany = "#" + o + "_adminCompany";

			$("#forderActivityName").val($(forderActivityName).text().trim());
			$("#forderActivityNamehid")
					.val($(forderActivityName).text().trim());
			$("#address").val($(address).text().trim());
/* 			$("#sumPotoCount").val($(sumPotoCount).text().trim()); */
			$("#activityTime").val($(activityTime).text().trim());
			$("#description").val($(description).text().trim());
			$("#edit").val($(id).text().trim());

		/* 	$("#boundId option:contains('" + $(boundId).text().trim() + "')")
					.attr("selected", true); */
			$(
					"#boundCompany option:contains('"
							+ $(boundCompany).text().trim() + "')").attr(
					"selected", true);
			
			
			var aa = $(type).text().trim();
			
			if(aa.indexOf("区域") >= 0 ) { 
			    $("#AREA").attr("checked","true");
			} 
			if(aa.indexOf("直属单位") >= 0 ) { 
				$("#DIRECTLYUTIS").attr("checked","true");
			} 
			if(aa.indexOf("基层单位") >= 0 ) { 
				$("#BASEUTIS").attr("checked","true");
			} 
			if(aa.indexOf("个人") >= 0 ) { 
				$("#PERSION").attr("checked","true");
			} 
			
			$("#toModal-form").trigger("click");

		}

	}

/* 	function save() {
		$("#edit").val("");
		$("#forderActivityName").val("");
		$("#forderActivityNamehid").val("");
		$("#address").val("");
		$("#sumPotoCount").val("");
		$("#activityTime").val("");
		$("#description").val("");
		$("#boundId").find("option[value='']").prop("selected", true);
		$("#type").find("option[value='']").prop("selected", true);
	
	}
 */</script>








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
								<h5>活动管理</h5>
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
								<!-- 		<p>
									添加区域帐号 onclick="addFormValue();"
									<a href="#modal-form" id="toModal-form" data-toggle="modal">
									</a>
									<button class="btn btn-primary " onclick="return save();"
										type="button">
										<i class="fa fa-plus"></i>&nbsp;添加
									</button>
								<p> -->
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>活动名称</th>
											<th>活动范围</th>
											<th>学校</th>
											<th>地址</th>
											<!-- <th>最大图片数</th> -->
											<td>活动时间</td>
											<td>创建者</td>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${pageList}" var="item" varStatus="status">
											<div id="${item.id }_description" style="display: none;">${item.description}</div>
											<div id="${item.id }_id" style="display: none;">${item.id}</div>
											<tr class="gradeX">
												<td id="${item.id }_forderActivityName">${item.forderActivityName}</td>
												<td id="${item.id }_type"><c:forEach
														items="${item.listType }" var="tp">
														<c:if test="${tp.type eq 'AREA'}">
														区域,
												</c:if>
														<c:if test="${tp.type eq 'DIRECTLYUTIS'}">
														直属单位,
												</c:if>
														<c:if test="${tp.type eq 'BASEUTIS'}">
														基层单位,
												</c:if>
														<c:if test="${tp.type eq 'PERSION'}">
														个人
												</c:if>

													</c:forEach></td>
												<td id="${item.id }_adminCompany">${item.adminCompany.name}</td>
												<td id="${item.id }_address">${item.address}</td>
												<%-- <td id="${item.id }_sumPotoCount">${item.sumPotoCount}</td> --%>
												<td id="${item.id }_activityTime">${item.activityTime}</td>
												<td id="${item.id }_createUser">${item.creatUser.name}</td>
												<td class="center"><a href="javascript:void(0);"
													onclick="return edit('${item.id}');">
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


	<!-- 添加活动模态框 start -->

	<%-- <div id="modal-form" class="modal fade" aria-hidden="true"
		style="margin-top: 6%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12">

							<form id="signupForm"
								action="${pageContext.request.contextPath}/forderActivity/creatOrEditActivity"
								method="post">
								<div class="form-group">
									<label>活动名称：</label><label for="forderActivityName"
										id="forforderActivityName" class="control-label"
										style="color: red; float: right;"></label> <input type="text"
										placeholder="请输入活动名称" name="forderActivityName"
										onchange="return getrepletes('forderActivityName');"
										id="forderActivityName" class="form-control" required>
								</div>
								<input type="hidden" id="forderActivityNamehid">

								<div class="form-group">
									<label>活动地址：</label> <input type="text" placeholder="活动地址"
										name="address" id="address" class="form-control">
								</div>






								<div class="form-group">
									<label>活动所属：</label> 
									<div class="checkbox checkbox-inline">
                                        <input type="checkbox" id="AREA" value="AREA" name="type">
                                        <label for="AREA"> 区域 </label>
                                    </div>
									<div class="checkbox checkbox-inline">
                                        <input type="checkbox" id="DIRECTLYUTIS" value="DIRECTLYUTIS" name="type">
                                        <label for="DIRECTLYUTIS"> 直属单位 </label>
                                    </div>
									<div class="checkbox checkbox-inline">
                                        <input type="checkbox" id="BASEUTIS" value="BASEUTIS" name="type">
                                        <label for="BASEUTIS"> 基层单位</label>
                                    </div>
									<div class="checkbox checkbox-inline">
                                        <input type="checkbox" id="PERSION" value="PERSION" name="type">
                                        <label for="PERSION"> 个人 </label>
                                    </div>
									
								</div>

								<c:if
									test="${sessionScope.userSession.userType eq 'ADMINISTRATORS' }">
									<div class="form-group" onchange="return getrepletes('forderActivityName');">
										<label>活动所属学校：</label> <select class="form-control m-b"
											name="boundCompany" id="boundCompany">
											<c:forEach items="${company}" var="item" varStatus="status">
												<option id="${item.id}" value="${item.id}">${item.name}</option>
											</c:forEach>
										</select>
									</div>
								</c:if>



								<div class="form-group">
									<label>活动时间：</label> <input type="text" placeholder="活动时间"
										name="activityTime" id="activityTime" readonly="readonly"
										class="form-control datainput" data-date-format="yyyy-mm-dd" required>
								</div>



								<div class="form-group">
									<label>描述：</label>
									<textarea rows="5" cols="7"
										style="resize: none; overflow: scroll;" placeholder="描述"
										name="description" id="description" class="form-control"></textarea>
								</div>

								<input type="hidden" name="parentId" id="parentId" value="0">
								<input type="hidden" name="edit" id="edit">

								<div>
									<button class="btn btn-sm btn-primary pull-right m-t-n-xs"
										style="margin-top: 20px;" type="submit" id="submit">
										<strong>添加</strong>
									</button>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 --%>
	<!-- 添加文件夹模态框 end -->




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
