//切换启用和禁用状态
function toChangeDisplayStatus(id,isDisplay,page){
	location="/system/CmsActivityController/toChangeDisplayStatus.sc?id="+id+"&isDisplay="+isDisplay+"&page="+page;
}

//活动页刷新
function toF5Activity(id){
	// var url='http://192.168.211.173/smForCms.sc?sendType=activity&id='+id;
	var url='http://m.yougou.com/smForCms.sc?sendType=activity&id='+id;
	$.ajax({
		url:url,
		dataType:'jsonp',
		processData: false,
		type:'get',
		success:function(data){
			alert("已刷新!");
			/*alert(data.name);
			 if(data == "success"){
			 alert("首页刷新成功！");
			 }else{
			 alert("首页刷新失败!");
			 }*/
		},
		error:function(XMLHttpRequest, textStatus, errorThrown) {
			alert("已刷新!");
		}});
}

function updateStatusBatch(isDisplay,modifyStatus_url,refulshPage_url){
	var checkObj=$("input[name='chk']:checked");
	var ids ="";
	checkObj.each(function(index, element) {
	   if(index != 0){
		   ids+=";";
	   }
	   var vals=$(this).val().split(';');
	   ids += vals[0];
    });
	if(ids !=""){
		$.post(
			modifyStatus_url,
			{"ids":ids,"isDisplay":isDisplay},
			function(str){
				if(str == "success"){
					alert("修改状态成功");
					document.location=refulshPage_url;
				}else{
					alert("修改状态失败,请重新操作!");
				}
			}
		);
	}
}

//删除频道到回收站
function logicalDeleteById(id,isDisplay,page){
	if(isDisplay == 1){
		alert("该活动页是启用状态不允许删除");
	}else{
		if(window.confirm("确定要删除此项内容？")==true){
			location="/system/CmsActivityController/logicalDeleteById.sc?id="+id+"&page="+page;
		}
	}
}

//进入到添加活动页面
function toAddActivity(){
	location="/system/CmsActivityController/toAddActivity.sc";
}

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

//检验一级分类的名称
function checkName(){
	var name = $('#activityName').val();
	var actName = $("#actName").val();//编辑时活动页的原始名称
	if(name != "") {
		if(actName == ""){
			$.ajax({
				type:"POST",
				url:"/system/CmsActivityController/checkName.sc",
				data:{"activityName":name},
				success:function(data){
					if(data == "fail"){
						alert("该活动页名称已经存在，请重新输入！");
						$('#activityName').val('');
						$('#activityName').focus();
					}
				}
			});
		}else{
			if(name != actName){
				$.ajax({
					type:"POST",
					url:"/system/CmsActivityController/checkName.sc",
					data:{"activityName":name},
					success:function(data){
						if(data == "fail"){
							alert("该活动页名称已经存在，请重新输入！");
							$('#activityName').val('');
							$('#activityName').focus();
						}
					}
				});
			}
		}
	}
}

//保存活动页
function save(){
	var activityName =$("#activityName").val();
	if(activityName == null || activityName ==""){
	 	alert("请填写活动页名称!");
	 	return false;
	}
	if(checkText(activityName)){
		alert("活动页名称不能包含特殊字符！");
		return false;
	}
	if(strlen(activityName) > 20){
		alert("活动页名称长度超过了10个汉字或20个字母，请重新输入!");
		return false;
	}
	var topName =$("#topName").val();
	if(topName == null || topName ==""){
	 	alert("请填写顶部标题!");
	 	return false;
	}
	if(checkText(topName)){
		alert("顶部标题不能包含特殊字符！");
		return false;
	}
	if(strlen(topName) > 20){
		alert("顶部标题长度超过了10个汉字或20个字母，请重新输入!");
		return false;
	}
	  
	//产品线数据封装处理
	var productLineCodeStr ='';
	var productLineCodes = document.getElementsByName('productLineCodes');
	var productLineCodesLength =0;
	for(var i = 0 ; i < productLineCodes.length ;i++){
		if(productLineCodes[i].checked){
			productLineCodeStr +=productLineCodes[i].value+";";
			productLineCodesLength +=1; 
		}
	}
	// if(productLineCodeStr ==''){
	// 	alert("至少要选择一个关联平台.");
	// 	return false;
	// }
	if(productLineCodesLength == productLineCodes.length){
		productLineCodeStr ="ALL";
	}
	$("#productLineCode").val(productLineCodeStr);
	
	var shareContent =$("#shareContent").val();
	if(shareContent != null && shareContent !="" && strlen(shareContent) > 100){
		alert("分享说明长度超过了50个汉字或100个字母，请重新输入!");
		$("#shareContent").focus();
		return false;
	}
    $("#addActivityForm").submit();
}

//还原单条频道数据
function restoreActivityById(id,page){
	location="/cmsActivityController/restoreActivityById.sc?id="+id+"&page="+page;
}

//删除单条回收站频道数据
function physicalDeleteById(id,page){
	if(window.confirm("确定要删除此项内容？")==true){
		location="/cmsActivityController/physicalDeleteById.sc?id="+id+"&page="+page;
	}
}

//清空回收站
function emptyRecycle(){
	if(window.confirm("确定要删除所有内容？")==true){
		location="/cmsActivityController/emptyRecycle.sc";
	}
}

//还原回收站
function restoreAll(){
	if(window.confirm("确定要还原所有内容？")==true){
		location="/cmsActivityController/restoreAll.sc";
	}
}

function toEditActivity(id,page){
	location="/cmsActivityController/toEditActivity.sc?activityId="+id+"&mark=act";
}

//跳转到编辑导航页面
function toAddActNav(){
	var activityId = $("#activityId").val();
	var productLineCode = $("#productLineCode").val();
	location = "/system/CmsActivityController/toAddNav.sc?activityId="+activityId+"&productLineCode="+productLineCode;
}
//增加一个频道信息
function addNav(){
	var number = $(".nav").length;
	index = number+1;
	var clonenav="<div class='nav' id='nav"+index+"'>"+$(".nav").clone().html()+"</div>";		
	$(".nav").eq(number-1).after(clonenav);
	$(".nav").eq(number).find("input").eq(0).attr("id","navigationInput"+index).attr("list","navigationName"+index);
    $(".nav").eq(number).find("datalist").attr("id","navigationName"+index);
	$(".nav").eq(number).find("input").eq(1).attr("id","sortNo"+index).attr("name","actNavList["+(number)+"].sortNo");
	$(".nav").eq(number).find("input").eq(2).attr("id","navigationId"+index).attr("name","actNavList["+(number)+"].navigationId");
	$(".nav").eq(number).children(".closenav").attr("id",'closenav'+index);
	$("#navigationInput"+index).val("");
	$("#sortNo"+index).val("");
	$("#navigationId"+index).val("");
}
//删除一个频道信息
$(function(){
	$("body").on("click",".closenav",function(){
		var size=$(".nav").size();	
		if(size>1){		
			$(this).parent(".nav").remove();
			for(var i=0;i<size-1;i++){
				var m = i+1;
				$(".nav").eq(i).attr("id","nav"+m);
				$(".nav").eq(i).find("input").eq(0).attr("id","navigationInput"+m).attr("list","navigationName"+m);
			    $(".nav").eq(i).find("datalist").attr("id","navigationName"+m);
				$(".nav").eq(i).find("input").eq(1).attr("id","sortNo"+m).attr("name","actNavList["+(i)+"].sortNo");
				$(".nav").eq(i).find("input").eq(2).attr("id","navigationId"+m).attr("name","actNavList["+(i)+"].navigationId");
				$(".nav").eq(i).children(".closenav").attr("id",'closenav'+m);
			}
		}else{
			alert("至少需要关联一个频道！");
		}
	});
});

//保存导航信息
function saveActNav(){
	var num = $(".nav").length;
	for(var i=1;i<=num;i++){
		var navigationId = "";
		var input = $("#navigationInput"+i)[0];
    	var res = input.value;
    	if(!res || res==""){
    		alert("请选择频道!");
		 	return false;
    	}else{
    		var list = input.list;
    		var options = $("#"+list.id+" option[value='"+res+"']");
	    	if(options && options.length>0){
	    		var option = options[0];
	    		navigationId = option.id;
	    	}
    	}
    	
   		 if(navigationId == null || navigationId ==""){
		 	alert("请选择频道!");
		 	return false;
		 }
   		 $("#navigationId"+i).val(navigationId);
   		 
   		 var sortNo = $("#sortNo"+i).val();
   		 if(sortNo == null || sortNo ==""){
   			 alert("请输入排序号！");
   			 return false;
   		 }
	}
	$("#addActNavForm").submit();
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

//复制活动页
function copyActivity(id){
    location="/system/CmsActivityController/copyActivity.sc?activityId="+id;
}

//批量删除活动页
function logicalDeleteBatch(){
	var checkObj=$("input[name='chk']:checked");
	var ids ="";
	checkObj.each(function(index, element) {
		if(index != 0){
			ids+=";";
		}
		var vals=$(this).val().split(';');
		ids += vals[0];
	});
	if(ids !=""){
		if(window.confirm("确定要批量删除此项内容？")==true){
            $.post("/system/CmsActivityController/logicalDeleteBatch.sc",{"ids":ids}, function(str){
                    if(str == "success"){
                        alert("批量删除成功");
                        document.location="/system/CmsActivityController/queryCmsActivityPage.sc";
                    }else{
                        alert("批量删除失败,请重新操作!");
                    }
                }
            );
        }
	}
}