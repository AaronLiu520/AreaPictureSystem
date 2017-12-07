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
                    window.location.href="${pageContext.request.contextPath}/photoMessageAction/checkActivity?checkId="+response
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
    $(document).ready(function () {
        $('.summernote').summernote({
            lang: 'zh-CN',
            onImageUpload: function(files, editor, $editable) {
                sendFile(files[0], editor, $editable);
            }
        });
        <!--显示与隐常左边的菜单-->
        $('#show-and-hidden-left').trigger("click");

    });

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
        window.location.href="${pageContext.request.contextPath}/photoMessageAction/checkActivity?checkId="+id
    }

</script>


<!-- update file and delete file-->
<script>
    <!-- update -->
    function updateImg(id,resourceName,person,photographer,resourceAddress,description){
        $("#made_id").val(id);
        $("#made_resourceName").val(resourceName);
        $("#made_person").val(person);
        $("#made_photographer").val(photographer);
        $("#made_resourceAddress").val(resourceAddress);
        $("#made_description").val(description);
    }

<!-- delete -->
    var deleteId=null;
    var activityId=null;
    //删除提示窗口
    function deleteAlert(id,activityid) {
        deleteId=id;
        activityId=activityid;
        $('#File_Delete').modal('show');

    }

    //删除记录
    function deleteById() {
        if(deleteId!=null && activityId!=null){
            window.location.href = "${pageContext.request.contextPath}/photoMessageAction/delete?id="+deleteId
                +"&activityId="+activityId;
        }

    }

</script>


<body>


</body>
</html>
