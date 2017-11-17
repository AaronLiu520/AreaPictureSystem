/*
 * explorer浏览器中的jquery效果
 */

$(document).ready(function(e) {
	//在iframe中查找父页面元素
	//alert($('.diskicon ul li', window.parent.document).length);
	//在iframe中调用父页面中定义的方法
	
	$('.explorer ul li').dblclick(function(){
		//初始化加载窗口
		parent.$.openWin($(this), true, true,'normal',{
			left:150,
			top:250,
			width:400,
			height:500
		});
	});	
   
	//在iframe中调用父页面中定义的变量
	//alert(parent.hello);
});