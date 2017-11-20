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
           
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-9">
                    <h2>区域活动图片库</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">全部</a>
                        </li>
                        <li>
                            <a href="#">校园活动</a>
                        </li>
                        <li>
                            <strong>文件管理器</strong>
                        </li>
                    </ol>
                </div>
            </div>
           
             <div class="wrapper wrapper-content">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <div class="file-manager">
                                    <h5>显示：</h5>
                                    <a href="${pageContext.request.contextPath}/potoAction/images?type=all" target="myFrameName" class="file-control active">所有</a>
                                    <a href="file_manager.html#" class="file-control">文档</a>
                                    <a href="file_manager.html#" class="file-control">视频</a>
                                    <a href="file_manager.html#" class="file-control">图片</a>
                                    <div class="hr-line-dashed"></div>
                                    <button class="btn btn-primary btn-block">上传文件</button>
                                    <div class="hr-line-dashed"></div>
                                    <h5>文件夹</h5>
                                    <ul class="folder-list" style="padding: 0">
                                        <li><a href="file_manager.html"><i class="fa fa-folder"></i> 文件</a>
                                        </li>
                                        <li><a href="file_manager.html"><i class="fa fa-folder"></i> 图片</a>
                                        </li>
                                        <li><a href="file_manager.html"><i class="fa fa-folder"></i> Web页面</a>
                                        </li>
                                        <li><a href="file_manager.html"><i class="fa fa-folder"></i> 插图</a>
                                        </li>
                                        <li><a href="file_manager.html"><i class="fa fa-folder"></i> 电影</a>
                                        </li>
                                        <li><a href="file_manager.html"><i class="fa fa-folder"></i> 书籍</a>
                                        </li>
                                    </ul>
                                    <h5 class="tag-title">标签</h5>
                                    <ul class="tag-list" style="padding: 0">
                                        <li><a href="file_manager.html">爱人</a>
                                        </li>
                                        <li><a href="file_manager.html">工作</a>
                                        </li>
                                        <li><a href="file_manager.html">家庭</a>
                                        </li>
                                        <li><a href="file_manager.html">孩子</a>
                                        </li>
                                        <li><a href="file_manager.html">假期</a>
                                        </li>
                                        <li><a href="file_manager.html">音乐</a>
                                        </li>
                                        <li><a href="file_manager.html">照片</a>
                                        </li>
                                        <li><a href="file_manager.html">电影</a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 animated fadeInRight">
			             <iframe  name="iframepage" id="iframepage" src="${pageContext.request.contextPath}/potoAction/images"
			             frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"
			             onload="changeFrameHeight()" width="100%" >
			             </iframe>
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
	
	function changeFrameHeight(){
	    var ifm= document.getElementById("iframepage"); 
	    ifm.height=document.documentElement.clientHeight-250;
	}
	window.onresize=function(){  
	     changeFrameHeight();  
	} 

    </script>
    
    
      
    
</body>
</html>
