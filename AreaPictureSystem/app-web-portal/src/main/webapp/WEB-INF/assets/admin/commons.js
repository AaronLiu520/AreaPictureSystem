$(function() {

	$("#checkall").click(function() {
		var flag = $("[name=checkall]:checkbox").is(':checked');
		$("[name=ids]:checkbox").each(function() {
			$(this).prop("checked", flag);
		})
	})

})

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

function checkOldPassword() {
	var oldPassword = $("#editoldPassword").val().trim();
	var path = getRootPath() + "/adminUser/checkPassword".toString();
	if (oldPassword != "") {
		// success fa fa-check-square
		// error <i class='fa fa-times-circle'></i>
		var result = "";
		var data = "password=" + oldPassword;
		$.ajax({
			type : "POST",
			url : path,
			data : data,
			dataType : "json",
			success : function(msg) {
				if (msg.status == "200") {
					$("#foroldPassword").css("color", "green");
					result = "<i class='fa fa-check-square' ></i>密码正确";
					$("#submit").attr("disabled", false);
				} else {
					$("#foroldPassword").css("color", "red");
					result = "<i class='fa fa-times-circle'></i>密码错误";
					$("#submit").attr("disabled", true);
				}
				$("#foroldPassword").html(result);
			}
		});

	}
}

flag = false;
var password = "";

//检查输入的内容
function checkinput() {
	var result1 = "";
	var result2 = "";
	var result3 = "";
	var oldPassword = $("#editoldPassword").val().trim();
	password = $("#editpassword").val().trim();
	var passwords = $("#editpasswords").val().trim();

	if (oldPassword == "") {
		$("#foroldPassword").css("color", "red");
		result1 = "<i class='fa fa-times-circle'></i>请输入旧密码";
		flag = false;
	} else {
		result1 = "";
		flag = true;
	}

	if (password == "") {
		$("#forpassword").css("color", "red");
		result2 = "<i class='fa fa-times-circle'></i>请输入新密码";
		flag = false;
	} else {
		result2 = "";
		flag = true;
	}

	if (passwords == "") {
		$("#forpasswords").css("color", "red");
		result3 = "<i class='fa fa-times-circle'></i>请确认新密码";
		flag = false;
	} else {
		result3 = "";
		flag = true;
	}

	if (passwords != "" && password != "") {
		if (password != passwords) {
			$("#forpasswords").css("color", "red");
			result3 = "<i class='fa fa-times-circle'></i>两次输入密码不同";
			flag = false;
		} else {
			result3 = "";
			flag = true;
		}
	}

	$("#foroldPassword").html(result1);
	$("#forpassword").html(result2);
	$("#forpasswords").html(result3);
}

// 清空文本框信息
function clear() {
	$("#editoldPassword").val("");
	$("#editpassword").val("");
	$("#editpasswords").val("");
}

//更新密码
function ajaxUpdatePassword() {
	checkinput();
	var path = getRootPath() + "/adminUser/updatePassword".toString();
	if (flag) {
		if (password != "") {
			var data = "password=" + password;
			$.ajax({
				type : "POST",
				url : path,
				data : data,
				dataType : "json",
				success : function(msg) {
					if (msg.status == "200") {
						$("#EditPasswordClose").trigger("click");
						$('#titleMessage').modal('show');
						$("#title").text("信息提示");
						$("#content").html("<h3>" + msg.msg + "</h3>");
						clear();
					} else {
						$('#titleMessage').modal('show');
						$("#title").text("信息提示");
						$("#content").html("<h3>" + msg.msg + "</h3>");
						clear();
					}
				}
			});
		}
	}
}


//富文本编辑器中的图片上传，并且回显
function sendFile(file, editor, welEditable) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : getRootPath() +"/editorImg/editImgUpload",
		cache : false,
		contentType : false,
		processData : false,
		success : function(data) {
			var fileUrl = getRootPath() +data.data;
			editor.insertImage(welEditable, fileUrl);
		}
	});
}


//富文本编辑器中的图片上传，并且回显
$(document).ready(function() {

	$("#add-news-btn").click(function() {
		var newsContent = $('.summernote').code();
		var textareaContent = $("#content").html(newsContent);
	});
	
	$('.summernote').summernote({
		lang : 'zh-CN',
		height : 300,
		minHeight : 400, // set minimum height of editor
		maxHeight : 700,
		disableDragAndDrop : true,
		onImageUpload : function(files, editor, $editable) {
			sendFile(files[0], editor, $editable);
		}
	});


	$(".note-statusbar").removeClass("note-statusbar");
	
	//点击删除按钮之后将图片所在input清空
	$(".fileinput-remove-button").click(function(e){
		$("#picture").val('');
	})
	//点击删除按钮之后将图片所在input清空
	$(".fileinput-remove").click(function(e){
		$("#picture").val('');
	})
	
	
	
});



//文本框校验
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
			newsTitle : {
				required : true,
				minlength : 5
			},
			author : {
				required : true
			},
			sort : {
				digits:true
			},
			newsDate : {
				required : true,
			},
			contestName : {
				required : true,
			},
			publisher : {
				required : true,
			},
			publisherPhone : {
				required : true,
				isMobile :  true
			},
			startTime : {
				required : true,
			},
			endTime : {
				required : true,
				compareDate: "#startTime",
			},
			voteStartTime : {
				required : true,
			},
			voteEndTime : {
				required : true,
				compareDate: "#voteStartTime",
			},
			minPictureNum : {
				digits:true
			},
			maxPictureNum : {
				digits:true
			},
			participants : {
				digits:true
			},
			
		},
		messages : {
			newsTitle : {
				required : a + "请输入新闻标题",
				minlength : a + "标题必须5个字符以上"
			},
			author : {
				required : a + "请输入作者",
			},
			sort : {
				digits : a+ "请输入正确的数字"
			},
			newsDate : {
				required : a + "请选择日期"
			},
			contestName : {
				required : a + "请输入比赛主题"
			},
			publisher : {
				required : a + "请输入比赛发布人"
			},
			publisherPhone : {
				required : a+"请输入发布人手机号",
				isMobile : a+"请输入正确的手机号码"
			},
			startTime : {
				required : a+"请选择开始时间"
			},
			endTime : {
				required : a+"请选择截止时间",
			/*	compareDate : a+ "活动截止时间必须大于开始时间"*/
			},
			voteStartTime : {
				required : a+"请选择投票开始时间"
			},
			voteEndTime : {
				required : a+"请选择投票截止时间",
	/*			compareDate : a+ "投票截止时间必须大于开始时间"*/
			},
			minPictureNum : {
				digits : a+ "请输入正确的数字"
			},
			maxPictureNum : {
				digits : a+ "请输入正确的数字"
			},
			participants : {
				digits : a+ "请输入正确的数字"
			},
			
			
			
		}
	});
	
	
});

//手机号码验证
jQuery.validator.addMethod("isMobile", function(value, element) {
    var length = value.length;
    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写您的手机号码");

//手机号码验证
/*jQuery.validator.addMethod("compareDate", function(value, element, param) {
	  var startDate = jQuery(param).val();
	    var date1 = new Date(Date.parse(startDate.replace("-", "/")));
	    var date2 = new Date(Date.parse(value.replace("-", "/")));
	    return date1 < date2;
}, "开始时间不能大于结束时间");


*/






