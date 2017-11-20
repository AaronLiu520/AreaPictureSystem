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
</head>
<script
	src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>


<body>
	<div id="wrapper">
		<!-- .aside left menu -->
		<%@include file="../../../public/left.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="../../../public/top.jsp"%>
			<div class="wrapper wrapper-content">
				<div class="row">
					<!-- 内容 -->
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>菜单管理</h5>
							</div>
							<div class="ibox-content">
								<form id="add-news-form" action="createOrUpdateToFind" method="post" class="form-horizontal">
										<div class="row">
											
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">名称</label>
												<div class="col-sm-8">
                                            		<input id="name" name="name" type="text" class="form-control" required="" 
                                            		value="${bean.name}" aria-required="true" aria-invalid="true" aria-describedby="cname-error">
                                       			 </div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">类型</label>
												<div class="col-sm-8">
													<select class="form-control m-b" name="type">
		                                                <option value="HaveMenu">有只菜单</option>
		                                                <option value="NoMenu">无子菜单</option>
		                                            </select>
												</div>
											</div>
										</div>
										
										<div class="row">
											
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">地址</label>
												<div class="col-sm-8">
													<input id="url" name="url" type="text" class="form-control" required="" 
                                            		value="${bean.url}" aria-required="true" aria-invalid="true" aria-describedby="cname-error">
                                            		
												</div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">图标</label>
												<div class="col-sm-8">
													<input type="text" id="icon" name="icon" value="${bean.icon}"
														class="form-control" placeholder="图标inc小图标">
												</div>
											</div>
										</div>
										
										<div class="row">
											
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">排序</label>
												<div class="col-sm-8">
													<input id="orderby" name="orderby" type="number" class="form-control" required="" 
                                            		value="${bean.orderby}"aria-required="true" aria-invalid="true" aria-describedby="cname-error">
												</div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">描述</label>
												<div class="col-sm-8">
													<input type="text" id="remark" name="remark" value="${bean.remark}"
														class="form-control" placeholder="备注">
												</div>
											</div>
										</div>
										
									
										
									<!-- 隐常ID,更新时使用 -->
									
									<c:if test="${not empty bean.pid}">
									
									</c:if>
									
									
									<c:choose>
										<c:when test="${not empty bean.pid }">
										<!-- bean不等于空，表示：修改数据信息 -->
											<input id="id" name="id" type="hidden" value="${bean.id }">
											<input id="pid" name="pid" value="${bean.pid}">
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${not empty pid }">
													<!-- PID 不等于空，添加子菜单 -->
													<input id="pid" name="pid" value="${pid}">
												</c:when>
												<c:otherwise>
													<input id="pid" name="pid" value="0">
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
									
									
									
									
									<div class="modal-footer">
										<button type="submit" id="save-btn-news"
											class="btn btn-primary">保存</button>
									</div>
								</form>
							</div>
						</div>
					</div>


				</div>
			</div>
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
	<!-- 主要的 scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/jquery-2.1.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/jeditable/jquery.jeditable.js"></script>

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
