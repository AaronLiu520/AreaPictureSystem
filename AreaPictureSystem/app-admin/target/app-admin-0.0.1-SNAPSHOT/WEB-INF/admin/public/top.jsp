<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%> 
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顶部</title>
</head>
<body>
	 <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                    <!--  显示与隐常左边的菜单 -->
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " >
                        	<i id="show-and-hidden-left" class="fa fa-bars"> </i> 
                        </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <span class="m-r-sm text-muted welcome-message">
                            <a href="${pageContext.request.contextPath}/web/index" title="返回首页">
                            <i class="fa fa-home"></i></a>
                           </span>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/adminUser/loginOut">
                                <i class="fa fa-sign-out"></i> 退出
                            </a>
                        </li>
                    </ul>

                </nav>
            </div>
 
</body>
</html>