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
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath}/assets/admin/css/plugins/layer/layer/layer.min.js"></script>

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
					<c:choose>
						<c:when test="${not empty fa}">
							<h3>
								<c:if test="${webType=='AREA'}"> 区域 </c:if>
								<c:if test="${webType=='BASEUTIS'}"> 基层单位 </c:if>
								<c:if test="${webType=='DIRECTLYUTIS'}"> 直属单位 </c:if>
								<c:if test="${webType=='PERSION'}"> 个人</c:if>
								《 ${fa.forderActivityName} 》
							</h3>


						</c:when>
					</c:choose>

				</div>
				<div class="col-sm-4">
					<%-- <div class="input-group">
						<input type="text" placeholder="图片快速搜索" class="input form-control"
							value="${mfregex }" id="mfregex"> <span
							class="input-group-btn">
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



				<c:if test="${not empty sessionScope.checkActivityId}">
					<a data-toggle="modal" href="form_basic.html#modal-form">
						<button class="btn btn-success " type="button">
							<i class="fa fa-upload"> </i>&nbsp;&nbsp;<span class="bold">上传图片</span>

						</button>
					</a>


					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							按时间排列 <span class="caret"></span>
						</button>



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
					<c:if
						test="${sessionScope.userSession.userType eq 'ADMINISTRATORS' or webType  eq 'PERSION' }">
						<button onclick="return tobatchDelete()" class="btn btn-danger "
							style="display: none;" id="deletes" type="button">
							<i class="fa fa-warning"> </i><span class="bold">批量删除</span>
						</button>
					</c:if>


					<button class="btn btn-primary " style="display: none;"
						id="downloads" type="button" onclick="return todownload();">
						<i class="fa fa-check"></i>&nbsp;下载
					</button>

					<c:if test="${webType  ne 'PERSION' }">

						<button class="btn btn-warning " onclick="return tofavorites();"
							style="display: none;" id="favorites" type="button">
							<i class="fa fa-heart"> </i> 收藏
						</button>



						<button class="btn btn-primary "
							onclick="return setTheCover('${sessionScope.checkActivityId}');"
							id="setTheCover" style="display: none;" type="button">
							<i class="fa fa-heart"> </i> 设为封面
						</button>
					</c:if>



					<button class="btn btn-default " id="choose" type="button"
						onclick="return choose();">
						<i class="fa fa-check-square-o"> </i> 选择
					</button>

				</c:if>
			</div>
		</div>




		<!-- 资源内容展示 -->
		<div class="mail-box">
			<div>
				<!--  gallery 相册弹出层-->
				<div class="col-lg-12 gallery imgs" id="imgs">
					<ul style="display: initial;">

						<c:forEach items="${listPhoto.datas}" var="item"
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
											src="${pageContext.request.contextPath}/file/getImg/${item.id}?type=max">
									</div>




									<div class="imgs" id="imgs">
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
													<td title="${item.originalName}"><c:if
															test="${not empty item.originalName}">
															  ${fn:substring(item.originalName,0,20)}
														</c:if></td>
													<td><c:if test="${not empty item.imgInfoBean.imgSize}">${item.imgInfoBean.imgSize }MB </c:if></td>
													<td><c:choose>
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
														</c:choose></td>
												</tr>

												<tr>
													<td colspan="3"><c:set var="contains" value="no" /> <c:forEach
															var="list" items="${listFavorites }" varStatus="status">
															<c:if test="${list.id eq item.id}">
																<c:set var="contains" value="yes" />
															</c:if>
														</c:forEach> <c:choose>
															<c:when test="${contains=='yes' }">
																<span style="display: none;margin-left: 0px;" class="collection"
																	id="collection_${item.id }"<%-- onclick="return cancelfavorites('${item.id}')" --%>>
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

								</div>
							</li>
						</c:forEach>
					</ul>
				</div>

				<!-- 分页功能 -->
				<div style="text-align: center; margin-bottom: 5px;">
					<c:if test="${not empty listPhoto.datas}">
						<div class="btn-group" style="margin: 0 auto;">
							<a
								href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/${webType}?checkId=${sessionScope.checkActivityId}&type=${type}&pageNo=${listPhoto.upPage}"
								type="button" class="btn btn-white"> <i
								class="fa fa-chevron-left"></i>
							</a>

							<c:forEach items="${listPhoto.navigatepageNums}" var="nav">
								<c:choose>
									<c:when test="${nav == newslist.pageNo}">
										<a class="btn btn-white  active">${nav}</a>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/${webType}?checkId=${sessionScope.checkActivityId}&type=${type}&pageNo=${nav}"
											class="btn btn-white">${nav}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<a
								href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/${webType}?checkId=${sessionScope.checkActivityId}&type=${type}&pageNo=${listPhoto.nextPage}"
								type="button" class="btn btn-white"> <i
								class="fa fa-chevron-right"></i>
							</a>
						</div>
					</c:if>
				</div>
			</div>

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
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="button"
						onclick="return todelete('${sessionScope.checkActivityId}');"
						id="delete" class="btn btn-primary delete-confirm-btn">确认</button>
				</div>
			</div>
		</div>
	</div>



	<div class="modal inmodal fade" id="successFavorites" tabindex="-1"
		role="dialog" aria-hidden="true" style="padding: 15%">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<span style="float: left; color: red; font-size: 18px;">图片收藏提示</span>
				</div>
				<div class="modal-body">
					<h3 id="">您喜欢的图片都已经收藏啦！</h3>
				</div>
				<input type="hidden" id="delete-id">
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>





	<script type="text/javascript">
   function checkout(){
	  var h=$("h2").text();
	  if(h==""){
		  
		  $('#deleteModal').modal('show'); 
		  $("#title").text("图片搜索提示");
		  $("#modalMessage").html("请先查询选择一个活动在进行搜索图片操作！");
		  
	      return 
	  }
	  var mfregex=$("#mfregex").val();
	  if(mfregex==""){
		  $('#deleteModal').modal('show'); 
		  $("#modalMessage").html("请输入要查找图片的关键字！");
		  $("#title").text("图片搜索提示");
	  }
	  else{
	  window.location.href ="${pageContext.request.contextPath}/photoMessageAction/checkActivity/${webType}?checkId=${sessionScope.checkActivityId}&type=${type}&mfregex="+mfregex;
	  }
	  }
</script>





	<script>
;!function(){
layer.use('extend/layer.ext.js', function(){
    //初始加载即调用，所以需放在ext回调里
    layer.ext = function(){
        layer.photosPage({
           // html:'<div style="padding:20px;">这里传入自定义的html<p>相册支持左右方向键，支持Esc关闭</p><p>另外还可以通过异步返回json实现相册。更多用法详见官网。</p><p>'+ unescape("%u7D20%u6750%u5BB6%u56ED%20-%20sc.chinaz.com") +'</p><p id="change"></p></div>',
            title: '<c:if test="${webType=='AREA'}"> 区域 </c:if> <c:if test="${webType=='BASEUTIS'}"> 基层单位 </c:if> <c:if test="${webType=='DIRECTLYUTIS'}"> 直属单位 </c:if><c:if test="${webType=='PERSION'}"> 个人</c:if>《 ${fa.forderActivityName} 》',
            id: 100, //相册id，可选
            parent:'#imgs'
        });
    };
});
}();
</script>







</body>
</html>
