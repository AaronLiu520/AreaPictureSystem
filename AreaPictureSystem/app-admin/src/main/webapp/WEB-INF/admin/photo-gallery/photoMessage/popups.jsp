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

            <form method="post" action="../createActivity/${webType}">
                <div class="modal-body">
                    <div class="form-group">
                        <label>名称</label>
                        <input   class="form-control" name="forderActivityName"
                                id="forderActivityName">

                        <label>时间</label>
                        <input  placeholder="活动时间" class="form-control datainput" name="activityTime"
                                id="activityTime"  data-date-format="yyyy-mm-dd">

                        <label>数量</label>
                        <input  placeholder="图片上传最大数量" class="form-control" name="sumPotoCount"
                                id="sumPotoCount">


                        <label>地址</label>
                        <input placeholder="活动地址" class="form-control" name="address"
                               id="address">

                        <!-- 活动主题类型 创建枚举类 QUYU表示区域级 ZHISHU 直属 GEREN 个人 -->
                        <input type="hidden" id="type" name="type" value="${webType}">
                        <!-- 公司ID ，个人ID-->
                        <input  type="hidden" name="boundId" value="${sessionScope.userSession.adminCompany.id}">

                        <input  type="hidden" name="parentId" value="0">

                        <label>描述</label>
                        <textarea style="height: 100px;"  placeholder="文件夹描述"
                                  class="form-control" name="description" id="description"></textarea>
                    </div>
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

            <form method="post" action="${pageContext.request.contextPath}/photoMessageAction/update/${webType}">
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















</body>
</html>
