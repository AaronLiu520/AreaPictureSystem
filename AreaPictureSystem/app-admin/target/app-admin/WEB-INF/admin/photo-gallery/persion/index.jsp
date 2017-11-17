<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8" />
    <title>管理后台</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="WeChat" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo_title.png"
          type="image/x-icon" />
</head>

<body>
<div id="wrapper">
    <!-- .aside left menu-->
    <%@include file="../../public/left.jsp" %>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- .aside top jsp -->
        <%@include file="../../public/top.jsp" %>
        <div class="wrapper wrapper-content">
            <!-- message center -->


            <!-- index show new image message-->
            <div class="row">
                个人
            </div>



        </div><!-- end message center-->


        <%@include file="../../public/botton.jsp" %>
    </div>
</div>
</body>
</html>
