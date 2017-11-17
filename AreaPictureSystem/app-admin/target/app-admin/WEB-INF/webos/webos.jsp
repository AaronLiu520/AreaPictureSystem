<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>管理后台</title>

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
  
  <title>WebOS+</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/webos/css/admin/global.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/webos/plugin/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/webos/plugin/easyui/themes/icon.css" />
  
</head>
    
<body onselectstart="return false;" style="-moz-user-select:none;">
<div class="mainbody">
  <div id="cloud1" class="cloud" ></div>
  <div id="cloud2" class="cloud" ></div>
</div>

<div class="diskicon" style="display:inline-block; width:auto;">
  <ul>
    <li >
    <a href="http://www.baidu.com">
    <span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/icon4.png" title="开始菜单" >
    </span><span class="text">我</span></li>
    </a>
    <li text="我的相册" icon="images/icon/folder.png" path="myphoto.html" 
    data-property="{minimize:'true',maximize:'false',target:'iframe',multiple:'false'}"
     data-style="[{name:'left',value:'650px'},{name:'top',value:'250px'},
     {name:'width',value:'580px'},{name:'height',value:'450px'}]" ><span class="icon"><span class="icon">
     <img src="images/icon/folder.png" title="我的相册" ></span><span class="text">我的vvv相册</span></li>
    <li text="创建新窗体" icon="images/icon/computer.png" path="div.html" data-property="{appid:'1',icon:'icon-add',title:'我的相册1',minimize:'true',maximize:'true',target:'iframe',multiple:'false'}" data-style="[{name:'left',value:'650px'},{name:'top',value:'250px'},{name:'width',value:'580px'},{name:'height',value:'450px'}]" ><span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/computer.png" title="开始菜单" ></span><span class="text">我的相册</span></li>
    <li text="新建文档" icon="images/icon/txt.png" path="api/kindeditor.html" data-property="{appid:'12',icon:'icon-add',title:'我的相册2',minimize:'true',maximize:'true',target:'iframe',multiple:'false'}" data-style="[{name:'left',value:'650px'},{name:'top',value:'250px'},{name:'width',value:'580px'},{name:'height',value:'450px'}]" ><span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/txt.png" title="新建文档" ></span><span class="text">新建文档</span></li>
    <li text="资源管理器" icon="images/icon/folder.png" path="api/explorer.html" data-property="{minimize:'true',maximize:'true',target:'iframe',multiple:'false'}" data-style="[{name:'left',value:'650px'},{name:'top',value:'150px'},{name:'width',value:'1200px'},{name:'height',value:'580px'}]" ><span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/folder.png" title="资源管理器" ></span><span class="text">资源管理器</span></li>
    <li text="数据列表" icon="images/icon/icon4.png" path="api/list.html" data-property="{minimize:'true',maximize:'false',target:'iframe',multiple:'true'}" data-style="[{name:'left',value:'350px'},{name:'top',value:'0px'},{name:'width',value:'1200px'},{name:'height',value:'450px'}]" ><span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/icon5.png" title="数据列表" ></span><span class="text">数据列表</span></li>
    <li text="我的电脑" icon="images/icon/icon4.png" path="api/computer.html" data-property="{minimize:'true',maximize:'true',target:'iframe',multiple:'false'}" data-style="[{name:'left',value:'50px'},{name:'top',value:'250px'},{name:'width',value:'1024px'},{name:'height',value:'600px'}]" ><span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/icon4.png" title="我的电脑" ></span><span class="text">我的电脑</span></li>
    <li text="grid数据" icon="images/icon/icon4.png" path="api/simpletoolbar.html" data-property="{minimize:'true',maximize:'false',target:'iframe',multiple:'false'}" data-style="[{name:'left',value:'650px'},{name:'top',value:'250px'},{name:'width',value:'735px'},{name:'height',value:'377px'}]" ><span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/add_icon.png" title="grid数据" ></span><span class="text">grid数据</span></li>
    <li text="BT种子文件" icon="images/icon/bt.png" path="div.html" data-property="{minimize:'true',maximize:'true',target:'iframe',multiple:'false'}" data-style="[{name:'left',value:'20%'},{name:'top',value:'10%'},{name:'width',value:'1440px'},{name:'height',value:'900px'}]" ><span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/bt.png" title="BT种子文件" ></span><span class="text">BTs种子文件</span></li>
    <li path="http://www.youku.com/" data-property="{title:'优酷视频',icon:'icon-save',minimize:'true',maximize:'true',target:'iframe',multiple:'false'}" data-style="[{name:'left',value:'650px'},{name:'top',value:'250px'},{name:'width',value:'1440px'},{name:'height',value:'900px'}]" ><span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/icon4.png" title="优酷视频" ></span><span class="text">优酷视频</span></li>
   
    <li text="创建新窗体" icon="images/icon/icon4.png" 
    path="${pageContext.request.contextPath}/${sessionScope.projectAddress}/adminMenu/list" 
    data-property="{appid:'123',icon:'icon-add',title:'我的相册1',minimize:'true',maximize:'true',target:'iframe',multiple:'true'}" 
    data-style="[{name:'left',value:'650px'},{name:'top',value:'250px'},{name:'width',value:'580px'},{name:'height',value:'450px'}]" >
    <span class="icon"><span class="icon"><img src="${pageContext.request.contextPath}/assets/webos/images/icon/icon4.png" title="开始菜单" >
    </span><span class="text">我的相册3</span></li>
  </ul>
</div>
<div class="taskbar">
  <div class="taskbar-opacity"></div>
</div>
<div class="taskbar-body">
  <ul>
    <li class="start"><span><img src="${pageContext.request.contextPath}/assets/webos/images/admin/logo.png" title="开始菜单" ></span></li>
	<li class="datetime"><span>21:04:25</span></li>
  </ul>
</div>
<!-- JAUERY  基本核心-->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/webos/js/jquery-2.1.4.min.js"></script> 

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/webos/js/json.js"></script> 

<!-- 背景云移动 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/webos/js/jquery.cloud.js"></script> 
<!-- JAUERY 弹出层管理  核心-->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/webos/js/jquery.ui.win.js"></script> 

<script type="text/javascript">
$(document).ready(function(e) {
		
	$.Init();	//初始化
	
	$(window).resize(function(){
		$('.window[status="maximized"]').css({'left':'0px','top':'0px','width':$(window).outerWidth()+'px', 'height':$(window).outerHeight()-40+'px'});	
		$('.window[status="maximized"] .window-body').css({'height':$(window).outerHeight()-25 - 25,'width':$(window).outerWidth() - 2});	
	});
});

</script>
</body>
</html>
