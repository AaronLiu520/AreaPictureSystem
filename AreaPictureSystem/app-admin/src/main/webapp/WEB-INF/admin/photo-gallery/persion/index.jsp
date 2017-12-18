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


            <!-- index show new image message-->
            <div class="row">
          
                
                     <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>个人图片库 <small>按时间找主题</small></h5>

                        </div>
                        <div class="ibox-content">

                            <%@include file="../persion/treetime.jsp" %>

                        </div>
                    </div>
                </div>


                <div class="col-lg-6">

                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>操作 <small>添加与查找</small></h5>
                            </div>
                            <div class="ibox-content">
                                <div class="widget style1 navy-bg">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/photoMessageAction/index/PERSION">
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

                                <div class="widget style1 lazur-bg">
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

                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>最近（每日图片上传分析）</h5>
                            </div>
                            <div class="ibox-content">

                                <div class="flot-chart">
                                    <div class="flot-chart-content" id="flot-line-chart"></div>
                                </div>
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

   	

    <!-- 图表统计 -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/flot/jquery.flot.js"></script>
    <script>
                // 时间轴（活动的单事件）
        function checkActivity(id){
            window.location.href="${pageContext.request.contextPath}/photoMessageAction/checkActivity/PERSION?checkId="+id
        }
    </script>
    
     <script>
        $(function() {
            var barOptions = {
                series: {
                    lines: {
                        show: true,
                        lineWidth: 2,
                        fill: true,
                        fillColor: {
                            colors: [{
                                opacity: 1.0
                            }, {
                                opacity: 0.0
                            }]
                        }
                    }
                },
                xaxis: {
                    ticks:20, 
                    tickDecimals: 0,
                },
                yaxis:{
                	ticks:10,   
                	min: 0,   
                	tickDecimals:0 ,   
                },
                colors: ["#1ab394"],
                grid: {
                    color: "#999999",
                    hoverable: true,
                    clickable: true,
                    tickColor: "#D4D4D4",
                    borderWidth:0
                },
                legend: {
                    show: false
                },
                tooltip: true,
                tooltipOpts: {
                    content: "x: %x, y: %y"
                }
            };	
            var barData = {
                label: "bar",
                data: [
                	<c:forEach items="${uploadList1}" var="items" varStatus="status">
               		 ${items },
               	 </c:forEach>
                ]
            };
            $.plot($("#flot-line-chart"), [barData], barOptions);



            
            
            // 节点提示  
            function showTooltip(x, y, contents) {  
                $('<div id="tooltip">' + contents + '</div>').css( {  
                    position: 'absolute',  
                    display: 'none',  
                    top: y + 10,  
                    left: x + 10,  
                    border: '1px solid #fdd',  
                    padding: '2px',  
                    'background-color': '#dfeffc',  
                    opacity: 0.80  
                }).appendTo("body").fadeIn(200);  
            }  
      
            var previousPoint = null;  
            // 绑定提示事件  
            $("#flot-line-chart").bind("plothover", function (event, pos, item) {  
                if (item) {  
                    if (previousPoint != item.dataIndex) {  
                        previousPoint = item.dataIndex;  
                        $("#tooltip").remove();  
                        var y = item.datapoint[1].toFixed(0);  
      
                        var tip = "上传数：";  
                        showTooltip(item.pageX, item.pageY,tip+y);  
                    }  
                }  
                else {  
                    $("#tooltip").remove();  
                    previousPoint = null;  
                }  
            
            }); 
            
            
            
            
            
            
            
            
            
        });




    </script>
    
    

</body>
</html>
