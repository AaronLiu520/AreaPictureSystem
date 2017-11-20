<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>用户管理</title>

  
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>
	
	<!-- 动态表格 -->
	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<body>
    <div id="wrapper">
     <!-- .aside left menu -->
	<%@include file="../../public/left.jsp" %>
        <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- .aside top jsp -->
           <%@include file="../../public/top.jsp" %>
            <div class="wrapper wrapper-content">
                <div class="row">
                    <!-- 内容 -->
                     <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>用户管理
                                    	<c:if test="${not empty param.error}">
                                    		<span style="color:red;padding-left: 100px;">友情提示：您添加的名称、登录帐号信息已经存在</span>
                                    	</c:if>
                                    </h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        
                                    </div>
                                </div>
                                <div class="ibox-content">
                                      <p>
                                        <a href="editor">
                                    		<button  class="btn btn-primary " type="button"><i class="fa fa-plus"  >
                                    		</i>&nbsp;添加</button>
                                    	</a>
                           			 </p>

                            <p>
                             <table class="table table-striped table-bordered table-hover dataTables-example">
                                <thead>
                                    <tr>
                                    	<th>真实姓名</th>
                                        <th>用户名</th>
                                        <th>角色</th>
                                        <th>电话</th>
                                        <th>是否绑定微信</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                               <c:forEach items="${pageList}" var="item" varStatus="status">
                                    <tr class="gradeX">
                                    	<td>${item.name}</td>
                                        <td>${item.username}</td>
                                        <td>
                                        	
										<c:forEach items="${listRole}" var="role" varStatus="status">
	                            			<c:if test="${role.id == item.role}">
	                            				${role.name}
	                            			</c:if>
	                            	</c:forEach>
                                        </td>
                                         <td>${item.tel}
                                         </td>
                                        <td>
                                        <c:choose>
                                        	<c:when test="${not empty item.weChatCode}">
                                        			已绑定
                                        	</c:when>
                                        	<c:otherwise>
                                        			未绑定
                                        	</c:otherwise>
                                        </c:choose>
                                        
                                        </td>
                                        <td class="center">
                                         	<button type="button" class="btn btn-primary btn-xs edit-news" data-id="1"
                                         	 onclick="updateFormValue('${item.id}','${item.username}','${item.password}',
                                         	 '${item.tel}','${item.email}',
                                         	 '${item.headImage}','${item.remark}','${item.name }','${item.card}','${item.role}')">编辑</button>
                                             <button type="button" class="btn  btn-warning btn-xs delete-news" data-id="1"
                                             onclick="deleteAlert('${item.id}')">删除</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                    </div>
                </div>
            </div>
                    
                  
                </div>
            </div>
            <%@include file="../../public/botton.jsp" %>
        </div>
    </div>
    
    <!-- 删除弹出层提示 -->
    <div class="modal inmodal fade" id="deleteModal6" tabindex="-1" role="dialog"  aria-hidden="true" style="padding: 15%">
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
    
 <!-- 弹出层－添加 -->
  <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                     <h4 class="modal-title" id="panelTitle"> </h4>
                </div>
                 <form id="add-news-form" action="${pageContext.request.contextPath}/user/createOrUpdateToFind" 
                 method="post" class="form-horizontal">
                <div class="modal-body">
                      <div class="row">
                      	<div class="col-lg-6">
	                      	 <div class="form-group">
	                            <label class="col-sm-2 control-label">用户名</label>
	                            <div class="col-sm-10">
	                                <input required="" aria-required="true" type="text" id="username" name="username" 
	                                class="form-control" placeholder="用户名" >
	                            </div>
	                        </div>
	                        
                        	<div class="form-group">
	                            <label class="col-sm-2 control-label">密码</label>
	                            <div class="col-sm-10">
	                                <input type="password" id="password" name="password" class="form-control" 
	                                placeholder="密码"  aria-required="true">
	                            </div>
                        	</div>
                        	<div class="form-group">
	                            <label class="col-sm-2 control-label">重密码</label>
	                            <div class="col-sm-10">
	                                <input type="password" id="cof_password" name="cof_password" class="form-control" 
	                                placeholder="确认密码" aria-required="true" >
	                            </div>
                        	</div>
                        	 
                        	<div class="form-group">
	                            <label class="col-sm-2 control-label">手机</label>
	                            <div class="col-sm-10">
	                                <input  aria-required="true" type="tel" id="tel" name="tel" class="form-control" 
	                                placeholder="联系方式" aria-required="">
	                            </div>
                        	</div>
                        	
                      	</div>
                      	<div class="col-lg-6">
                      		 <div class="form-group">
	                            <label class="col-sm-2 control-label">姓名</label>
	                            <div class="col-sm-10">
	                                <input required="" aria-required="true" type="text" id="name" name="name" 
	                                class="form-control" placeholder="填写姓名" >
	                            </div>
                        	</div>
                         	<div class="form-group">
	                            <label class="col-sm-2 control-label">角色</label>
	                            <div class="col-sm-10">
	                            <select class="form-control" name="role" id="role">
	                           		 <c:forEach items="${listRole}" var="role" varStatus="status">
	                            		<option value="${role.id}">${role.name}</option>
	                            	</c:forEach>
	                            </select>
<!-- 	                                <input required="" aria-required="true" type="text" id="role" name="role"  -->
<!-- 	                                class="form-control" placeholder="选择性别" > -->
	                            </div>
                        	</div>
                        	
                        	<div class="form-group">
	                            <label class="col-sm-2 control-label">证件号</label>
	                            <div class="col-sm-10">
	                                <input required="" aria-required="true" type="text" id="card" name="card" class="form-control" 
	                                placeholder="证件号" >
	                            </div>
                        	</div>
                        	
                        	
                        	<div class="form-group">
	                            <label class="col-sm-2 control-label">Email</label>
	                            <div class="col-sm-10">
	                                <input required="" aria-required="true" type="email" id="email" name="email" class="form-control" 
	                                placeholder="证件号" >
	                            </div>
                        	</div>
                      	</div>
                      </div>
                      
                      <div class="row">
	                      <div class="col-lg-12">
	                      		 <div class="form-group">
	                            <label class="col-sm-1 control-label">备注</label>
	                            <div class="col-sm-11">
	                            	<textarea id="remark" name="remark" data-rangelength="[2,100]" placeholder="备注" class="form-control parsley-validated" rows="6"></textarea>
	                            </div>
	                        </div>
	                        </div>
                      </div>
                </div>
                	<!-- 隐常ID,更新时使用 -->
					<input id="id" name="id" type="hidden">
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="submit" id="save-btn-news" class="btn btn-primary">保存</button>
                </div>
                </form>
            </div>
        </div>
    </div>
 <!-- 更新内容是传值 -->
 <script type="text/javascript">
 	//更新内容传值
/*  	 onclick="updateFormValue('${item.id}','${item.username}','${item.password}',
                                         	 '${item.tel}','${item.email}',
                                         	 '${item.headImage}','${item.remark}','${item.name }','${item.card}','${item.role}')">编辑</button> */
 	function updateFormValue(id,username,password,tel,email,headImage,remark,name,card,role){
 		$('#myModal5').modal('show');
 		$("#id").val(id);
		$("#username").val(username);
		$("#password").val(password);
		$("#tel").val(tel);
		$("#email").val(email);
		$("#headImage").val(headImage);
		$("#remark").val(remark);
		//用户名，身份证号
		$("#name").val(name);
		$("#card").val(card);
		$("#cof_password").val(password);
		
		//角色
		 $("#role").find("option[value='"+role+"']").attr("selected", "selected");
		//禁用，用户名。
		$("#username").attr("readOnly",true);
		
		 //var selectText = .val();
       //alert($("#role").val());
		
		
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("更新用户"); 
 	}
 	//添加时－清空值
 	function addFormValue(){
 		$("#id").val('');
		$("#username").val('');
		$("#password").val('');
		$("#tel").val('');
		$("#email").val('');
		$("#headImage").val('');
		$("#remark").val('');
		
		
		
		//用户名，身份证号
		$("#name").val('');
		$("#card").val('');
		$("#cof_password").val('');
		
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("添加用户"); 
 	}
 	
 	
 	var deleteId;
 	//删除提示窗口
 	function deleteAlert(id) {
 		 $('#deleteModal6').modal('show');
 		deleteId=id;
 		
 	}
 	//删除记录
 	function deleteById() {
 		window.location.href = "delete?id="+deleteId;
 	}
 	
 	
 </script>
 
<script>
$(document).ready(function () {
    $('.summernote').summernote({
        lang: 'zh-CN',
        onImageUpload: function(files, editor, $editable) {
          sendFile(files[0], editor, $editable);
        }
    });
    $('.dataTables-example').dataTable();//表格

    // validate the comment form when it is submitted
    $("#add-news-form").validate();//初始化from验证
});
</script>

</body>
</html>
