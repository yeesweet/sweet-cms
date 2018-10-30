
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

//添加图片
function selectImage(){
	ImageSelector.open(6,function(json){
	// 通过约定格式获取选定数据
		$.each(json,function(n,value) {
			$('#shareImg').val(value.imgName);
			$("#iptimg").attr("src",value.imgName);
		});
	});
}

//上传图片
function ajaxImageUpload(em) {
	var $this = $(em);
	var imgType =	$("#imgType").val();
	var file = $("#fileimg").val();
	if(file==""){
		alert("请选择文件");
		return false;
	} 
	var fileInput = $("#fileimg")[0];
    byteSize  = fileInput.files[0].size;
    var fileSize = Math.floor(byteSize / 1024);
	var fileType = file.substring(file.lastIndexOf(".")+1);
	if(fileType.toLowerCase()=="gif" && fileSize > 100){
		alert("上传GIF格式图片大小不能超过100KB！");
		return false;
	} else if (fileType.toLowerCase()!="gif" && fileSize > 60){
		alert("上传图片大小不能超过60KB！");
		return false;
	}
	if(fileType.toLowerCase()!="jpg" && fileType.toLowerCase()!="png" && fileType.toLowerCase()!="gif" && fileType.toLowerCase()!="bmp"){
		 alert("只能上传图片!");
		 return false;
	 }else{
		 $.ajaxFileUpload({
	            url: '/system/cmsImageControler/uploadImage.sc?type='+imgType, 
	            type: 'post',
	            secureuri: false, //一般设置为false
	            fileElementId: 'fileimg', // 上传文件的id、name属性名
	            dataType: 'json', //返回值类型，一般设置为json、application/json
	            success: function(data){  
	                if(data.status == "success"){
	                	alert("上传成功！");
	                	$("#iptimg").attr("src",data.picpath);
		                $("#shareImg").val(data.picpath);
	                }else{
	                	alert(data.errorDesc);
	                	$("#iptimg").attr("src","/images/icon/moren.png");
	                }
	            },
	            error: function(data, e){ 
	                alert(e);
	                alert("上传失败！");
	                $("#iptimg").attr("src","/images/icon/moren.png");
	            }
	      });
	 }
}
	
function closeImg(){
	$("#shareImg").val("");
	$("#iptimg").attr("src","/images/homepage/1img2.jpg");
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