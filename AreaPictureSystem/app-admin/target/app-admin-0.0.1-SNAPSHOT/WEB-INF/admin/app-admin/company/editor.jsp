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
	
	<!-- 上传控件 -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/dropzone.css" rel="stylesheet">
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
								<h5>企业单位管理</h5>
							</div>
	
							<div class="ibox-content">
								<form  role="form" id="form" action="${pageContext.request.contextPath}/${sessionScope.projectAddress}/adminCompany/createOrUpdateToFind" 
								method="post" class="form-horizontal" enctype="multipart/form-data">
										<div class="row">
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">名称</label>
												<div class="col-sm-8">
													  <input value="${bean.name}" id="name" name="name" type="text" 
													  	placeholder="请输入名称" class="form-control" required>
                                       			 </div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">简称</label>
												<div class="col-sm-8">
													 <input value="${bean.shorts}" name="shorts" type="text" placeholder="简称" class="form-control">
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">地址</label>
												<div class="col-sm-8">
													 <input value="${bean.address}" id="address" name="address" type="text" 
													 placeholder="请输入地址" class="form-control" required>
												</div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">联系人</label>
												<div class="col-sm-8">
													<input  value="${bean.contacts}" type="text" name="contacts" placeholder="请输入联系人" class="form-control" required>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">电话</label>
												<div class="col-sm-8">
													 <input value="${bean.telPhone}" id="telPhone" name="telPhone" type="text" 
													 placeholder="请输入 电话" class="form-control" required>
                                            		
												</div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">email</label>
												<div class="col-sm-8">
													<input  value="${bean.email}" type="email" name="email" 
													placeholder="请输入邮箱" class="form-control" required>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											
											<div class="form-group col-sm-6">
											 <label class="col-sm-4 control-label">企业角色</label>

	                                        <div class="col-sm-8">
	                                            <select class="form-control" name="adminRoleId" id="adminRoleId">
	                                            <c:forEach items="${role}" var="item" varStatus="status">
	                                                <option id="${item.id}" value="${item.id}">${item.name}</option>
	                                             </c:forEach>
	                                            </select>
												</div>
											</div>
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">用户名</label>
												<div class="col-sm-8">
													<input  value="${bean.userName}" type="text"  name="userName"
													id="userName" placeholder="请输入用户名" class="form-control" required>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">密码</label>
												<div class="col-sm-8">
													 <input value="${bean.password}" name="password" type="text" 
													 placeholder="密码" class="form-control" required>
												</div>
											</div>
											
											<div class="form-group col-sm-6">
												<label class="col-sm-4 control-label">重复密码</label>
												<div class="col-sm-8">
													 <input value="${bean.password}" id="pwd" type="text" 
													 placeholder="密码" class="form-control" required>
												</div>
											</div>
										</div>
										
									<!-- 隐常ID,更新时使用 -->
									<c:if test="${not empty bean.id}">
										<!-- 验证是修改、还是添加 -->
										<input  name="id" type="hidden" value="${bean.id}">
										<input  name="adminAreaId" type="hidden" value="${bean.id}">
										<script type="text/javascript">
										//禁用，用户名。
										$("#userName").attr("readOnly",true);
										//角色
										 $("#adminRoleId").find("option[value='${bean.adminRole.id}']").attr("selected", "selected");
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

<!-- 上传图片控件 -->
    <div id="modal-form" class="modal fade" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                       <div class="ibox-content">
                            <form  id="my-awesome-dropzone" class="dropzone" action="uploadFile">
                                <div class="dropzone-previews"></div>
                                
                                <button  type="submit" class="btn btn-primary pull-right">上传文件</button>
                            </form>
                            <div>
                                <div class="m">您可以在此，上传多张图片，建意：1-5张照片</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


	


    <!-- Jquery Validate -->
  	<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
   	<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>
 <!-- DROPZONE -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dropzone/dropzone.js"></script>


      <script>
    
        $(document).ready(function () {

            Dropzone.options.myAwesomeDropzone = {

                autoProcessQueue: false,
                uploadMultiple: true,
                parallelUploads: 100,
                maxFiles: 100,
                // Dropzone settings
                init: function () {
                    var myDropzone = this;
                    this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                    	
                        e.preventDefault();
                        e.stopPropagation();
                        myDropzone.processQueue();
                    });
                    this.on("sendingmultiple", function () {
                    });
                    this.on("successmultiple", function (files, response) {
                    	document.getElementById("imgid").innerHTML=response;  
                    });
                    this.on("errormultiple", function (files, response) {
                    	
                    });
                }

            }

        });
    </script>
    <script>
        $(document).ready(function () {

            $("#form").validate({
                rules: {
                    password: {
                        required: true,
                        minlength: 6,
                        maxlength: 15,
                        equalTo:"#pwd"
                    },
                    username: {
                        required: true,
                        minlength: 6,
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
