<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>比赛管理</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
</head>

<!-- 动态表格 -->
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

<body>
	<div id="wrapper">
		<!-- .aside left menu -->
		<%@include file="../../public/left.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="../../public/top.jsp"%>
			<div class="wrapper wrapper-content">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5 id="add-title">比赛发布</h5>
							</div>
							<div class="ibox-content">
								<div class="modal-body">
									<p>
									<form id="signupForm"
										action="${pageContext.request.contextPath}/contest/createOrUpdateToFind"
										method="POST" class="form-horizontal"
										enctype="multipart/form-data">

										<div class="form-group">
											<div class="col-sm-12">
												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">比赛主题</label>
													<div class="col-sm-10">
														<input type="text" name="contestName" id="contestName"
															value="${contest.contestName }" class="form-control"
															placeholder="比赛主题" required="required">
													</div>
												</div>
												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">比赛类别</label>
													<div class="col-sm-10">

														<select class="form-control" name="contestType">
															<option value="false"
																<c:if test="${contest.contestType eq false }">selected </c:if>>区域</option>
															<option value="true"
																<c:if test="${contest.contestType eq true }">selected </c:if>>内部</option>
														</select>
													</div>
												</div>

											</div>
											<div class="col-sm-12">
												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">排序</label>
													<div class="col-sm-10">
														<input type="text" name="sort" id="sort"
															value="${contest.sort }" class="form-control"
															placeholder="排序">
													</div>
												</div>



												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">发布人</label>
													<div class="col-sm-10">
														<input type="text" name="publisher" id="publisher"
															required value="${contest.publisher }"
															class="form-control" placeholder="发布人">
													</div>
												</div>
											</div>
											<div class="col-sm-12">
												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">发布人电话</label>
													<div class="col-sm-10">
														<input type="text" name="publisherPhone"
															id="publisherPhone" value="${contest.publisherPhone }"
															class="form-control" placeholder="发布人电话" required>
													</div>
												</div>

														<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">同时上传最大图片数</label>
													<div class="col-sm-10">
														<input type="text" name="maxPictureNum" id="maxPictureNum"
															value="${contest.minPictureNum }" class="form-control"
															placeholder="同时上传最大图片数">
													</div>
												</div>
											</div>

										<%-- 	<div class="col-sm-12">
										
												
												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">最少图片数</label>
													<div class="col-sm-10">
														<input type="text" name="minPictureNum" id="minPictureNum"
															value="${contest.minPictureNum }" class="form-control"
															placeholder="最少图片数">
													</div>
												</div>
												
												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">参赛人数上限</label>
													<div class="col-sm-10">
														<input type="text" name="participants" id="participants"
															value="${contest.participants }" class="form-control"
															placeholder="参赛人数上限">
													</div>
												</div>

											</div> --%>
											<div class="col-sm-12">
												<div class="form-group  col-sm-6">
													<label class="col-sm-2 control-label">开始时间</label>
													<div class="col-sm-10">

														<input type="text" placeholder="开始时间" name="startTime"
															id="startTime" readonly="readonly"
															value="${contest.startTime }"
															class="form-control datainput"
															data-date-format="yyyy-mm-dd hh:ii:00" required>
													</div>
												</div>

												<div class="form-group  col-sm-6">
													<label class="col-sm-2 control-label">截止时间</label>
													<div class="col-sm-10">

														<input type="text" placeholder="截止时间" name="endTime"
															id="endTime" readonly="readonly"
															value="${contest.endTime }"
															class="form-control datainput"
															data-date-format="yyyy-mm-dd hh:ii:00" required>
													</div>
												</div>
											</div>
											<div class="col-sm-12">
												<div class="form-group  col-sm-6">
													<label class="col-sm-2 control-label">投票开始时间</label>
													<div class="col-sm-10">

														<input type="text" placeholder="投票开始时间"
															name="voteStartTime" id="voteStartTime"
															readonly="readonly" value="${contest.voteStartTime }"
															class="form-control datainput"
															data-date-format="yyyy-mm-dd hh:ii:00" required>
													</div>
												</div>

												<div class="form-group  col-sm-6">
													<label class="col-sm-2 control-label">投票截止时间</label>
													<div class="col-sm-10">

														<input type="text" placeholder="截止时间" name="voteEndTime"
															id="voteEndTime" readonly="readonly"
															value="${contest.voteEndTime }"
															class="form-control datainput"
															data-date-format="yyyy-mm-dd hh:ii:00" required>
													</div>
												</div>
											</div>
											<div class="col-sm-12">

												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">开启投票</label>
													<div class="col-sm-10">

														<select class="form-control" name="openVote">
															<option value="false"
																<c:if test="${contest.openVote eq false }">selected </c:if>>禁用投票</option>
															<option value="true"
																<c:if test="${contest.openVote eq true }">selected </c:if>>启用投票</option>
														</select>
													</div>
												</div>
												<%-- <div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">公开投票</label>
													<div class="col-sm-10">

														<select class="form-control" name="openPublicVote">
															<option value="true"
																<c:if test="${contest.openPublicVote eq true }">selected </c:if>>登录投票</option>
															<option value="false"
																<c:if test="${contest.openPublicVote eq false }">selected </c:if>>公开投票</option>
														</select>
													</div>
												</div> --%>


											</div>


											<div class="col-sm-12">


												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">发布公告</label>
													<div class="col-sm-10">

														<select class="form-control" name="announcements">
															<option value="false"
																<c:if test="${contest.announcements eq false }">selected </c:if>>不发布</option>
															<option value="true"
																<c:if test="${contest.announcements eq true }">selected </c:if>>发布</option>

														</select>


													</div>
												</div>
												<div class="form-group col-sm-6">
													<label class="col-sm-2 control-label">状态</label>
													<div class="col-sm-10">

														<select class="form-control" name="status">
															<option value="true"
																<c:if test="${contest.status eq true }">selected </c:if>>启用</option>
															<option value="false"
																<c:if test="${contest.status eq false }">selected </c:if>>禁用</option>
														</select>


													</div>
												</div>


												 <div class="form-group col-sm-12">
													<label class="col-sm-1 control-label">投票规则</label>
													<div class="col-sm-11">
														<textarea rows="5" 
															style="resize: none; overflow: scroll;"
															placeholder="投票规则" name="intro" id="intro"
															class="form-control">${contest.intro }</textarea>
													</div>
												</div>
												
												
											</div>


											<div class="form-group col-sm-12" style="margin-bottom: 10%;">
												<textarea name="content" id="content" style="display: none;"></textarea>
												<input type="hidden" id="edit-id" /> <label
													class="col-sm-1 control-label">比赛公告</label>
												<div class="col-sm-11">
													<div class="summernote">${contest.content }</div>
												</div>
											</div>

											<input type="hidden" name="editid" value="${contest.id }">



											<div class="col-sm-12" style="padding-top: 20px;">

												<button type="submit" class="btn btn-primary btn-lg"
													style="float: right;" id="add-news-btn">保存</button>
											</div>







											<div class="form-group col-sm-12">
												<div class="text-right"></div>
											</div>
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>



			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>

	<!-- 删除弹出层提示 -->
	<div class="modal inmodal fade" id="deleteModal6" tabindex="-1"
		role="dialog" aria-hidden="true" style="padding: 15%">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<span style="float: left; color: red; font-size: 18px;">删除提示</span>
				</div>
				<div class="modal-body">
					<h3>您确认是否要删除此记录吗?</h3>
				</div>
				<input type="hidden" id="delete-id">
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="button" onclick="deleteById();"
						class="btn btn-primary delete-confirm-btn">确认</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		var deleteId;
		//删除提示窗口
		function deleteAlert(id) {
			$('#deleteModal6').modal('show');
			deleteId = id;

		}
		//删除记录
		function deleteById() {
			window.location.href = "delete?id=" + deleteId;
		}
	</script>

	<script
		src="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/js/fileinput.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/bootstrap-fileinput/js/fileinput_locale_zh.js"
		type="text/javascript"></script>





	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
		$('.datainput').datetimepicker({
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 0,
			forceParse : 0,
		});
	</script>




</body>
</html>
