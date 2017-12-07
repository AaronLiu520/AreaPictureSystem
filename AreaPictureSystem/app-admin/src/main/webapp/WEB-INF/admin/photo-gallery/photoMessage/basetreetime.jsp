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

<div id="jstree1">
    <!-- jstree-open 打开树形菜单 -->
    <ul>
        <li class="jstree-open" >时间轴
            <ul>
                <c:forEach items="${basePhotoTimeList}" var="item" varStatus="status">
                    <!-- jstree-open 打开树形 时间轴 -->
                    <li class="jstree-open" >
                    <i class="fa "></i>${item.name}</span>
                    <!-- 活动名称 -->
                    <c:if test="${not empty item.layerAdmonCompanyList}">
                        <ul>
                            <c:forEach items="${item.layerAdmonCompanyList}" var="activity" varStatus="status">
                                <li >
                                    <span ">
                                        <i class="fa "></i>${activity.name}
                                    </span>
                                    <c:if test="${not empty activity.timeList}">
                                        <ul>
                                            <c:forEach items="${activity.timeList}" var="subitem"
                                                       varStatus="status">
                                                <li >
                                                    <span onclick="checkActivity('${subitem.id}');">
                                                        <i class="fa "></i>${subitem.time}
                                                    </span>


                                                    <c:if test="${not empty subitem.list}">
                                                        <ul>
                                                            <c:forEach items="${subitem.list}" var="ss" varStatus="status">
                                                                <li  data-jstree='{"type":"css"}'>
                                                                    <span >
                                                                        <i class="fa "></i>${ss.forderActivityName}
                                                                    </span>

                                                                </li>

                                                            </c:forEach>
                                                        </ul>
                                                    </c:if>

                                                </li>

                                            </c:forEach>

                                        </ul>

                                    </c:if>



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

</body>
</html>
