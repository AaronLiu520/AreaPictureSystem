var maxPictureNum = "";
var nowNum = "";

// left.jsp 修改密码检验就密码是否相同
// js获取项目根路径，如： http://localhost:80 83/uimcardprj
function getRootPath() {
	// 获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	// 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	// 获取主机地址，如： http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// 获取带"/"的项目名，如：/uimcardprj
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPaht + projectName);
}

// 网站js
function toApply(o1, o2) {

	if (o1 != "") {
		var data = "id=" + o1 + "&type=" + o2;
		window.location.href = "apply?" + data;
	}

}

// 文本框校验
$.validator.setDefaults({
	highlight : function(a) {
		$(a).closest(".form-group").removeClass("has-success").addClass(
				"has-error")
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
$().ready(
		function() {
			$("#commentForm").validate();

			var a = "<i class='fa fa-times-circle'></i> ";
			$("#signupForm").validate(
					{
						rules : {
							name : {
								required : true
							},
							school : {
								required : true
							},
							phone : {
								required : true,
								isMobile : true,
								remote : {
									url : getRootPath() + "/web/checkPhone",
									type : "POST",
									data : {
										phone : function() {
											return $("#phone").val();
										}
									},
									dataType : "json",
									dataFilter : function(data, type) {
										var jsondata = $.parseJSON(data);
										if (jsondata.status == 200) {
											return true;
										}
										return false;
									}
								},
							},
							email : {
								required : true,
								email : true,
								remote : {
									url : getRootPath() + "/web/checkEmail",
									type : "POST",
									data : {
										email : function() {
											return $("#email").val();
										}
									},
									dataType : "json",
									dataFilter : function(data, type) {
										var jsondata = $.parseJSON(data);
										if (jsondata.status == 200) {
											$(".registerSendEmail").prop(
													"disabled", "");
											return true;
										}
										$(".registerSendEmail").prop(
												"disabled", "disabled");
										return false;
									}
								},
							},
							code : {
								required : true,
								remote : {
									url : getRootPath() + "/web/checkCode",
									type : "POST",
									data : {
										code : function() {
											return $("#registerCode").val();
										}
									},
									dataType : "json",
									dataFilter : function(data, type) {
										var jsondata = $.parseJSON(data);
										if (jsondata.status == 200) {
											return true;
										}
										return false;
									}
								},
							},
							accountName : {
								required : true,
								minlength : 5,
								remote : {
									url : getRootPath()
											+ "/web/checkAccountName",
									type : "POST",
									data : {
										email : function() {
											return $("#accountName").val();
										}
									},
									dataType : "json",
									dataFilter : function(data, type) {
										var jsondata = $.parseJSON(data);
										if (jsondata.status == 200) {
											return true;
										}
										return false;
									}
								},
							},
							password : {
								required : true,
								minlength : 5
							},
							password1 : {
								required : true,
								minlength : 5,
								equalTo : "#password"
							},
						},
						messages : {
							name : {
								required : a + "请输入姓名"
							},
							school : {
								required : a + "请输入所属学校"
							},
							phone : {
								required : a + "请输入手机号",
								isMobile : a + "请输入正确的手机号",
								remote : a + "该手机号已经被注册"
							},
							email : {
								required : a + "请输入邮箱地址",
								email : a + "请输入正确的邮箱地址",
								remote : a + "该邮箱地址已经被注册"
							},
							code : {
								required : a + "请输入验证码",
								remote : a + "输入的验证码错误"
							},
							accountName : {
								required : a + "请输入帐号",
								minlength : a + "用户帐号必能少于5个字符",
								remote : a + "该帐号已经被注册"
							},
							password : {
								required : a + "请输入密码",
								minlength : a + "密码不能少于5个字符"
							},
							password1 : {
								required : a + "请再次输入密码",
								minlength : a + "密码不能少于5个字符",
								equalTo : a + "两次密码输入不一致"
							},

						},

						submitHandler : function(form) { // 验证通过后的执行方法
							// 当前的form通过ajax方式提交（用到jQuery.Form文件）
							$.ajax({
								type : "POST",
								url : getRootPath() + "/web/register",
								data : $("#signupForm").serialize(),
								dataType : "json",
								success : function(data) {
									if (data.status == 200) {
										$("#signupForm")[0].reset();

										$("#closed").trigger("click");
										var txt = data.msg;
										if (data.status == 200) {
											$("#modelLabel").html("注册成功");
											$("#modelContent").html(
													"<center>" + data.msg
															+ "</center>");
											$('#titleModel').modal('show');
										} else {
											$("#modelLabel").html("注册失败");
											$("#modelContent").html(
													"<center>" + data.msg
															+ "</center>");
											$('#titleModel').modal('show');
										}
									}
								}
							});
						}
					});

			// 登录验证
			$("#userLoginForm").validate(
					{
						rules : {
							accountName : {
								required : true,
							},
							password : {
								required : true,
							},
						},
						messages : {
							accountName : {
								required : a + "请输入帐号",
							},
							password : {
								required : a + "请输入密码",
							},

						},

						submitHandler : function(form) { // 验证通过后的执行方法
							// 当前的form通过ajax方式提交（用到jQuery.Form文件）
							$.ajax({
								type : "POST",
								url : getRootPath() + "/web/userLogin",
								data : $("#userLoginForm").serialize(),
								dataType : "json",
								success : function(data) {
									if (data.status == 200) {
										$("#userLoginForm")[0].reset()
										$("#userLoginFormclosed").trigger(
												"click");
										window.location.href = getRootPath()
												+ "/web/toApply?contestId="
												+ $("#contestId").val()
												+ "&type="
												+ $("#loginType").val();
									} else {
										$("#userLoginForm")[0].reset()
										$("#modelLabel").html("登录失败");
										$("#modelContent").html(
												"<center>" + data.msg
														+ "</center>");
										$('#titleModel').modal('show');
									}

								}
							});
						}
					});

			/*
			 * $('#file').fileinput({ language : 'zh', uploadUrl : getRootPath() +
			 * '/web/uploadImgs', allowedFileExtensions : [ 'jpg', 'png', 'gif',
			 * 'jpeg', 'bmp' ], dropZoneTitle : "请上传需要进行投稿的图片！", showUpload :
			 * false,// 是否显示上传按钮 showCaption : true,// 是否显示标题 showPreview :
			 * true,// 显示预览 dropZoneEnabled: true,//是否显示拖拽区域 maxFileSize : 1024 *
			 * 10, // 单位为kb，如果为0表示不限制文件大小 // browseClass : "btn btn-primary
			 * btn-lg",//上传选择按钮样式 overwriteInitial : false, initialPreviewAsData :
			 * false, // 配置上传后是否显示预览 maxFileCount : $("#maxPictureNum").val(), //
			 * 表示允许同时上传的最大文件个数 // 解决上传图片大小不一 previewSettings : { image : { width :
			 * "100px", height : "100px" }, }, // 去掉图片上的缩略图按钮 layoutTemplates : {
			 * actionDelete:'', //去除上传预览的缩略图中的删除图标
			 * actionUpload:'',//去除上传预览缩略图中的上传图片； actionZoom:''
			 * //去除上传预览缩略图中的查看详情预览的缩略图标。 },
			 * 
			 * initialPreviewConfig: [{ caption: 'desert.jpg',// 展示的图片名称 width:
			 * '100px',// 图片高度 height:'100px', url: 'delete',// 预展示图片的删除调取路径
			 * key: 100,// 可修改 场景2中会用的 extra: {id: 100} //调用删除路径所传参数 }],
			 * 
			 * }).on("fileuploaded", function(e, data) { var res =
			 * data.response; alert(res.msg) var a = $("#fileImagePath").val();
			 * $("#fileImagePath").val(a + "," + res.id); });
			 */

			// 登录验证
			$("#uploadImgForm").validate(
					{
						rules : {
							theme : {
								required : true,
							},
							introduce : {
								required : true,
							},
						},
						messages : {
							theme : {
								required : a + "请输入主题信息",
							},
							introduce : {
								required : a + "请添加对上传图片的介绍",
							},

						},

						submitHandler : function(form) { // 验证通过后的执行方法
							// 当前的form通过ajax方式提交（用到jQuery.Form文件）
							$.ajaxSubmit({
								type : "POST",
								// url : getRootPath() + "/web/addUsersUpload",
								data : $("#uploadImgForm").serialize(),
								dataType : "json",
								success : function(data) {
									var types = $("#types").val();
									if (data.status == 200) {

										$("#editId").val(data.data.id);
										$("#usersUploadsId").val(data.data.id);
										$("#modelLabel").html("信息提示");
										$("#modelContent").html(
												"<center>" + data.msg
														+ "</center>");
										$('#titleModel').modal('show');
									}
								}
							});
						}
					});

			$("#RetrievePasswordForm").validate(
					{
						rules : {

							checkemail : {
								required : true,
								email : true,
								remote : {
									url : getRootPath() + "/web/checkEmail",
									type : "POST",
									data : {
										email : function() {
											return $("#checkemail").val();
										}
									},
									dataType : "json",
									dataFilter : function(data, type) {
										var jsondata = $.parseJSON(data);
										if (jsondata.status == 203) {

											$(".getEmailCode").prop("disabled",
													"");
											return true;
										}
										if (jsondata.status == 200) {

											$(".getEmailCode").prop("disabled",
													"disabled");
											return false;
										}
									}
								},
							},
							code : {
								required : true,
								remote : {
									url : getRootPath() + "/web/checkCode",
									type : "POST",
									data : {
										code : function() {
											return $("#code").val();
										}
									},
									dataType : "json",
									dataFilter : function(data, type) {
										var jsondata = $.parseJSON(data);
										if (jsondata.status == 200) {
											return true;
										}
										return false;
									}
								},
							},
							newpassword1 : {
								required : true,
								minlength : 5
							},
							newpassword2 : {
								required : true,
								minlength : 5,
								equalTo : "#newpassword1"
							},
						},
						messages : {

							checkemail : {
								required : a + "请输入邮箱地址",
								email : a + "请输入正确的邮箱地址",
								remote : a + "您输入的邮箱地址未被注册！"
							},
							code : {
								required : a + "请输入验证码",
								remote : a + "输入的验证码错误"
							},
							newpassword1 : {
								required : a + "请输入密码",
								minlength : a + "密码不能少于5个字符"
							},
							newpassword2 : {
								required : a + "请再次输入密码",
								minlength : a + "密码不能少于5个字符",
								equalTo : a + "两次密码输入不一致"
							},

						},

						submitHandler : function(form) { // 验证通过后的执行方法
							// 当前的form通过ajax方式提交（用到jQuery.Form文件）
							$.ajax({
								type : "POST",
								url : getRootPath() + "/web/ChangePassword",
								data : "id=" + $("#id").val() + "&password="
										+ $("#newpassword1").val(),
								dataType : "json",
								success : function(data) {
									if (data.status == 200) {
										$("#RetrievePasswordForm")[0].reset()
										$("#modelLabel").html("信息提示");
										$("#modelContent").html(
												"<center>" + data.msg
														+ "</center>");
										$('#titleModel').modal('show');
										$("#RetrievePassword").modal("hide");
									} else {
										$("#modelLabel").html("信息提示");
										$("#modelContent").html(
												"<center>" + data.msg
														+ "</center>");
										$('#titleModel').modal('show');
									}
								}
							});
						}
					});

		});

// 手机号码验证
jQuery.validator
		.addMethod(
				"isMobile",
				function(value, element) {
					var length = value.length;
					var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
					return this.optional(element)
							|| (length == 11 && mobile.test(value));
				}, "请正确填写您的手机号码");

function sendEmail() {

	$.ajax({
		type : "POST",
		url : getRootPath() + "/web/email",
		data : "emailPath=" + $("#checkemail").val(),
		dataType : "json",
		success : function(data) {
			if (data.status == 200) {
				$("#id").val(data.data.id);
				$("#modelLabel").html("信息提示");
				$("#modelContent").html("<center>" + data.msg + "</center>");
				$('#titleModel').modal('show');
			}
		}
	});

}

function registerSendEmail() {

	var mail = $('#email').val();
	if (mail != '') {// 判断
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if (!reg.test(mail)) {
			$("#modelLabel").html("信息提示");
			$("#modelContent").html("<center>邮箱格式不正确，请重新填写</center>");
			$('#titleModel').modal('show');
			return false;
		}
	}
	$.ajax({
		type : "POST",
		url : getRootPath() + "/web/registerEmail",
		data : "emailPath=" + $("#email").val(),
		dataType : "json",
		success : function(data) {
			if (data.status == 200) {
				$("#modelLabel").html("信息提示");
				$("#modelContent").html("<center>" + data.msg + "</center>");
				$('#titleModel').modal('show');
			} else {
				$("#modelLabel").html("信息提示");
				$("#modelContent").html("<center>" + data.msg + "</center>");
				$('#titleModel').modal('show');
			}
		}
	});

}
