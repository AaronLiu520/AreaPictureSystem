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
	min-height: 300px;
}



</style>

<div class="banner">
	<div class="container">
		<div class="banner-info text-center">
		
		<c:if test="${not empty webIndexBanana.bananaTitle}">
			<h1>${webIndexBanana.bananaTitle }</h1>
		</c:if>	
		<c:if test="${not empty webIndexBanana.bananaContent}">
			<p> ${webIndexBanana.bananaContent } </p>
		</c:if>	
		
		</div>
	</div>
</div>