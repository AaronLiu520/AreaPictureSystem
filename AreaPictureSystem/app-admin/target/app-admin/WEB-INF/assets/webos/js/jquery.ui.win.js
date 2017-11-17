var template;

var appidArr = new Array();

$(document).ready(function(e){
	
	$.fn.resized = function(element){
		if(element.attr('status')=='maximized'){
			
		}else{
			element.find('.window-header .panel-tool-max').removeClass('panel-tool-normal');
		}
	};
	
	$.fn.normal = function(){	//还原窗口
		var win = $(this).parents('.window');
		
		$('.taskbar-body ul li[appid="'+win.attr('appid')+'"]').css('background-color','#2880b4').parent().find('li.app').not($('.taskbar-body ul li[appid="'+win.attr('appid')+'"]')).css('background-color','#4b8fb7');

		win.css({'left': win.attr('win-left') + 'px', 'top': win.attr('win-top') + 'px','width':win.attr('win-width')+'px', 'height':win.attr('win-height')+'px'}).attr('status','normal').find('.window-body').css({'height':$(window).outerHeight() - 78,'width': $(window).outerWidth() - 15});;	
		
		//还原窗口后，重置状态按钮
		////由于最大化和还原按钮是同一个对象，需将panel-tool-max的click事件删除，否则会两个事件同时执行，产生冲突
		win.find('.window-header .panel-tool-normal').unbind('click').removeClass('panel-tool-normal').addClass('panel-tool-max');
		win.find('.panel-tool-max').click(function(){
			$(this).maximize();
		});
	};
	
	$.fn.maximize = function(){	//最大化窗口
		var win = $(this).parents('.window');
	
		$('.taskbar-body ul li[appid="'+win.attr('appid')+'"]').css('background-color','#2880b4').parent().find('li.app').not($('.taskbar-body ul li[appid="'+win.attr('appid')+'"]')).css('background-color','#4b8fb7');					
		win.attr('win-left', win.position().left).attr('win-top', win.position().top).attr('win-width',win.outerWidth()).attr('win-height',win.outerHeight());			
		win.css({'left':'0px','top':'0px','height':$(window).outerHeight() - 52,'width': $(window).outerWidth() - 12}).attr('status', 'maximized').find('.window-body').css({'height':$(window).outerHeight() - 78,'width': $(window).outerWidth() - 15});	
		win.find('.window-header .panel-tool-max').unbind('click').removeClass('panel-tool-max').addClass('panel-tool-normal');			
		//由于最大化和还原按钮是同一个对象，需将panel-tool-max的click事件删除，否则会两个事件同时执行，产生冲突
		win.find('.panel-tool-normal').click(function(){
			$(this).normal();
		});
	};
	
	$.extend({
		
		arrayDiskIcon:function(width, height){	//自动排列桌面图标
			var diskicon = $('.diskicon'), icons=$('.diskicon ul li');
			var n=parseInt($('.diskicon').outerHeight()/height);
			for(var i=0,len=icons.length; i<len; i++){
				icons.eq(i).css({'left':parseInt(i/n)*width+15+'px','top':i%n*height+15+'px'}).click(function(){	//单击选中当前图标
					$(this).addClass('active').parent().find('li').not(this).removeClass('active');
				}).dblclick(function(){	//双击执行图标程序
							
					//初始化加载窗口
					$.openWin($(this), {
						left:150,
						top:250,
						width:400,
						height:500
					});
				});	
			}
			
		},
		createAppID:function(n){	//生成不重复的appid
			var r = 0;
			while(r==0){
				r = Math.floor(Math.random()*n+1);
				//判断appid是否存在，如果存在则重新生成
				if($('.window[appid="'+r+'"]').attr('appid')=='underfine' || $('.window[appid="'+r+'"]').attr('appid')=='undefined' || $('.window[appid="'+r+'"]').attr('appid')==null){
					
				}else{
					r=0;
				}
			}	
				
			return r;
        },
		winActive:function (win) {	//激活窗口
			//取消其他非激活窗口标题高亮显示并将当前窗口标题栏高亮显示
			//激活窗口靠前显示，其他非激活窗口靠后显示
			$('.window').css('z-index','0').find('.window-title').css('background-color','#4b8fb7');
            win.css('z-index','9998').find('.window-title').css('background-color','#2880b4');
			//任务栏对应标签高亮显示
			$('.taskbar-body ul li[class="app"]').css('background-color','#4b8fb7').filter('[appid="' + win.attr('appid') + '"]').css('background-color','#2880b4');
			
		},
		minimize:function(win){	//最小化窗口
			win.attr('status','minimized').hide().find('.window-title').css('background-color','#4991BC');
			$('.taskbar-body ul li[appid="'+win.attr('appid')+'"]').css('background-color','#4991BC');
		},		
		
		showWin:function(win){	//显示当前窗口
			win.show().css('z-index','9998');
			$('.window').not(win).css('z-index','0');
			$('.taskbar-body ul li[appid="'+win.attr('appid')+'"]').css('background-color','#2880b4').parent().find('li.app').not($('.taskbar-body ul li[appid="'+win.attr('appid')+'"]')).css('background-color','#4b8fb7');
		},
		hideWin:function(win){	//隐藏当前窗口
			$('.taskbar-body ul li[appid="'+win.attr('appid')+'"]').css('background-color','#4991BC');
			win.css('z-index','0').hide();
		},
		openWin:function(settings, options){		//打开新窗口
	///////////新应用窗口/////////////
			if($('.taskbar-body ul li[class="app"]').length > 5){				
				alert('进程数已达上限，只允许运行最多6个进程.');
			}
			
			//获取Json属性
			var propertyString =  eval('('+settings.attr('data-property')+')');	
			
//			检查窗口是否已经登录过。
			for(var i = 0;i < appidArr.length; i++) {
				if(appidArr[i] == propertyString.appid){
					template=true;
				}
			}
			if(template==true){//该窗口已经打开。
				var win=$('.window[appid="'+propertyString.appid+'"]');			
				if(win.css('display')=='none'){			
					//还原当前窗口
					$.showWin(win);
				}else{
					if(win.css('z-index')=='9998'){
						$.hideWin(win);
					}else{
						$.winActive(win);
					}
				}
			}else{
				
				
				//判断是否允许加载重复窗体
				if(propertyString.multiple == 'false' && $('.window[path="' + settings.attr('path') + '"]').length > 0){	
					return false;
				}

				
				//创建AppId
//				var appid = $.createAppID(9999);
				var appid = propertyString.appid;
				appidArr.push(appid)
				//创建窗体对象
				var win = $('<div class="panel window" appid="' + appid + '" status="'+ propertyString.winstate +'" path="' + settings.attr('path') +'"></div>');
			
				//创建窗体头部对象
				var windowHeader = $('<div class="panel-header panel-header-noborder window-header" style="width: 100%;"></div>');
				//创建窗体标题栏对象
				var windowTitle = $('<div class="panel-title panel-with-icon">').append(propertyString.title).append('</div>');
				//创建图标对象
				var windowIocn = $('<div class="panel-icon">').addClass(propertyString.icon).append('</div>');
				//创建工具栏对象
				var windowTools = $('<div class="panel-tool"></div>');
				//创建折叠工具按钮
				var toolCollapse = $('<a class="panel-tool-collapse" href="javascript:void(0)"></a>');
				windowTools.append(toolCollapse);
				
				
				
				//判断是否允许出现最小化按钮
				if(propertyString.minimize == 'true'){
					var toolMinimize = $('<a class="panel-tool-min" href="javascript:void(0)"></a>').click(function(){
						$.minimize(win);
					});
					
					windowTools.append(toolMinimize);		
				}
				
				if(propertyString.maximize == 'true'){
					
					var normalButton = $('<span class="window-title-normal"><img src="/images/icon/16/window_normal.png" title="还原" ></span>').click(function(){
						$(this).normal();
					});
					
					if(propertyString.winstate=='maximized'){		
										
						var toolNormal = $('<a class="panel-tool-normal" href="javascript:void(0)"></a>').click(function(){
							
							$(this).normal();
						});		
						
						//创建还原按钮
						windowTools.append(toolNormal);
					}else{
						var toolMaximize = $('<a class="panel-tool-max" href="javascript:void(0)"></a>').click(function(){
							$(this).maximize();
						});		
						
						//创建还原按钮
						windowTools.append(toolMaximize);
					}
				}else{
									
				}
				
				//创建关闭按钮			
				var toolClose = $('<a class="panel-tool-close" href="javascript:void(0)"></a>').click(function(){
					$.winClose(win);
				});
				
				windowTools.append(toolClose);
							
				windowHeader.append(windowIocn);
				windowHeader.append(windowTitle);
				windowHeader.append(windowTools);
				
				//创建内容框
				var winContent = $('<div class="easyui-window panel-body panel-body-noborder window-body" title="" data-options="iconCls:\'icon-save\'" style="margin-right:3px;width: 100%; height: 100%; display: block;"></div>');
				
					
				//移动窗体
				windowHeader.mousedown(function(event){
					$.winMove(win, event);
				});
				
				win.append(windowHeader);
				win.append(winContent);
							
				$('.window').css('z-index','0');
				win.attr('status', status)
				
				var styleString =  eval('('+ settings.attr('data-style')+')');			
				//获取data-css中的样式配置信息并初始窗体样式
				$.each(styleString, function(index, element){
					win.css(element.name, element.value).attr('win-'+element.name, element.value);		
				});	

				winContent.css({'height':parseInt(win.css('height')) - 25,'width':parseInt(win.css('width')) - 2});			
				
				//初始化窗口的位置和大小
				win.css({'z-index':'9998','opacity':'0'});
				
				
					//加载窗体到桌面
					//加载窗体到桌面
					$('body').append(win);
					
					win.fadeTo(500, 1);

					var taskbar = $('<li class="app" appid="' + appid + '" path="' + settings.attr('path')+'"><span class="taskbar-body-icon ' + propertyString.icon + '"></span><span class="taskbar-body-text">' + propertyString.title + '</span></li>').click(function(){
						$.taskbarClick($(this));
					});
					
					$('.taskbar-body ul').append(taskbar);
								
					//激活当前窗口和对应任务栏标签并高亮显示
					$.winActive(win);
					
					//如果窗体标注需要通过iframe框架加载
					if(propertyString.target == 'iframe'){
						winContent.append('<iframe src="' + settings.attr('path') + '" frameborder="0" height="100%" width="100%" id="dialogFrame" scrolling="no"></iframe>');				
					}
			}
			
			
		
			
				
			
			
			
			
			
			
			
			
			//如果窗体标注需要通过ajax标签填充
			if(propertyString.target == 'html'){
				
				$.ajax({
					type: 'get',
					url: settings.attr('path'),
					dataType: 'html',
					data: { },
					beforeSend: function (XMLHttpRequest) {
						winContent.html('<img src="/images/admin/loading.gif" />');
					},
					success: function (dataHtml, textStatus) {
						if(textStatus=='success'){
							winContent.html(dataHtml);
						}
					},
					complete: function (XMLHttpRequest, textStatus) {
						//HideLoading();
					},
					error: function (err) {
						
					}
				});
			
			}
		},
		
		winMove:function(win, event){			
			//如果窗口被最大化，则移动失效
			if(win.attr('status') == 'maximized'){return false;}
						
			//激活当前窗口和对应任务栏标签并高亮显示
			$.winActive(win);
			
			var isFlag = true;  
			//鼠标与div左上角相对位置
			var divX = event.pageX - parseInt(win.css("left")),divY = event.pageY - parseInt(win.css("top"));
			//移动窗体事件，动态改变窗体位置
			$(document).mousemove(function (e) {  
				if (isFlag) { 
					//窗体不能超过桌面左侧边界
					//if(event.pageX < 0){win.css('left', '0px');}
					//窗体不能超过桌面顶部边界
					//if(event.pageY < 0){win.css('top', '0px');}
					//窗体不能超过桌面任务栏，以免造成鼠标无法点中窗体任务栏
					//if(event.pageY > $(window).outerHeight() - $('.taskbar').height() - 10){win.css('top',($(window).outerHeight() - $('.taskbar').height()-10) + 'px');}
					//以上条件以外的位置可进行随意移动窗体
					//if(e.pageX >0 && e.pageY>0 && e.pageY < $(window).outerHeight() - $('.taskbar').height() - 10){
					win.css({'left':e.pageX - divX, 'top':e.pageY - divY});  
					//}
					//win.fadeTo(20,0.5);
				}  
			}).mouseup(function (e) {  				
				isFlag = false; 
				//删除文档的鼠标移动事件
				$(document).unbind('mousemove');
				//win.fadeTo(20,1);//松开鼠标后停止移动并恢复成不透明
			});  		
		},
		winClose:function(win){	//关闭窗口
			$('.taskbar-body ul li[appid="'+win.attr('appid')+'"]').remove();		
			win.remove();	
		},
		
		taskbarClick:function(taskbar){
			var win=$('.window[appid="'+taskbar.attr('appid')+'"]');			
			if(win.css('display')=='none'){			
				//还原当前窗口
				$.showWin(win);
			}else{
				if(win.css('z-index')=='9998'){
					$.hideWin(win);
				}else{
					$.winActive(win);
				}
			}
		},
		
		Init:function(){	//初始化桌面UI
			//禁止右键
			$(document).bind("contextmenu",function(e){   
				//return false;   
			}).click(function(){
				
				$('.diskicon ul li').removeClass('active');
				
			});
	
			//初始化桌面右侧停靠栏位置
			$('.dock').css('top',(($(window).outerHeight()-$('.dock').height())/2)+'px');
			
			//初始化桌面图标容器高度
			$('.diskicon').css('height',($(window).outerHeight()-90)+'px');
			
			//初始化桌面图标排列
			$.arrayDiskIcon(105, 95);
			
			$(window).resize(function(){
	
				//桌面右侧停靠栏位置智能调整
				$('.dock').css('top',(($(window).outerHeight()-$('.dock').height())/2)+'px');
				
				//桌面图标容器高度智能调整
				$('.diskicon').css('height',($(window).outerHeight()-90)+'px');
				
				//桌面图标智能化排版
				$.arrayDiskIcon(100, 95);
			});		
		},
		resize:function(win){	//改变窗口大小
			var src_posi_Y = 0, dest_posi_Y = 0, move_Y = 0, is_mouse_down_Y = false, destHeight = 30, src_posi_X = 0, dest_posi_X = 0, move_X = 0,is_mouse_down_X = false,  destWidth = 30;
			
			win.find('.window-footer').mousedown(function(e){				
				src_posi_Y = e.pageY;
				is_mouse_down_Y = true;
			});
			win.find('.window-right').mousedown(function(e){				
				src_posi_X = e.pageX;
				is_mouse_down_X = true;
			});
			$(document).bind("click mouseup",function(e){
				if(is_mouse_down_Y || is_mouse_down_X){
				  is_mouse_down_Y = is_mouse_down_X = false;
				}
			}).mousemove(function(e){
				if(is_mouse_down_Y){
					dest_posi_Y = e.pageY;
					move_Y = src_posi_Y - dest_posi_Y;
					src_posi_Y = dest_posi_Y;
					destHeight = win.height() - move_Y;
					if(is_mouse_down_Y){
						win.css("height", destHeight > 30 ? destHeight : 30);
					}
				}else{					
					dest_posi_X = e.pageX;
					move_X = src_posi_X - dest_posi_X;
					src_posi_X = dest_posi_X;
					destWidth = win.width() - move_X;
					if(is_mouse_down_X){
						win.css("width", destWidth > 30 ? destWidth : 30);
					}
				}
			});
			
		}
		
	});
	
});