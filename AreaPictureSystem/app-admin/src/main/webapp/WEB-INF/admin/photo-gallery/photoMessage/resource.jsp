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
			i = 1;

		} else if (i == 1) {
			$(".checkbox").hide();
			$("#deletes").hide();
			$("#downloads").hide();
			$("#favorites").hide();
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
	
	
	
	
	function todownload() {
		var a = $("input[name='ids']:checked").length;

		if (a == 0) {
			$("#delete").hide();

			$("#modalMessage").text("请先选中需要下载的图片！");
			
			$('#deleteModal').modal('show');

		}else{
			
			var downloadIds = $("input[name='ids']:checked");

			//获取所有的id执行删除操作，使用ajax
			var str = "";
			$(downloadIds).each(function() {
				str += this.value + ",";
			});

			if (str != "") {
				var id = str.substring(0, str.length - 1);
				 window.location.href = "${pageContext.request.contextPath}/photoMessageAction/download?id="
						+ id ; 
				  $("#downloads").attr("disabled","disabled");
					 setTimeout(function(){
			            $("#downloads").removeAttr("disabled");
			        },5000)
				 
				 
				 
			} else {
				window.location.href = document.URL;
			}
			
		} 

		

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>


<body>
	<!-- 资源管理模块 -->
	<div class="col-lg-9 animated fadeInRight">
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
							<h2>
								<c:if test="${webType=='AREA'}"> 区域 </c:if>
								<c:if test="${webType=='BASEUTIS'}"> 基层单位 </c:if>
								<c:if test="${webType=='DIRECTLYUTIS'}"> 直属单位 </c:if>
								《 ${fa.forderActivityName} 》
							</h2>


						</c:when>
						<c:otherwise>
							<h3>请先： 选择活动 或 创建活动</h3>
						</c:otherwise>
					</c:choose>

				</div>
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" placeholder="图片快速搜索" class="input form-control" value="${mfregex }"
							id="mfregex"> <span class="input-group-btn">
							<button type="button" class="btn btn btn-primary"
								onclick="checkout();">
								<i class="fa fa-search"></i> 搜索
							</button>
						</span>
					</div>
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
					<c:if test="${sessionScope.userSession.userType eq 'ADMINISTRATORS'}">
						<button onclick="return tobatchDelete()" class="btn btn-danger "
								style="display: none;" id="deletes" type="button">
							<i class="fa fa-warning"> </i><span class="bold">批量删除</span>
						</button>
					</c:if>


					<button class="btn btn-primary " style="display: none;"
						id="downloads" type="button" onclick="return todownload();">
						<i class="fa fa-check"></i>&nbsp;下载
					</button>


					<button class="btn btn-warning " onclick="return tofavorites();"
						style="display: none;" id="favorites" type="button">
						<i class="fa fa-heart"> </i> 收藏
					</button>

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
				<div class="col-lg-12 gallery">
					<ul style="display: initial;">
						<c:forEach items="${listPhoto.datas}" var="item"
							varStatus="status">

							<li>
								<!-- 已经将点击预览移植到图片层中 -->
								<div class="file-box">
									<div class="checkbox" name="checkboxs"
										style="z-index: 999; position: absolute; margin-top: 3px; margin-left: 3px; display: none">
										<input id="ids${item.id}" value="${item.id }" type="checkbox"
											name="ids"> <label for="ids${item.id}"> </label>
									</div>

								</div> <a target="_blank"
								href="${pageContext.request.contextPath}/file/getImg/${item.id }?type=">

									<div class="file-box">

										<div class="file">

											<span class="corner"></span>
											<!--如果修改后的资源名称不为空-->


											<div id="item_4" class="item image"
												style="height: 130px; text-align: center;">

												<%--    <a target="_blank" href="${pageContext.request.contextPath}/file/getImg/${item.id}?type=">  --%>
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
															<c:if test="${not empty item.editorImgInfo.resourceName}">
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
															<c:if test="${not empty item.editorImgInfo.description}">
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


											<div class="file-name" style="text-align: center;">

												<c:choose>
													<c:when test="${fn:length(item.originalName)<15}">
                                                ${item.originalName}
                                            </c:when>
													<c:otherwise>
                                                ${fn:substring(item.originalName,0,15)}...
                                            </c:otherwise>
												</c:choose>

												<br /> <small> <!-- 只有：管理员 与 自己上传的图片才修改、删除--> <c:choose>
														<c:when
															test="${sessionScope.userSession.userType eq 'ADMINISTRATORS'  || sessionScope.userSession.id == item.boundId }">
															<span> <a
																onclick="updateImg('${item.id}','${item.editorImgInfo.resourceName}','${item.editorImgInfo.person}',
																	'${item.editorImgInfo.photographer}','${item.editorImgInfo.resourceAddress}',
																	'${item.editorImgInfo.description}')"
																data-toggle="modal" data-target="#File_Made"> 描述 </a>
															</span>
															<span style="padding-left: 10%;"> <a
																onclick="deleteAlert('${item.id}','${sessionScope.checkActivityId}')">删除
															</a>
															</span>
														</c:when>
														<c:otherwise>
															<span style="padding-left: 10%;"> </span>

														</c:otherwise>
													</c:choose> <c:set var="contains" value="no" /> <c:forEach var="list"
														items="${listFavorites }" varStatus="status">
														<c:if test="${list.id eq item.id}">
															<c:set var="contains" value="yes" />
														</c:if>
													</c:forEach> <c:choose>
														<c:when test="${contains=='yes' }">
															<span style="padding-left: 10%; display: none;"
																class="collection" id="collection_${item.id }"<%-- onclick="return cancelfavorites('${item.id}')" --%>>
																<a><i class="fa fa-heart"></i>已收藏</a>
															</span>
														</c:when>
														<c:otherwise>
															<span style="padding-left: 10%; display: none;"
																class="collection" id="collection_${item.id }"> </span>
														</c:otherwise>
													</c:choose>

												</small>
											</div>


										</div>
									</div>
							</a>

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
				<div class="modal-body" >
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








	<script type="text/javascript">
		//ajax收藏图片资源
		function tofavorites(o) {
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
						url : "${pageContext.request.contextPath}/photoMessageAction/toMyFavorties",
						data : "resourceId=" + favoritesIds,
						dataType : "json",
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
								var a = "collection_" + data[i].id;
								$("#" + a)
										.html(
												"<a><i class='fa fa-heart'></i>已收藏</a>");
							}
							/* 收藏成功提示 $('#successFavorites').modal('show'); */
						}
					});
		}
		<!--  取消收藏-->
		<%-- function cancelfavorites(o){--%>
			<%--var favoritesIds = "";--%>
			<%--if (o == null) {--%>
				<%--//获取所有选中状态下的收藏图片的id      --%>
				<%--var favorites = $("input[name='ids']:checked");--%>
				<%--$(favorites).each(function() {--%>
					<%--favoritesIds += this.value + ",";--%>
				<%--});--%>
			<%--}else if(o != null){--%>
				<%--favoritesIds=o;--%>
			<%--}--%>
			<%----%>
			<%--$.ajax({--%>
						<%--type : "POST",--%>
						<%--url : "${pageContext.request.contextPath}/photoMessageAction/cancelMyFavorties",--%>
						<%--data : "resourceId=" + favoritesIds,--%>
						<%--dataType : "json",--%>
						<%--success : function(data) {--%>
							<%--for (var i = 0; i < data.length; i++) {--%>
								<%--var a = "collection_" + data[i].id;--%>
								<%--$("#"+a).attr("onclick","return tofavorites('"+data[i].id+"')")--%>
								<%--$("#" + a) .html("<a><i class='fa fa-heart'></i>收藏</a>");--%>
							<%--}--%>
							<%--/* 收藏成功提示 $('#successFavorites').modal('show'); */--%>
						<%--}--%>
					<%--});--%>
		<%--}--%>

		<!--取消收藏-->
	<%--function cancelfavorites(o){--%>
		
	<%--var favoritesIds = "";--%>
		
	<%--if (o == null) {--%>
		
	<%--//获取所有选中状态下的收藏图片的id      --%>
		
	<%--var favorites = $("input[name='ids']:checked");--%>
		
	<%--$(favorites).each(function() {--%>
		
	<%--favoritesIds += this.value + ",";--%>
		
	<%--});--%>
		
	<%--}else if(o != null){--%>
		
	<%--favoritesIds=o;--%>
		
	<%--}--%>
		
	<%----%>
		
	<%--$.ajax({--%>
		
	<%--type : "POST",--%>
		
	<%--url : "${pageContext.request.contextPath}/photoMessageAction/cancelMyFavorties",--%>
		
	<%--data : "resourceId=" + favoritesIds,--%>
		
	<%--dataType : "json",--%>
		
	<%--success : function(data) {--%>
		
	<%--for (var i = 0; i < data.length; i++) {--%>
		
	<%--var a = "collection_" + data[i].id;--%>
		
	<%--$("#"+a).attr("onclick","return tofavorites('"+data[i].id+"')")--%>
		
	<%--$("#" + a) .html("<a><i class='fa fa-heart'></i>收藏</a>");--%>
		
	<%--}--%>
		
	<%--/* 收藏成功提示 $('#successFavorites').modal('show'); */--%>
		
	<%--}--%>
		
	<%--});--%>
		
	<%--}--%>
		
	</script>













</body>
</html>
