<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<body>
	<div class="col-sm-12 gallery" >
		<ul style="display: initial;">
		
			<c:forEach items="${forderActivityList.datas}" var="item"
				varStatus="status">

					<!-- 已经将点击预览移植到图片层中 -->
				<div class="file-box collection_${item.id }">
					<div class="checkbox" name="checkboxs"
						style="z-index: 999; position: absolute; margin-top: 3px; margin-left: 3px; display: none">
						<input id="ids${item.id}" value="${item.id }" type="checkbox"
							name="ids"> <label for="ids${item.id}"> </label>
					</div>
				</div>
				

				<div class="file-box collection col-sm-2" style="height: 227px;" >

					<div class="file">

						<span class="corner"></span>
						<!--如果修改后的资源名称不为空-->


						<div id="item_4 " class=" image"
							style="height: 130px; text-align: center;">

							<a
								href="${pageContext.request.contextPath}/adminUser/findPictures/${item.id}?type=">

								<img alt="image" class="img-responsive" style="margin: 0 auto;"
								src="${pageContext.request.contextPath}/assets/admin/img/forder.png">
							</a>
						</div>



						<div class="row">
							<div class="col-sm-12">
								<div class="file-name" style="background-color: #fefefe;">


									<c:choose>
										<c:when test="${fn:length(item.forderActivityName)<20}">
											<small>
											活动名称：${item.forderActivityName}

											</small>
										</c:when>
										<c:otherwise>
											<small>
												活动名称：${fn:substring(item.forderActivityName,0,20)}...</small>
										</c:otherwise>
									</c:choose>
									<br />
										<small>
										活动所属：<c:forEach items="${item.listType}" var="it" varStatus="status">
							<c:if test="${it.type eq 'AREA' }">区域、</c:if> 
							<c:if test="${it.type eq 'BASEUTIS' }">基层单位、</c:if>
						    <c:if test="${it.type eq 'DIRECTLYUTIS' }">直属单位、  </c:if> 
								</c:forEach>
										
										</small>
									
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- end -->
			</c:forEach>
		</ul>

	</div>

</body>