<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>用户管理</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo_title.png" 
   type="image/x-icon" />
</head>
<script
	src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>

<script type="text/javascript">
	var checkForms = false;
	function check() {
		$
				.ajax({
					type : "POST",
					url : "ajaxCheckName",
					data : "name=" + $("#username").val(),
					dataType : "text",
					success : function(msg) {
						if (msg == "true") {
							document.getElementById('usernamealter').innerHTML = "此用户名已经存在";
							document.getElementById('usernamealter').style.cssText = "float: right; color: red;";
							checkForms=false;
						} else {
							checkForms = true;
							document.getElementById('usernamealter').innerHTML = "用户名可用";
							document.getElementById('usernamealter').style.cssText = "float: right; color: #11AB5A;";
						}
					}
				});
	}
	//验证表单
	function checkForm() {
		if ($("#updatename").val() == $("#username").val()) {
			checkForms=true;
		}
		
		if (checkForms == false)
			return false;
		else
			return true;
	}
</script>
<body>


	<section class="vbox">
		<!-- .top-->
		<%@include file="../../public/top.jsp"%>
		<section>
			<section class="hbox stretch">
				<!-- .aside left menu -->
				<%@include file="../../public/left.jsp"%>
				<!-- /.aside -->
				<!-- /.aside -->
				<section id="content">
					<section class="vbox">
						<section class="scrollable padder">
							<div class="m-b-md">
								<h3 class="m-b-none">用户个人信息</h3>
							</div>
							<div class="row">

								<div class="col-sm-6" style="width: 100%;">
									<form onsubmit="return checkForm();" data-validate="parsley"
										action="createOrUpdateToFind" method="post">
										<section class="panel panel-default">
											<header class="panel-heading">
												<span class="h4"> <c:choose>
														<c:when test="${not empty user}">
															<input name="id" value="${user.id}" type="hidden"
																class="form-control">
															<input id="updatename" value="${user.username}"
																type="hidden">
																
                        	修改操作
                        	                        	</c:when>
														<c:otherwise>
                        	添加操作
                        	</c:otherwise>
													</c:choose>

												</span>
											</header>
											<div class="panel-body">
												<p class="text-muted"></p>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label> <span style="float: left;"> 用户名</span>
														</label> <span id="usernamealter"
															style="float: right; color: red;">*</span> <input
															name="username" onblur="check();" id="username" data-rangelength="[3,20]"
															placeholder="用户名" value="${user.username}" type="text"
															class="form-control"  data-required="true">
													</div>
													<div class="col-sm-6">
														<label>角色</label> 
														<select name="role"
															class="form-control m-b" data-required="true">
															<c:forEach items="${roleList}" var="items"
																varStatus="status">
																<c:if test="${user.role == items.id}">
																	<option value="${items.id}">${items.roleName}</option>
																</c:if>
															</c:forEach>
															
															<c:forEach items="${roleList}" var="items"
																varStatus="status">
																<c:if test="${user.role!= items.id}">
																	<option value="${items.id}">${items.roleName}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>密码</label> <input value="${user.password}"
															name="password" placeholder="6位以上的密码" type="password"
															data-rangelength="[6,20]" class="form-control"
															placeholder="data-rangelength = [5,20]"
															data-required="true" id="pwd">
													</div>
													<div class="col-sm-6">
														<label>确认密码</label> <input placeholder="确认密码"
															value="${user.password}" type="password"
															data-rangelength="[6,20]" class="form-control"
															placeholder="data-rangelength = [5,20]"
															data-equalto="#pwd" data-required="true">
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-2 control-label">头像</label> <input
														name="headImage" type="file" class="filestyle" placeholder="选择文件"
														data-classButton="btn btn-default"
														data-classInput="form-control inline v-middle input-s">
												</div>

												<div class="form-group">
													<label>备注</label>
													<textarea name="remark"
														class="form-control parsley-validated" rows="6">${user.remark}</textarea>
												</div>
												<input id="schoolid" name ="schoolid" value="${sessionScope.SSchool.id}" type="hidden">
											</div>
											</div>
											<footer class="panel-footer text-right bg-light lter">
												<button type="submit" class="btn btn-success btn-s-xs">提交</button>
											</footer>
										</section>
									</form>
								</div>
							</div>

						</section>
					</section>
				</section>
			</section>
		</section>
	</section>
</body>
</html>
