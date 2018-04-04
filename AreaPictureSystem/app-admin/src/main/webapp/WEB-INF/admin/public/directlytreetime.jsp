<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<style>
p {
	height: 15px;
}
</style>

<body>

	<div id="directlytreetime" style="margin-left: -50px; font-size: 10px;" >
		<!-- jstree-open 打开树形菜单 -->
		<ul style="color: #c7c7c7;">
			<c:forEach items="${directlyphotoTimeList}" var="item"
				varStatus="status">
				<!-- jstree-open 打开树形 时间轴 class="jstree-open"  <c:if test="${item.id eq year }">class="jstree-open"</c:if> -->
		<li	<c:if test="${item.id eq yearId }"> class="jstree-open"</c:if>><i  class="fa "></i>${item.year} 年 <c:forEach
						items="${item.listPhotoTime }" var="getMonth" varStatus="status">

			<ul>
					<c:forEach items="${getMonth.listPhotoTime }" var="getDay"
									varStatus="status">
									
									<c:forEach items="${getDay.list}" var="activity"
												varStatus="status">
												<li   data-jstree='{"type":"img"}'    style="font-size: 10px;" 
													title="活动名称：${activity.forderActivityName }&#13;活动地点：${activity.address}"><span
													onclick="checkActivityType('${activity.id}','DIRECTLYUTIS','${item.id }','${getMonth.id }','${getDay.id }');">
														<i class="fa"></i>
														   ${item.year}_${getMonth.month}_${getDay.day }&nbsp;${fn:substring(activity.forderActivityName,0,40)}..
														
												</span></li>
											</c:forEach>
									
					</c:forEach>
					</ul>
					


						<%-- <ul>
							<li <c:if test="${getMonth.id eq monthId }"> class="jstree-open"</c:if> >${getMonth.month }月
								<ul>
									<c:forEach items="${getMonth.listPhotoTime }" var="getDay"
										varStatus="status">
																			<li <c:if test="${getDay.id eq dayId }"> class="jstree-open"</c:if> class="select" >${getDay.day }日
											<ul>
												<c:forEach items="${getDay.list}" var="activity"
													varStatus="status">
													<li data-jstree='{"type":"img"}'
														title="活动地点：${activity.address}"><span
														onclick="checkActivityType('${activity.id}','AREA','${item.id }','${getMonth.id }','${getDay.id }');">
															<i class="fa"></i> ${activity.forderActivityName}
													</span></li>

												</c:forEach>

											</ul>


										</li>


									</c:forEach>
								</ul>


							</li>
						</ul> --%>

					</c:forEach> <!-- 活动名称 -->
					<%--  <c:if test="${not empty item.listPhotoTime}">

					<ul>
						<c:forEach items="${item.list}" var="activity" varStatus="status">
							<li class="jstree-open" data-jstree='{"type":"img"}'
								title="${activity.address}"><span
								onclick="checkActivityType('${activity.id}','AREA');"> <i
									class="fa"></i> ${activity.forderActivityName}
							</span></li>

						</c:forEach>

					</ul>
				</c:if> --%>
			</c:forEach>

		</ul>








	</div>

</body>
</html>
