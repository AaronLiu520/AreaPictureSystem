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
                                    <a class="btn btn-block btn-primary compose-mail" href="">
                                        创建活动
                                    </a>
                                    <div class="space-25"></div>
                                    <h5>导航器</h5>
                                    <div id="jstree1">
                                        <!-- jstree-open 打开树形菜单 -->
                                        <ul>
                                            <li class="jstree-open" >时间轴
                                                <ul>
                                                    <c:forEach items="${photoTimeList}" var="item" varStatus="status">
                                                        <!-- jstree-open 打开树形 时间轴 -->
                                                        <c:choose>
                                                            <c:when test="${item.istree}">
                                                                <li class="jstree-open" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li>
                                                            </c:otherwise>
                                                        </c:choose>

                                                             <i class="fa "></i>${item.time}</span>
                                                            <!-- 活动名称 -->
                                                            <c:if test="${not empty item.list}">
                                                                <ul>
                                                                    <c:forEach items="${item.list}" var="activity" varStatus="status">
                                                                        <li  data-jstree='{"type":"css"}'>
                                                                            <span onclick="checkActivity('${activity.id}');">
                                                                                <i class="fa "></i>${activity.forderActivityName}
                                                                            </span>

                                                                        </li>

                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                        </li>
                                                    </c:forEach>

                                                </ul>
                                            </li>
                                        </ul>

                                    </div>
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


                    <div class="col-lg-9 animated fadeInRight">
                        <div class="mail-box-header">

                            <form method="get" action="index.html" class="pull-right mail-search">
                                <div class="input-group">
                                    <div class="input-group-btn" style="width: 0%">
                                        <button type="submit" class="btn btn-sm btn-primary">
                                            创建子文件夹
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <c:choose>
                                <c:when test="${not empty fa}">
                                    <h2>${fa.forderActivityName}</h2>
                                </c:when>
                                <c:otherwise>
                                    <h3>
                                        请先： 选择活动 或 创建活动
                                    </h3>
                                </c:otherwise>
                            </c:choose>

                            <div class="mail-tools tooltip-demo m-t-md">
                                <!--当用户选择活动后，显示操作按扭-->
                                <c:if test="${not empty sessionScope.checkActivityId}">
                                    <a data-toggle="modal"  href="form_basic.html#modal-form">
                                        <button  class="btn btn-success " type="button"><i class="fa fa-upload">
                                        </i>&nbsp;&nbsp;<span class="bold">上传图片</span>
                                        </button>
                                    </a>

                                    <button class="btn btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button>


                                    <button class="btn btn-danger " type="button"><i class="fa fa-warning">
                                         </i><span class="bold">删除</span>
                                    </button>

                                    <button class="btn btn-primary " type="button"><i class="fa fa-check"></i>&nbsp;下载</button>


                                    <button class="btn btn-warning " type="button"><i class="fa fa-heart">
                                    </i> 收藏
                                    </button>
                                </c:if>

                            </div>
                        </div>
                        <div class="mail-box">
                            <div >
                                 <div class="col-lg-12 gallery" >
                                     <ul style="display: initial;">
                                    <c:forEach items="${listPhoto.datas}" var="item" varStatus="status">
                                        <li><a target="_blank" href="${pageContext.request.contextPath}/file/getImg/${item.id}?type=max">
                                            <div class="file-box" >
                                                <div class="file">
                                                    <span class="corner"></span>

                                                    <div class="image" style="height: 150px;text-align: center;">

                                                        <img alt="image" class="img-responsive" style="margin: 0 auto;"
                                                             src="${pageContext.request.contextPath}/file/getImg/${item.id}?type=min">

                                                    </div>
                                                    <div class="file-name" style="text-align: center;">
                                                        <!--如果修改后的资源名称不为空-->

                                                        <c:choose>
                                                            <c:when test="${fn:length(item.resourceName)<10}">
                                                                ${item.resourceName}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${fn:substring(item.resourceName,0,10)}...
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <br/>
                                                        <small>
			                                                <span style="padding-right: 30px;">
                                                                <a onclick="updateImg('${item.id}','${item.resourceName}','${item.person}',
                                                                        '${item.photographer}','${item.resourceAddress}','${item.description}')"
                                                                   data-toggle="modal" data-target="#File_Made">
                                                                    描述
                                                                </a>
			                                                </span>
                                                            <span>
                                                                <!--
                                                                <a data-toggle="modal" data-target="#File_Delete"> -->
                                                                    <a onclick="deleteAlert('${item.id}','${sessionScope.checkActivityId}')">
                                                                    删除 </a>
			                                                </span>
                                                        </small>
                                                    </div>

                                                </div>
                                            </div>
                                        </a></li>
                                         </c:forEach>
                                     </ul>
                            </div>

                                <!-- 分页功能 -->
                                <div style="text-align: center;margin-bottom: 5px;">
                                    <c:if test="${not empty listPhoto.datas}">
                                        <div class="btn-group" style="margin: 0 auto;">
                                            <a href="${pageContext.request.contextPath}/photoMessageAction/checkActivity?checkId=${sessionScope.checkActivityId}&type=${type}&pageNo=${listPhoto.upPage}" type="button" class="btn btn-white">
                                                <i class="fa fa-chevron-left"></i>
                                            </a>

                                            <c:forEach items="${listPhoto.navigatepageNums}" var="nav">
                                                <c:choose>
                                                    <c:when test="${nav == newslist.pageNo}">
                                                        <a class="btn btn-white  active">${nav}</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${pageContext.request.contextPath}/photoMessageAction/checkActivity?checkId=${sessionScope.checkActivityId}&type=${type}&pageNo=${nav}"
                                                           class="btn btn-white">${nav}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <a href="${pageContext.request.contextPath}/photoMessageAction/checkActivity?checkId=${sessionScope.checkActivityId}&type=${type}&pageNo=${listPhoto.nextPage}" type="button" class="btn btn-white">
                                                <i class="fa fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                        </div>
                    </div>
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

</body>
</html>
