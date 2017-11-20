<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>四团小学－用户登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/loginAssets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/loginAssets/css/supersized.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/loginAssets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container" style="margin:250px auto 0 auto;">
            <h1 style="color: #000;">上海市奉贤区四团小学－管理后台</h1>
            <form action="${pageContext.request.contextPath}/user/loginToIndex" method="post">
                <input style="color: #000;" type="text" name="username" class="username" placeholder="用户名">
                <input style="color: #000;" type="password" name="password" class="password" placeholder="密 码">
                <button type="submit">登录</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
<!--                 <p>找回用户和密码</p> -->
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="${pageContext.request.contextPath}/assets/admin/loginAssets/js/jquery-1.8.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/admin/loginAssets/js/supersized.3.2.7.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/admin/loginAssets/js/scripts.js"></script>
		<script type="text/javascript">
		jQuery(function($){

		    $.supersized({

		        // Functionality
		        slide_interval     : 4000,    // Length between transitions
		        transition         : 1,    // 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
		        transition_speed   : 1000,    // Speed of transition
		        performance        : 1,    // 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)

		        // Size & Position
		        min_width          : 0,    // Min width allowed (in pixels)
		        min_height         : 0,    // Min height allowed (in pixels)
		        vertical_center    : 1,    // Vertically center background
		        horizontal_center  : 1,    // Horizontally center background
		        fit_always         : 0,    // Image will never exceed browser width or height (Ignores min. dimensions)
		        fit_portrait       : 1,    // Portrait images will not exceed browser height
		        fit_landscape      : 0,    // Landscape images will not exceed browser width

		        // Components
		        slide_links        : 'blank',    // Individual links for each slide (Options: false, 'num', 'name', 'blank')
		        slides             : [    // Slideshow Images
		                                 {image : '${pageContext.request.contextPath}/assets/admin/loginAssets/img/backgrounds/1.jpg'},
		                                 {image : '${pageContext.request.contextPath}/assets/admin/loginAssets/img/backgrounds/2.jpg'},
		                                 {image : '${pageContext.request.contextPath}/assets/admin/loginAssets/img/backgrounds/3.jpg'}
		                       ]

		    });

		});

		</script>
    </body>

</html>