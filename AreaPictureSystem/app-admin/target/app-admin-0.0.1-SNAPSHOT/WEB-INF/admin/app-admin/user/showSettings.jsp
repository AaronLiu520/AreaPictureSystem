<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>个人信息</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
   <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo_title.png" 
   type="image/x-icon" />
</head>

<body>


	<section class="vbox">
		<!-- .top-->
		<%@include file="../../public/top.jsp"%>
		<section>
			<section class="hbox stretch">
				<!-- .aside left menu -->
				<%@include file="../../public/left.jsp"%>
				<!-- /.aside -->
				<!-- /.aside -->
				<section id="content">
					<section class="vbox">
						<section class="scrollable padder ">
							<div class="m-b-md">
								<h3 class="m-b-none">个人信息</h3>
							</div>
							<div class="row">
								<div class="col-sm-6" style="width: 100%;">
										<section class="panel panel-default">
											
											<div class="panel-body">
												<p class="text-muted"></p>
									<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">用户名</label>
                      						<div class="col-lg-10">
                      						  <p class="form-control-static" style="margin-left:10%">${user.username}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				 
                  						<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">微信帐号</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%"><c:choose>

															<c:when test="${not empty user.weChatCode}">
																	已绑定微信帐号
															</c:when>
															<c:otherwise>
																	未设置微信帐号
															</c:otherwise>
														</c:choose></p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				 
                  					 		<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">账户类型</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">	
                      						  	<c:if test="${user.type=='teacherUser'}">
																教师
														</c:if>
														<c:if test="${user.type=='studentUser'}">
																学生
														</c:if>
														<c:if test="${user.type=='otheruser'}">
																其他用户
														</c:if>
														<c:if test="${user.type=='SchoolManager'}">
																学校管理员
														</c:if>
														<c:if test="${user.type=='superManager'}">
																超级管理员
														</c:if></p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				 
									<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">创建时间</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%"><fmt:formatDate value="${user.createTime}"
																	pattern="yyyy-MM-dd" /></p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				 
												<!-- 得到学生的详细信息 -->
												<c:if test="${not empty studentdetail}">
												
									<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">学生姓名</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.name}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				 		<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">入学年份</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.entranceYear}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				 		<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">班级</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.classesId}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				  		<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">籍贯</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.nativePlace}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  				 	  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				  		<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">学籍号</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.fileCode}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				 	<div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">学号 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.code}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">性别</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.sex}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
                  				  <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">家庭地址</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.address}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
										 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">证件号码</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.cardId}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
										 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">健康状态</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.health}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
										 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">联系人</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.contactsPerson}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
										 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">联系人电话</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.contactsPhone}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
										 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">联系人手机 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${studentdetail.contactsmobile}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
										</c:if>

												<!-- 得到老师的详细信息 -->
										<c:if test="${not empty detail}">
												
									 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">姓名 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.name}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>
										 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">出生日期 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.birthDate}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
											 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">性别 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.sex}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
													
											 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">家庭地址 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.address}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
													
												
											 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">联系电话 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.telPhone}</p>
                     						 </div>
                   						 </div>   
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
											 <div class="form-group pull-in clearfix">		
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">证件号码 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.cardId}</p>
                     						 </div>
                     						 </div>
                  					  </div>
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
													 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">教师编号</label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.teachernum}</p>
                     						 </div>
                     						 </div>
                   						 </div>   
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
												 <div class="form-group pull-in clearfix">	
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">入职时间 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.entryTime}</p>
                     						 </div>
                   						 </div>   
                   						 </div>   
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
													 <div class="form-group pull-in clearfix">
                   					 	<div class="form-group">
                    						  <label class="col-lg-2 control-label">所属部门 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.department}</p>
                     						 </div>
                   						 </div>   
                   						 </div>   
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
											 <div class="form-group pull-in clearfix">
											<div class="form-group">
                    						  <label class="col-lg-2 control-label">邮箱地址 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${detail.email}</p>
                     						 </div>
                     						 </div>
                   						 </div>   
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
												</c:if>
											 <div class="form-group pull-in clearfix">
											<div class="form-group">
                    						  <label class="col-lg-2 control-label">备注 </label>
                      						<div class="col-lg-10">
                      						 <p class="form-control-static" style="margin-left:10%">${user.remark}</p>
                     						 </div>
                     						 </div>
                   						 </div>   
                  					  <div class="line line-dashed b-b line-lg pull-in"></div>		
													
												
												<input id="schoolid" name="schoolid"
													value="${sessionScope.SSchool.id}" type="hidden">
											</div>
										</section>
								</div>
							</div>

						</section>
					</section>
				</section>
			</section>
		</section>
	</section>
</body>
</html>
