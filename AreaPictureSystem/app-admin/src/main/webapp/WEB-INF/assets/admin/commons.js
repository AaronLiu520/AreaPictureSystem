//left.jsp 修改密码检验就密码是否相同

function checkOldPassword() {

	var oldPassword = $("#oldPassword").val().trim();
	if (oldPassword != "") {
		// success fa fa-check-square
		// error <i class='fa fa-times-circle'></i>
		var result = "";
		var data = "password=" + oldPassword;
		$.ajax({
			type : "POST",
			url : "../adminUser/checkPassword",
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
var password="";

function checkinput() {
	var result1 = "";
	var result2 = "";
	var result3 = "";
	var oldPassword = $("#oldPassword").val().trim();

	 password = $("#password").val().trim();
	var passwords = $("#passwords").val().trim();

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

function ajaxUpdatePassword() {
	checkinput();
	
	if (flag) {
		if(password!=""){
			var data = "password=" + password;
			$.ajax({
				type : "POST",
				url : "../adminUser/updatePassword",
				data : data,
				dataType : "json",
				success : function(msg) {
					if(msg.status =="200"){
						$("#EditPasswordClose").trigger("click");
						$('#titleMessage').modal('show');
						$("#title").text("信息提示");
						$("#content").html("<h3>"+msg.msg+"</h3>")
					}else{
						$('#titleMessage').modal('show');
						$("#title").text("信息提示");
						$("#content").html("<h3>"+msg.msg+"</h3>")
					}
					
					
				}
			});
		}
		

	}

}
