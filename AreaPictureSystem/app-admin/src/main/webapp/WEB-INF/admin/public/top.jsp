<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顶部</title>
<link
	href="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<style type="text/css">
.navbar-form-custom .form-control {
	background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
	border: medium none;
	font-size: 14px;
	height: 60px;
	width: 200px;
	margin: 0;
	z-index: 2000;
}
</style>
</head>
<script type="text/javascript">
	function tocleanForm() {
		$("#edAREA").show();
		$("#edDIRECTLYUTIS").show();
		$("#edBASEUTIS").show();
		$("#edPERSION").show();
		$("#boundCompany").attr("disabled", false);

		$("#AREA").each(function() {
			this.checked = false;
		});
		$("#DIRECTLYUTIS").each(function() {
			this.checked = false;
		});
		$("#BASEUTIS").each(function() {
			this.checked = false;
		});
		$("#PERSION").each(function() {
			this.checked = false;
		});
		$("#boundCompany option:first").prop("selected", 'selected');

		$("#CrateActivityForm")[0].reset();

		$("#toModal-form").trigger("click");

	}
</script>


<body>

	<div class="row border-bottom white-bg">
		<nav class="navbar navbar-static-top" role="navigation">
			<div class="navbar-header">
				<div style="width: 80%;">
					<!-- 				 <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i>123 </a>  -->
					<!-- 				 显示与隐常左边的菜单 -->
					<div style="width: 200px; float: left;">
						<button class=" minimalize-styl-2 btn btn-primary"
							onclick="return tocleanForm();" style="width: 200px;">
							<i class="fa fa-plus">&nbsp;&nbsp;<b>上传图片</b></i>
						</button>

						<a class=" minimalize-styl-2 btn btn-primary" id="toModal-form"
							data-toggle="modal" style="display: none;"
							data-target="#CrateActivity" style="width: 200px;"> </a>
					</div>



					<div style="width: 60%; float: left; margin-left: 20px;">
						<form role="search" class="navbar-form-custom " method="post"
							action="${pageContext.request.contextPath}/photoMessageAction/searchImgsByQuerys">
							<div class="row" style="width: 500px;">

								<select class="form-control m-b" name="selectQuery"
									id="selectQuery" style="float: left; margin-left: 20px;">
									<option value="">请选择查询条件</option>
									<option value="createDate">日期</option>
									<option value="uploadPerson">上传者</option>
									<option value="editorImgInfo.resourceName">图片名称</option>
									<option value="editorImgInfo.person">图片主要人物</option>
									<option value="editorImgInfo.photographer">拍摄者</option>
									<option value="editorImgInfo.resourceAddress">地址</option>
								</select> <input type="text" placeholder="请输入您需要查找的内容 …"
									style="float: left;" class="form-control" name="selectVal"
									id="selectVal" value="${selectVal}">

								<button name="name"
									style="float: right; margin-left: 20px; margin-top: 10px;"
									class="btn btn-primary">搜索</button>

								<script type="text/javascript">
									$(function() {
										//回显 "selectQuery"  下拉框id  ${schoolCode} 后台放作用域里的值  
										$("#selectQuery option")
												.each(
														function() {
															if ($(this).val() == '${selectQuery}') {
																$(this)
																		.attr(
																				"selected",
																				true);
															}
														});
									});
								</script>

							</div>

						</form>
					</div>
				</div>
			</div>
			<div class="navbar-collapse collapse" id="navbar"
				style="float: right;">
				<ul class="nav navbar-nav" style="margin-left: 20px;">
					<!-- 以上菜单为固定菜单，以下菜单为动态数据库权限菜单-->


					<c:forEach items="${listMenu}" var="item" varStatus="status">
						<c:if test="${item.type eq 'NoMenu'  && item.pid eq '0'}">
							<li><a aria-expanded="false" role="button"
								href="${pageContext.request.contextPath}/${item.url}?activeMenu=${item.id}">
									${item.name}</a></li>
						</c:if>

						<c:if test="${item.type eq 'HaveMenu'  && item.pid eq '0'}">
							<li class="dropdown"><a aria-expanded="false" role="button"
								href="#" class="dropdown-toggle" data-toggle="dropdown">
									${item.name } <span class="caret"></span>
							</a>
								<ul role="menu" class="dropdown-menu">
									<c:forEach items="${listMenu}" var="subitem" varStatus="status">
										<c:set var="val" value="${subitem.id}_${item.id}"></c:set>
										<c:choose>
											<c:when test="${sessionScope.webMenuSession eq  val}">
												<li class="active">
											</c:when>
											<c:otherwise>
												<li>
											</c:otherwise>
										</c:choose>


										<c:if test="${subitem.pid == item.id}">
											<a
												href="${pageContext.request.contextPath}/${subitem.url}?activeMenu=${subitem.id}_${item.id}">
												<i class="fa ${subitem.icon}"></i> ${subitem.name}
											</a>
										</c:if></li>
					</c:forEach>

				</ul>
				</li>

				</c:if>
				</c:forEach>
				</ul>




				<ul class="nav navbar-top-links navbar-right"
					style="margin-top: -5px;">

					<li><a
						href="${pageContext.request.contextPath}/adminUser/index"
						title="返回首页"> <i class="fa fa-home"></i> 首页
					</a></li>

					<li><a
						href="${pageContext.request.contextPath}/adminUser/loginOut"
						target="mainframer"> <i class="fa fa-sign-out"></i> 退出
					</a></li>
				</ul>
			</div>
		</nav>
	</div>







	<%-- 

	<div class="row border-bottom">
		<nav class="navbar navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<!--  显示与隐常左边的菜单 -->
				<button class=" minimalize-styl-2 btn btn-primary"
					onclick="return tocleanForm();" style="width: 200px;">
					<i class="fa fa-plus">&nbsp;&nbsp;<b>创建活动 </b></i>
				</button>
				<a class=" minimalize-styl-2 btn btn-primary" id="toModal-form"
					data-toggle="modal" style="display: none;"
					data-target="#CrateActivity" style="width: 200px;"> </a>


			</div>

			<form role="search" class="navbar-form-custom " method="post"
				action="${pageContext.request.contextPath}/photoMessageAction/searchImgsByQuerys">

				<div class="form-group ">
					<input type="text" placeholder="请输入您需要查找的内容 …" class="form-control"
						name="selectQuery" id="selectQuery" value="${selectQuery}">
				</div>


			</form>

			<ul class="nav navbar-top-links navbar-right">
				<li><span class="m-r-sm text-muted welcome-message"> <a
						href="${pageContext.request.contextPath}/adminUser/index"
						title="返回首页"> <i class="fa fa-home"></i></a>
				</span></li>

				<li><a
					href="${pageContext.request.contextPath}/adminUser/loginOut"
					target="mainframer"> <i class="fa fa-sign-out"></i> 退出
				</a></li>
			</ul>

		</nav>
	</div>
 --%>





	<!-- 创建活动 -->
	<div class="modal inmodal" id="CrateActivity" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title">新活动／上传图片</h4>
				</div>

				<form method="post" id="CrateActivityForm" action="#">
					<div class="modal-body">
						<div class="form-group">
							<label>拍摄活动：</label><label for="forderActivityName"
								id="forforderActivityName" class="control-label"
								style="color: red; float: right;"></label> <input type="text"
								placeholder="请输入活动名称" name="forderActivityName"
								onkeyup="return getrepletes('forderActivityName');"
								id="forderActivityName" class="form-control" required>
						</div>
						<input type="hidden" id="forderActivityNamehid">

						<div class="form-group">
							<label>拍摄地址：</label> <input type="text" placeholder="活动地址"
								name="address" id="address" class="form-control">
						</div>


						<!-- 	<div class="form-group">
									<label>图片上传最大数量：</label> <input type="text"
										placeholder="图片上传最大数量" name="sumPotoCount" id="sumPotoCount"
										class="form-control" required>
								</div> -->

						<div class="form-group"
							onchange="return getrepletes('forderActivityName');">
							<label>活动所属学校：</label> <select class="form-control m-b"
								onchange="return getrepletes('forderActivityName');"
								name="boundCompany" id="boundCompany" required="required">
								<option id="default" selected="selected">----请选择所属学校----</option>
								<c:forEach items="${company}" var="item" varStatus="status">
									<option id="${item.id}" value="${item.id}">${item.name}</option>
								</c:forEach>
							</select>
						</div>



						<div class="form-group">
							<label>拍摄时间：</label> <input type="text" placeholder="活动时间"
								name="activityTime" id="activityTime" readonly="readonly"
								onchange="return getrepletes('forderActivityName');"
								class="form-control datainput" data-date-format="yyyy-mm-dd"
								required>
						</div>


						<div class="form-group" id="belongTo" style="display: none;">
							<label>活动所属：${item.listType}</label>
							<div class="checkbox checkbox-inline" id="edAREA">
								<input type="checkbox" id="AREA" value="AREA" name="type"
									onclick="return getrepletes('forderActivityName');"> <label
									for="AREA"> 区域 </label>
							</div>
							<div class="checkbox checkbox-inline" id="edDIRECTLYUTIS">
								<input type="checkbox" id="DIRECTLYUTIS" value="DIRECTLYUTIS"
									onclick="return getrepletes('forderActivityName');" name="type">
								<label for="DIRECTLYUTIS"> 直属单位 </label>
							</div>

							<div class="checkbox checkbox-inline" id="edBASEUTIS">
								<input type="checkbox" id="BASEUTIS" value="BASEUTIS"
									onclick="return getrepletes('forderActivityName');" name="type">
								<label for="BASEUTIS"> 基层单位</label>
							</div>
							<div class="checkbox checkbox-inline" id="edPERSION">
								<input type="checkbox" id="PERSION" value="PERSION" name="type"
									onclick="return getrepletes('forderActivityName');"> <label
									for="PERSION"> 个人 </label>
							</div>
						</div>



						<div class="form-group">
							<label>拍摄描述：</label>
							<textarea rows="5" cols="7"
								style="resize: none; overflow: scroll;" placeholder="描述"
								name="description" id="description" class="form-control"></textarea>
						</div>
						<input type="hidden" name="boundId" id="boundId"
							value="${sessionScope.userSession.id}">
						<%-- 			<c:if
							test="${sessionScope.userSession.userType != 'ADMINISTRATORS' }">
							<input type="hidden" name="boundCompany" id="boundCompany"
								value="${sessionScope.userSession.adminCompany.id}">

						</c:if> --%>
						<input type="hidden" name="parentId" id="parentId" value="0">
						<input type="hidden" name="type" id="type" value="${webType}">
						<input type="hidden" name="edit" id="edit">
					</div>
					<div class="modal-footer">
						<button type="submit" id="createActivitySubmit"
							class="btn btn-primary">保存</button>
					</div>
				</form>
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


	<!-- 添加jqueryvalidate -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>


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
			var types = "";
			var r1 = $("#" + o1).val();//获取需要判断是否重复的属性
			var r2 = $("#" + o1 + "hid").val();//该值的隐藏域值 判断如果是原始值则不变

			var boundCompany = $("#boundCompany").val();

			if (boundCompany == null) {
				boundCompany = "";
			}
			var type = $("input[name='type']:checked");

			if (type == null) {
				types = "";
			} else {
				$(type).each(function() {

					types += this.value + ",";

				});

			}
			var activityTime = $("#activityTime").val();

			if (activityTime == null) {
				activityTime = "";
			}

			var data = o1 + "=" + r1 + "&companyId=" + boundCompany + "&type="
					+ types + "&activityTime=" + activityTime;
			if (r1 != r2) {
				$
						.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/forderActivity/ajaxgetRepletes",
							data : data,
							dataType : "json",
							success : function(msg) {
								if (msg.status == 200) {
									$("#createActivitySubmit").attr("disabled",
											false);
									document.getElementById("for" + o1).innerHTML = " ";
								} else {
									document.getElementById("for" + o1).innerHTML = msg.msg;
									document.getElementById("for" + o1).style.cssText = "float: right; color: red;";
									$("#createActivitySubmit").attr("disabled",
											"true");
								}
							}
						});
			} else {
				document.getElementById("for" + o1).innerHTML = " ";
				$("#createActivitySubmit").attr("disabled", false);
			}
		}
	</script>











	<script type="text/javascript">
		$.validator.setDefaults({
			highlight : function(a) {
				$(a).closest(".form-group").removeClass("has-success")
						.addClass("has-error")
			},
			success : function(a) {
				a.closest(".form-group").removeClass("has-error").addClass(
						"has-success")
			},
			errorElement : "span",
			errorPlacement : function(a, b) {
				if (b.is(":radio") || b.is(":checkbox")) {
					a.appendTo(b.parent().parent().parent())
				} else {
					a.appendTo(b.parent())
				}
			},
			errorClass : "help-block m-b-none",
			validClass : "help-block m-b-none"
		});
		$()
				.ready(
						function() {
							$("#commentForm").validate();
							var a = "<i class='fa fa-times-circle'></i> ";
							$("#CrateActivityForm")
									.validate(
											{
												rules : {
													forderActivityName : {
														required : true
													},
													boundCompany : {
														required : true,
														remote : {
															url : "${pageContext.request.contextPath}/forderActivity/findCompanyType",
															type : "POST",
															data : {
																boundCompany : function() {
																	return $(
																			"#boundCompany")
																			.val();
																}
															},
															dataType : "json",
															dataFilter : function(
																	data, type) {

																var jsondata = $
																		.parseJSON(data);
																if (jsondata.status == 200) {
																	$(
																			"#belongTo")
																			.show();

																	if (jsondata.data == "JICHENG") {

																		$(
																				"#DIRECTLYUTIS")
																				.each(
																						function() {
																							this.checked = false;
																						});
																		$(
																				"#edDIRECTLYUTIS")
																				.hide();
																		$(
																				"#edBASEUTIS")
																				.show();
																	}
																	if (jsondata.data == "ZHISHU") {
																		$(
																				"#BASEUTIS")
																				.each(
																						function() {
																							this.checked = false;
																						});
																		$(
																				"#edBASEUTIS")
																				.hide();
																		$(
																				"#edDIRECTLYUTIS")
																				.show();
																	}

																	return true;
																}
																$("#belongTo")
																		.hide();
																return false;
															}
														},

													},
													activityTime : {
														required : true,
													},
													/* 	sumPotoCount : {
															required : true,
															digits : true
														}, */
													type : {
														required : true,
													}
												},
												messages : {
													forderActivityName : {
														required : a
																+ "请输入活动名称"
													},
													boundCompany : a
															+ "请选择所属单位",
													activityTime : {
														required : a
																+ "请选择活动时间"
													},
													/* sumPotoCount : {
														required : a + "请输入上传图片最大数量",
														digits : a + "请输入正确的数字"
													}, */
													type : {
														required : ""
													}
												},
												submitHandler : function(form) { // 验证通过后的执行方法
													// 当前的form通过ajax方式提交（用到jQuery.Form文件）
													$
															.ajax({
																type : "POST",
																url : "${pageContext.request.contextPath}/forderActivity/creatOrEditActivity",
																data : $(
																		"#CrateActivityForm")
																		.serialize(),
																dataType : "json",
																success : function(
																		data) {
																	if (data.status == 200) {
																		$("#CrateActivityForm")[0]
																				.reset()
																		/* 	$("#modelLabel").html("信息提示");
																			$("#modelContent").html(
																					"<center>" + data.msg
																							+ "</center>");
																			$('#titleModel').modal('show'); */
																		location
																				.reload(1000);
																		//$("#CrateActivityForm").modal("hide");
																	} else {
																		$(
																				"#modelLabel")
																				.html(
																						"信息提示");
																		$(
																				"#modelContent")
																				.html(
																						"<center>"
																								+ data.msg
																								+ "</center>");
																		$(
																				'#titleModel')
																				.modal(
																						'show');
																	}
																}
															});
												}
											});
						});
	</script>



</body>
</html>