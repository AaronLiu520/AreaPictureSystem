<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<link
	href="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<body>


	<%-- 
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


							<!-- 	<div class="form-group">
									<label>图片上传最大数量：</label> <input type="text"
										placeholder="图片上传最大数量" name="sumPotoCount" id="sumPotoCount"
										class="form-control" required>
								</div> -->

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
									<label>活动时间：</label> <input type="text" placeholder="活动时间"
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
               		     <button type="submit" id="submit" class="btn btn-primary">保存</button>
              		  </div>
            </form>
        </div>
    </div>
</div> --%>





	<!-- 图片编缉 -->









	<div class="modal inmodal" id="File_Made" tabindex="-1" role="dialog"
		aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title">修改图片信息</h4>
				</div>

				<form method="post"
					action="${pageContext.request.contextPath}/photoMessageAction/update/${webType}">
					<div class="modal-body">


						<div class="form-group">
							<label>图片名称</label>
							<div class="input-group">
								<input placeholder="图片名称" class="form-control" name="resourceName"
									id="made_resourceName">

								<div class="input-group-btn">
									<button data-toggle="dropdown"
										class="btn btn-white dropdown-toggle" type="button" onclick="return getInformationRegister('resourceName');"
										aria-expanded="false">
										快速选择 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" id="resourceName">
											
									</ul>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>主要人物</label>
							<div class="input-group">
								<input placeholder="图片主要人物" class="form-control" name="person" 
									id="made_person">

								<div class="input-group-btn">
									<button data-toggle="dropdown"
										class="btn btn-white dropdown-toggle" type="button" onclick="return getInformationRegister('person');"
										aria-expanded="false">
										快速选择 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" id="person">
										
									</ul>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>摄影者</label>
							<div class="input-group">
								<input placeholder="摄影者" class="form-control" name="photographer" 
									id="made_photographer">

								<div class="input-group-btn">
									<button data-toggle="dropdown"
										class="btn btn-white dropdown-toggle" type="button"  onclick="return getInformationRegister('photographer');"
										aria-expanded="false">
										快速选择 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" id="photographer">

									</ul>
								</div>
							</div>  
						</div>


						<div class="form-group">
							<label>拍摄地址</label>
							<div class="input-group">
								<input placeholder="拍摄地址" class="form-control"   
									name="resourceAddress" id="made_resourceAddress">
								<div class="input-group-btn">
									<button data-toggle="dropdown"
										class="btn btn-white dropdown-toggle" type="button" onclick="return getInformationRegister('resourceAddress');"
										aria-expanded="false">
										快速选择 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" id="resourceAddress">
								
									</ul>
								</div>
							</div>
						</div>
						<input type="hidden" id="made_id" name="id"> <input
							type="hidden" name="activityId"
							value="${sessionScope.checkActivityId}">


						<div class="form-group">
							<label>描述：</label>
							<textarea rows="5" cols="7"
								style="resize: none; overflow: scroll;" placeholder="描述"
								name="description" id="made_description" class="form-control"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" id="submit" class="btn btn-primary">保存</button>
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
							<form id="my-awesome-dropzone" class="dropzone"
								action="${pageContext.request.contextPath}/photoMessageAction/uploadFile">
								<div class="dropzone-previews"></div>
								<input type="hidden" value="${sessionScope.checkActivityId}"
									name="forderActivityId">
								<button onclick="uploadFile()" type="submit"
									class="btn btn-primary pull-right">上传文件</button>
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
	<div class="modal inmodal fade" id="File_Delete" tabindex="-1"
		role="dialog" aria-hidden="true" style="padding: 15%">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<span style="float: left; color: red; font-size: 18px;">删除提示</span>
				</div>
				<div class="modal-body">
					<h3>您确认是否要删除此记录吗?</h3>
				</div>
				<input type="hidden" id="delete-id">
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="button" onclick="deleteById();"
						class="btn btn-primary delete-confirm-btn">确认</button>
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

	function getInformationRegister(o){
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/photoMessageAction/getInformationRegister",
			data : null,
			dataType : "json",
			success : function(msg) {
				if(msg.status == "200"){
					var a = "";
					var aa=null;
					if(o !=""){
						var made_o="made_"+o
						
						if(o=="resourceName"){
							aa=msg.data.resourceNameList;
						}
						if(o=="person"){
							aa=msg.data.personList;
						}
						if(o=="photographer"){
							aa=msg.data.photographerList;
						}
						if(o=="resourceAddress"){
							aa=msg.data.resourceAddressList;
						}
						
						$.each(aa,function(index,value){
							a+="<li><a href='javascript:void(0);' onclick=setvalue('"+made_o+"','"+value+"');>"+value+"</a></li>"
							});
							$("#"+o).html(a);
					}
					
					
				}else{
					alert("连接服务器失败请与管理员联系");
					
				}
			}
		});
		
		
	}
	
	
	function setvalue(o1,o2){
		var id="#"+o1;
		$(id).val(o2);
	}
	
	
	
	

</script>



</body>
</html>
