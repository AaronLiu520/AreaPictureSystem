<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>授权密钥</title>

  
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
                                    <h5>授权密钥
                                    <c:if test="${not empty param.error}">
                                    	<span style="color:red;padding-left: 100px;">友情提示：操作失败</span>
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
                                    <!-- 添加区域帐号 onclick="addFormValue();"-->
                                    	<button  onclick="addFormValue();" class="btn btn-primary " type="button"
                                    	data-toggle="modal" data-target="#myModal5"
                                    	><i class="fa fa-plus" 
                                        ></i>&nbsp;添加</button>

                            		</p>
                             <table class="table table-striped table-bordered table-hover dataTables-example">
                                <thead>
                                    <tr>
                                    	<th>企业名</th>
                                    	<th>密钥号</th>
                                        <th>激活状态</th>
                                        <th>Mac地址</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                               		 <c:forEach items="${pageList}" var="item" varStatus="status">
                                    <tr class="gradeX">
                                    	<td>${item.adminCompany.name}</td>
                                        <td>${item.id}</td>
                                        <td>${item.state}</td>
                                        <td>${item.macAddress}</td>
                                        <td class="center">
                                            <button type="button" class="btn btn-danger btn-xs delete-news" data-id="1"
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
    
    <!-- 弹出层－添加 -->
  <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="panelTitle"> </h4>
                </div>
                 <form id="form" action="createKey"  method="post" class="form-horizontal">
                <div class="modal-body">
                      <div class="row">
                      	<div class="col-lg-12">
	                      	<!-- 给哪个公司创密钥 -->
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label">公司</label>
	                            <div class="col-sm-10">
	                            <select class="form-control" name="adminCompanyId" id="adminCompanyId">
		                             <c:forEach items="${companyList}" var="item" varStatus="status">
		                            	<option value="${item.id}">${item.name}</option>
		                            </c:forEach>
	                            </select>
	                            </div>
	                        </div>
	                        <!-- 创建密钥 数量-->
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label">密钥数量</label>
	                            <div class="col-sm-10">
	                                <input required="" aria-required="true" type="number" 
	                                id="createNumber" name="createNumber" class="form-control" placeholder="密钥数量" value="">
	                            </div>
	                        </div>
	                        
                      	</div>
                      </div>
                </div>
                	<!-- 隐常ID,更新时使用 -->
               	 <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="submit" id="save-btn-news" class="btn btn-primary">保存</button>
                </div>
                </form>
            </div>
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

<!-- 删除 -->
 <script type="text/javascript">
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
 	//添加时－清空值
 	function addFormValue(){
		$("#panelTitle").empty();
		$("#panelTitle").append("创密钥"); 
 	}
 </script>
 
 <!-- 动态数据表格，前台查询 -->
<script>
$(document).ready(function () {
    $('.summernote').summernote({
        lang: 'zh-CN',
        onImageUpload: function(files, editor, $editable) {
          sendFile(files[0], editor, $editable);
        }
    });
    $('.dataTables-example').dataTable();//表格


});
  </script> 

</body>
</html>
