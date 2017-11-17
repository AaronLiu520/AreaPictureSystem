<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>编缉信息</title>

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
								<h5>菜单管理</h5>
							</div>

							<div class="ibox-content">
								<form  role="form" id="form" action="createOrUpdateToFind" method="post" class="form-horizontal">
										<div class="row">
											
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">名称</label>
												<div class="col-sm-8">
													  <input value="${bean.name}" id="name" name="name" type="text" placeholder="请输入名称" class="form-control" required>
                                       			 </div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">描述</label>
												<div class="col-sm-8">
													 <input value="${bean.remark}" name="remark" type="text" placeholder="描述
													 " class="form-control">
												</div>
											</div>
										</div>
										
										<div class="row">
											
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">用户名</label>
												<div class="col-sm-8">
													 <input value="${bean.username}" id="username" name="username" type="text" placeholder="请输入 用户名" class="form-control" required>
                                            		
												</div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">密码</label>
												<div class="col-sm-8">
													<input  value="${bean.password}" type="password" name="password" placeholder="请输入密码" class="form-control" required>
												</div>
											</div>
										</div>
										
										
										<div class="row">
											
											<div class="form-group col-sm-6">
											 <label class="col-sm-4 control-label">权限角色</label>

	                                        <div class="col-sm-8">
	                                            <select class="form-control m-b" name="temp_ar" id="temp_ar">
	                                            <c:forEach items="${role}" var="item" varStatus="status">
	                                                <option id="${item.id}" value="${item.id}">${item.name}</option>
	                                             </c:forEach>
	                                            </select>
<!-- 												<label class="col-sm-4 control-label"></label> -->
<!-- 												<div class="col-sm-8"> -->
<%-- 													 <input value="${bean.adminRole}" id="adminRole" name="adminRole" type="text" placeholder="请输入 用户名" --%>
<!-- 													  class="form-control" required> -->
                                            		
<!-- 												</div> -->
												</div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">确认密码</label>
												<div class="col-sm-8">
													<input  value="${bean.password}" type="password" id="pws" placeholder="请输入密码" class="form-control" required>
												</div>
											</div>
										</div>
										
										
										<div class="row">
											
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">联系人</label>
												<div class="col-sm-8">
													 <input value="${bean.contacts}" name="contacts" type="text" placeholder="联系人、负则人" class="form-control" required>
												</div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">联系手机</label>
												<div class="col-sm-8">
													<input value="${bean.tel}" name="tel" type="tel" placeholder="联系电话" class="form-control" required>
												</div>
											</div>
										</div>
										
									
										
									<!-- 隐常ID,更新时使用 -->
									
									<c:if test="${not empty bean.id}">
										<input  name="id" type="hidden" value="${bean.id}">
										<input value="${bean.weChatId}" name="weChatId" type="hidden" >
<%-- 										<input value="${bean.adminRole}" name="adminRole" type="hidden" > --%>
										<script type="text/javascript">
										//禁用，用户名。
										$("#username").attr("readOnly",true);
										//角色
										 $("#temp_ar").find("option[value='${bean.adminRole.id}']").attr("selected", "selected");
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
				<%@include file="../../public/botton.jsp" %>
			</div>
	</div>

	


    <!-- Jquery Validate -->
  	<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
   	<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>

    <script>
        $(document).ready(function () {

            $("#form").validate({
                rules: {
                    password: {
                        required: true,
                        minlength: 4,
                        maxlength: 15,
                        equalTo:"#pws"
                    },
                    username: {
                        required: true,
                        minlength: 4,
                        maxlength: 15
                    },
                    contacts: {
                        required: true,
                        minlength: 2
                    },
                    tel: {
                    	 required: true,
                         number: true
                    }
                }
            });
        });
    </script>
</body>
</html>
