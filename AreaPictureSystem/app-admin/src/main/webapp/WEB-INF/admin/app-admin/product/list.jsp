<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title></title>

  
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
                    <!-- 内容 -->
                  <div class="row">
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>产品管理 <small style="color: red;">除根目录有效产品</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
          <div class="ibox-content">

             <div id="jstree1">
             <!-- jstree-open 打开树形菜单 -->
                <ul>
                    <li class="jstree-open" >
                    <span onclick="updateSuper()">
                    	产品管理
                    </span>
                    <ul>
                      <c:forEach items="${pageList}" var="item" varStatus="status">
                      	 <!-- 一级菜单，根目录   updateFormValue(id,name,type,icon,url,orderby,remark,pid)-->
                      	<!-- jstree-open 打开树形菜单 -->
                      		<li>
                      		<span onclick="updateFormValue('${item.id}','${item.name}','${item.icon}','${item.manageUrl}','${item.androidUrl}','${item.orderby}','${item.remark}')">
                      		<i class="fa ${item.icon}"></i> ${item.name}</span>
                      		</li>
                      </c:forEach>
                      </ul>

                  </ul>
              </div>

          </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5  style="color: red;" id="panelTitle">产品操作管理</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            
                            <div class="ibox-content" style="text-align: center;display:none;" id="panel">
                            	<div class="row">
                                	<button id="but_add" onclick="coreate();" type="button" class="btn btn-w-m btn-primary">添加产品</button>
                                	<button id="but_update" onclick="update();" type="button" class="btn btn-w-m btn-success">修改产品</button>
                                </div>
                                	<button id="but_del" onclick="deleteAlert();" type="button" class="btn btn-w-m btn-danger">删除产品</button>
                            </div>
                            
                            <div class="ibox-content" id="message" style="display:none;">
                               <form id="add-news-form" action="createOrUpdateToFind" method="post" class="form-horizontal">
											
											<div class="form-group col-sm-12">
												<label class="col-sm-4 control-label">名称</label>
												<div class="col-sm-8">
                                            		<input id="name" name="name" type="text" class="form-control" required="" 
                                            		value="${bean.name}" aria-required="true" aria-invalid="true" aria-describedby="cname-error">
                                       			 </div>
											</div>
											
										
											<div class="form-group col-sm-12">
												<label class="col-sm-4 control-label">管理地址</label>
												<div class="col-sm-8">
													<input id="manageUrl" name="manageUrl" type="text" class="form-control" required="" 
                                            		value="${bean.manageUrl}" aria-required="true" aria-invalid="true" aria-describedby="cname-error">
                                            		
												</div>
											</div>
											
											<div class="form-group col-sm-12">
												<label class="col-sm-4 control-label">展示地址</label>
												<div class="col-sm-8">
													<input id="androidUrl" name="androidUrl" type="text" class="form-control" required="" 
                                            		value="${bean.androidUrl}" aria-required="true" aria-invalid="true" aria-describedby="cname-error">
                                            		
												</div>
											</div>
											
											<div class="form-group col-sm-12">
												<label class="col-sm-4 control-label">图标</label>
												<div class="col-sm-8">
													<input type="text" id="icon" name="icon" value="${bean.icon}"
														class="form-control" placeholder="图标inc小图标">
												</div>
											</div>
										
											
											<div class="form-group col-sm-12">
												<label class="col-sm-4 control-label">排序</label>
												<div class="col-sm-8">
													<input id="orderby" name="orderby" type="number" class="form-control" required="" 
                                            		value="${bean.orderby}"aria-required="true" aria-invalid="true" aria-describedby="cname-error">
												</div>
											</div>
											<div class="form-group col-sm-12">
												<label class="col-sm-4 control-label">描述</label>
												<div class="col-sm-8">
													<input type="text" id="remark" name="remark" value="${bean.remark}"
														class="form-control" placeholder="备注">
												</div>
											</div>
									

										<input type="hidden" id="id" name="id">
									
									
									<div class="modal-footer">
										<button type="submit" id="save-btn-news" class="btn btn-primary">修改保存</button>
									</div>
								</form>
                            </div>
                            
                            
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
    


 




 <!-- 更新内容是传值 -->
 <script type="text/javascript">	
 	var deleteId;
 	//删除提示窗口
 	function deleteAlert() {
 		 $('#deleteModal6').modal('show');
 		
 	}
 	
 	//删除记录
 	function deleteById() {
 		window.location.href = "delete?id="+deleteId;
 	}
 	
 	
 	//添加子菜单
 	function coreate(){
 		$("#panel").hide();
 		$("#message").show();
 		
 		//获取父ID
 		var pid=$("#id").val();
 		
 		//数据
		$("#id").val("");
		$("#name").val("");
		$("#icon").val("");
		$("#url").val("");
		$("#manageUrl").val("");
		$("#androidUrl").val("");
		$("#orderby").val("");
		$("#remark").val("");
		//如果是添加子菜单，则禁用ID
		$("#id").attr("disabled","disabled");
		
		
 		
 	}
 	
	
 	//更新
 	function update(){
 		$("#panel").hide();
 		$("#message").show();
 		//不要禁用ID
 		$("#id").attr("disabled",false);
 		
 	}
 	
 	//更新内容传值
	function updateFormValue(id,name,icon,manageUrl,androidUrl,orderby,remark){
		console.log("加载："+name);
 		//打开操作面板
 		$("#panel").show();
 		//显示面板中的按扭
 		$("#but_update").show();
 		$("#but_del").show();
 		
 		$("#but_add").hide();
 		
 		//数据面板
 		$("#message").hide();
 		//发送数据
		$("#id").val(id);
		$("#name").val(name);
		$("#icon").val(icon);
		$("#manageUrl").val(manageUrl);
		$("#androidUrl").val(androidUrl);
		$("#orderby").val(orderby);
		$("#remark").val(remark);
		

		
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("产品管理 ("+name+") "); 
		
		//将ID,传给删除组。
		deleteId=id;
	}
 	function updateSuper(){
 		//如果是添加跟目录菜单:0
 		$("#id").val(0);
 		//打开操作面板
 		$("#panel").show();
 		//显示面板中的按扭
 		$("#but_update").hide();
 		$("#but_del").hide();
 		$("#but_add").show();
 	}
 	
 	
 </script>

<script>

//表单验证
	$(document).ready(function () {
	    $('.summernote').summernote({
	        lang: 'zh-CN',
	        onImageUpload: function(files, editor, $editable) {
	          sendFile(files[0], editor, $editable);
	        }
	    });
	    $('.dataTables-example').dataTable();//表格
	    <!--显示与隐常左边的菜单-->
	    $('#show-and-hidden-left').trigger("click");
	});
//树形菜单
     $(document).ready(function () {

         $('#jstree1').jstree({
             'core': {
                 'check_callback': true
             },
             'plugins': ['types', 'dnd'],
             'types': {
                 'default': {
                     'icon': 'fa fa-folder'
                 },
                 'html': {
                     'icon': 'fa fa-file-code-o'
                 },
                 'svg': {
                     'icon': 'fa fa-file-picture-o'
                 },
                 'css': {
                     'icon': 'fa fa-file-code-o'
                 },
                 'img': {
                     'icon': 'fa fa-file-image-o'
                 },
                 'js': {
                     'icon': 'fa fa-file-text-o'
                 }

             }
         });

     });
    </script>
    
    
      
    
</body>
</html>
