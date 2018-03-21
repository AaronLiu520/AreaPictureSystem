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

	<div id="basetreetime" style="margin-left: -50px;" >
		<!-- jstree-open 打开树形菜单 -->
		<ul>
			<!--
        <li class="jstree-open" >时间轴
            <ul>-->
			<c:forEach items="${basePhotoTimeList}" var="item1"
				varStatus="status">
				<!-- jstree-open 打开树形 时间轴 -->
				<li
					<c:if test="${item1.name eq nature }"> class="jstree-open"</c:if>><span
					style="margin: -5px;"> <!-- 幼儿、中小学、中学 --> <i></i>${item1.name }</span>

					<c:if test="${not empty item1.layerAdmonCompanyList}">
						<ul>
							<c:forEach items="${item1.layerAdmonCompanyList}" var="ac"
								varStatus="status">
								<li
									<c:if test="${ac.name eq companyName }"> class="jstree-open"</c:if>
									title="${ac.name}"><span style="margin: -5px;"> <!-- 企业名称 -->
										<i class="fa "></i> ${ac.name}
								</span>

									<ul>
										<c:forEach items="${ac.timeList}" var="item"
											varStatus="status">
											<!-- jstree-open 打开树形 时间轴 class="jstree-open"  -->
											<li
												<c:if test="${item.id eq yearId }"> class="jstree-open"</c:if>><i
												class="fa "></i>${item.year} 年 <c:forEach
													items="${item.listPhotoTime }" var="getMonth"
													varStatus="status">

													<ul>

														<c:forEach items="${getMonth.listPhotoTime }" var="getDay"
															varStatus="status">

															<c:forEach items="${getDay.list}" var="activity"
																varStatus="status">
																<li data-jstree='{"type":"img"}'
																	title="活动名称：${activity.forderActivityName }&#13;活动地点：${activity.address}"><span
																	onclick="checkActivityTypeBase('${activity.id}','BASEUTIS','${item.id }','${getMonth.id }','${getDay.id }','${ac.id }','${ac.name}');">
																		<i class="fa"></i><font size="-1px;">
																			${item.year}_${getMonth.month}_${getDay.day }&nbsp;${fn:substring(activity.forderActivityName,0,25)}..
																	</font>
																</span></li>
															</c:forEach>

														</c:forEach>







														<%-- 	<li <c:if test="${getMonth.id eq monthId }"> class="jstree-open"</c:if> >${getMonth.month }月
													<ul>
														<c:forEach items="${getMonth.listPhotoTime }" var="getDay"
															varStatus="status">
														<li <c:if test="${getDay.id eq dayId }"> class="jstree-open"</c:if> >${getDay.day }日
																<ul>
																	<c:forEach items="${getDay.list}" var="activity"
																		varStatus="status">
																		<li data-jstree='{"type":"img"}'
																			title="活动地点：${activity.address}"><span
																			onclick="checkActivityTypeBase('${activity.id}','AREA','${item.id }','${getMonth.id }','${getDay.id }','${ac.id }','${ac.name}');">
																				<i class="fa"></i> ${activity.forderActivityName}
																		</span></li>

																	</c:forEach>

																</ul>


															</li>


														</c:forEach>
													</ul>


												</li> --%>
													</ul>

												</c:forEach> <!-- 活动名称 --> <%-- <c:if test="${not empty item.listPhotoTime}">

											<ul>
												<c:forEach items="${item.list}" var="activity"
													varStatus="status">
													<li class="jstree-open" data-jstree='{"type":"img"}'
														title="${activity.address}"><span
														onclick="checkActivityType('${activity.id}','AREA');">
															<i class="fa"></i> ${activity.forderActivityName}
													</span></li>

												</c:forEach>

											</ul>
										</c:if> --%>
										</c:forEach>

									</ul></li>

							</c:forEach>
						</ul>
					</c:if></li>
			</c:forEach>

			<!--         <li  data-jstree='{"type":"html"}'>
                    <span onclick="ActivityIndex('BASEUTIS');">
                        <i class="fa"></i>创建活动
                    </span>
        </li> -->
		</ul>

	</div>

</body>
</html>
