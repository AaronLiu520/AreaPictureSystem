<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page isELIgnored="false"%> 
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>底部</title>
</head>
<body>
	  <div class="footer">
                <div class="pull-right">
                    By：<a  target="_blank">后台管理</a>
                </div>
                <div>
                    <strong>Copyright</strong> Aaron For Cored &copy; 2017
                </div>
            </div>
</body>
<script type="text/javascript">
//获取浏览的高度
$(document).ready(function () {
	 var h=document.documentElement.clientHeight+"px";
	 $("#page-wrapper").css("min-height", h);
});
</script>
</html>