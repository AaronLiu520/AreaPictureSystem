<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>管理后台</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  	<link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <!-- Morris -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="${pageContext.request.contextPath}/assets/admin/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/jsTree/style.min.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <style type="text/css">
		.modal.fade .user-modal-dialog {
			padding: 5%;
		}


		li_style

{
background-color:red;

}
li_style:hover

{
background-color:blue;

}
	</style>
<body>
<nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                	   <li class="nav-header">

                        <div class="dropdown profile-element">
                        	<span style="float: left;padding-right: 10px;">
                           	 <img alt="image" class="img-circle"
                           	 src="${pageContext.request.contextPath}/assets/admin/img/profile_small.jpg" />
                             </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">
                               奉贤区图片库

                                </strong>
                             </span>  <span class="text-muted text-xs block">
                             
                             		欢迎您： 刘庆
                             
                             
                             <b class="caret"></b></span> </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">

								<li><a href="#">个人图片库</a> </li>

                                <li><a href="#">修改头像</a> </li>

                                <li><a href="${pageContext.request.contextPath}/user/profile">个人资料</a></li>

                                <li class="divider"></li>
                                <li> <a href="${pageContext.request.contextPath}/adminUser/loginOut">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            CORED
                        </div>

                    </li>

                  <c:forEach items="${listMenu}" var="item" varStatus="status">

                   <!-- 一级菜单，根目录   updateFormValue(id,name,type,icon,url,orderby,remark,pid)-->
                    <c:if test="${item.pid == '0'}">
                    	<c:choose>
                   			<c:when test="${item.type == 'HaveMenu'}"><!-- 有子菜单 -->
                   				<!-- active 打开 class="active"-->
                   				<c:choose>
                   					<c:when test="${fn:contains(cookie.activeMenuCookie.value,item.id)}">
                   						<li class="active">
                   					</c:when>
                   					<c:otherwise>
                   						<li>
                   					</c:otherwise>
                   				</c:choose>


                        		<a href="#"> <i class="fa ${item.icon}"></i> <span class="nav-label">${item.name}</span>
                        		<span class="fa arrow"></span></a>
	                        <!-- 二级菜单，根目录 -->
	                       			 <ul class="nav nav-second-level">
	                        			<c:forEach items="${listMenu}" var="subitem" varStatus="status">
		                      				<c:if test="${subitem.pid == item.id}">
					                            <c:choose>
		                        					<c:when test="${subitem.type == 'HaveMenu'}">
		                        					<!-- 有只子菜单 -->
		                        					<c:choose>
					                   					<c:when test="${fn:contains(cookie.activeMenuCookie.value,subitem.id)}">
					                   						<li class="active">
					                   					</c:when>
					                   					<c:otherwise>
					                   						<li>
					                   					</c:otherwise>
					                   				</c:choose>

		                        					<a href="#"> <i class="fa ${item.icon}"></i>${subitem.name} <span class="nav-label">
		                        					<!-- 这里空，为三级菜单 --></span><span class="fa arrow"></span></a>
		                        						 	<ul class="nav nav-second-level">
		                        						 		<c:forEach items="${listMenu}" var="menu" varStatus="status">
		                        						 			<c:if test="${menu.pid == subitem.id}">

		                        						 		 	<c:choose>
									                   					<c:when test="${fn:contains(cookie.activeMenuCookie.value,menu.id)}">
									                   						<li class="active">
									                   					</c:when>
									                   					<c:otherwise>
									                   						<li>
									                   					</c:otherwise>
									                   				</c:choose>

		                        						 		 	<a href="${pageContext.request.contextPath}/${menu.url}?activeMenu=${menu.id}_${item.id}_${subitem.id}">${menu.name}</a></li>

		                        						 			</c:if>
		                        						 			</c:forEach>
		                        						 	</ul>
		                        						</li>
		                        					</c:when>
		                        					<c:otherwise>
		                        					<!-- 没有子菜单 -->
		                        					<c:choose>
					                   					<c:when test="${fn:contains(cookie.activeMenuCookie.value,subitem.id)}">
					                   						<li class="active">
					                   					</c:when>
					                   					<c:otherwise>
					                   						<li>
					                   					</c:otherwise>
					                   				</c:choose>
		                        					 <a href="${pageContext.request.contextPath}/${subitem.url}?activeMenu=${subitem.id}_${item.id}">
		                        					  <i class="fa ${subitem.icon}"></i>
		                        					 ${subitem.name}</a>    </li>
		                        					</c:otherwise>
		                        				</c:choose>


	                           				 </c:if>
	                            		</c:forEach>
	                            	</ul>
                   				</li>
                   			</c:when>
                   			<c:otherwise>
							<!-- active 打开 class="active"-->
							<c:choose>
								<c:when test="${fn:contains(cookie.activeMenuCookie.value,item.id)}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
                   			<!-- 没有子菜单 -->
                   				<a href="${pageContext.request.contextPath}/${item.url}?activeMenu=${item.id}">
                   				 <i class="fa ${item.icon}"></i>
                   				<span class="nav-label">
                   				${item.name}</span>
                   				</a>
                   				</li>
                   			</c:otherwise>
                   </c:choose>

                   		</c:if>
                   		</c:forEach>

                </ul>

            </div>

        </nav>

        <!-- 主要的 scripts -->
<script src="${pageContext.request.contextPath}/assets/admin/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/jeditable/jquery.jeditable.js"></script>

<!-- 动态表格数据 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<!-- 定制的javascript和插件 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/hplus.js?v=2.2.0"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/pace/pace.min.js"></script>
<!-- 全文搜索与查询 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote-zh-CN.js"></script>
<!-- 树 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/jsTree/jstree.min.js"></script>
<!-- 通知 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/toastr/toastr.min.js"></script>



     <c:if test="${not empty success}">
     	<script type="text/javascript">
            toastr.success('${success}', '操作成功')
    	</script>
     </c:if>

  	<c:if test="${not empty error}">
     	<script type="text/javascript">
           toastr.error('${error}', '操作失败');
    	</script>
     </c:if>
</body>
</html>