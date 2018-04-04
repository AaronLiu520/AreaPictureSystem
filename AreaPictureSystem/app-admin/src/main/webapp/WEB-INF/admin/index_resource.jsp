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


<script src="${pageContext.request.contextPath}/assets/admin/css/plugins/layer/layer/layer.min.js"></script>

<body>
	<div class="row">
		<!-- 资源管理模块 -->
		<div class="col-lg-12 animated fadeInRight">

					
	<button type="button" id="loading-example-btn" onClick="return index();"
							class="btn btn-white btn-sm" style="margin-top: 10px;">
							<i class="fa fa-hand-o-left" ></i> 返回
						</button>

<div class="mail-box">
			<div>
				<!--  gallery 相册弹出层-->
				<div class="col-lg-12 gallery imgs" id="imgs" >
					<ul style="display: initial;">
					
						<c:forEach items="${resourcelist.datas}" var="item"
							varStatus="status">

							<li>
								<!-- 已经将点击预览移植到图片层中 -->
								<div class="file-box" >
									<div class="checkbox" name="checkboxs"
										style="z-index: 999; position: absolute; margin-top: 3px; margin-left: 15px; display: none">
										<input id="ids${item.id}" value="${item.id }" type="checkbox"
											name="ids"> <label for="ids${item.id}"> </label>
								</div>
								</div> 
								
								
									<div class="file-box"
										style="width: 280px; margin-left: 10px; margin-top: 0px;">

										<div class="file">
											<img alt="image" class="img-responsive" 
												style="margin: 0 auto; width: 258px;height: 172px;"
												onclick="return findImg('${item.id}')"
												src="${pageContext.request.contextPath}/file/getImg/${item.id}?type=">
										</div>
										
										
										
										
											<div>
												<small>
													<table border="0" style="width: 250px !important; margin-top: -20px;margin-bottom: 5px;">
													
													<tr style="width: 250px;height: 30px !important;">
														<td style="white-space: nowrap" title="${ item.imgInfoBean.make}">
														<c:if test="${not empty item.imgInfoBean.make}">
													  ${fn:substring(item.imgInfoBean.make,0,15)}
														</c:if></td>
															<td>&nbsp;</td>
														<td align="right" style="white-space: nowrap ;text-overflow:ellipsis;overflow:hidden;" >
														<c:if test="${not empty item.imgInfoBean.imgHeight && not empty  item.imgInfoBean.imgWidth}">
														 <c:set var="imgWidth" value="${item.imgInfoBean.imgWidth}" />
														 <c:set var="imgHeight" value="${item.imgInfoBean.imgHeight}" />
														 <c:set var="imgHeight_len" value="${fn:length(imgHeight)-6}" />
														 <c:set var="imgWidth_len" value="${fn:length(imgWidth)-6}" />
														 <c:choose>
															 <c:when test="${fn:contains(imgWidth,'pix')}">
															 ${fn:substring(imgWidth,0,imgHeight_len)}*${fn:substring(imgHeight,0,imgHeight_len)}</c:when>
														<c:otherwise>
															${item.imgInfoBean.imgWidth}*${item.imgInfoBean.imgHeight}
														</c:otherwise>
														</c:choose>
														</c:if>
														</td>
													
													</tr>
													<tr>
														<td  title="${item.editorImgInfo.resourceName  }" style="white-space: nowrap ;text-overflow:ellipsis;overflow:hidden;">名称： <c:if test="${not empty item.editorImgInfo.resourceName }">
																	 ${fn:substring(item.editorImgInfo.resourceName,0,5)}
													</c:if></td>
														<td title="${item.editorImgInfo.resourceAddress }" colspan="2" style="white-space: nowrap ;text-overflow:ellipsis;overflow:hidden;">地址：
														<c:if test="${not empty item.editorImgInfo.resourceAddress }">
															  ${fn:substring(item.editorImgInfo.resourceAddress,0,15)}
															</c:if>
													   </td>
													</tr>
													
													<tr>
														<td  title="${item.editorImgInfo.person  }" colspan="2" style="white-space: nowrap ;text-overflow:ellipsis;overflow:hidden;">主要人物：
														 <c:if test="${not empty item.editorImgInfo.person }">
																	 ${fn:substring(item.editorImgInfo.person,0,5)}
															</c:if>
													   </td>
														<td  title="${item.editorImgInfo.photographer  }" colspan="2" style="white-space: nowrap ;text-overflow:ellipsis;overflow:hidden;">作者： <c:if test="${not empty item.editorImgInfo.photographer }">
																	 ${fn:substring(item.editorImgInfo.photographer,0,5)}
													</c:if></td>
													</tr>
													
													<tr>
														<td title="${item.originalName}">
														
														<c:if test="${not empty item.originalName}">
															  ${fn:substring(item.originalName,0,20)}
														</c:if>
													</td>
														<td><c:if test="${not empty item.imgInfoBean.imgSize}">${item.imgInfoBean.imgSize }MB </c:if></td>
														<td>
														</td>
													</tr>
													

													</table> 
												</small>
											</div>
										
									</div>
							</li>
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

			<!-- 资源内容展示 -->
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
<script>
;!function(){
layer.use('extend/layer.ext.js', function(){
    //初始加载即调用，所以需放在ext回调里
    layer.ext = function(){
        layer.photosPage({
           // html:'<div style="padding:20px;">这里传入自定义的html<p>相册支持左右方向键，支持Esc关闭</p><p>另外还可以通过异步返回json实现相册。更多用法详见官网。</p><p>'+ unescape("%u7D20%u6750%u5BB6%u56ED%20-%20sc.chinaz.com") +'</p><p id="change"></p></div>',
            title: '',
            id: 100, //相册id，可选
            parent:'#imgs'
        });
    };
});
}();
</script>

<script type="text/javascript">
function index(){
		window.location.href = "${pageContext.request.contextPath}/adminUser/index";
		
}

</script>



</body>
</html>
