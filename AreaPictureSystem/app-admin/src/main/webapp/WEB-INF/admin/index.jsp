<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<body>
	<div id="wrapper">
		<!-- .aside left menu-->
		<%@include file="public/left.jsp"%>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="public/top.jsp"%>
			<div class="wrapper wrapper-content">
			
			
			  <div class="ibox-content ">
                        <div class="carousel slide" id="carousel2">
                            <ol class="carousel-indicators">
                                <li data-slide-to="0" data-target="#carousel2" class="active"></li>
                                <li data-slide-to="1" data-target="#carousel2"></li>
                                <li data-slide-to="2" data-target="#carousel2" class=""></li>
                            </ol>
                            
                            <div class="carousel-inner">
                            	<c:forEach items="${resourcelist.datas}" var="item" begin="0" end="${fn:length(resourcelist.datas)}" 
						varStatus="status">
                            
                                <div class="item 	<c:if test="${status.index  eq '1'}">active</c:if>">
                                <center>
                                    <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/file/getImg/${item.id}?type=max">
                                    <div class="carousel-caption">
                                        <p>名    称：${item.originalName } </p>
                                        <p>上传者：${item.uploadPerson } </p>
                                    </div>
                                    </center>
                                </div>
                               </c:forEach>
                            </div>
                            <a data-slide="prev" href="carousel.html#carousel2" class="left carousel-control">
                                <span class="icon-prev"></span>
                            </a>
                            <a data-slide="next" href="carousel.html#carousel2" class="right carousel-control">
                                <span class="icon-next"></span>
                            </a>
                        </div>
                    </div>
			
			
			
			<div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>图片库系统最近上传图片列表</h5>
                    </div>
                    <div class="ibox-content">
	<c:forEach items="${resourcelist.datas}" var="item"
						varStatus="status">
                        <a class="fancybox" href="${pageContext.request.contextPath}/file/getImg/${item.id}?type=min"
                         title="图片名称：${item.originalName }<br/>上传者：${item.uploadPerson }">
                            <img alt="image" src="${pageContext.request.contextPath}/file/getImg/${item.id}?type=min" />
                        </a>
                       
</c:forEach>


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

</body>
</html>
