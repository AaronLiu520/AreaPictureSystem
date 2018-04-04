<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<body>

	<div class="row">
		<!-- 资源管理模块 -->
		<div class="col-lg-12 animated fadeInRight">

			<div class="mail-box">

				<div class="col-sm-12 gallery">
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


							<div class="file-box collection col-sm-2"
								style="height: 227px; width: 200px; margin-bottom: 30px;">

								<div class="file">

									<span class="corner"></span>
									<!--如果修改后的资源名称不为空-->

									<a
										href="${pageContext.request.contextPath}/adminUser/findPictures/${item.id}?type=">

										<div id="item_4 " class=" image"
											style="height: 130px; text-align: center;">



											<c:if test="${ empty item.cover}">
												<img alt="image" class="img-responsive"
													style="margin: 0 auto;"
													src="${pageContext.request.contextPath}/assets/admin/img/forder.png">

											</c:if>
											<c:if test="${not empty item.cover}">
												<img alt="image" class="img-responsive"
													style="margin-top: 10px; border-radius: 9px; -webkit-border-radius: 9px; -moz-border-radius: 9px;"
													src="${pageContext.request.contextPath}/file/getImg/${item.cover}?type=min">

											</c:if>
										</div>
									</a>



									<div class="row">
										<div class="col-sm-12">
											<div class="file-name" style="background-color: #fefefe;">


												<c:choose>
													<c:when test="${fn:length(item.forderActivityName)<20}">
														<small> 拍摄主题：${item.forderActivityName} </small>
													</c:when>
													<c:otherwise>
														<small>
															拍摄主题：${fn:substring(item.forderActivityName,0,20)}...</small>
													</c:otherwise>
												</c:choose>
												<%-- <br /> <small> 所属单位：${item.adminCompany.name} </small> --%>

												<br /> <small> 拍摄地点：${item.address} </small> <br /> <small>
													创建人：${item.adminUser.name} </small> <br /> <small><c:forEach
														items="${item.listType}" var="it" varStatus="status">
														<c:if test="${it.type eq 'AREA' }">区域、</c:if>
														<c:if test="${it.type eq 'BASEUTIS' }">基层单位</c:if>
														<c:if test="${it.type eq 'DIRECTLYUTIS' }">直属单位  </c:if>
													</c:forEach> </small>


											</div>
										</div>
									</div>
								</div>
							</div>


							<!-- end -->
						</c:forEach>
					</ul>

				</div>

<!-- 分页功能 -->
				<div style="text-align: center; ">
					<c:if test="${not empty forderActivityList.datas}">
						<div class="btn-group" style="margin: 0 auto;margin-top: 30px;margin-bottom: 10px;">
							<a
								href="${pageContext.request.contextPath}/adminUser/index/${id }?pageNo=${forderActivityList.upPage}&time1=${time1}&time2=${time2}&selectVal=${selectVal}&selectQuery=${selectQuery}"
								type="button" class="btn btn-white"> <i
								class="fa fa-chevron-left"></i>
							</a>

							<c:forEach items="${forderActivityList.navigatepageNums}"
								var="nav">
								<c:choose>
									<c:when test="${nav == newslist.pageNo}">
										<a class="btn btn-white  active">${nav}</a>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/adminUser/index/${id }?pageNo=${nav}&time1=${time1}&time2=${time2}&selectVal=${selectVal}&selectQuery=${selectQuery}"
											class="btn btn-white">${nav}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<a
								href="${pageContext.request.contextPath}/adminUser/index/${id }?pageNo=${forderActivityList.nextPage}&time1=${time1}&time2=${time2}&selectVal=${selectVal}&selectQuery=${selectQuery}"
								type="button" class="btn btn-white"> <i
								class="fa fa-chevron-right"></i>
							</a>
						</div>
					</c:if>
				</div>
			</div>
			
				
			
		</div>
	</div>




</body>