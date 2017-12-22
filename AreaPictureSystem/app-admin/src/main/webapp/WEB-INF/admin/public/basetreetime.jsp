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

<div id="basetreetime">
    <!-- jstree-open 打开树形菜单 -->
    <ul>
        <!--
        <li class="jstree-open" >时间轴
            <ul>-->
                <c:forEach items="${basePhotoTimeList}" var="item" varStatus="status">
                    <!-- jstree-open 打开树形 时间轴 -->
                    <li><span style="margin: -5px;">
                        <!-- 幼儿、中小学、中学 -->
                    <i></i>${item.name}</span>

                    <c:if test="${not empty item.layerAdmonCompanyList}">
                        <ul>
                            <c:forEach items="${item.layerAdmonCompanyList}" var="activity" varStatus="status">
                                <li title="${activity.name}">
                                    <span style="margin: -5px;">
                                        <!-- 企业名称 -->
                                        <i class="fa "></i>
                                             <c:choose>
                                                 <c:when test="${fn:length(activity.name)<7}">
                                                     ${activity.name}
                                                 </c:when>
                                                 <c:otherwise>
                                                     ${fn:substring(activity.name,0,7)}..
                                                 </c:otherwise>
                                             </c:choose>


                                    </span>
                                    <c:if test="${not empty activity.timeList}">
                                        <ul>
                                            <c:forEach items="${activity.timeList}" var="subitem"
                                                       varStatus="status">
                                                <li >
                                                    <span style="margin: -5px;">
                                                        <!-- 时间 -->
                                                        <i class="fa "></i>${subitem.time}
                                                    </span>


                                                    <c:if test="${not empty subitem.list}">
                                                        <ul>
                                                            <c:forEach items="${subitem.list}" var="ss" varStatus="status">
                                                                <li data-jstree='{"type":"img"}' title="${ss.forderActivityName}">
                                                                    <span  onclick="checkActivityType('${ss.id}','BASEUTIS');" style="margin: -5px;">
                                                                        <i class="fa "></i>
                                                                        <!-- 活动名称 -->
                                                                          <c:choose>
                                                                              <c:when test="${fn:length(ss.forderActivityName)<5}">
                                                                                  ${ss.forderActivityName}
                                                                              </c:when>
                                                                              <c:otherwise>
                                                                                  ${fn:substring(ss.forderActivityName,0,5)}..
                                                                              </c:otherwise>
                                                                          </c:choose>

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

          <!--  </ul>
        </li>-->
    </ul>

</div>

</body>
</html>
