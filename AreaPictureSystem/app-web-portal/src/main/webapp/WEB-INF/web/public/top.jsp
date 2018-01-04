<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>

<div class="header">
    <div class="logo" style="padding: 20px 0px 0px 30px;width:25%">
        <a href="index.html">奉贤区教工摄影网</a>
    </div>
    <div class="header-right">
        <span class="menu"><img src="${pageContext.request.contextPath}/assets/images/menu.png" alt=""/></span>
        <ul class="nav1">
        
            <!-- class="active"-->
            
            <c:forEach  items="${sessionScope.webmenus }" var="item" varStatus="status">
            	<li><a id="${item.id}" href="${pageContext.request.contextPath}/${item.webUrl}?type=${item.id}">${item.name}</a></li>
            </c:forEach>

        </ul>
        <!-- script for menu -->
        <script>
            $("span.menu").click(function () {
                $("ul.nav1").slideToggle(100, function () {
                });
            });


            $("#${sessionScope.checkMenu}").addClass("active");
        </script>
        <!-- //script for menu -->

    </div>
    <div class="clearfix"></div>
</div>
