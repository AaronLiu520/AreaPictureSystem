<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>

<style type="text/css">
        html{height:100%;}
        body{min-height:100%;margin:0;padding:0;position:relative;}

        .footer{position:absolute;bottom:0;width:100%;height:20px;}
    </style>

<div class="footer" style="margin-top: 10px;">
    <p style="color:#7E7E7E;text-align: center;padding-top: 15px;">
       ${websetting.copyRight}
    </p>
</div>




<!-- Jquery Validate -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>

<!-- 引入通用js -->
	<script
		src="${pageContext.request.contextPath}/assets/web/js/common.js"></script>