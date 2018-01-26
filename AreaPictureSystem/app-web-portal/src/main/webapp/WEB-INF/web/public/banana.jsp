<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<style type="text/css">
/*-- //menu --*/
.banner {
	background: url('${webIndexBanana.banana}') no-repeat 0px 0px;
	background-size: cover;
	-webkit-background-size: cover;
	-o-background-size: cover;
	-ms-background-size: cover;
	-moz-background-size: cover;
	min-height: 730px;
}

.banner-info {
	margin-top: 440px;
}

.logo {
	width: 25%;
	float: left;
	background: #CA4D4D;
	padding: 19px 50px 0px 227px;
	min-height: 80px;
}

.banner-info h1 {
	margin: 0 auto;
	font-size: 30px;
	color: #ffffff;
	font-weight: 400;
	background: rgba(202, 77, 77, 0.61);
	width: 60%;
	padding: 33px 0;
	text-align: center;
}

.banner-info p {
	margin: 8px auto 0px auto;
	font-size: 17px;
	color: #ffffff;
	font-weight: 400;
	background: rgba(36, 42, 44, 0.67);
	width: 50%;
	padding: 33px 0;
	text-align: center;
}

.banner-info p span {
	display: block;
}

.banner-info a {
	font-size: 20px;
	text-decoration: none;
	color: #ffffff;
	text-align: center;
	border: 3px solid rgba(252, 252, 252, 0.35);
	border-radius: 5px;
	padding: 14px 25px;
	background: rgba(37, 44, 46, 0.2);
}

.banner-info a:hover {
	background: rgba(99, 198, 174, 0.25);
}

.banner-bottom {
	padding: 50px 0 100px 0;
}
</style>

<div class="banner">
	<div class="container">
		<div class="banner-info text-center">
			<h1>${webIndexBanana.bananaTitle }</h1>
			<p> ${webIndexBanana.bananaContent } </p>
		</div>
	</div>
</div>