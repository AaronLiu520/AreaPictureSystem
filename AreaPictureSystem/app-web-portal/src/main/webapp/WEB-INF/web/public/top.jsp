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
            <li><a id="index" class="" href="${pageContext.request.contextPath}/web/index">首页</a></li>
            <li><a id="listPhotography" class="" href="${pageContext.request.contextPath}/web/listPhotography">摄影作品</a></li>
            <li><a id="listGame"    class="" href="${pageContext.request.contextPath}/web/listGame">摄影比赛</a></li>
            <li><a id="listGallery" class="" href="${pageContext.request.contextPath}/web/listGallery">相册</a></li>
            <li><a id="listNews" class="" href="${pageContext.request.contextPath}/web/listNews">新闻</a></li>
            <li><a id="about" class="" href="${pageContext.request.contextPath}/web/about">关于我们</a></li>

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
