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

<!-- 上传控件 -->
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/basic.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/dropzone.css"
	rel="stylesheet">
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
								<h5>企业单位管理</h5>
							</div>

							<div class="ibox-content">
								<form role="form" id="form"
									action="${pageContext.request.contextPath}/${sessionScope.projectAddress}/adminCompany/createOrUpdateToFind"
									method="post" class="form-horizontal"
									enctype="multipart/form-data">
								
								
								
									<div class="row">
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">名称</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="name" value="${bean.name}"
													name="name" class="form-control" placeholder="请输入学校名称" required>
											</div>
										</div>
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">简称</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="shorts" value="${bean.shorts}"
													name="shorts" class="form-control" placeholder="企业简称"
													required>
											</div>
										</div>
									</div>
									
									<div class="hr-line-dashed"></div>
								
									<div class="row">
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">地址</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="address" value="${bean.address}"
													name="address" class="form-control" placeholder="请输入企业地址" required>
											</div>
										</div>
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">联系人</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="contacts" value="${bean.contacts}"
													name="contacts" class="form-control" placeholder="企业联系人"
													required>
											</div>
										</div>
									</div>
									
									<div class="hr-line-dashed"></div>
								
								
									<div class="row">
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">电话</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="telPhone" value="${bean.telPhone}"
													name="telPhone" class="form-control" placeholder="请输入电话" required 
													onchange="return getrepletes('telPhone');" onkeyup="return getrepletes('telPhone');"
													><label for="telPhone" id="fortelPhone" class="control-label" style="color: red; float: right;"></label>
											</div>
											<input type="hidden" id="telPhonehid" name="telPhonehid" value="${bean.telPhone}">
										</div>
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">email</label>
											<div class="col-sm-8 form-group">
												<input type="text" id="email" value="${bean.email}"
													name="email" class="form-control" placeholder="企业邮箱"
													required>
											</div>
										</div>
									</div>
									
									<div class="hr-line-dashed"></div>

									<div class="row">
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">性质</label>
											<div class="col-sm-8 form-group">
												<select class="form-control" name="nature" id="nature">
													<option value=""></option>
													<option value="ZHISHU">直属单位</option>
													<option value="JICHENG">基层单位</option>
												</select>
											</div>
										</div>
										<div class="col-sm-5">
											<label class="col-sm-4 control-label">类型</label>
											<div class="col-sm-8 form-group">
												<select class="form-control" name="type" id="type">
													<option  value=""></option>
													<option  value="幼儿园">幼儿园</option>
													<option  value="小学">小学</option>
													<option  value="中学">中学</option>
													<option  value="高中">高中</option>
													<option  value="九年制">九年制</option>
													<option  value="直属单位">直属单位</option>
												</select>
											</div>
										</div>
									</div>
									


									<!-- 隐常ID,更新时使用 -->
									<c:if test="${not empty bean.id}">
										<!-- 验证是修改、还是添加 -->
										<input name="id" type="hidden" value="${bean.id}">
										<script type="text/javascript">
											//禁用，用户名。
											$("#userName").attr("readOnly",
													true);
											//角色
											/**
											 *  // $("#adminRoleId").find("option[value='${bean.id}']").attr("selected", "selected");
											 */
										</script>
									</c:if>


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
			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>

	<!-- 上传图片控件 -->
	<div id="modal-form" class="modal fade" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="ibox-content">
							<form id="my-awesome-dropzone" class="dropzone"
								action="uploadFile">
								<div class="dropzone-previews"></div>

								<button type="submit" class="btn btn-primary pull-right">上传文件</button>
							</form>
							<div>
								<div class="m">您可以在此，上传多张图片，建意：1-5张照片</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<!-- Jquery Validate -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>
	<!-- DROPZONE -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/dropzone/dropzone.js"></script>


	<script>
		$(document)
				.ready(
						function() {

							Dropzone.options.myAwesomeDropzone = {

								autoProcessQueue : false,
								uploadMultiple : true,
								parallelUploads : 100,
								maxFiles : 100,
								// Dropzone settings
								init : function() {
									var myDropzone = this;
									this.element
											.querySelector(
													"button[type=submit]")
											.addEventListener(
													"click",
													function(e) {

														e.preventDefault();
														e.stopPropagation();
														myDropzone
																.processQueue();
													});
									this.on("sendingmultiple", function() {
									});
									this
											.on(
													"successmultiple",
													function(files, response) {
														document
																.getElementById("imgid").innerHTML = response;
													});
									this.on("errormultiple", function(files,
											response) {

									});
								}

							}

						});
	</script>

	<script type="text/javascript">
	$(function(){
		$("#nature").find("option[value='${bean.nature}']").prop("selected", true);
		$("#type").find("option[value='${bean.type}']").prop("selected", true);
	})
	
	
	</script>


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
			$("#form").validate({
				rules : {
					name : "required",
					shorts : {
						required : true,
					},
					address : {
						required : true,
					},
					email : {
						required : true,
						email : true
					},
					address : {
						required : true,
					},
					contacts : {
						required : true,
					},
					telPhone : {
						required : true,
						isMobile : true
					},	
					nature : {
						required : true,
					},
					type : {
						required : true,
					},
				},
				messages : {
					name : a + "请输入企业名称",
					shorts : {
						required : a + "请输入企业简称",
					},
					address : {
						required : a + "请输入企业地址",
					},
					
					email : {
						required : a + "请输入您的邮箱地址",
						minlength : a + "用户名必须两个字符以上",
						email:a + "请输入正确的E-mail"
					},
					contacts : {
						required : a + "请输入企业联系人",
					},
					telPhone : {
						required : a + "请收入联系电话",
						isMobile : a + "请输入正确的手机号码"
					},
					nature : {
						required : a + "请选择企业性质"
					},
					type : {
						required : a + "请选择企业类型"
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



<script type="text/javascript">
		//ajax判断有没有重复
		function getrepletes(o1) {
			var r1 = $("#" + o1).val();//获取需要判断是否重复的属性
			var r2 = $("#" + o1 + "hid").val();//该值的隐藏域值 判断如果是原始值则不变

			if (r1 != r2) {
				$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/adminCompany/ajaxgetRepletes",
							data : o1 + "=" + r1,
							dataType : "text",
							success : function(msg) {
								if (msg == "true") {
									document.getElementById("for" + o1).innerHTML = "当前手机号已经创建过企业了！！";
									document.getElementById("for" + o1).style.cssText = "float: right; color: red;";
									$("#save-btn-news").attr("disabled", true);
								} else {
									$("#save-btn-news").attr("disabled", false);
									document.getElementById("for" + o1).innerHTML = " ";
								}
							}
						});
			} else {
				$("#save-btn-news").attr("disabled", false);
				document.getElementById("for" + o1).innerHTML = " ";
			}
		}
	</script>

</body>
</html>
