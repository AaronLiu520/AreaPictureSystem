<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>角色管理</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />



</head>

<link
	href="${pageContext.request.contextPath}/assets/admin/css/fileSystem/prettyPhoto.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/css/fileSystem/style.default.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">



<script type="text/javascript">
	function edit(o) {
		var forderActivityName = "#"+o+"_forderActivityName";
		var address = "#"+o+"_address";
		var id ="#"+o+"_id";
		var boundId = "#"+o+"_boundId";
		var type = "#"+o+"_type";
		var description = "#"+o+"_description";
		var activityTime = "#"+o+"_activityTime";
		$("#forderActivityName").val($(forderActivityName).val());
		$("#forderActivityNamehid").val($(forderActivityName).val());
		$("#address").val($(address).val());
		$("#editid").val($(id).val());
		$("#description").val($(description).val());
		$("#activityTime").val($(activityTime).val());
		$("#Enumtype").find("option[value="+$(type).val()+"]").prop("selected",true);
		$("#boundId").find("option[value="+$(boundId).val()+"]").prop("selected",true);
		
		
		$("#toModal-form").trigger("click");
		
	}
</script>




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

					<div class="contentpanel">

						<ul class="filemanager-options">
							<li>
								<div class="ckbox ckbox-default">
									<input type="checkbox" id="selectall" value="1" /> <label
										for="selectall">全选</label>
								</div>
							</li>
							<li><a href="" class="itemopt disabled"><i
									class="fa fa-envelope-o"></i> Email</a></li>
							<li><a href="" class="itemopt disabled"><i
									class="fa fa-download"></i> 下载</a></li>
						<!-- 	<li><a href="" class="itemopt disabled"><i
									class="fa fa-pencil"></i> 编辑</a></li> -->
							<li><a href="javascript:void(0);"
								onclick="return deleteAlert();" class="itemopt disabled"><i
									class="fa fa-trash-o"></i> 删除</a></li>



							<li class="filter-type"><a
								href="${pageContext.request.contextPath}/forderActivity/list">根目录</a>/
								<c:if test="${not empty  parentForderActivity}">
									<a
										href="${pageContext.request.contextPath}/forderActivity/list?id=${parentForderActivity.id}&parentId=${parentForderActivity.parentId}">${parentForderActivity.forderActivityName}</a>/
							</c:if> <c:if test="${not empty  forderActivity}">
									<a href="#">${forderActivity.forderActivityName}</a>
									<!-- Show: <a href="all.html"
								class="active">All</a> <a href="document.html">Documents</a> <a
								href="audio.html">Audio</a> <a href="image.html">Images</a> <a
								href="video.html">Videos</a> -->
								</c:if></li>
						</ul>


						<div class="row">
							<div class="col-sm-9">
								<div class="row filemanager">
									<c:forEach items="${listForderActivity}" var="items"
										varStatus="status">
										<div class="col-xs-6 col-sm-4 col-md-2 document">
											<div class="thmb">
												<div class="ckbox ckbox-default">
													<input type="checkbox" id="ids${items.id }" name="ids"
														value="${items.id }" /> <label for="ids${items.id }"></label>
												</div>
												<div class="btn-group fm-group">
													<button type="button"
														class="btn btn-default dropdown-toggle fm-toggle"
														data-toggle="dropdown">
														<span class="caret"></span>
													</button>
													<ul class="dropdown-menu fm-menu" role="menu">
														<li><a href="javascript:void(0);" onclick="return edit('${items.id}');"><i class="fa fa-pencil"></i>修改</a></li>
														<li><a href="#"><i class="fa fa-download"></i>下载</a></li>
														<li><a href="javascript:void(0);"
															onclick="deleteAlert('${items.id}')"><i
																class="fa fa-trash-o"></i>删除</a></li>
													</ul>
												</div>
												<!-- btn-group -->
												<div class="thmb-prev">
													<a href="#"
														ondblclick="window.open('${pageContext.request.contextPath}/forderActivity/list?id=${items.id }&parentId=${items.parentId}','_self')">
														<img
														src="${pageContext.request.contextPath}/assets/admin/FileSystem/Pictures_Folder.png"
														class="img-responsive" alt="" />
													</a>
												</div>

												<input type="hidden" value="${items.forderActivityName }"
													id="${items.id }_forderActivityName"> <input
													type="hidden" value="${items.address }"
													id="${items.id }_address"> <input
													type="hidden" value="${items.boundId }"
													id="${items.id }_boundId"> <input
													type="hidden" value="${items.type }"
													id="${items.id }_type"> <input type="hidden"
													value="${items.description }"
													id="${items.id }_description"> <input
													type="hidden" value="${items.activityTime }"
													id="${items.id }_activityTime"><input
													type="hidden" value="${items.id }"
													id="${items.id }_id">






												<h5 class="fm-title">
													<a href="">${items.forderActivityName}</a>
												</h5>
												<small class="text-muted">${items.activityTime}</small>
											</div>
											<!-- thmb -->
										</div>
										<!-- col-xs-6 -->
									</c:forEach>


								</div>
								<!-- row -->
							</div>
							<!-- col-sm-9 -->
							<div class="col-sm-3">
								<div class="fm-sidebar">

									<button class="btn btn-primary btn-block">上传资源</button>
									<div class="mb30"></div>

									<h5 class="subtitle">
										所有文件夹 <a id="toModal-form" data-toggle="modal" href="#modal-form"
											class="pull-right">+ 创建活动文件夹</a>
									</h5>
									<ul class="folder-list">
										<c:forEach items="${listForderActivity}" var="items"
											varStatus="status">
											<li><a href="#" onclick="window.open('${pageContext.request.contextPath}/forderActivity/list?id=${items.id }&parentId=${items.parentId}','_self')"><i class="fa fa-folder-o"></i>${items.forderActivityName}</a>
										</c:forEach>

									</ul>

									<div class="mb30"></div>

									<h5 class="subtitle">Tags</h5>
									<ul class="tag-list">
										<li><a href="">Animation</a></li>
										<li><a href="">Design</a></li>
										<li><a href="">Trailer</a></li>
										<li><a href="">Short Film</a></li>
										<li><a href="">Dubstep</a></li>
										<li><a href="">Soundtrack</a></li>
										<li><a href="">Photography</a></li>
										<li><a href="">Macro</a></li>
										<li><a href="">Tuturials</a></li>
										<li><a href="">Documentation</a></li>
									</ul>

								</div>
							</div>
							<!-- col-sm-3 -->
						</div>
					</div>

					<!-- 内容 end-->
				</div>
			</div>
			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>

	<!-- 添加文件夹模态框 start -->

	<div id="modal-form" class="modal fade" aria-hidden="true"
		style="margin-top: 6%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12">

							<form
								action="${pageContext.request.contextPath}/forderActivity/createForder"
								method="post">
								<div class="form-group">
									<label>文件夹/活动名称：</label><label id="forforderActivityNamehid"></label> <input type="text"
										placeholder="请输入文件夹/活动名称" name="forderActivityName" onchange="return getrepletes('forderActivityName');"
										id="forderActivityName" class="form-control">
								</div>
								<input type="hidden" id="forderActivityNamehid" > 

								<div class="form-group">
									<label>活动地址：</label> <input type="text" placeholder="活动地址"
										name="address" id="address" class="form-control">
								</div>

								<div class="form-group">
									<label>文件夹绑定：</label> <select class="form-control m-b"
										name="boundId" id="boundId">
										<option value="0">个人</option>
										<option value="1">单位</option>
									</select>
								</div>

								<div class="form-group">
									<label>文件夹类别：</label> <select class="form-control m-b"
										name="Enumtype" id="Enumtype" >
										<option value="QUYU">区域</option>
										<option value="ZHISHU">直属单位</option>
										<option value="GEREN">个人</option>
									</select>
								</div>

								<div class="form-group">
									<label>活动时间：</label> <input type="text" placeholder="活动地址"
										name="activityTime" id="activityTime"
										class="form-control datainput" data-date-format="yyyy-mm-dd">
								</div>



								<div class="form-group">
									<label>描述：</label>
									<textarea rows="5" cols="7"
										style="resize: none; overflow: scroll;" placeholder="描述"
										name="description" id="description" class="form-control"></textarea>
								</div>

								<input type="text" name="parentId" id="parentId" value="${id }">
								<input type="text" name="editid" id="editid">





								<div>
									<button class="btn btn-sm btn-primary pull-right m-t-n-xs"
										type="submit" id="submit">
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

	<!-- 添加文件夹模态框 end -->








	<!-- 删除弹出层提示 -->
	<div class="modal inmodal fade" id="deleteModal6" tabindex="-1"
		role="dialog" aria-hidden="true" style="padding: 15%">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<span style="float: left; color: red; font-size: 10px;">删除提示（删除的数据将无法还原）</span>
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







	<script
		src="${pageContext.request.contextPath}/assets/admin/js/fileSystem/jquery-migrate-1.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/fileSystem/modernizr.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/fileSystem/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/fileSystem/toggles.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/fileSystem/retina.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/fileSystem/jquery.cookies.js"></script>




	<script
		src="${pageContext.request.contextPath}/assets/admin/js/fileSystem/jquery.prettyPhoto.js"></script>

	<script
		src="${pageContext.request.contextPath}/assets/admin/js/fileSystem/custom.js"></script>



	<!-- datepicker  日期控件js-->
	<%-- <script src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script> --%>

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

//ajax判断有没有重复
function getrepletes(o1) {
	var r1 = $("#" + o1).val();//获取需要判断是否重复的属性
	var r2 = $("#" + o1 + "hid").val();//该值的隐藏域值 判断如果是原始值则不变
	if (r1 != '#') {
		if (r1 != r2) {
			$.ajax({
						type : "POST",
						url : "ajaxgetRepletes",
						data : o1 + "=" + r1,
						dataType : "text",
						success : function(msg) {
							if (msg == "true") {//
								document.getElementById("for" + o1).innerHTML = "当前值已存在！！";
								document.getElementById("for" + o1).style.cssText = "float: right; color: red;";
								$("#submit").attr("disabled", true);
							} else {
								$("#submit").attr("disabled", false);
								document.getElementById("for" + o1).innerHTML = " ";
							}
						}
					});
		}
	}
}

</script>








	<script type="text/javascript">
		jQuery(document).ready(function() {

			"use strict";

			jQuery('.thmb').hover(function() {
				var t = jQuery(this);
				t.find('.ckbox').show();
				t.find('.fm-group').show();
			}, function() {
				var t = jQuery(this);
				if (!t.closest('.thmb').hasClass('checked')) {
					t.find('.ckbox').hide();
					t.find('.fm-group').hide();
				}
			});

			jQuery('.ckbox').each(function() {
				var t = jQuery(this);
				var parent = t.parent();
				if (t.find('input').is(':checked')) {
					t.show();
					parent.find('.fm-group').show();
					parent.addClass('checked');
				}
			});

			jQuery('.ckbox').click(function() {
				var t = jQuery(this);
				if (!t.find('input').is(':checked')) {
					t.closest('.thmb').removeClass('checked');
					enable_itemopt(false);
				} else {
					t.closest('.thmb').addClass('checked');
					enable_itemopt(true);
				}
			});

			jQuery('#selectall').click(function() {
				if (jQuery(this).is(':checked')) {
					jQuery('.thmb').each(function() {
						jQuery(this).find('input').attr('checked', true);
						jQuery(this).addClass('checked');
						jQuery(this).find('.ckbox, .fm-group').show();
					});
					enable_itemopt(true);
				} else {
					jQuery('.thmb').each(function() {
						jQuery(this).find('input').attr('checked', false);
						jQuery(this).removeClass('checked');
						jQuery(this).find('.ckbox, .fm-group').hide();
					});
					enable_itemopt(false);
				}
			});

			function enable_itemopt(enable) {
				if (enable) {
					jQuery('.itemopt').removeClass('disabled');
				} else {

					// check all thumbs if no remaining checks
					// before we can disabled the options
					var ch = false;
					jQuery('.thmb').each(function() {
						if (jQuery(this).hasClass('checked'))
							ch = true;
					});

					if (!ch)
						jQuery('.itemopt').addClass('disabled');
				}
			}

			jQuery("a[data-rel^='prettyPhoto']").prettyPhoto();

		});

		var deleteId;
		//删除提示窗口
		function deleteAlert(id) {
			$('#deleteModal6').modal('show');

			if (id == null)
				var delids = $("input[name='ids']:checked");
			//获取所有的id执行删除操作，使用ajax
			var str = "";
			$(delids).each(function() {
				str += this.value + ",";
			});
			if (str != "") {
				var ids = str.substring(0, str.length - 1);
				deleteId = ids;
			}

		}
		//删除记录
		function deleteById() {
			window.location.href = "delete?id=" + deleteId + "&parentId="
					+ $("#parentId").val();
		}

		//表格查询
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

</body>
</html>
