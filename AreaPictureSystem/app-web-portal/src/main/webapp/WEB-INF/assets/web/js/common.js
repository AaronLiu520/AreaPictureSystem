//网站js
function toApply(o1,o2){
	
	if(o1 !=""){
		var data = "id="+o1+"&type="+o2;
		window.location.href="apply?"+data;
	}
	
}

//查看活动介绍
function findpara1(){
	$("#introduce").toggle(1000);
}