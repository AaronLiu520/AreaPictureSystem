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


<body>
	<div id="wrapper">
		<!-- .aside left menu -->
		<%@include file="../../public/left.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="../../public/top.jsp"%>


			<div class="wrapper wrapper-content">


				<!-- 资源管理模块 -->
				<div class="col-lg-12 animated fadeInRight">
					<div class="mail-box-header">

							<h3>投稿图片管理</h3>
						<div class="row">


							<!-- 资源内容展示 -->
							<div class="mail-box">
								<div>
									<!--  gallery 相册弹出层-->
									<div class="col-lg-12 gallery">
										<ul style="display: initial;">
											<c:forEach items="${usersUploads.listContestImages}"
												var="item" varStatus="status">

												<li>
													<!-- 已经将点击预览移植到图片层中 -->
													<div class="file-box">

													</div> <a target="_blank" href="${item.originalPath }">

														<div class="file-box">

															<div class="file">

																<span class="corner"></span>
																<!--如果修改后的资源名称不为空-->


																<div id="item_4" class=" image"
																	style="height: 130px; text-align: center;">
																	<img alt="image" class="img-responsive"
																		style="margin: 0 auto;"
																		onclick="return findImg('${item.id}')"
																		src="${item.originalPath }">
																</div>


																<div class="file-name" style="text-align: center;">
																	${item.originalName} <br /> <small> <!-- 只有：管理员 与 自己上传的图片才修改、删除-->
																		<span style="padding-left: 10%;"> <a
																			onclick="deleteAlert('${item.id}','${usersUploads.id }')">删除
																		</a>
																	</span> <span style="padding-left: 10%;"> </span></small>
																</div>


															</div>
														</div>
												</a>

												</li>
											</c:forEach>
										</ul>
									</div>

								</div>

							</div>



						</div>




						<!-- 管理 菜单 按扭  -->
					</div>





				</div>


		 <!-- 删除弹出层提示 -->
    <div class="modal inmodal fade" id="deleteModal" tabindex="-1" role="dialog"  aria-hidden="true" style="padding: 15%">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            	<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <span style="float: left;color: red;font-size: 18px;">删除提示</span>
                </div>
                <div class="modal-body">
                 <h3>您确认是否要删除此记录吗?</h3>
                </div>
                <input type="hidden" id="delete-id"> 
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="deleteById();" class="btn btn-primary delete-confirm-btn">确认</button>
                </div>
            </div>
        </div>
    </div>

			</div>
			<!-- 底部 -->
			<%@include file="../../public/botton.jsp"%>
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
	var deleteId ;
	var usersUploadsId;
 	function deleteAlert(id,o2) {
		 $('#deleteModal').modal('show');
		deleteId=id;
		usersUploadsId = o2;
	}
 	
 	function deleteById(){
 		
 		window.location.href="${pageContext.request.contextPath}/contest/deleteImages?id="+deleteId+"&usersUploadsId="+usersUploadsId;
 	}
 	
 	
 	
 	
 	
 	
 	
	</script>
	
	



</body>
</html>
