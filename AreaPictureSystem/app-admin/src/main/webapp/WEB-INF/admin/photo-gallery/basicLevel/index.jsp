<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8" />
    <title>管理后台</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="WeChat" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo_title.png"
          type="image/x-icon" />
</head>

<body>
<div id="wrapper">
    <!-- .aside left menu-->
    <%@include file="../../public/left.jsp" %>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- .aside top jsp -->
        <%@include file="../../public/top.jsp" %>
        <div class="wrapper wrapper-content">
            <!-- message center -->

            <div class="row">
                <!-- left -->
                <div class="col-lg-6">
                    <!-- 操作 -->
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>操作 <small>添加与查找</small></h5>
                            </div>
                            <div class="ibox-content">
                                <div class="widget style1 navy-bg">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/photoMessageAction/index/BASEUTIS">
                                            <div class="col-xs-4">
                                                <i class="fa fa-anchor fa-5x"></i>
                                            </div>
                                            <div class="col-xs-8 text-right">
                                                <span style="font-size: 10px;"> 如果您找不到需要的活动主题，请点击我！ </span>
                                                <h3 class="font-bold">我要《创建主题》活动</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <div class="widget style1 yellow-bg">
                                    <div class="row">

                                        <div class="col-xs-4">
                                            <i class="fa fa-eye fa-5x"></i>
                                        </div>
                                        <div class="col-xs-8 text-right" >
                                            <span>想更精确的查找资料，点击我！</span>
                                            <h3 class="font-bold">查找区域图片资料</h3>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <!--  个人排榜-->
                    <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>人员上传排行榜</h5>
                                </div>
                                <div class="ibox-content">

                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>报名</th>
                                            <th>数据</th>
                                            <th>用户</th>
                                            <th>数量</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                       <c:forEach items="${list }" var="item" varStatus="status">
									        <tr>
									        <td>${item.sortnum }</td>
									        <td><span class="line">${item.str}</span>
                                            </td>
									        <td>${item.name }</td>
									        <td>${item.uploadnum }</td>
									        </tr>
									        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </div>

                </div>

              <!-- 右边 -->
                <div class="col-lg-6">
                    <!--树形菜单-->
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>基层单位图片库 <small>按类型、学校、时间找主题</small></h5>

                        </div>
                        <div class="ibox-content">


                            <%@include file="../photoMessage/basetreetime.jsp" %>
                        </div>
                    </div>
                    </div>
                    <!--热门学校 -->
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>热门-学校</h5><small>（标签）</small>
                            </div>
                            <div class="ibox-content">
                                <button type="button" class="btn btn-w-m btn-default">光明学校</button>
                                <button type="button" class="btn btn-w-m btn-primary">洪庙学校</button>
                                <button type="button" class="btn btn-w-m btn-success">西渡小学</button>
                                <button type="button" class="btn btn-w-m btn-info"> 奉贤幼儿园</button>
                                <button type="button" class="btn btn-w-m btn-warning">致远高中</button>
                                <button type="button" class="btn btn-w-m btn-danger">华亭学校</button>

                            </div>
                        </div>

                    </div>
                </div>





            </div>



        </div><!-- end message center-->


        <%@include file="../../public/botton.jsp" %>
    </div>
</div>


<script>
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
</script>



<!-- Peity -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/peity/jquery.peity.min.js"></script>

<!-- Peity -->
<script src="${pageContext.request.contextPath}/assets/admin/js/demo/peity-demo.js"></script>

<!-- 图表统计 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/flot/jquery.flot.js"></script>
<script>
    // 时间轴（活动的单事件）
    function checkActivity(id){
        window.location.href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/BASEUTIS?checkId="+id
    }

</script>

</body>
</html>
