<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="index">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="renderer" content="webkit">	
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="apple-mobile-web-app-title" content="WeChat"/>

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--fonts-->
    <!-- //for-mobile-apps -->
    <!-- js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/modernizr.custom.97074.js"></script>
    <!-- js -->
    <!-- start-smooth-scrolling -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/move-top.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!-- start-smooth-scrolling -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.chocolat.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/chocolat.css" type="text/css" media="screen" charset="utf-8">
    <!--light-box-files -->
    <script type="text/javascript" charset="utf-8">
        $(function() {
            $('.gallery a').Chocolat();
        });
    </script>
</head>
<body>
<!-- 菜单头部 -->
<jsp:include page="public/top.jsp"/>
	<!-- banner -->
	<jsp:include page="public/inner-banana.jsp" />
<!--相册内容-->
<div class="gallery">
    <div class="container">
        <h3 class="tittle">摄影相册</h3>
        <section>
            <ul id="da-thumbs" class="da-thumbs">
            
            	<c:forEach items="${usersUploads.listContestImages }" var="items" varStatus="status">
            	
            	<li>
                    <a href="${items.originalPath }" rel="title" class="b-link-stripe b-animate-go  thickbox">
                        <img src="${items.originalPath }" alt="" style="width: 359px;height: 230px;" />
                <!--       <div>
                            <h5>模特 1 </h5>
                            <span>没有平日的失败，就没有最终的成功。重要的是分析失败原因并吸取教训。</span>
                        </div>  -->
                    </a>
                </li>
               
            	
            	</c:forEach>
                
                <div class="clearfix"> </div>
            </ul>
        </section>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.hoverdir.js"></script>
        <script type="text/javascript">
            $(function() {
                $(' #da-thumbs > li ').each( function() { $(this).hoverdir(); } );
            });
        </script>
    </div>

</div>


<!-- 底部 -->
<jsp:include page="public/botton.jsp"/>


<!-- smooth scrolling -->
<script type="text/javascript">
    $(document).ready(function() {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */
        $().UItoTop({ easingType: 'easeOutQuart' });
    });
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->

</body>
</html>
