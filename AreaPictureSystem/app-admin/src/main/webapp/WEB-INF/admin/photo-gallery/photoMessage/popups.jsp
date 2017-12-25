<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en" class="app">
<link
	href="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<body>



<!-- 创建活动 -->
<div class="modal inmodal" id="CrateActivity" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">创建活动／文件夹</h4>
            </div>

            <form method="post" id="signupForm" action="../createActivity/${webType}">
                <div class="modal-body">
                    <div class="form-group">
									<label>活动名称：</label><label for="forderActivityName"
										id="forforderActivityName" class="control-label"
										style="color: red; float: right;"></label> <input type="text"
										placeholder="请输入活动名称" name="forderActivityName"
										onchange="return getrepletes('forderActivityName');" 
										onkeyup="return getrepletes('forderActivityName');"
										id="forderActivityName" class="form-control" required>
								</div>
								<input type="hidden" id="forderActivityNamehid">

								<div class="form-group">
									<label>活动地址：</label> <input type="text" placeholder="活动地址"
										name="address" id="address" class="form-control">
								</div>


								<div class="form-group">
									<label>图片上传最大数量：</label> <input type="text"
										placeholder="图片上传最大数量" name="sumPotoCount" id="sumPotoCount"
										class="form-control" required>
								</div>

								<c:if
									test="${sessionScope.userSession.userType eq 'ADMINISTRATORS' && webType eq 'BASEUTIS'}">
									<div class="form-group" onchange="return getrepletes('forderActivityName');">
										<label>活动所属学校：</label> <select id="boundCompany" class="form-control m-b"
											name="boundCompany" >
											<c:forEach items="${listAdminCompany}" var="item" varStatus="status">
												<option id="${item.id}" value="${item.id}">${item.name}</option>
											</c:forEach>
										</select>
									</div>
								</c:if>



								<div class="form-group">
									<label>活动时间：</label> <input type="text" placeholder="活动地址"
										name="activityTime" id="activityTime" readonly="readonly"
										class="form-control datainput" data-date-format="yyyy-mm-dd" required>
								</div>



								<div class="form-group">
									<label>描述：</label>
									<textarea rows="5" cols="7"
										style="resize: none; overflow: scroll;" placeholder="描述"
										name="description" id="description" class="form-control"></textarea>
								</div>
								   <input  type="hidden" name="boundId" id="boundId" value="${sessionScope.userSession.id}">
                                    <c:if test="${sessionScope.userSession.userType != 'ADMINISTRATORS' }">
                                        <input  type="hidden" name="boundCompany" id="boundCompany" value="${sessionScope.userSession.adminCompany.id}">

                                    </c:if>
                       			   <input  type="hidden" name="parentId" id="parentId" value="0">
                       			   <input  type="hidden" name="type"  id="type" value="${webType}">
            		    </div>
           		     <div class="modal-footer">
               		     <button type="submit" class="btn btn-primary">保存</button>
              		  </div>
            </form>
        </div>
    </div>
</div>





<!-- 图片编缉 -->
<div class="modal inmodal" id="File_Made" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title" id="galleryNameId">编 缉</h4>
            </div>

            <form method="post"  action="${pageContext.request.contextPath}/photoMessageAction/update/${webType}">
                <div class="modal-body">
                    <div class="form-group">
                        <label>名称</label>
                        <input  placeholder="资源名称" class="form-control" name="resourceName"
                                id="made_resourceName">

                        <label>被拍摄者</label>
                        <input  placeholder="图片内容" class="form-control" name="person"
                                id="made_person">

                        <label>摄影者</label>
                        <input  placeholder="拍摄者" class="form-control" name="photographer"
                                id="made_photographer">

                        <label>拍摄地址</label>
                        <input placeholder="拍摄地址" class="form-control" name="resourceAddress"
                               id="made_resourceAddress">

                        <input type="hidden" id="made_id" name="id">
                        <input type="hidden"  name="activityId" value="${sessionScope.checkActivityId}">
                        <label>描述</label>
                        <textarea style="height: 100px;"  placeholder="描述"
                                  class="form-control" name="description" id="made_description"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 上传图片控件 -->
<div id="modal-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="ibox-content">
                        <form  id="my-awesome-dropzone" class="dropzone"
                               action="${pageContext.request.contextPath}/photoMessageAction/uploadFile">
                            <div class="dropzone-previews"></div>
                            <input type="hidden" value="${sessionScope.checkActivityId}" name="forderActivityId">
                            <button onclick="uploadFile()"  type="submit" class="btn btn-primary pull-right">上传文件</button>
                        </form>
                        <div>
                            <div class="m">您可以在此上传图片，每次最大支持100个文件</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 删除弹出层提示 -->
<div class="modal inmodal fade" id="File_Delete" tabindex="-1" role="dialog"  aria-hidden="true" style="padding: 15%">
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






	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
		$('.datainput').datetimepicker({
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	</script>






<script type="text/javascript">
		//ajax判断有没有重复
		function getrepletes(o1) {
			var r1 = $("#" + o1).val();//获取需要判断是否重复的属性
			var r2 = $("#" + o1 + "hid").val();//该值的隐藏域值 判断如果是原始值则不变
			
			var boundCompany = $("#boundCompany").val();
			if(boundCompany == null){
				boundCompany="";
			}
			var type = $("#type").val();
			if(type == null){
				type="";
			}
			
			
			if (r1 != r2) {
				$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/forderActivity/ajaxgetRepletes",
							data : o1 + "=" + r1+"&companyId="+boundCompany+"&type="+type,
							dataType : "text",
							success : function(msg) {
								if (msg == "true") {
									document.getElementById("for" + o1).innerHTML = "您当前已经创建过这个活动了！！";
									document.getElementById("for" + o1).style.cssText = "float: right; color: red;";
									$("#submit").attr("disabled", true);
								} else {
									$("#submit").attr("disabled", false);
									document.getElementById("for" + o1).innerHTML = " ";
								}
							}
						});
			} else {
				$("#submit").attr("disabled", false);
				document.getElementById("for" + o1).innerHTML = " ";
			}
		}
	</script>

<!-- Jquery Validate -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>

	<script type="text/javascript">
		$.validator.setDefaults({
			highlight : function(a) {
				$(a).closest(".form-group").removeClass("has-success")
						.addClass("has-error")
			},
			success : function(a) {
				a.closest(".form-group").removeClass("has-error").addClass(
						"has-success")
			},
			errorElement : "span",
			errorPlacement : function(a, b) {
				if (b.is(":radio") || b.is(":checkbox")) {
					a.appendTo(b.parent().parent().parent())
				} else {
					a.appendTo(b.parent())
				}
			},
			errorClass : "help-block m-b-none",
			validClass : "help-block m-b-none"
		});
		$().ready(function() {
			$("#commentForm").validate();
			var a = "<i class='fa fa-times-circle'></i> ";
			$("#signupForm").validate({
				rules : {
					forderActivityName : "required",
					activityTime : {
						required : true,
					},
					sumPotoCount : {
						required : true,
						digits:true
					}
				},
				messages : {
					forderActivityName : a + "请输入活动名称",
					activityTime : {
						required : a + "请选择活动时间"
					},
					sumPotoCount : {
						required : a + "请输入上传图片最大数量",
						digits: a+"请输入正确的数字"
					}
				}
			});
		});
	</script>





</body>
</html>
