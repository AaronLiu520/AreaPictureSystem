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

    <!--//fonts-->
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <!-- js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- js -->
    <!-- start-smooth-scrolling -->
    <!-- responsiveslides -->
    <script src="${pageContext.request.contextPath}/assets/js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 4
            $("#slider4").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });
        });
    </script>
    <!-- responsiveslides -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/move-top.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <!-- start-smooth-scrolling -->
</head>
<body>
<!-- 菜单头部 -->
<jsp:include page="public/top.jsp"/>
<!-- banner -->
<div class="inner-banner"></div>


<div class="contact">
	 <div class="container">
		<h3 class="tittle">${contest.contestName}报名：</h3>
		
			<div class="contact-form">
				<div class="col-md-6 contact-grid" style="display:none;">
					<form>
						<p class="your-para">Your mail:</p>
						<input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
						<p class="your-para">Your mail:</p>
						<input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
						<p class="your-para">Your message:</p>
						<textarea cols="77" rows="6" value=" " onfocus="this.value='';" onblur="if (this.value == '') {this.value = '';}"></textarea>
						<div class="send">
							<input type="submit" value="Send">
						</div>
					</form>
			</div>
				<div class="col-md-12 contact-in">
				
				<h2><a href="javascript:void(0);"  onclick="return findpara1()"><span class="label label-primary">查看比赛介绍</span></a></h2>
					<p class="sed-para"></p>
					<div style="display: none;" id="introduce">
					<p class="para1">
						${contest.content } 
					</p>
					
						<div class="col-md-12 contact-grid">
							<p>报名时间:${contest.startTime }~${contest.endTime }</p>
							<c:if test="${items.openVote eq true}">
							<p>投票时间时间:${contest.voteStartTime }~${contest.voteEndTime }</p>
							</c:if>
							<p>活动开始时间:${contest.startTime }</p>
						</div>
						<div class="address-left">
							<p>Tel:1115550001</p>
							<p>Fax:190-4509-494</p>
							<p><a href="mailto:info@example.com">mail@example.com</a></p>
						</div>
						<div class="clearfix"> </div>
				      </div>
				</div>
				<div class="clearfix"> </div>
			   </div>
		  <h3 class="tittle">Find Us Here</h3>
	</div>
</div>







<!-- 底部 -->
<jsp:include page="public/botton.jsp"/>

<!-- smooth scrolling -->
<script type="text/javascript">
    $(document).ready(function() {

        $().UItoTop({ easingType: 'easeOutQuart' });
    });
</script>

</body>
</html>
