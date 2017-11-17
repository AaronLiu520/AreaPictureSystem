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
                                        <div class="col-xs-4">
                                            <i class="fa fa-anchor fa-5x"></i>
                                        </div>
                                        <div class="col-xs-8 text-right">
                                            <span style="font-size: 10px;"> 如果您找不到需要的活动主题，请点击我！ </span>
                                            <h3 class="font-bold">我要《创建主题》活动</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="widget style1 yellow-bg">
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <i class="fa fa-eye fa-5x"></i>
                                        </div>
                                        <div class="col-xs-8 text-right">
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
                                        <tr>
                                            <td>1</td>
                                            <td><span class="line">5,3,2,-1,-3,-2,2,3,5,2</span>
                                            </td>
                                            <td>张三</td>
                                            <td> 400</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                            </td>
                                            <td>李四</td>
                                            <td> 300</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><span class="line">1,6,3,9,5,9,5,3,9,6,4</span>
                                            </td>
                                            <td>王麻子</td>
                                            <td> 300</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><span class="line">6,2,3,9,5,8,5,3,3,9,4</span>
                                            </td>
                                            <td>李进</td>
                                            <td> 200</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><span class="line">5,6,3,7,5,3,5,6,2,6,4</span>
                                            </td>
                                            <td>华人</td>
                                            <td> 100</td>
                                        </tr>
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

                            <div id="jstree1">
                                <ul>
                                    <li class="jstree-open">类型
                                        <ul>
                                            <!-- 幼儿园 -->
                                            <li>幼儿园
                                                <ul>
                                                    <li>小蜻蜓幼儿园
                                                       <ul>
                                                           <li>2017-10-19
                                                               <ul>
                                                                   <li data-jstree='{"type":"img"}'>国庆节活动</li>
                                                                   <li data-jstree='{"type":"img"}'>欢度中秋节</li>
                                                               </ul>
                                                           </li>
                                                       </ul>

                                                    </li>

                                                    <li>育秀幼儿园
                                                        <ul>
                                                            <li>2017-10-19
                                                                <ul>
                                                                    <li data-jstree='{"type":"img"}'>国庆节活动</li>
                                                                    <li data-jstree='{"type":"img"}'>欢度中秋节</li>
                                                                </ul>
                                                            </li>
                                                        </ul>

                                                    </li>

                                                </ul>

                                            </li>

                                            <!-- 小学 -->
                                            <li>小学
                                                <ul>
                                                    <li>西渡小学
                                                        <ul>
                                                            <li>2017-09-11
                                                                <ul>
                                                                    <li data-jstree='{"type":"img"}'>教师节活动</li>
                                                                </ul>
                                                            </li>
                                                        </ul>

                                                    </li>

                                                </ul>

                                            </li>


                                            <!-- 中学 -->
                                            <li>中学
                                                <ul>
                                                    <li>邬桥学校
                                                        <ul>
                                                        <li>2017-09-01
                                                            <ul>
                                                                <li data-jstree='{"type":"img"}'>学生运动会</li>
                                                                <li data-jstree='{"type":"img"}'>教学节活动</li>
                                                            </ul>
                                                         </li>
                                                        </ul>

                                                    </li>

                                                </ul>

                                            </li>

                                            <!-- 高中 -->
                                            <li>高中
                                                <ul>
                                                    <li>致远高中
                                                        <ul>
                                                            <li>2017-05-03
                                                                <ul>
                                                                    <li data-jstree='{"type":"img"}'>学生节活动</li>
                                                                    <li data-jstree='{"type":"img"}'>校园植树节</li>
                                                                </ul>
                                                            </li>
                                                        </ul>

                                                    </li>

                                                </ul>

                                            </li>



                                            <!-- 九年制    class="jstree-open" -->
                                            <li>九年制
                                                <ul>
                                                    <li>华亭学校
                                                        <ul>
                                                        <li>2017-04-13
                                                            <ul>
                                                                <li data-jstree='{"type":"img"}'>喜庆端午节</li>
                                                            </ul>
                                                        </li>
                                                        </ul>

                                                    </li>

                                                </ul>

                                            </li>



                                        </ul>
                                    </li>
                                </ul>
                            </div>

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



</body>
</html>
