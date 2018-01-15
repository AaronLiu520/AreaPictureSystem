	$(function() {

		$("#checkall").click(function() {
			var flag = $("[name=checkall]:checkbox").is(':checked');
			$("[name=ids]:checkbox").each(function() {
				$(this).prop("checked", flag);
			})
		})

	})

//left.jsp 修改密码检验就密码是否相同
//js获取项目根路径，如： http://localhost:80	83/uimcardprj  
function getRootPath(){  
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp  
    var curWwwPath=window.document.location.href;  
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp  
    var pathName=window.document.location.pathname;  
    var pos=curWwwPath.indexOf(pathName);  
    //获取主机地址，如： http://localhost:8083  
    var localhostPaht=curWwwPath.substring(0,pos);  
    //获取带"/"的项目名，如：/uimcardprj  
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);  
    return(localhostPaht+projectName);  
} 

function checkOldPassword() {
	var oldPassword = $("#oldPassword").val().trim();
	var path =getRootPath()+"/adminUser/checkPassword".toString();
	if (oldPassword != "") {
		// success fa fa-check-square
		// error <i class='fa fa-times-circle'></i>
		var result = "";
		var data = "password=" + oldPassword;
		$.ajax({
			type : "POST",
			url :path,
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
	var path =getRootPath()+"/adminUser/updatePassword".toString();
	if (flag) {
		if(password!=""){
			var data = "password=" + password;
			$.ajax({
				type : "POST",
				url : path,
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




//<!--取消收藏-->
function cancelfavorites(o) {
	var favoritesIds = "";

	if (o == null) {

		//获取所有选中状态下的收藏图片的id      

		var favorites = $("input[name='ids']:checked");

		$(favorites).each(function() {

			favoritesIds += this.value + ",";

		});

	} else if (o != null) {

		favoritesIds = o;

	}

	$
			.ajax({

				type : "POST",

				url :getRootPath()+ "/photoMessageAction/cancelMyFavorties",

				data : "resourceId=" + favoritesIds,

				dataType : "json",

				success : function(data) {

					for (var i = 0; i < data.length; i++) {

						var a = "collection_" + data[i].id;

						$("." + a).remove();

					}

					/* 收藏成功提示 $('#successFavorites').modal('show'); */

				}

			});

}


//ajax收藏图片资源
function tofavorites(o) {
	var favoritesIds = "";
	if (o == null) {
		//获取所有选中状态下的收藏图片的id      
		var favorites = $("input[name='ids']:checked");
		$(favorites).each(function() {
			favoritesIds += this.value + ",";
		});
	} else if (o != null) {
		favoritesIds = o;
	}

	$
			.ajax({
				type : "POST",
				url :  getRootPath()+"/photoMessageAction/toMyFavorties",
				data : "resourceId=" + favoritesIds,
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						var a = "collection_" + data[i].id;
						$("#" + a)
								.html(
										"<a><i class='fa fa-heart'></i>已收藏</a>");
					}
					/* 收藏成功提示 $('#successFavorites').modal('show'); */
				}
			});
}



//图片下载
function todownload() {
	var a = $("input[name='ids']:checked").length;

	if (a == 0) {
		$("#delete").hide();

		$("#modalMessage").text("请先选中需要下载的图片！");
		
		$('#deleteModal').modal('show');

	}else{
		
		var downloadIds = $("input[name='ids']:checked");

		//获取所有的id执行删除操作，使用ajax
		var str = "";
		$(downloadIds).each(function() {
			str += this.value + ",";
		});

		if (str != "") {
			var id = str.substring(0, str.length - 1);
			 window.location.href = getRootPath()+"/photoMessageAction/download?id="
					+ id ; 
			  $("#downloads").attr("disabled","disabled");
				 setTimeout(function(){
		            $("#downloads").removeAttr("disabled");
		        },5000)
			 
			 
			 
		} else {
			window.location.href = document.URL;
		}
		
	} 

	

}




document.onkeydown = function (e) {
    if (!e) e = window.event;
    if ((e.keyCode || e.which) == 13) {
        $("#btnSubmit").click();
    }
}











