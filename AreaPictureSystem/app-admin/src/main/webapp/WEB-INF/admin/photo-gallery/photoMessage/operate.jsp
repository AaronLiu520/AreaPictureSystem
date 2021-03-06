<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en" class="app">

<!-- 上传控件-->
<script>
    $(document).ready(function () {

        Dropzone.options.myAwesomeDropzone = {

            autoProcessQueue: false,
            uploadMultiple: true,
            parallelUploads: 100,
            maxFiles: 100,
            addRemoveLinks: true,
            dictRemoveFile: "删除文件",
            dictDefaultMessage: "拖放文件来上传",
            // Dropzone settings
            init: function () {
                var myDropzone = this;
                this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });
                this.on("sendingmultiple", function () {
                });
                this.on("successmultiple", function (files, response) {
                    window.location.href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/${webType}?checkId="+response
                });
                this.on("errormultiple", function (files, response) {

                });
                
                
            }

        }

    });
</script>


<!-- tree 树形 -->
<script>

    //上下文
    <!--显示与隐常左边的菜单-->
    //$(document).ready(function () {
    //    $('.summernote').summernote({
    //        lang: 'zh-CN',
    //        onImageUpload: function(files, editor, $editable) {
    //            sendFile(files[0], editor, $editable);
   //         }
    //    });
//
     //   $('#show-and-hidden-left').trigger("click");
//
   // });


    // tree 时间轴
    $(document).ready(function () {

        $('#jstree1').jstree({
            'core': {
                'check_callback': true
            },
            'plugins': ['types', 'dnd'],
            'types': {
                'default': {
                    'icon': 'fa fa-folder'
                },
                'html': {
                    'icon': 'fa fa-file-code-o'
                },
                'svg': {
                    'icon': 'fa fa-file-picture-o'
                },
                'css': {
                    'icon': 'fa fa-file-code-o'
                },
                'img': {
                    'icon': 'fa fa-file-image-o'
                },
                'js': {
                    'icon': 'fa fa-file-text-o'
                }

            }
        });

    });

    // 时间轴（活动的单事件）

    function checkActivity(id){
        window.location.href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/${webType}?checkId="+id
    }
    function checkActivityAndSort(id,Sortname){
        window.location.href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/${webType}?checkId="+id+"&Sort="+Sortname
    }

</script>


<!-- update file and delete file-->
<script>
    <!-- update -->
    function updateImg(id,resourceName,person,photographer,resourceAddress,description,sort){
        $("#made_id").val(id);
        $("#made_resourceName").val(resourceName);
        $("#made_person").val(person);
        $("#made_photographer").val(photographer);
        $("#made_resourceAddress").val(resourceAddress);
        $("#made_description").val(description);
        $("#sort").val(sort);
    }

<!-- delete -->
    var deleteId=null;
    var activityId=null;
    var selectQuery = null;
    var selectVal = null;
    var pageNo = null;
    var pageSize = null;
    //删除提示窗口
    function deleteAlert(id,activityid) {
        deleteId=id;
        activityId=activityid;
        $('#File_Delete').modal('show');

    }
    //删除提示窗口
    function deleteAlertIndex(id_,selectQuery_,selectVal_,pageNo_,pageSize_) {
    	
    	
        deleteId=id_;
        selectQuery = selectQuery_;
        selectVal = selectVal_;
        pageNo = pageNo_;
        pageSize = pageSize_;
        $('#File_Delete').modal('show');

    }

    //删除记录
    function deleteById() {
    	var query="";
    	
        if(deleteId!=null){
        	
        	if(activityId!=null){
        		query="&activityId="+activityId;
        	}
        	if(selectQuery!=null){
        		query = query+"&selectQuery="+selectQuery;
        	}
			if(selectVal!=null){
				query = query+"&selectVal="+selectVal;
			}
			if(pageNo!=null){
				query = query+"&pageNo="+pageNo;
			}
			if(pageSize!=null){
				query = query+"&pageSize="+pageSize;
			}
            window.location.href = "${pageContext.request.contextPath}/photoMessageAction/delete/${webType}?id="+deleteId+query;
        }

    }

</script>


<body>


</body>
</html>
