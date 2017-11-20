<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>角色管理</title>
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>
	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/jsTree/style.min.css" rel="stylesheet">

   <link href="${pageContext.request.contextPath}/assets/admin/css/style.css?v=2.2.0" rel="stylesheet">
<body>
    <div id="wrapper">
     <!-- .aside left menu -->
	<%@include file="../../public/left.jsp" %>
        <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- .aside top jsp -->
           <%@include file="../../public/top.jsp" %>
            <div class="wrapper wrapper-content">
                <div class="row">
                 <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                      <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">
                          <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                          <h4 class="modal-title">${ar.name}-权限模块</h4>
                      </div>
                            
                    <form action="updateRole" method="post">
                    
                    <input name="id" type="hidden" value="${ar.id}" />
                    
                  <div class="modal-body">
                    <!-- 权限菜单加载 -->
                     <div id="jstree1">
                <ul>
                    <li class="jstree-open" >
                    <span onclick="updateSuper()">
                    	菜单管理
                    </span>
                    <ul>
                  <c:forEach items="${listar}" var="item" varStatus="status">
                      	 <!-- 一级菜单，根目录   updateFormValue(id,name,type,icon,url,orderby,remark,pid)-->
                      	<c:if test="${item.adminMenu.pid == '0'}">
                      		<li class="jstree-open" >
                      		<span onclick="updateCheck('${item.adminMenu.id}');" >
	                      		<c:choose>
	                      			<c:when test="${item.check == 'check'}">
	                      				<input id="${item.adminMenu.id}" checked="checked" name="check_box" type="checkbox" value="${item.adminMenu.id}">
	                      			</c:when>
	                      			<c:otherwise>
	                      				<input id="${item.adminMenu.id}" name="check_box" type="checkbox" value="${item.adminMenu.id}">
	                      			</c:otherwise>
	                      		</c:choose>   ${item.adminMenu.name}
                      		</span>
                      			<!-- 二级菜单，根目录 -->
	                      		<c:if test="${item.adminMenu.type == 'HaveMenu'}">
		                      		<ul>
		                      			<c:forEach items="${listar}" var="subitem" varStatus="status">
		                      				<c:if test="${subitem.adminMenu.pid == item.adminMenu.id}">
		                      					<li data-jstree='{"type":"css"}'>
		                      						<span onclick="updateCheck('${subitem.adminMenu.id}');">
		                      						
		                      							<c:choose>
							                      			<c:when test="${subitem.check == 'check'}">
							                      				<input  id="${subitem.adminMenu.id}" checked="checked" name="check_box" type="checkbox" value="${subitem.adminMenu.id}">
							                      			</c:when>
							                      			<c:otherwise>
							                      				<input  id="${subitem.adminMenu.id}" name="check_box" type="checkbox" value="${subitem.adminMenu.id}">
							                      			</c:otherwise>
							                      		</c:choose>   
		                      						
		                      							
		                      							${subitem.adminMenu.name}
		                      						</span>
		                      						
		                      						<c:if test="${item.adminMenu.type == 'HaveMenu'}">
		                      							<ul>
		                      								<c:forEach items="${listar}" var="subitem_end" varStatus="status">
		                      									<c:if test="${subitem_end.adminMenu.pid == subitem.adminMenu.id}">
		                      										<li data-jstree='{"type":"css"}' >
		                      										<span onclick="updateCheck('${subitem_end.adminMenu.id}');" >
		                      										
		                      											<c:choose>
											                      			<c:when test="${subitem_end.check == 'check'}">
																				<input   id="${subitem_end.adminMenu.id}" checked="checked" name="check_box" type="checkbox" value="${subitem_end.adminMenu.id}">
																			</c:when>
											                      			<c:otherwise>
											                      				<input   id="${subitem_end.adminMenu.id}"  name="check_box" type="checkbox" value="${subitem_end.adminMenu.id}">											      
											                      			</c:otherwise>
											                      		</c:choose>  
		                      										
		                      											${subitem_end.adminMenu.name}
		                      										</span>
		                      									</c:if>
		                      								</c:forEach>
		                      							</ul>
		                      						</c:if>
		                      					</li>
		                      				</c:if>
		                      			</c:forEach>
		                      		</ul>
	                      		</c:if>
                      		</li>
                      	</c:if>
                      </c:forEach>
                      </ul>
                      </li>
                      </ul>
                      </div>
				</div>

                <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" id="btn-add-news-push">保存</button>
                </div>
                
                </form>
           </div>
       </div>
                          

                  
                </div>
            </div>
            <%@include file="../../public/botton.jsp" %>
        </div>
    </div>
    
<script type="text/javascript">
//更新内容传值
function updateCheck(id){
// 	alert($("#"+id).is(":checked"));
	
	  if ($("#"+id).is(":checked")) {
		  $("#"+id).prop("checked", false);
      } else {
    	  $("#"+id).prop("checked", true);
      }
	
// 	 $("#"+id).prop("checked", false);
	 console.log("加载："+id+"状态："+$("#"+id).is(":checked"));
}


//树形菜单
$(document).ready(function () {

    $('#jstree1').jstree({
       
    });

});
</script>

</body>
</html>
