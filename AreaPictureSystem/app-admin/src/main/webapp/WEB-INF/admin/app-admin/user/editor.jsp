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
								<h5>用户管理</h5>
							</div>
							<div class="ibox-content">
								<form role="form" id="signupForm"  action="createOrUpdateToFind" method="post" class="form-horizontal m-t" >
									<div class="row">
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">姓 名</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="name" value="${bean.name}"
													name="name" class="form-control" placeholder="" required>
											</div>
										</div>
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">用户名</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="userName" value="${bean.userName}"
													name="userName" class="form-control" placeholder=""
													required>
											</div>
										</div>
									</div>
									
									<div class="hr-line-dashed"></div>
									<div class="row">
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">密 码</label>
											<div class="col-sm-8 form-group">
												<input type="password" id="password"
													value="${bean.password}" name="password"
													class="form-control" placeholder="" required>
											</div>
										</div>
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">确认密码</label>
											<div class="col-sm-8 form-group">
												<input type="password" id="passwords"
													value="${bean.password}" name="passwords"
													class="form-control" placeholder="" required>
											</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="row">
									
									
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">性 别</label>
											<div class="col-sm-8 form-group">
											<select class="form-control" name="sex" id="sex">
													<option id="男" value="男">男</option>
													<option id="女" value="女">女</option>
												</select>
											
											</div>
										</div>
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">地 址</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="address" value="${bean.address}"
													name="address" class="form-control" placeholder="" required>
										</div>
									</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="row">
									
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">联系电话</label>
											<div class="col-sm-8  form-group">
												<input type="text" id="tel" value="${bean.tel}" name="tel"
													class="form-control" placeholder="" required>
											</div>
										</div>
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">个人空间大小</label>
											<div class="col-sm-8 m-b form-group">
													 <input id="spaceSize" value="${bean.spaceSize}"
													name="spaceSize" class="form-control" placeholder=""
													required type="text" class="form-control"> 
										</div>
										</div>
									</div>

									<div class="hr-line-dashed"></div>
									<div class="row">
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">用户类型</label>
											<div class="col-sm-8 form-group">
												<select class="form-control" name="userType" id="userType" required>
													<option id="" value=""></option>
													<option id="TEACHER" value="TEACHER">老师</option>
												<c:if test="${sessionScope.userSession.userType eq 'ADMINISTRATORS' }">
													<option id="SCHOOLADMIN" value="SCHOOLADMIN">学校管理员</option>
													<option id="ADMINISTRATORS" value="ADMINISTRATORS">超级管理员</option>
												</c:if>
												</select>
											</div>

										</div>

										<div class="col-sm-5">
											<label class="col-sm-4 control-label">邮箱</label>
											<div class="col-sm-8 form-group">
												<input type="email" id="email" value="${bean.email}"
													name="email" class="form-control" placeholder="" required>
											</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="row">
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">所属单位</label>
											<div class="col-sm-8 form-group">
												<select class="form-control" name="companyId" id="companyId" required>
												<c:if test="${sessionScope.userSession.userType eq 'ADMINISTRATORS' }">
														<option id="" value=""></option>
													<c:forEach items="${company}" var="item" varStatus="status">
														<option id="${item.id}" value="${item.id}">${item.name}</option>
													</c:forEach>
												</c:if>
												<c:if test="${sessionScope.userSession.userType eq 'SCHOOLADMIN' }">
													<c:forEach items="${company}" var="item" varStatus="status">
														<c:if test="${sessionScope.userSession.adminCompany.id eq item.id}">
															<option id="${item.id}" value="${item.id}">${item.name}</option>
														</c:if>
													</c:forEach>
												</c:if>
												</select>
											</div>

										</div>
											<div class="col-sm-5">
											<label class="col-sm-4 control-label">角 色</label>
											<div class="col-sm-8 form-group">
												<select class="form-control" name="roleId" id="roleId" required>
													<c:if test="${sessionScope.userSession.userType eq 'SCHOOLADMIN' }">
														<c:forEach items="${role}" var="item" varStatus="status">
														<%-- 	<c:if test="${item.userType eq 'SCHOOLADMIN'}">
																<option id="${item.id}" value="${item.id}">${item.name}</option>
															</c:if> --%>
															<c:if test="${sessionScope.userSession.userType eq 'SCHOOLADMIN'}">
																<c:if test="${item.userType eq 'TEACHER' }">
																	<option id="${item.id}" value="${item.id}" selected>${item.name}</option>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
													<c:if test="${sessionScope.userSession.userType eq 'ADMINISTRATORS' }">
																<option id="" value="">请选择角色</option>
														<c:forEach items="${role}" var="item" varStatus="status">
																<option id="${item.id}" value="${item.id}">${item.name} </option>
														</c:forEach>
													</c:if>
														
												</select>
											</div>

										</div>

									</div>

									<div class="hr-line-dashed"></div>
									<div class="row">
									

										<div class="col-sm-5">
											<label class="col-sm-4 control-label">头像图片</label>
											<div class="col-sm-8">
												<input id="headImage" name="headImage" type="file"
													class="filestyle" placeholder="选择文件"
													data-classButton="btn btn-default"
													data-classInput="form-control inline v-middle input-s">
											</div>
										</div>
									</div>
									
									
										<div class="hr-line-dashed"></div>
									
										<div class="row">
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">描述</label>
										</div>

										<div class="col-sm-5">
										
										</div>
										
										</div>
										<div class="row">
										<div class="col-sm-1">
											
										</div>

										<div class="col-sm-10">
											<textarea rows="10"  id="reamrk" name="reamrk" 
										style="resize: none; overflow: scroll;margin-top: 20px;margin-left: 30px;" placeholder="描述" class="form-control">${bean.reamrk}</textarea>
										</div>
										
										</div>
									

									<!-- 隐常ID,更新时使用 -->
									<c:if test="${not empty bean.id}">
										<input id="id" name="id" type="hidden" value="${bean.id}">
										<script type="text/javascript">
											//禁用，用户名。
											$("#userName").attr("readOnly",true);
											//权限
											$("#roleId").find( "option[value='${bean.adminRole.id}']") .attr("selected", "selected");
											//用户类型
											$("#userType").find("option[value='${bean.userType}']") .attr("selected", "selected");
											//公司
											$("#companyId").find("option[value='${bean.adminCompany.id}']").attr("selected","selected");
											
											$("#sex").find("option[value='${bean.sex}']").attr("selected","selected");
										</script>
									</c:if>

									<div class="modal-footer" style="margin-top: 20px;">
										<button type="submit" id="save-btn-news"
											class="btn btn-primary">保存</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>


	<!-- Jquery Validate -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>

	<script>
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
		$().ready(function() {
			$("#commentForm").validate();
			var a = "<i class='fa fa-times-circle'></i> ";
			$("#signupForm").validate({
				rules : {
					name : "required",
					userName : {
						required : true,
						minlength : 2
					},
					password : {
						required : true,
						minlength : 5
					},
					passwords : {
						required : true,
						minlength : 5,
						equalTo : "#password"
					},
					email : {
						required : true,
						email : true
					},
					address : {
						required : true,
					},
					tel : {
						required : true,
						isMobile : true  
					},
					spaceSize : {
						required : true,
					},
					userType : {
						required : true,
					},
					companyId : {
						required : true,
					},
					roleId : {
						required : true,
					},
				},
				messages : {
					name : a + "请输入你的姓名",
					userName : {
						required : a + "请输入您的用户名",
						minlength : a + "用户名必须两个字符以上"
					},
					password : {
						required : a + "请输入您的密码",
						minlength : a + "密码必须5个字符以上",
					},
					passwords : {
						required : a + "请再次输入密码",
						minlength : a + "密码必须5个字符以上",
						equalTo : a + "两次输入的密码不一致",
					},
					address : a + "请输入您的地址",
					email : {
						required : a + "请输入您的邮箱地址",
						minlength : a + "用户名必须两个字符以上",
						email:a + "请输入正确的E-mail"
					},
					tel : {
						required : a + "请输入你的手机号",
						isMobile : a+ "请输入正确的手机号"
					},
					spaceSize : {
						required : a + "请输入分配的空间大小"
					},
					userType : {
						required : a + "请选择用户类型"
					},
					companyId : {
						required : a + "请选择所属单位"
					},
					roleId : {
						required : a + "请选择分配角色"
					}
				}
			});
		/* 	$("#username").focus(function() {
				var c = $("#firstname").val();
				var b = $("#lastname").val();
				if (c && b && !this.value) {
					this.value = c + "." + b
				}
			}) */
		});
		
		// 手机号码验证
		jQuery.validator.addMethod("isMobile", function(value, element) {
		    var length = value.length;
		    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
		    return this.optional(element) || (length == 11 && mobile.test(value));
		}, "请正确填写您的手机号码");
		
	</script>

</body>
</html>