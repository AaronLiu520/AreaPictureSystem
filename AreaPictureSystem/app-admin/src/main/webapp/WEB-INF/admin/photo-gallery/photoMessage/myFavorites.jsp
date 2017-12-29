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




<script type="text/javascript">
	var i = 0;
	function choose() {
		if (i == 0) {
			$(".checkbox").show();
			$("#deletes").show();
			$("#downloads").show();
			$("#favorites").show();
			$("#choose").html("<i class='fa fa-square-o'>&nbsp;取消选择</i>");
			$(".collection").show();
			$("#tb").show();
			i = 1;

		} else if (i == 1) {
			$(".checkbox").hide();
			$("#deletes").hide();
			$("#downloads").hide();
			$("#favorites").hide();
			$("#choose").html("<i class='fa fa-check-square-o'>&nbsp;选择</i>");
			$(".collection").hide();
			$("#tb").hide();
			i = 0;

		}
	}
</script>








<script type="text/javascript">
	function todownload() {
		var a = $("input[name='ids']:checked").length;

		if (a == 0) {
			$("#delete").hide();

			$("#modalMessage").text("请先选中需要下载的图片！");

			$('#deleteModal').modal('show');

		} else {

			var downloadIds = $("input[name='ids']:checked");

			//获取所有的id执行删除操作，使用ajax
			var str = "";
			$(downloadIds).each(function() {
				str += this.value + ",";
			});

			if (str != "") {
				var id = str.substring(0, str.length - 1);
				window.location.href = "${pageContext.request.contextPath}/photoMessageAction/download?id="
						+ id;
				$("#downloads").attr("disabled", "disabled");
				setTimeout(function() {
					$("#downloads").removeAttr("disabled");
				}, 5000)

			} else {
				window.location.href = document.URL;
			}

		}
	}

	function tocopy() {
		//将收藏的资源同步到自己的资源库中
		var a = $("input[name='ids']:checked").length;

		if (a == 0) {

			$("#delete").hide();

			$("#modalMessage").text("请选择需要同步的图片！");

			$('#deleteModal').modal('show');

		} else {

			var tb = $("input[name='ids']:checked");
			//获取所有的id执行删除操作，使用ajax
			var str = "";
			$(tb).each(function() {
				str += this.value + ",";
			})

			if (str != "") {

				var tbId = str.substring(0, str.length - 1);

				$
						.ajax({

							type : "POST",

							url : "${pageContext.request.contextPath}/photoMessageAction/copyToMyPictures",

							data : "resourceId=" + tbId,

							dataType : "text",

							success : function(data) {

								if (data == 'true') {
									$("#modalMessage").text("图片同步成功！");

									$('#deleteModal').modal('show');

								} else {

									$("#modalMessage").text("图片同步失败！");

									$('#deleteModal').modal('show');
								}

							}

						});

			}

		}

	}
</script>

<body>
	<div id="wrapper">
		<!-- .aside left menu -->
		<%@include file="../../public/left.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="../../public/top.jsp"%>


			<div class="wrapper wrapper-content">
				<div class="row">
					<!-- 资源管理模块 -->
					<div class="col-lg-12 animated fadeInRight">
						<div class="mail-box-header">

							<!-- 创建子文件夹 -->
							<div class="pull-right mail-search">
								<div class="input-group">
									<div class="input-group-btn" style="width: 0%">

										<!--
                    <button type="submit" class="btn btn-sm btn-primary">
                        创建子文件夹
                    </button>-->



									</div>
								</div>
							</div>



							<div class="row">
								<div class="col-sm-8">
									<h2>我的收藏夹</h2>
								</div>
								<div class="col-sm-4">
									<%-- <div class="input-group">
										<input type="text" placeholder="图片快速搜索"
											class="input form-control" value="${mfregex }" id="mfregex">
										<span class="input-group-btn">
											<button type="button" class="btn btn btn-primary"
												onclick="checkout();">
												<i class="fa fa-search"></i> 搜索
											</button>
										</span>
									</div> --%>
								</div>
							</div>




							<!-- 管理 菜单 按扭  -->
							<div class="mail-tools tooltip-demo m-t-md">
								<!--当用户选择活动后，显示操作按扭-->

								<div class="checkbox" style="float: left; display: none;">
									<input id="checkall" type="checkbox" name="checkall"> <label
										for="checkall"> </label>
								</div>


								<button type="button" class="btn btn-primary"
									style="display: none;" id="tb" onclick="return tocopy();">
									<i class="fa fa-copy"></i> &nbsp;同步至个人图片库
								</button>


								<button class="btn btn-primary " style="display: none;"
									id="downloads" type="button" onclick="return todownload();">
									<i class="fa fa-check"></i>&nbsp;下载
								</button>




								<button class="btn btn-warning "
									onclick="return cancelfavorites();" style="display: none;"
									id="favorites" type="button">
									<i class="fa fa-heart"> </i> 取消收藏
								</button>

								<button class="btn btn-default " id="choose" type="button"
									onclick="return choose();">
									<i class="fa fa-check-square-o"> </i> 选择
								</button>

							</div>
						</div>




						<!-- 资源内容展示 -->
						<div class="mail-box">
							<div>
								<!--  gallery 相册弹出层-->
								<div class="col-lg-12 gallery">
									<ul style="display: initial;">
										<c:forEach items="${pagination.datas}" var="item"
											varStatus="status">

											<c:if test="${not empty item.id }">

												<li>
													<!-- 已经将点击预览移植到图片层中 -->
													<div class="file-box collection_${item.id }">
														<div class="checkbox" name="checkboxs"
															style="z-index: 999; position: absolute; margin-top: 3px; margin-left: 3px; display: none">
															<input id="ids${item.id}" value="${item.id }"
																type="checkbox" name="ids"> <label
																for="ids${item.id}"> </label>
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
																					<p style="text-align: center;">未添加描述信息，请点 "描述"
																						管理 ....</p>
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
																	<div class="col-sm-2">
																		<div class="file-name"
																			style="background-color: #fefefe;">
																			<a href=""
																				onclick="return cancelfavorites('${item.id}')"><i
																				class="fa fa-heart"></i></a>
																		</div>



																	</div>
																	<div class="col-sm-10">
																		<div class="file-name"
																			style="background-color: #fefefe;">


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
									<c:if test="${not empty pagination.datas}">
										<div class="btn-group" style="margin: 0 auto;">
											<a
												href="${pageContext.request.contextPath}/photoMessageAction/findMyFavorites?pageNo=${pagination.upPage}"
												type="button" class="btn btn-white"> <i
												class="fa fa-chevron-left"></i>
											</a>

											<c:forEach items="${pagination.navigatepageNums}" var="nav">
												<c:choose>
													<c:when test="${nav == newslist.pageNo}">
														<a class="btn btn-white  active">${nav}</a>
													</c:when>
													<c:otherwise>
														<a
															href="${pageContext.request.contextPath}/photoMessageAction/findMyFavorites?pageNo=${nav}"
															class="btn btn-white">${nav}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>

											<a
												href="${pageContext.request.contextPath}/photoMessageAction/findMyFavorites?pageNo=${pagination.nextPage}"
												type="button" class="btn btn-white"> <i
												class="fa fa-chevron-right"></i>
											</a>
										</div>
									</c:if>
								</div>
							</div>

						</div>
					</div>





				</div>
			</div>
			<!-- 底部 -->
			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>

	<!-- 删除弹出层提示 -->
	<div class="modal inmodal fade" id="deleteModal" tabindex="-1"
		role="dialog" aria-hidden="true" style="padding: 15%">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<span style="float: left; color: red; font-size: 18px;" id="title">信息提示</span>
				</div>
				<div class="modal-body">
					<h3 id="modalMessage"></h3>
				</div>
				<input type="hidden" id="delete-id">
				<div class="modal-footer">
					<button type="button" class="btn btn-primary delete-confirm-btn" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!--javaScript event and JS-->
	<%@include file="operate.jsp"%>
	<!-- import popups -->
	<%@include file="popups.jsp"%>

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
	<!--取消收藏-->
		function cancelfavorites(o) {

			var favoritesIds = "";

			if (o == null) {

				//获取所有选中状态下的收藏图片的id      

				var favorites = $("input[name='ids']:checked");

				$(favorites).each(function() {

					favoritesIds += this.value + ",";

				});

			} else if (o != null) {

				favoritesIds = o;

			}

			$
					.ajax({

						type : "POST",

						url : "${pageContext.request.contextPath}/photoMessageAction/cancelMyFavorties",

						data : "resourceId=" + favoritesIds,

						dataType : "json",

						success : function(data) {

							for (var i = 0; i < data.length; i++) {

								var a = "collection_" + data[i].id;

								$("." + a).remove();

							}

							/* 收藏成功提示 $('#successFavorites').modal('show'); */

						}

					});

		}
	</script>

	<script type="text/javascript">
		$(function() {
			$("#checkall").click(function() {
				var flag = $("[name=checkall]:checkbox").is(':checked');
				$("[name=ids]:checkbox").each(function() {
					$(this).prop("checked", flag);
				})
			})

		})
	</script>



</body>
</html>
