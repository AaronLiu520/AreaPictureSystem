<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>管理后台</title>

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

<!-- 动态表格 -->
	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

<style type="text/css">
.box {
	width: 650px;
	height: 500px;
	overflow: hidden;
	margin: 0 auto;
}
</style>
</head>

<body>
	<div id="wrapper">
		<!-- .aside left menu-->
		<%@include file="public/left.jsp"%>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="public/top.jsp"%>
			<div class="wrapper wrapper-content">

				<div class="row">
					<div class="col-sm-12">
					
				 <!-- 内容 -->
                     <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>比赛信息
                                    </h5>
                                </div>
                                <div class="ibox-content">

                            <p>
                             <table class="table table-striped table-bordered table-hover dataTables-example">
                                <thead>
                                    <tr>
                                    	<th>比赛名称</th>
                                        <th>参赛人数</th>
                                        <th>投票总数</th>
                                    </tr>
                                </thead>
                                <tbody>
                               <c:forEach items="${lists}" var="item" varStatus="status">
                                    <tr class="gradeX">
                                    	<td>${item.contest.contestName}</td>
                                        <td>${fn:length(item.usersUploads)}</td>
                                        <td>${item.polls}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                    </div>
                </div>
					</div>

				</div>


			</div>
			<!-- end message center-->

			<%@include file="public/botton.jsp"%>
		</div>
	</div>
	</div>
 
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
