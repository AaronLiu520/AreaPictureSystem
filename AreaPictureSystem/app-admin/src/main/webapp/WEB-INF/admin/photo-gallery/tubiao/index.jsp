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


         

                <div class="col-md-6">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>最近区域（每日图片上传分析）</h5>
                            </div>
                                 <div class="flot-chart" style="width:700px ">
                                    <div class="flot-chart-content" id="flot-line-chart1" ></div>
                                 </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-6">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>最近直属（每日图片上传分析）</h5>
                            </div>
                                <div class="flot-chart" style="width:700px ">
                                    <div class="flot-chart-content" id="flot-line-chart2" ></div>
                                </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-6" style="margin-top: 100px">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>最近基层（每日图片上传分析）</h5>
                            </div>
                                <div class="flot-chart" style="width:700px">
                                    <div class="flot-chart-content" id="flot-line-chart3" ></div>
                                </div>
                        </div>
                    </div>
                </div>
           
                    <div class="col-md-6" style="margin-top: 100px">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>最近个人（每日图片上传分析）</h5>
                            </div>
                                <div class="flot-chart" style="width:700px">
                                    <div class="flot-chart-content" id="flot-line-chart4" ></div>
                                </div>
                        </div>
                    </div>
                </div>
           
            </div>
        </div><!-- end message center-->


        <%@include file="../../public/botton.jsp" %>
    </div>



   	

    <!-- 图表统计 -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/flot/jquery.flot.js"></script>
   
    //区域的
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
                	<c:forEach items="${uploadListarea}" var="items" varStatus="status">
               		 ${items },
               	 </c:forEach>
               		 ]
            };
            $.plot($("#flot-line-chart1"), [barData], barOptions);
            

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
            $("#flot-line-chart1").bind("plothover", function (event, pos, item) {  
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
    
    //直属的
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
                	<c:forEach items="${uploadListdirect}" var="items" varStatus="status">
               		 ${items },
               	 </c:forEach>
               		 ]
            };
            $.plot($("#flot-line-chart2"), [barData], barOptions);
            

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
            $("#flot-line-chart2").bind("plothover", function (event, pos, item) {  
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
    
    
    //基层的
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
                	<c:forEach items="${uploadListbase}" var="items" varStatus="status">
               		 ${items },
               	 </c:forEach>
               		 ]
            };
            $.plot($("#flot-line-chart3"), [barData], barOptions);
            

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
            $("#flot-line-chart3").bind("plothover", function (event, pos, item) {  
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
    
    //个人的
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
                	<c:forEach items="${uploadListgeren}" var="items" varStatus="status">
               		 ${items },
               	 </c:forEach>
               		 ]
            };
            $.plot($("#flot-line-chart4"), [barData], barOptions);
      

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
            $("#flot-line-chart4").bind("plothover", function (event, pos, item) {  
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
