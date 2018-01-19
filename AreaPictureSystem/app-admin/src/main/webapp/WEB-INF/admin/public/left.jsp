<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>管理后台</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link
	href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css?v=3.4.0"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/font-awesome/css/font-awesome.css?v=4.3.0"
	rel="stylesheet">
<!-- Morris -->
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/morris/morris-0.4.3.min.css"
	rel="stylesheet">
<!-- Gritter -->
<link
	href="${pageContext.request.contextPath}/assets/admin/js/plugins/gritter/jquery.gritter.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/jsTree/style.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/Assets/css/zoom.css"
	media="all" />



<style type="text/css">
.modal.fade .user-modal-dialog {
	padding: 5%;
}

li_style {
	background-color: red;
}

li_style:hover {
	background-color: blue;
}
</style>
<body>
	<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header">

					<div class="dropdown profile-element">
						<span style="float: left; padding-right: 10px;"> <c:choose>
								<c:when test="${sessionScope.userSession.headImage==''}">
									<img alt="image" class="img-circle"
										src="${pageContext.request.contextPath}/assets/admin/img/profile_small.jpg" />
								</c:when>
								<c:otherwise>
									<img alt="image" class="img-circle"
										src="${pageContext.request.contextPath}/user/getImg"
										width="64" />
								</c:otherwise>
							</c:choose>






						</span> <a data-toggle="dropdown" class="dropdown-toggle"
							href="index.html#"> <span class="clear"> <span
								class="block m-t-xs"> <strong class="font-bold">
										奉贤区图片库 </strong>
							</span> <span class="text-muted text-xs block">
									欢迎：${sessionScope.userSession.name} <b class="caret"></b>
							</span>
						</span>
						</a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">

							<li><a
								href="${pageContext.request.contextPath}/photoMessageAction/index/PERSION">个人图片库</a></li>

							<li><a
								href="${pageContext.request.contextPath}/photoMessageAction/findMyFavorites">我的收藏夹</a></li>

							<li><a data-toggle="modal" data-target="#myModal2">修改头像</a></li>

							<!-- Button trigger modal -->
							<!-- Modal -->

							<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<form role="form" enctype="multipart/form-data"
													method="post"
													action="${pageContext.request.contextPath}/user/change">
													<label for="inputfile">图片选择输入</label> <input type="file"
														id="inputfile" name="file">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">关闭</button>
											<button type="submit" class="btn btn-primary">修改上传</button>
										</div>
									</div>
								</div>
							</div>
							</form>


							<!-- Button trigger modal -->
							<li><a data-toggle="modal" data-target="#myModal">个人资料</a></li>

							<li><a data-toggle="model"
								href="${pageContext.request.contextPath}/picture/uploadfilelog">上传记录</a>

								<!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<table class="table">
													<caption>个人信息资料</caption>
													<tbody>
														<tr>
															<td>姓名:</td>
															<td>${sessionScope.userSession.name}</td>
														</tr>
														<tr>
															<td>性别:</td>
															<td>${sessionScope.userSession.sex}</td>
														</tr>
														<tr>
															<td>地址:</td>
															<td>${sessionScope.userSession.address}</td>
														</tr>
														<tr>
															<td>所属单位:</td>
															<td>${sessionScope.userSession.adminCompany.name}</td>
														</tr>
														<tr>
															<td>电话:</td>
															<td>${sessionScope.userSession.tel}</td>
														</tr>
														<tr>
															<td>邮箱:</td>
															<td>${sessionScope.userSession.email}</td>
														</tr>
														<tr>
															<td>备注:</td>
															<td>${sessionScope.userSession.reamrk}</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">关闭</button>
												<a
													href="${pageContext.request.contextPath}/user/editor?id=${sessionScope.userSession.id}"><button
														type="button" class="btn btn-primary">修改</button></a>
											</div>
										</div>
									</div>
								</div> <!-- 修改登录密码 -->
							<li><a data-toggle="modal" data-target="#EditPassword">密码修改</a></li>
							<!-- Modal -->


							<div class="modal inmodal" id="EditPassword" tabindex="-1"
								role="dialog" aria-hidden="true">

								<div class="modal-dialog">
									<div class="modal-content animated bounceInRight">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" id="EditPasswordClose">
												<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
											</button>
											<h4 class="modal-title">密码修改</h4>
										</div>

											<div class="modal-body">

												<div class="form-group">
													<label>旧密码：</label> <label for="foroldPassword" style="float: right;"
														id="foroldPassword" class="control-label"></label> <input
														type="text" placeholder="旧密码" name="oldPassword"
														id="oldPassword" class="form-control"
														onkeyup="return checkOldPassword();" required="required">
												</div>
												<div class="form-group">
													<label>新密码：</label><label for="forpassword" style="float: right;"
														id="forpassword" class="control-label"></label>  <input type="password" placeholder="新密码" required onkeyup="return checkinput();"
														name="password" id="password" class="form-control">
												</div>
												<div class="form-group">
													<label>确认密码：</label><label for="forpasswords" style="float: right;"
														id="forpasswords" class="control-label"></label> <input type="password" placeholder="确认密码" onkeyup="return checkinput();"
														name="passwords" id="passwords" required
														class="form-control">
												</div>

											</div>
											<div class="modal-footer">
												<button type="button" onclick="return ajaxUpdatePassword();" id="submit" class="btn btn-primary">保存</button>
											</div>
									</div>
								</div>


							</div>

							<!-- 修改密码end -->



							<li class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/adminUser/loginOut">安全退出</a>
							</li>
						</ul>
					</div>
					<div class="logo-element">CORED</div>

				</li>


				<!-- 区域图片库-->
				<li class="active"><a><i class="fa fa-th-large"
						style="margin-left: -10px;"></i> <span class="nav-label">区域图片库</span>
						<span class="fa arrow"></span> </a>
					<ul style="color: #c7c7c7; margin-left: -20px;">
						<%@include file="areatreetime.jsp"%>
					</ul></li>
				<!--直属单位-->
				<li class="active"><a><i class="fa fa-columns"
						style="margin-left: -10px;"></i> <span class="nav-label">直属单位</span>
						<span class="fa arrow"></span> </a>
					<ul style="color: #c7c7c7; margin-left: -20px;">
						<%@include file="directlytreetime.jsp"%>
					</ul></li>
				<!--基层单位-->
				<li class="active"><a><i class="fa fa-sitemap"
						style="margin-left: -10px;"></i> <span class="nav-label">基层单位</span><span
						class="fa arrow"></span> </a>
					<ul style="color: #c7c7c7; margin-left: -30px;">
						<%@include file="basetreetime.jsp"%>
					</ul></li>

				<!-- 以上菜单为固定菜单，以下菜单为动态数据库权限菜单-->
				<c:forEach items="${listMenu}" var="item" varStatus="status">

					<!-- 一级菜单，根目录   updateFormValue(id,name,type,icon,url,orderby,remark,pid)-->
					<c:if test="${item.pid == '0'}">
						<c:choose>
							<c:when test="${item.type == 'HaveMenu'}">
								<!-- 有子菜单 -->
								<!-- active 打开 class="active"-->
								<c:choose>
									<c:when
										test="${fn:contains(sessionScope.webMenuSession,item.id)}">

										<li class="active">
									</c:when>
									<c:otherwise>
										<li>
									</c:otherwise>
								</c:choose>


								<a href="#"> <i class="fa ${item.icon}"
									style="margin-left: -10px;"></i> <span class="nav-label">${item.name}</span>
									<span class="fa arrow"></span></a>
								<!-- 二级菜单，根目录 -->
								<ul class="nav nav-second-level">
									<c:forEach items="${listMenu}" var="subitem" varStatus="status">
										<c:if test="${subitem.pid == item.id}">
											<c:choose>
												<c:when test="${subitem.type == 'HaveMenu'}">
													<!-- 有只子菜单 -->
													<c:choose>
														<c:when
															test="${fn:contains(sessionScope.webMenuSession,subitem.id)}">
															<li class="active">
														</c:when>
														<c:otherwise>
															<li>
														</c:otherwise>
													</c:choose>

													<a href="#"> <i class="fa ${item.icon}"></i>${subitem.name}
														<span class="nav-label"> <!-- 这里空，为三级菜单 --></span><span
														class="fa arrow"></span></a>
													<ul class="nav nav-second-level">
														<c:forEach items="${listMenu}" var="menu"
															varStatus="status">
															<c:if test="${menu.pid == subitem.id}">

																<c:choose>
																	<c:when
																		test="${fn:contains(sessionScope.webMenuSession,menu.id)}">
																		<li class="active">
																	</c:when>
																	<c:otherwise>
																		<li>
																	</c:otherwise>
																</c:choose>

																<a
																	href="${pageContext.request.contextPath}/${menu.url}?activeMenu=${menu.id}_${item.id}_${subitem.id}">${menu.name}</a>
								</li>
					</c:if>
				</c:forEach>
			</ul>
			</li>
			</c:when>
			<c:otherwise>
				<!-- 没有子菜单 -->
				<c:choose>
					<c:when
						test="${fn:contains(sessionScope.webMenuSession,subitem.id)}">
						<li class="active">
					</c:when>
					<c:otherwise>
						<li>
					</c:otherwise>
				</c:choose>
				<a
					href="${pageContext.request.contextPath}/${subitem.url}?activeMenu=${subitem.id}_${item.id}">
					<i class="fa ${subitem.icon}"></i> ${subitem.name}
				</a>
				</li>
			</c:otherwise>
			</c:choose>


			</c:if>
			</c:forEach>
			</ul>
			</li>
			</c:when>
			<c:otherwise>
				<!-- active 打开 class="active"-->
				<c:choose>
					<c:when test="${fn:contains(sessionScope.webMenuSession,item.id)}">
						<li class="active">
					</c:when>
					<c:otherwise>
						<li>
					</c:otherwise>
				</c:choose>
				<!-- 没有子菜单 -->
				<a
					href="${pageContext.request.contextPath}/${item.url}?activeMenu=${item.id}">
					<i class="fa ${item.icon}"></i> <span class="nav-label">
						${item.name}</span>
				</a>
				</li>
			</c:otherwise>
			</c:choose>

			</c:if>
			</c:forEach>



			</ul>

		</div>

	</nav>
	
	
	
	<!-- 弹出层提示 -->
	<div class="modal inmodal fade" id="titleMessage" tabindex="-1"
		role="dialog" aria-hidden="true" style="padding: 15%">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<span style="float: left; color: red; font-size: 18px;" id="title"></span>
				</div>
				<div class="modal-body" id="content">
					<!-- <h3>您确认是否要删除此记录吗?</h3> -->
				</div>
				<div class="modal-footer">
		
					<button type="button" data-dismiss="modal"
						class="btn btn-primary delete-confirm-btn">确认</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	

	<!-- 主要的 scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/jquery-2.1.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/jeditable/jquery.jeditable.js"></script>

	<!-- 动态表格数据 -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<!-- 定制的javascript和插件 -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/hplus.js?v=2.2.0"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/pace/pace.min.js"></script>
	<!-- 全文搜索与查询 -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote.min.js"></script>
	<script	
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote-zh-CN.js"></script>
	<!-- 树 -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/jsTree/jstree.min.js"></script>
	<!-- 通知 -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/toastr/toastr.min.js"></script>
	<!-- 添加jqueryvalidate -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>







	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/commons.js">
	</script>



	<c:if test="${not empty success}">
		<script type="text/javascript">
			toastr.success('${success}', '操作成功')
		</script>
	</c:if>

	<c:if test="${not empty error}">
		<script type="text/javascript">
			toastr.error('${error}', '操作失败');
		</script>
	</c:if>
	<!-- tree 树形 -->
	<script>
		// tree 时间轴
		$(document).ready(function() {
			<!--区域时间轴-->
			$('#areatreetime').jstree({
				'core' : {
					'check_callback' : true
				},
				'plugins' : [ 'types', 'dnd' ],
				'types' : {
					'default' : {
						'icon' : 'fa fa-folder'
					},
					'html' : {
						'icon' : 'fa fa-file-code-o'
					},
					'svg' : {
						'icon' : 'fa fa-file-picture-o'
					},
					'css' : {
						'icon' : 'fa fa-file-code-o'
					},
					'img' : {
						'icon' : 'fa fa-file-image-o'
					},
					'js' : {
						'icon' : 'fa fa-file-text-o'
					}

				}
			});
			<!--直属时间轴-->
			$('#directlytreetime').jstree({
				'core' : {
					'check_callback' : true
				},
				'plugins' : [ 'types', 'dnd' ],
				'types' : {
					'default' : {
						'icon' : 'fa fa-folder'
					},
					'html' : {
						'icon' : 'fa fa-file-code-o'
					},
					'svg' : {
						'icon' : 'fa fa-file-picture-o'
					},
					'css' : {
						'icon' : 'fa fa-file-code-o'
					},
					'img' : {
						'icon' : 'fa fa-file-image-o'
					},
					'js' : {
						'icon' : 'fa fa-file-text-o'
					}

				}
			});
			<!--个人时间轴-->
			$('#basetreetime').jstree({
				'core' : {
					'check_callback' : true
				},
				'plugins' : [ 'types', 'dnd' ],
				'types' : {
					'default' : {
						'icon' : 'fa fa-folder'
					},
					'html' : {
						'icon' : 'fa fa-file-code-o'
					},
					'svg' : {
						'icon' : 'fa fa-file-picture-o'
					},
					'css' : {
						'icon' : 'fa fa-file-code-o'
					},
					'img' : {
						'icon' : 'fa fa-file-image-o'
					},
					'js' : {
						'icon' : 'fa fa-file-text-o'
					}

				}
			});
		});

		// 时间轴（活动的单事件）
		function checkActivityType(id, webType) {
			window.location.href = "${pageContext.request.contextPath}/photoMessageAction/checkActivity/"
					+ webType + "?checkId=" + id
		}

		// 时间轴（首页）
		function ActivityIndex(webType) {
			window.location.href = "${pageContext.request.contextPath}/photoMessageAction/index/"
					+ webType
		}
		

		
		
	</script>


</body>
</html>