<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>图片管理</title>

  
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>

<!-- 上传控件 -->
<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/basic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/dropzone.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/jsTree/style.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/admin/css/style.css?v=2.2.0" rel="stylesheet">

<link rel="stylesheet"  href="${pageContext.request.contextPath}/assets/admin/Assets/css/zoom.css" media="all" />


<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/Assets/tooltip/stylesheets/jquery.tooltip/jquery.tooltip.css" type="text/css" />

<style type="text/css">
    * {

        list-style-type: none;
    }


</style>
    
    
<body>
    <div id="wrapper">
     <!-- .aside left menu -->
	<%@include file="../../public/left.jsp" %>
        <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- .aside top jsp -->
           <%@include file="../../public/top.jsp" %>


            <div class="wrapper wrapper-content">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content mailbox-content">
                                <div class="file-manager">
                                     <a class="btn btn-block btn-primary compose-mail"
                                        data-toggle="modal" data-target="#CrateActivity">
                                        创建活动
                                    </a>
                                    <div class="space-25"></div>
                                    <h5>导航器</h5>
                                    <%@include file="treetime.jsp" %>
                                    <!-- 类型 -->
                                    <h5>类型</h5>
                                    <ul class="category-list" style="padding: 0">
                                        <li>
                                            <a href="mail_compose.html#"> <i class="fa fa-circle text-navy"></i>幼儿园</a>
                                        </li>
                                        <li>
                                            <a href="mail_compose.html#"> <i class="fa fa-circle text-danger"></i>小学</a>
                                        </li>
                                        <li>
                                            <a href="mail_compose.html#"> <i class="fa fa-circle text-primary"></i>中学</a>
                                        </li>
                                        <li>
                                            <a href="mail_compose.html#"> <i class="fa fa-circle text-info"></i>高中</a>
                                        </li>
                                        <li>
                                            <a href="mail_compose.html#"> <i class="fa fa-circle text-warning"></i>九年制</a>
                                        </li>
                                    </ul>

                                    <c:if test="${not empty lableList}">
                                        <h5 class="tag-title">标签</h5>

                                        <ul class="tag-list" style="padding: 0">
                                            <c:forEach items="${lableList}" var="item" varStatus="status">
                                                <li><a href=""><i class="fa fa-tag"></i> ${item.labelName}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>

                                    </c:if>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 资源管理 -->
                    <%@include file="resource.jsp" %>

                </div>
            </div>

             <%@include file="../../public/botton.jsp" %>
        </div>
    </div>



    <!--javaScript event-->
    <%@include file="operate.jsp" %>
    <!-- import popups -->
    <%@include file="popups.jsp" %>


    <!-- DROPZONE -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dropzone/dropzone.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/Assets/js/zoom.min.js"></script>

    <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/admin/Assets/tooltip/javascripts/jquery.tooltip.js"></script>
    <script type="text/javascript">
        $j = jQuery.noConflict();
        $j(document).ready(function(){
            $j("div.item").tooltip();
        });
    </script>



</body>
</html>
