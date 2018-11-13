
function checkText(str){
	 return !(/^[^\|"'<>]*$/.test(str));
}

function strlen(str){
	var len = 0;
    for (var i=0; i<str.length; i++) { 
    	var c = str.charCodeAt(i); 
    	//单字节加1 
    	if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) { 
    		len++; 
    	} else { 
    		len+=2; 
    	} 
    } 
    return len;
}
//根据顶部标题名称变化
function changeTopName(){
	var topName =$("#topName").val();
	$("#titleName").children("p").text(topName);
}


//切换换肤背景类型
function getTypeBg(){
	alert(11);
	var typeBg = $("#typeBg").val();
	$("#bg2").css("display","none");
	$("#bgColor").val("");
	$("#bgColorBlock").css("background-color","");
	$("#bg").val("");
	if(typeBg != ""){
		$("#bg"+typeBg).css("display","");
	}
}

//填背景颜色显示到页面小方块中
function changeBgColor(){
	var bgColor = $("#bgColor").val();
	$("#bgColorBlock").css("background-color",bgColor);
	$("#bg").val(bgColor);
}