<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>图片管理</title>

  
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>

<!-- 上传控件 -->
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<style type="text/css">
    * {

        list-style-type: none;
    }


</style>
    
    
<script type="text/javascript">
	var i = 0;
	function choose() {
		if (i == 0) {
			$(".checkbox").show();
			$("#deletes").show();
			$("#downloads").show();
			$("#favorites").show();
			$("#setTheCover").show();
			$("#choose").html("<i class='fa fa-square-o'>&nbsp;取消选择</i>");
			$(".collection").show();
			i = 1;

		} else if (i == 1) {
			$(".checkbox").hide();
			$("#deletes").hide();
			$("#downloads").hide();
			$("#favorites").hide();
			$("#setTheCover").hide();
			$("#choose").html("<i class='fa fa-check-square-o'>&nbsp;选择</i>");
			$(".collection").hide();
			i = 0;

		}
	}
</script>


<script type="text/javascript">
	function tobatchDelete() {
		var a = $("input[name='ids']:checked").length;

		if (a == 0) {
			$("#delete").hide();

			$("#modalMessage").text("请先选中需要删除的图片！");

		} else {
			$("#delete").show();

			$("#modalMessage").text("确定要删除所有选中的图片吗？");
		}

		$('#deleteModal').modal('show');

	}

	function todelete(o) {

		var delids = $("input[name='ids']:checked");

		//获取所有的id执行删除操作，使用ajax
		var str = "";
		$(delids).each(function() {
			str += this.value + ",";
		});

		if (str != "") {
			var id = str.substring(0, str.length - 1);
			window.location.href = "${pageContext.request.contextPath}/photoMessageAction/delete/${webType}?id="
					+ id + "&activityId=" + o;
		} else {
			window.location.href = document.URL;
		}

	}
	
	
</script>





<body>
    <div id="wrapper" >
     <!-- .aside left menu -->
	<%@include file="../../public/left.jsp" %>
        <div id="page-wrapper" class="gray-bg dashbard-1"  >
        <!-- .aside top jsp -->
           <%@include file="../../public/top.jsp" %>


            <div class="wrapper wrapper-content" >
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


<%-- 
			<div class="row">
				<div class="col-sm-8">

				</div>
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" placeholder="图片快速搜索" class="input form-control"
							value="${mfregex }" id="mfregex"> <span
							class="input-group-btn">
							<button type="button" class="btn btn btn-primary"
								onclick="checkout();">
								<i class="fa fa-search"></i> 搜索
							</button>
						</span>
					</div>
				</div>
			</div> --%>




			<!-- 管理 菜单 按扭  -->
			<div class="mail-tools tooltip-demo m-t-md">
				<!--当用户选择活动后，显示操作按扭-->

				<div class="checkbox" style="float: left; display: none;">
					<input id="checkall" type="checkbox" name="checkall"> <label
						for="checkall"> </label>
				</div>





					<div class="btn-group">
					<!-- 	<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							按时间排列 <span class="caret"></span>
						</button> -->



						<ul class="dropdown-menu" role="menu">
							<li><a
								href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/${webType}?checkId=${sessionScope.checkActivityId}&type=${type}&sort=ASC">升序</a></li>
							<li><a
								href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/${webType}?checkId=${sessionScope.checkActivityId}&type=${type}&sort=DESC">降序</a></li>
						</ul>
					</div>



					<!--
                <button class="btn btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button>
                -->
				<%-- 	<c:if
						test="${sessionScope.userSession.userType eq 'ADMINISTRATORS' or webType  eq 'PERSION' }">
						<button onclick="return tobatchDelete()" class="btn btn-danger "
							style="display: none;" id="deletes" type="button">
							<i class="fa fa-warning"> </i><span class="bold">批量删除</span>
						</button>
					</c:if> --%>


					<button class="btn btn-primary " style="display: none;"
						id="downloads" type="button" onclick="return todownload();">
						<i class="fa fa-check"></i>&nbsp;下载
					</button>



					<button class="btn btn-default " id="choose" type="button"
						onclick="return choose();">
						<i class="fa fa-check-square-o"> </i> 选择
					</button>

			</div>
		</div>
<script
	src="${pageContext.request.contextPath}/assets/admin/css/plugins/layer/layer/layer.min.js"></script>



		<!-- 资源内容展示 -->
		<div class="mail-box">
			<div>
				<!--  gallery 相册弹出层-->
				<div class="col-lg-12 gallery imgs" id="imgs">
					<ul style="display: initial;">

						<c:forEach items="${searchList.datas}" var="item"
							varStatus="status">

							<li>
								<!-- 已经将点击预览移植到图片层中 -->
								<div class="file-box">
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
											style="margin: 0 auto; width: 258px; height: 172px;"
											onclick="return findImg('${item.id}')"
											src="${pageContext.request.contextPath}/file/getImg/${item.id}?type=">
									</div>




										<small>
											<table border="0"
												style="width: 250px !important; margin-top: -10px;">

												<tr style="width: 250px;">
													<td style="white-space: nowrap"
														title="${ item.imgInfoBean.make}"><c:if
															test="${not empty item.imgInfoBean.make}">
													  ${fn:substring(item.imgInfoBean.make,0,15)}
														</c:if></td>
													<td>&nbsp;</td>
													<td align="right"
														style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
														<c:if
															test="${not empty item.imgInfoBean.imgHeight && not empty  item.imgInfoBean.imgWidth}">
															<c:set var="imgWidth"
																value="${item.imgInfoBean.imgWidth}" />
															<c:set var="imgHeight"
																value="${item.imgInfoBean.imgHeight}" />
															<c:set var="imgHeight_len"
																value="${fn:length(imgHeight)-6}" />
															<c:set var="imgWidth_len"
																value="${fn:length(imgWidth)-6}" />
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
													<td title="${item.editorImgInfo.resourceName  }"
														style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">名称：
														<c:if test="${not empty item.editorImgInfo.resourceName }">
																	 ${fn:substring(item.editorImgInfo.resourceName,0,5)}
													</c:if>
													</td>
													<td title="${item.editorImgInfo.resourceAddress }"
														colspan="2"
														style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">地址：
														<c:if
															test="${not empty item.editorImgInfo.resourceAddress }">
															  ${fn:substring(item.editorImgInfo.resourceAddress,0,15)}
															</c:if>
													</td>
												</tr>

												<tr>
													<td title="${item.editorImgInfo.person  }" colspan="2"
														style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">主要人物：
														<c:if test="${not empty item.editorImgInfo.person }">
																	 ${fn:substring(item.editorImgInfo.person,0,5)}
															</c:if>
													</td>
													<td title="${item.editorImgInfo.photographer  }"
														colspan="2"
														style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">作者：
														<c:if test="${not empty item.editorImgInfo.photographer }">
																	 ${fn:substring(item.editorImgInfo.photographer,0,5)}
													</c:if>
													</td>
												</tr>

												<tr>
													<td  colspan="2" title="${item.originalName}"><c:if
															test="${not empty item.originalName}">
															  ${fn:substring(item.originalName,0,20)}
														</c:if></td>
													<td><c:if test="${not empty item.imgInfoBean.imgSize}">${item.imgInfoBean.imgSize }MB </c:if></td>
											<%-- 		<td><c:choose>
															<c:when
																test="${sessionScope.userSession.userType eq 'ADMINISTRATORS'  || sessionScope.userSession.id == item.boundId }">
																<span> <a
																	onclick="updateImg('${item.id}','${item.editorImgInfo.resourceName}','${item.editorImgInfo.person}',
																	'${item.editorImgInfo.photographer}','${item.editorImgInfo.resourceAddress}',
																	'${item.editorImgInfo.description}','${item.editorImgInfo.sort }')"
																	data-toggle="modal" data-target="#File_Made"> 修改 </a>
																</span>
																<span style="padding-left: 10%;"> <a
																	onclick="deleteAlert('${item.id}','${sessionScope.checkActivityId}')">删除
																</a>
																</span>
															</c:when>
															<c:otherwise>
																<span style="padding-left: 10%;"> </span>

															</c:otherwise>
														</c:choose></td> --%>
												</tr>

												<tr>
													<td colspan="3"><c:set var="contains" value="no" /> <c:forEach
															var="list" items="${listFavorites }" varStatus="status">
															<c:if test="${list.id eq item.id}">
																<c:set var="contains" value="yes" />
															</c:if>
														</c:forEach> <c:choose>
															<c:when test="${contains=='yes' }">
																<span style="display: none;" class="collection"
																	id="collection_${item.id }"onclick="return cancelfavorites('${item.id}')">
																	<a><i class="fa fa-heart"></i>已收藏</a>
																</span>
															</c:when>
															<c:otherwise>
																<span style="padding-left: 10%; display: none;"
																	class="collection" id="collection_${item.id }">
																</span>
															</c:otherwise>
														</c:choose> <br /></td>
												</tr>




											</table>
										</small>

								</div>
							</li>
						</c:forEach>
					</ul>
				</div>

				<!-- 分页功能 -->
				
				<div style="text-align: center; margin-bottom: 5px;">
					<c:if test="${not empty searchList.datas}">
						<div class="btn-group" style="margin: 0 auto;">
							<a
								href="${pageContext.request.contextPath}/photoMessageAction/searchImgsByQuerys?selectQuery=${selectQuery}&selectVal=${selectVal }&pageNo=${searchList.upPage}"
								type="button" class="btn btn-white"> <i
								class="fa fa-chevron-left"></i>
							</a>

							<c:forEach items="${searchList.navigatepageNums}" var="nav">
								<c:choose>
									<c:when test="${nav == newslist.pageNo}">
										<a class="btn btn-white  active">${nav}</a>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/photoMessageAction/searchImgsByQuerys?selectQuery=${selectQuery}&selectVal=${selectVal }&pageNo=${nav}"
											class="btn btn-white">${nav}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<a
								href="${pageContext.request.contextPath}/photoMessageAction/searchImgsByQuerys?selectQuery=${selectQuery}&selectVal=${selectVal }&pageNo=${searchList.nextPage}"
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
                <%@include file="../../public/botton.jsp" %>
        </div>
    </div>



    <!--javaScript event and JS-->
    <%@include file="operate.jsp" %>
    <!-- import popups -->
    <%@include file="popups.jsp" %>








<script>
;!function(){
layer.use('extend/layer.ext.js', function(){
    //初始加载即调用，所以需放在ext回调里
    layer.ext = function(){
        layer.photosPage({
           // html:'<div style="padding:20px;">这里传入自定义的html<p>相册支持左右方向键，支持Esc关闭</p><p>另外还可以通过异步返回json实现相册。更多用法详见官网。</p><p>'+ unescape("%u7D20%u6750%u5BB6%u56ED%20-%20sc.chinaz.com") +'</p><p id="change"></p></div>',
            //title: '快捷模式-获取页面元素包含的所有图片',
            id: 100, //相册id，可选
            parent:'#imgs'
        });
    };
});
}();
</script>
</body>
</html>




















