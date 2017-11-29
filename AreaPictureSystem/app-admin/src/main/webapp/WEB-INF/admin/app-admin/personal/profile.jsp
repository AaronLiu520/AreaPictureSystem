<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>编缉个人资料</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/logo_title.png"
	type="image/x-icon" />
</head>
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
								<h5>个人资料修改</h5>
							</div>
							<div class="ibox-content">
								<form role="form" id="form" action="update"
									method="post" class="form-horizontal">
							      
							      <!-- 隐藏传递值 -->
							      <input  type="hidden" id="password" value="${sessionScope.userSession.password}"
														name="password" class="form-control" placeholder="" >		
								  
								  <input  type="hidden" id="companyId" value="${sessionScope.userSession.adminCompany.id}"
														name="companyId" class="form-control" placeholder="" >
								  
								 
								  <input  type="hidden" id="roleId" value="${sessionScope.userSession.adminRole.id}"
														name="roleId" class="form-control" placeholder="" >
								<!-- 
								  <input  type="hidden" id="listFavorites" value="${sessionScope.userSession.listFavorites}"
														name="listFavorites" class="form-control" placeholder="" >
									
									 -->
									
									
									<div class="row">
										<div class="col-sm-6">
												<label class="col-sm-4 control-label">姓 名</label>
												<div class="col-sm-8">
													<input type="text" id="name" value="${sessionScope.userSession.name}"
														name="name" class="form-control" placeholder="" >
												</div>
										</div>
										<div class="col-sm-6">
												<label class="col-sm-4 control-label">用户名</label>
												<div class="col-sm-8">
													<input type="text" id="userName" value="${sessionScope.userSession.userName}"
														name="userName" class="form-control" placeholder=""
														readonly="readonly">
												</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									
									
									<div class="row">
										<div class="col-sm-6">
												<label class="col-sm-4 control-label">性 别</label>
												<div class="col-sm-8">
													<input type="text" id="sex" value="${sessionScope.userSession.sex}" name="sex"
														class="form-control" placeholder="">
												</div>
										</div>
										<div class="col-sm-6">
												<label class="col-sm-4 control-label">地 址</label>
												<div class="col-sm-8">
													<input type="text" id="address" value="${sessionScope.userSession.address}"
														name="address" class="form-control" placeholder=""
														>
												</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="row">
										<div class="col-sm-6">
												<label class="col-sm-4 control-label">联系电话</label>
												<div class="col-sm-8">
													<input type="text" id="tel" value="${sessionScope.userSession.tel}" name="tel"
														class="form-control" placeholder="">
												</div>
										</div>
										<div class="col-sm-6">
												<label class="col-sm-4 control-label">个人空间大小</label>
												<div class="col-sm-8">
													<input type="text" id="spaceSize" value="${sessionScope.userSession.spaceSize}"
														name="spaceSize" class="form-control" placeholder=""
														readonly="readonly">
											</div>
										</div>
									</div>

									<div class="hr-line-dashed"></div>
									<div class="row">
										<div class="col-sm-6">
											<label class="col-sm-4 control-label">用户类型</label>
											<div class="col-sm-8">
												<input type="userType" id="userType" value="${sessionScope.userSession.userType}"
													   name="userType" class="form-control" placeholder=""
													  readonly="readonly">
											</div>
											</div>
										</div>
                                     <div class="hr-line-dashed"></div>
										<div class="row">
										<div class="col-sm-6">
											<label class="col-sm-4 control-label">邮箱</label>
											<div class="col-sm-8">
												<input type="email" id="email" value="${sessionScope.userSession.email}"
													   name="email" class="form-control" placeholder=""
													   required>
											</div>
										</div>
										</div>
									
									<div class="hr-line-dashed"></div>
									<div class="row">
										<div class="col-sm-6">
											<label class="col-sm-4 control-label">所属单位</label>
											<div class="col-sm-8">
												<input type="company" id="company" value="${sessionScope.userSession.adminCompany.name}"
													   name="company" class="form-control" placeholder=""
													  readonly="readonly">
											</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="row">
										<div class="form-group">
											<label class="col-sm-2 control-label">角色备注</label>
											<div class="col-sm-10">
												<textarea id="reamrk" name="reamrk"
													data-rangelength="[2,100]" placeholder="备注"
													class="form-control parsley-validated" rows="6">${sessionScope.userSession.reamrk}</textarea>
											</div>
										</div>
									</div>

									<!-- 隐常ID,更新时使用 -->
									<c:if test="${not empty sessionScope.userSession.id}">
										<input id="id" name="id" type="hidden" value="${sessionScope.userSession.id}">
										<script type="text/javascript">
                                            //禁用，用户名。
                                            $("#userName").attr("readOnly",true);
                                            //权限
                                            $("#roleId").find("option[value='${bean.adminRole.id}']").attr("selected", "selected");
                                            //用户类型
                                            $("#userType").find("option[value='${bean.userType}']").attr("selected", "selected");
                                            //公司
                                            $("#companyId").find("option[value='${bean.adminCompany.id}']").attr("selected", "selected");
										</script>
									</c:if>

									<div class="modal-footer">
										<button type="submit" id="save-btn-news"
											class="btn btn-primary">保存</button>
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
			<%@include file="../../public/botton.jsp"%>
		</div>
	</div>


	<!-- Jquery Validate -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>

	<script>
        $(document).ready(function () {

            $("#form").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2,
                        maxlength: 15
                    },
                    passwords: {
                        required: true,
                        minlength: 6,
                        maxlength: 15,
                        equalTo:"#password"
                    },
                    username: {
                        required: true,
                        minlength: 6,
                        maxlength: 15
                    },
                    tel: {
                        required: true,
                        minlength: 11,
                        maxlength: 11,
                        number: true
                    }
            
                }
            });
        });
    </script>
</body>
</html>