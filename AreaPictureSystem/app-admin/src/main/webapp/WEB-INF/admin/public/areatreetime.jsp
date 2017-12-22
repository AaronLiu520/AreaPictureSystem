<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en" class="app">
<style>
    p{
        height: 15px;
    }

</style>

<body>

<div id="areatreetime">
    <!-- jstree-open 打开树形菜单 -->
    <ul style="color: #c7c7c7;">
        <!--
        <li class="jstree-open" >时间轴
            <ul>-->
                <c:forEach items="${areaphotoTimeList}" var="item" varStatus="status">
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
                                <li  data-jstree='{"type":"img"}' title="${activity.forderActivityName}">
                                    <span onclick="checkActivityType('${activity.id}','AREA');">
                                        <i class="fa"></i>
                                        <c:choose>
                                        	<c:when test="${fn:length(activity.forderActivityName)<7}">
                                                ${activity.forderActivityName}
                                            </c:when>
                                            <c:otherwise>
                                                ${fn:substring(activity.forderActivityName,0,7)}..
                                            </c:otherwise>
                                        </c:choose>
                                    </span>

                                </li>

                            </c:forEach>

                        </ul>
                    </c:if>
                    </li>
                </c:forEach>
        <!--
                <li  data-jstree='{"type":"css"}'>
                    <span onclick=""> <i class="fa"></i>更多></span>
                </li>-->
            </ul>
       <!-- </li>
    </ul>-->

</div>

</body>
</html>