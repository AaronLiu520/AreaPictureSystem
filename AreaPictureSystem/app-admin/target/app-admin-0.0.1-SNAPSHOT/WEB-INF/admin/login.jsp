<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>管理后台登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/admin/loginAssets/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/admin/loginAssets/images/login.js"></script>
<link href="${pageContext.request.contextPath}/assets/admin/loginAssets/css/login2.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
       function checkUsername(){
//                         var password = encode64($("#password").val());
//                         $("#password").val(password);
       }
        
        // base64加密开始
        var keyStr = "ABCDEFGHIJKLMNOP" + "QRSTUVWXYZabcdef" + "ghijklmnopqrstuv"
                        + "wxyz0123456789+/" + "=";
        
        function encode64(input) {

                var output = "";
                var chr1, chr2, chr3 = "";
                var enc1, enc2, enc3, enc4 = "";
                var i = 0;
                do {
                        chr1 = input.charCodeAt(i++);
                        chr2 = input.charCodeAt(i++);
                        chr3 = input.charCodeAt(i++);
                        enc1 = chr1 >> 2;
                        enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
                        enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
                        enc4 = chr3 & 63;
                        if (isNaN(chr2)) {
                                enc3 = enc4 = 64;
                        } else if (isNaN(chr3)) {
                                enc4 = 64;
                        }
                        output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2)
                                        + keyStr.charAt(enc3) + keyStr.charAt(enc4);
                        chr1 = chr2 = chr3 = "";
                        enc1 = enc2 = enc3 = enc4 = "";
                } while (i < input.length);

                return output;
        }
        // base64加密结束

</script>


<body>


<!--
<h1>${area.name} - 电子班排授权系统－管理后台  ${area.namePingYing}<sup>V2016</sup></h1>
-->
<h1>奉贤区教育图片库－管理后台  <sup>V2017</sup></h1>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
<!-- 			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div> -->
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               
               
               <div class="login-box">
    
            
			<div class="login_form">
			<p style="color: red;text-align: center;">${sessionScope.loginError}</p>
				<form action="${pageContext.request.contextPath}/adminUser/checkLogin"
				accept-charset="utf-8" id="login_form" class="loginForm" method="post">

                <div class="uinArea" id="uinArea">
                    <label class="input-tips" for="u">帐号：</label>
                    <div class="inputOuter" id="uArea">
                        <input type="text" id="u" name="username" class="inputstyle"/>
                    </div>
                </div>

                <div class="pwdArea" id="pwdArea">
                    <label class="input-tips" for="p">密码：</label>
                    <div class="inputOuter" id="pArea">
                        <input type="password" id="password" name="password" class="inputstyle"/>
                    </div>
                </div>
               
                <div style="padding-left:50px;margin-top:20px;">
                <input id="btn" type="submit" value="登 录" style="width:150px;" class="button_blue"/></div>
              </form>
           </div>
           
            	</div>
               
            </div>
            <!--登录end-->
  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login">
    
           
    
    </div>
   
    
    </div>
    <!--注册end-->
</div>
<c:if test="${sessionScope.loginFailureNumber > 3}">
<script type="text/javascript">
var wait=30;
function time() {

// 	alert($("#btn").val())
  if (wait == 0) {
	  $("#btn").attr("disabled",false); 
   		$("#btn").val("登录");
   wait = 60;
  } else { 
	$("#btn").attr("disabled","disabled");
   	$("#btn").val("等待(" + wait + ")");
   wait--;
   setTimeout(function() {
    time()
   },
   1000)
  }
 }
 
time();
 
</script>

</c:if>

</body></html>