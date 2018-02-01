<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>比赛管理</title>

  
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
                                    <h5>参赛管理
                                    </h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        
                                    </div>
                                </div>
                                <div class="ibox-content">
                                      <p>
                                    		<a href="${pageContext.request.contextPath}/contest/listContest" class="btn btn-primary " type="button"><i class="fa fa-mail-reply"  >
                                    		</i>&nbsp;返回</a>
                           			 </p>

                            <p>
                             <table class="table table-striped table-bordered table-hover dataTables-example">
                                <thead>
                                    <tr>
                                    	<th>主题</th>
                                    	<th>作者</th>
                                    	<th>所属单位</th>
                                    	<th>电话</th>
                                    	<th>邮箱地址</th>
                                    	<th>创建时间</th>
                                    	<th>上传图片数量</th>
                                    	<th>当前票数</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                               <c:forEach items="${pageList}" var="item" varStatus="status">
                                    <tr class="gradeX"  ondblclick="return findImgs('${item.id}');" >
                                    	<td>${item.theme}</td>
                                        <td>${item.users.name}</td>
                                        <td>${item.users.school}</td>
                                        <td>${item.users.phone}</td>
                                        <td>${item.users.email}</td>
                                        <td>${item.createDate}</td>
                                        <td>${fn:length(item.listContestImages)}</td>
                                        <td>${item.poll}</td>
                                        <td class="center">
                                     	  <button  onclick="return findUploadsImgs('${item.id}')" type="button" class="btn btn-primary btn-xs edit-news" data-id="1">查看投稿图片</button>
                                            
                                            <button type="button" class="btn  btn-warning btn-xs delete-news" data-id="1"
                                             onclick="deleteAlert('${item.id}','${item.contestId }')">删除</button>
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
    

 <script type="text/javascript">
 	
 	var deleteId;
 	var contestId;
 	//删除提示窗口
 	function deleteAlert(id,o2) {
 		 $('#deleteModal6').modal('show');
 		deleteId=id;
 		contestId = o2;
 		
 		
 	}
 	//删除记录
 	function deleteById() {
 		window.location.href = "deleteUsersUploads?id="+deleteId+"&contestId="+contestId;
 	}
 	
 	function findUploadsImgs(o){
 		
 		window.location.href = "findImages?id="+o;
 		
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
