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
<script
	src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>


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
								<h5>角色管理</h5>
							</div>
							<div class="ibox-content">
								<form role="form" id="form" action="createOrUpdateToFind" method="post" class="form-horizontal">
										 <div class="row">
				                        	<div class="form-group">
					                            <label class="col-sm-2 control-label">角色名称</label>
					                            <div class="col-sm-10">
					                                <input type="text" id="name"  value="${bean.name}" 
					                                name="name" class="form-control" placeholder="角色名称" required >
					                            </div>
				                      	</div>
				                      </div>
				                      <div class="row">
				                      		 <div class="form-group">
				                            <label class="col-sm-2 control-label">角色备注</label>
				                            <div class="col-sm-10">
				                            	<textarea id="reamrk" name="reamrk" data-rangelength="[2,100]" 
				                            	placeholder="备注" class="form-control parsley-validated" rows="6">${bean.reamrk}</textarea>
				                            </div>
				                        </div>
				                      </div>
				                      
									<!-- 隐常ID,更新时使用 -->
									<c:if test="${not empty bean.id}">
									<input id="id" name="id" type="hidden" value="${bean.id }">
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
 <!-- Jquery Validate -->
  	<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
   	<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>

    <script>
        $(document).ready(function () {

            $("#form").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2,
                        maxlength: 15
                    }
            
                }
            });
        });
    </script>
</body>
</html>
