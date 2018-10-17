//上传背景图片
function ajaxImageUploadBg(em) {
	var $this = $(em);
	var id =$this.attr("id").substring(9);
	var file = $("#fileimg"+id).val();
	if(file==""){
		alert("请选择文件");
		return false;
	} 
	var fileInput = $("#fileimg"+id)[0];
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
	            url: '../cmsImageControler/uploadImage.sc?type=1', 
	            type: 'post',
	            secureuri: false, //一般设置为false
	            fileElementId: 'fileimg'+id, // 上传文件的id、name属性名
	            dataType: 'json', //返回值类型，一般设置为json、application/json
	            success: function(data){  
	                if(data.status == "success"){
	                	alert("上传成功！");
	                	$("#iptimg"+id).attr("src",data.picpath);
		                $("#bg").val(data.picpath);
	                }else{
	                	alert(data.errorDesc);
	                	$("#iptimg"+id).attr("src","/images/homepage/2img1.jpg");
	                }
	            },
	            error: function(data, e){ 
	                alert(e);
	                alert("上传失败！");
	                $("#iptimg"+id).attr("src","/images/homepage/2img1.jpg");
	            }
	        });
	 }
}

//选择背景图片方法
function selectBgImage(){
 	ImageSelector.open(1,function(json){
 		//通过约定格式获取选定数据
 		$.each(json,function(n,value) {
 			var imgUrl = value.imgName;
 			$("#iptimg0").attr("src",imgUrl);
            $("#bg").val(imgUrl);
 		});
 	});
 }

//切换换肤背景类型
function getTypeBg(){
	var typeBg = $("#typeBg").val();
	$("#bg1").css("display","none");
	$("#bg2").css("display","none");
	$("#iptimg0").attr("src","/images/homepage/2img1.jpg");
	$("#bgColor").val("");
	$("#bgColorBlock").css("background-color","");
	$("#bg").val("");
	if(typeBg != ""){
		$("#bg"+typeBg).css("display","block");
	}
}

//填背景颜色显示到页面小方块中
function changeBgColor(){
	var bgColor = $("#bgColor").val();
	$("#bgColorBlock").css("background-color",bgColor);
	$("#bg").val(bgColor);
}

//删除图片
$("body").on("click",".closeBg",function(){
	$("#iptimg0").attr("src","/images/homepage/2img1.jpg");
	$("#bg").val("");
});