<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>企业单位</title>


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
<body>
	<div id="wrapper">
		<!-- .aside left menu -->
		<%@include file="../../public/left.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="../../public/top.jsp"%>
			<div class="wrapper wrapper-content">
				<div class="row">
					<!-- 内容 -->
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>企业单位管理</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a>

								</div>
							</div>





							<div class="ibox-content">
								<div class="row">
						<div class="clients-list">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#tab-1"
											id="a"><i class="fa fa-user"></i>操作日志</a></li>
										<li class=""><a data-toggle="tab" href="#tab-2" id="b"><i
												class="fa fa-briefcase"></i>异常监控</a></li>
									</ul>
									<div class="tab-content">
										<div id="tab-1" class="tab-pane active">
											<!-- <div class="full-height-scroll">
												<div class="table-responsive"> -->

													<table
														class="table table-striped table-bordered table-hover "
														id="editable">
														<thead>
															<tr>
																<th>操作</th>
																<th>操作人</th>
																<th>操作时间</th>
																<th>请求ip</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach items="${pageList0.datas}" var="items"
																varStatus="status">
																<c:if test="${items.type == '0' }">
																	<tr class="gradeC">
																		<td>${items.description}</td>
																		<td>${items.adminUser.name}</td>
																		<td><fmt:formatDate value="${items.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
																		<td>${items.requestIp}</td>
																	</tr>
																</c:if>


															</c:forEach>
														</tbody>

													</table>

													<div class="widget-foot">
														<div class="row">
															<div class="col-sm-5 hidden-xs">
																<small class="text-muted inline m-t-sm m-b-sm">
																	每页显示${pageList0.pageSize}行 － 当前页${pageList0.pageNo}页 －
																	共${pageList0.totalPage}页 </small>

															</div>

															<ul class="pagination pagination-split"  style="margin-top: 0px;">
																<li <c:if test="${pageList.pageNo  eq 1}">class="disabled"</c:if>><a
															<c:if test="${pageList.pageNo  eq 1 }">href="javascript:void(0)"</c:if>
																	href="${pageContext.request.contextPath}/log/list?type=0&pageNo1=${pageList0.upPage}&pageNo1=${pageno1}">
																		上一页 </a></li>
																<c:forEach items="${pageList0.navigatepageNums}"
																	var="nav">
																	<c:choose>
																		<c:when test="${nav == pageList0.pageNo}">
																			<!-- 1当前页面 -->
																			<li class="active"><a
																				style="border-color: #eaeef1; background-color: #e8eff0;"
																				href="${pageContext.request.contextPath}/log/list?type=0&pageNo1=${pageno1}">${nav}</a>
																			</li>
																		</c:when>
																		<c:otherwise>
																			<li><a
																				href="${pageContext.request.contextPath}/log/list?pageNo0=${nav}&type=0&pageNo1=${pageno1}">${nav}</a></li>
																		</c:otherwise>
																	</c:choose>

																</c:forEach>
																<li><a
																	href="${pageContext.request.contextPath}/log/list?pageNo0=${pageList0.nextPage}&type=0&pageNo1=${pageno1}">
																		下一页 </a></li>
															</ul>

															<div class="clearfix"></div>

											<!-- 			</div>

													</div> -->

												</div>
											</div>
										</div>
										<div id="tab-2" class="tab-pane">
											<!-- <div class="full-height-scroll">
												<div class="table-responsive "> -->

													<table
														class="table table-striped table-bordered table-hover "
														id="editable">
														<thead>
															<tr>
																<th>操作</th>
																<th>操作人</th>
																<th>操作时间</th>
																<th>异常代码</th>
																<th>请求ip</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach items="${pageList1.datas}" var="items"
																varStatus="status">
																<c:if test="${items.type == '1' }">
																	<tr class="gradeC">
																		<td>${items.description}</td>
																		<td>${items.adminUser.name}</td>
																	<td><fmt:formatDate value="${items.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
																		<td>${items.exceptionCode}</td>
																		<td>${items.requestIp}</td>
																	</tr>
																</c:if>


															</c:forEach>
														</tbody>

													</table>

													<div class="widget-foot">
														<div class="row">
															<div class="col-sm-5 hidden-xs">
																<small class="text-muted inline m-t-sm m-b-sm">
																	每页显示${pageList1.pageSize}行 － 当前页${pageList1.pageNo}页 －
																	共${pageList1.totalPage}页 </small>

															</div>

															<ul class="pagination pagination-split" style="margin-top: 0px;">
															<li <c:if test="${pageList.pageNo  eq 1}">class="disabled"</c:if>><a
															<c:if test="${pageList.pageNo  eq 1 }">href="javascript:void(0)"</c:if>
																	href="${pageContext.request.contextPath}/log/list?type=1&pageNo1=${pageList1.upPage}&pageNo0=${pageno0}">
																		上一页 </a></li>
																<c:forEach items="${pageList1.navigatepageNums}"
																	var="nav">
																	<c:choose>
																		<c:when test="${nav == pageList1.pageNo}">
																			<!-- 1当前页面 -->
																			<li class="active"><a
																				href="${pageContext.request.contextPath}/log/list?type=1&pageNo0=${pageno0}">${nav}</a>
																			</li>
																		</c:when>
																		<c:otherwise>
																			<li><a
																				href="${pageContext.request.contextPath}/log/list?pageNo1=${nav}&type=1&pageNo0=${pageno0}">${nav}</a></li>
																		</c:otherwise>
																	</c:choose>

																</c:forEach>
																<li><a
																	href="${pageContext.request.contextPath}/log/list?pageNo1=${pageList1.nextPage}&type=1&pageNo0=${pageno0}">
																		下一页 </a></li>
															</ul>

															<div class="clearfix"></div>

												<!-- 		</div>

													</div> -->
												</div>
											</div>
										</div>
									</div>

								</div>

						</div>
								
							</div>
						</div>
					</div>


				</div>
			</div>
			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>


</body>
</html>
