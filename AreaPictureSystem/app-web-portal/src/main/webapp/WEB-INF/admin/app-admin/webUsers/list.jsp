<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>注册用户管理</title>


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
								<h5>
									注册用户管理
									<c:if test="${not empty param.error}">
										<span style="color: red; padding-left: 100px;">友情提示：您添加的名称、登录帐号信息已经存在</span>
									</c:if>
								</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a>

								</div>
							</div>
							<div class="ibox-content">

								<p>
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>姓名</th>
											<th>所属单位</th>
											<th>用户名</th>
											<th>联系电话</th>
											<th>邮箱</th>
											<th>使用状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pageList}" var="item" varStatus="status">
											<tr class="gradeX">
												<td>${item.name}</td>
												<td>${item.school}</td>
												<td>${item.accountName}</td>
												<td>${item.phone}</td>
												<td>${item.email}</td>
												<td id="status_${item.id }"><c:if test="${item.status eq true }">
														<span class="label label-primary">正常</span>
													</c:if> <c:if test="${item.status eq false }">
														<span class="label label-danger">已禁用</span>
													</c:if></td>
												<td class="center">
													
													<c:if test="${item.status == true }">
													<button type="button" id="statusButton_${item.id }" onclick="return checkStatus('${item.id}');"
														class="btn btn-danger  btn-xs edit-news" data-id="1">禁用</button>
													</c:if>
													
													<c:if test="${item.status == false }">
													<button type="button" id="statusButton_${item.id }" onclick="return checkStatus('${item.id}');"
														class="btn btn-primary  btn-xs edit-news" data-id="1">启用</button>

													</c:if>
													
													
													

													<button type="button"
														class="btn  btn-warning btn-xs delete-news" data-id="1"
														onclick="deleteAlert('${item.id}')">删除</button>
												</td>
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
		
		
		
		function checkStatus(o){
			
		$.ajax({
			type: "POST",
			url:"${pageContext.request.contextPath}/webUsers/checkStatus",
			data:"id="+o,
			dataType:"json",
			success:function(data){
				if(data.data.status == true){
					//用户是启用状态
					$("#status_"+o).html("<span class='label label-primary'>正常</span>")
					$("#statusButton_"+o).removeClass("btn-primary").addClass("btn-danger").text("禁用");
				}else{
					$("#status_"+o).html("<span class='label label-danger'>已禁用</span>")
					$("#statusButton_"+o).removeClass("btn-danger").addClass("btn-primary").text("启用");
					
				}
				
				
			}
			
			
		})
			
			
		}
		
		
		
		
		
		
	</script>

	<script>
		$(document).ready(function() {
			$('.summernote').summernote({
				lang : 'zh-CN',
				onImageUpload : function(files, editor, $editable) {
					sendFile(files[0], editor, $editable);
				}
			});
			$('.dataTables-example').dataTable();//表格

			// validate the comment form when it is submitted
			$("#add-news-form").validate();//初始化from验证
		});
	</script>

</body>
</html>
