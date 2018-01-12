<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>图片管理</title>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
</head>

<!-- 上传控件 -->
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/basic.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/dropzone.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/jsTree/style.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/css/style.css?v=2.2.0"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/Assets/css/zoom.css"
	media="all" />


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/Assets/tooltip/stylesheets/jquery.tooltip/jquery.tooltip.css"
	type="text/css" />

<style type="text/css">
* {
	list-style-type: none;
}
</style>
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">


<body>
	<div class="row">
		<!-- 资源管理模块 -->
		<div class="col-lg-12 animated fadeInRight">

			<!-- 资源内容展示 -->
			<div>
				<!--  gallery 相册弹出层-->
				<div class="col-lg-12 gallery">

					
	<button type="button" id="loading-example-btn" onClick="return index();"
							class="btn btn-white btn-sm" style="margin-top: 10px;">
							<i class="fa fa-hand-o-left" ></i> 返回
						</button>
					<ul style="display: initial;">
						
						<c:forEach items="${resourcelist.datas}" var="item"
							varStatus="status">

							<c:if test="${not empty item.id }">

								<li>
									<!-- 已经将点击预览移植到图片层中 -->
									<div class="file-box collection_${item.id }">
										<div class="checkbox" name="checkboxs"
											style="z-index: 999; position: absolute; margin-top: 3px; margin-left: 3px; display: none">
											<input id="ids${item.id}" value="${item.id }" type="checkbox"
												name="ids"> <label for="ids${item.id}"> </label>
										</div>

									</div> <a target="_blank"
									href="${pageContext.request.contextPath}/file/getImg/${item.id }?type=">

										<div class="file-box collection_${item.id }">

											<div class="file">

												<span class="corner"></span>
												<!--如果修改后的资源名称不为空-->


												<div id="item_4" class="item image"
													style="height: 130px; text-align: center;">

													<a target="_blank"
														href="${pageContext.request.contextPath}/file/getImg/${item.id}?type=">
														<img alt="image" class="img-responsive"
														style="margin: 0 auto;"
														onclick="return findImg('${item.id}')"
														src="${pageContext.request.contextPath}/file/getImg/${item.id}?type=min">



														<!--  </a>  -->
														<div class="tooltip_description" style="display: none"
															title="相机、图片信息">
															<!-- 图片信息-->
															<c:choose>
																<c:when test="${empty item.editorImgInfo}">
																	<p style="text-align: center;">未添加描述信息，请点 "描述" 管理
																		....</p>
																</c:when>
																<c:otherwise>
																	<!--名称-->
																	<c:if
																		test="${not empty item.editorImgInfo.resourceName}">
																		<p>
																			<span style="float: left;">资源名称: <c:choose>
																					<c:when
																						test="${fn:length(item.editorImgInfo.resourceName)<15}">
                                                                            ${item.editorImgInfo.resourceName}
                                                                        </c:when>
																					<c:otherwise>
                                                                            ${fn:substring(item.editorImgInfo.resourceName,0,15)}...
                                                                        </c:otherwise>
																				</c:choose>
																			</span>
																		</p>
																	</c:if>
																	<!--被拍摄者、摄影者-->
																	<c:if test="${not empty item.editorImgInfo.person}">
																		<p>
																			<span style="float: left;">被拍摄者:
																				${item.editorImgInfo.person} </span> <span
																				style="float: right; padding-right: 10px;">
																				摄影者: ${item.editorImgInfo.photographer} </span>
																		</p>
																	</c:if>

																	<!--资源地址-->
																	<c:if
																		test="${not empty item.editorImgInfo.resourceAddress}">
																		<p>
																			<span style="float: left;">拍摄地址: <c:choose>
																					<c:when
																						test="${fn:length(item.editorImgInfo.resourceAddress)<15}">
                                                                          ${item.editorImgInfo.resourceAddress}
                                                                      </c:when>
																					<c:otherwise>
                                                                          ${fn:substring(item.editorImgInfo.resourceAddress,0,15)}...
                                                                      </c:otherwise>
																				</c:choose>

																			</span>
																		</p>
																	</c:if>
																	<!--资源地址-->
																	<c:if
																		test="${not empty item.editorImgInfo.description}">
																		<p>
																			<span style="float: left;">内容描述: <c:choose>
																					<c:when
																						test="${fn:length(item.editorImgInfo.description)<15}">
                                                                       ${item.editorImgInfo.description}
                                                                   </c:when>
																					<c:otherwise>
                                                                       ${fn:substring(item.editorImgInfo.description,0,15)}...
                                                                   </c:otherwise>
																				</c:choose>

																			</span>
																		</p>
																	</c:if>
																</c:otherwise>

															</c:choose>

															<hr
																style="height: 1px; border: none; border-top: 1px solid #c7c7c7;" />
															<!-- 相机信息-->
															<c:choose>
																<c:when test="${empty item.imgInfoBean}">
																	<p style="text-align: center;">图片信息加工处理中，请稍后....</p>
																</c:when>
																<c:otherwise>
																	<p>
																		<span style="float: left;">高度:
																			${item.imgInfoBean.imgHeight}</span> <span
																			style="float: right; padding-right: 10px;">宽度:
																			${item.imgInfoBean.imgWidth}</span>
																	</p>
																	<!-- 相机、型号-->
																	<c:if
																		test="${not empty item.imgInfoBean.make &&
                                                          not empty item.imgInfoBean.model}">
																		<p>
																			<span style="float: left;">相机:
																				${item.imgInfoBean.make} </span> <span
																				style="float: right; padding-right: 10px;">型号:
																				${item.imgInfoBean.model}</span>
																		</p>
																	</c:if>
																	<!-- 检查闪光，模式 -->
																	<c:if
																		test="${not empty item.imgInfoBean.flashMode &&
                                                          not empty item.imgInfoBean.easyShooting}">
																		<p>
																			<span style="float: left;">闪光:
																				${item.imgInfoBean.flashMode}</span> <span
																				style="float: right; padding-right: 10px;">模式:
																				${item.imgInfoBean.easyShooting}</span>
																		</p>
																	</c:if>
																	<!-- 检查 纬度，经度 -->

																	<c:if
																		test="${not empty item.imgInfoBean.latitude &&
                                                            not empty item.imgInfoBean.longitude}">
																		<p>
																			<span style="float: left;">纬度:
																				${item.imgInfoBean.latitude}</span> <span
																				style="float: right; padding-right: 10px;">经度:
																				${item.imgInfoBean.longitude}</span>
																		</p>
																	</c:if>

																	<p>
																		<span style="float: left;">大小:
																			${item.imgInfoBean.imgSize} MB</span>
																	</p>
																	<p>
																		<span style="float: left;">名称:
																			${item.imgInfoBean.imgName}</span>
																	</p>
																	<p>
																		<span style="float: left;">拍摄时间:
																			${item.imgInfoBean.dateTime}</span>
																	</p>

																</c:otherwise>
															</c:choose>


														</div>
												</div>

												<div class="row">
													<div class="col-sm-2"></div>
													<div class="col-sm-10">
														<div class="file-name" style="background-color: #fefefe;">


															<c:choose>
																<c:when test="${fn:length(item.originalName)<20}">
																	<small> ${item.originalName}</small>
																</c:when>
																<c:otherwise>
																	<small>
																		${fn:substring(item.originalName,0,20)}...</small>
																</c:otherwise>
															</c:choose>
															<br />
														</div>
													</div>


												</div>


											</div>
										</div>
								</a>

								</li>

							</c:if>



							<!-- end -->

						</c:forEach>
					</ul>




				</div>

				<!-- 分页功能 -->
				<div style="text-align: center; margin-bottom: 5px;">
					<c:if test="${not empty resourcelist.datas}">
						<div class="btn-group" style="margin: 0 auto;">
							<a
								href="${pageContext.request.contextPath}/adminUser/findPictures/${id }?pageNo=${resourcelist.upPage}"
								type="button" class="btn btn-white"> <i
								class="fa fa-chevron-left"></i>
							</a>

							<c:forEach items="${resourcelist.navigatepageNums}" var="nav">
								<c:choose>
									<c:when test="${nav == newslist.pageNo}">
										<a class="btn btn-white  active">${nav}</a>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/adminUser/findPictures/${id }?pageNo=${nav}"
											class="btn btn-white">${nav}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<a
								href="${pageContext.request.contextPath}/adminUser/findPictures/${id }?pageNo=${resourcelist.nextPage}"
								type="button" class="btn btn-white"> <i
								class="fa fa-chevron-right"></i>
							</a>
						</div>
					</c:if>
				</div>

			</div>
		</div>





	</div>


	<!-- DROPZONE -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/dropzone/dropzone.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/Assets/js/zoom.min.js"></script>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/Assets/tooltip/javascripts/jquery.tooltip.js"></script>
	<script type="text/javascript">
		$j = jQuery.noConflict();
		$j(document).ready(function() {
			$j("div.item").tooltip();
		});
	</script>


<script type="text/javascript">
function index(){
		window.location.href = "${pageContext.request.contextPath}/adminUser/index";
		
}

</script>



</body>
</html>
