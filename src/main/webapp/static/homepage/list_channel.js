//切换显示和隐藏频道状态
function toChangeShowStatus(channelId,isShow,page,productLineCode){
	location="/system/cmsChannelController/toChangeDisplayStatus.sc?channelId="+channelId+"&isShow="+isShow+"&page="+page+"&productLineCode="+productLineCode;
}

//切换启用和禁用频道状态
function toChangeDisplayStatus(channelId,isDisplay,page,productLineCode){
	location="/system/cmsChannelController/toChangeDisplayStatus.sc?channelId="+channelId+"&isDisplay="+isDisplay+"&page="+page+"&productLineCode="+productLineCode;
}

function updateStatusBatch(isDisplay,isShow,modifyStatus_url,refulshPage_url){
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
			{"ids":ids,"isDisplay":isDisplay,"isShow":isShow},
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
function logicalDeleteById(channelId,isDisplay,page,productLineCode){
	if(isDisplay == 1){
		alert("该频道是启用状态不允许删除");
	}else{
		if(window.confirm("确定要删除此项内容？")==true){
			location="/system/cmsChannelController/logicalDeleteById.sc?channelId="+channelId+"&page="+page+"&productLineCode="+productLineCode;
		}
	}
}

//进入到添加频道页面
function toAddChannel(productLineCode){
	location="/system/cmsChannelController/toAddChannel.sc?productLineCode="+productLineCode;
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

//保存频道
function save(){
	var channelName =$("#channelName").val();
	if(channelName == null || channelName ==""){
	 	alert("请填写频道名称!");
	 	return false;
	}
	if(checkText(channelName)){
		alert("频道名称不能包含特殊字符！");
		return false;
	}
	if(strlen(channelName) > 12){
		alert("频道名称长度超过了6个汉字或12个字母，请重新输入!");
		return false;
	}
	  
 	//产品线数据封装处理
	var productLineCodeStr ='';
	var productLineCodes = document.getElementsByName('productLineCodeA');
	var productLineCodesLength =0;
	for(var i = 0 ; i < productLineCodes.length ;i++){
		if(productLineCodes[i].checked){
			productLineCodeStr += productLineCodes[i].value+";";
			productLineCodesLength += 1;
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
    $("#addChannelForm").submit();
}

//还原单条频道数据
function restoreChannelById(channelId,page,productLineCode){
	location="/system/cmsChannelController/restoreChannelById.sc?channelId="+channelId+"&page="+page+"&productLineCode="+productLineCode;
}

//删除单条回收站频道数据
function physicalDeleteById(channelId,page,productLineCode){
	if(window.confirm("确定要删除此项内容？")==true){
		location="/system/cmsChannelController/physicalDeleteById.sc?channelId="+channelId+"&page="+page+"&productLineCode="+productLineCode;
	}
}

//清空回收站
function emptyRecycle(productLineCode){
	if(window.confirm("确定要删除所有内容？")==true){
		location="/system/cmsChannelController/emptyRecycle.sc?productLineCode="+productLineCode;
	}
}

//还原回收站
function restoreAll(productLineCode){
	if(window.confirm("确定要还原所有内容？")==true){
		location="/system/cmsChannelController/restoreAll.sc?productLineCode="+productLineCode;
	}
}

//向上移动
function up(obj) {
	var objParentTR = $(obj).parent().parent();
	var prevTR = objParentTR.prev();
	if (prevTR.length > 0) {
		prevTR.insertAfter(objParentTR);
	}
}
//向下移动
function down(obj) {
	var objParentTR = $(obj).parent().parent();
	var nextTR = objParentTR.next();
	var nextCheckbox = nextTR.children().find('[name=chk]').val().split(';');
	if (nextTR.length > 0 && nextCheckbox[1] == 1) {
		nextTR.insertBefore(objParentTR);
	}
}

//修改频道排序
function updateSortNo(productLineCode,page){
	var checkObj=$("input[name='chk']");
	var ids ="";
	checkObj.each(function(index, element) {
	   var vals=$(this).val().split(';');
	   if(vals[1] == 1){
		   if(index != 0){
			   ids+=";";
		   }
		   ids += vals[0];
	   }
    });
	
	if(ids != null){
		$.post(
			"/system/cmsChannelController/updateSortNo.sc",
			{"ids":ids},
			function(str){
				if(str == "success"){
					alert("保存排序成功!");
					document.location="/system/cmsChannelController/queryChannelPage.sc?productLineCode="+productLineCode+"&page="+page;
				}else{
					alert("保存排序失败!");
				}
			}
		);
	}
}

function toEditChannel(channelId,page,productLineCode){
	location="/system/cmsChannelController/toEditChannel.sc?channelId="+channelId+"&productLineCode="+productLineCode;
}

function edit(){
	var channelName =$("#channelName").val();
	if(channelName == null || channelName ==""){
		alert("请填写频道名称!");
	 	return false;
	}
	if(checkText(channelName)){
		alert("频道名称不能包含特殊字符！");
		return false;
	}
	if(strlen(channelName) > 12){
		alert("频道名称长度超过了6个汉字或12个字母，请重新输入!");
		return false;
	}
	
 	//产品线数据封装处理
	var productLineCodeStr ='';
	var productLineCodes = document.getElementsByName('productLineCodeE');
	var productLineCodesLength =0;
	for(var i = 0 ; i < productLineCodes.length ;i++){
		if(productLineCodes[i].checked){
			productLineCodeStr += productLineCodes[i].value+";";
			productLineCodesLength += 1;
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
	var boardIds = "";
	$("input[name='boardId']").each(function(){
		if($(this).val() != ""){
			boardIds += $(this).val()+";";
		}
	});
	$("#boardIds").val(boardIds);
    $("#editChannelForm").submit();
}

//编辑频道切换提示
function changeEditChannel(){
	alert("抱歉，您只能编辑当前频道页");
}

//编辑页返回按钮提示
function editReturn(){
	var windowHeight=$(window).height(); 
	var windowWidth=$(window).width(); 
	var popHeight=$(".tanchu").height();
	var popWidth=$(".tanchu").width(); 
	var popY=(windowHeight-popHeight)/2; 
	var popX=(windowWidth-popWidth)/2;
	$(".tc").slideToggle("slow"); 
	$(".tanchu").css("top",popY).css("left",popX);
}
//弹框保存
$("#dialogYes").click(function(){ 
	$(this).parent().parent().hide("slow");
	edit();
}); 
//弹框否
$("#dialogNo").click(function(){ 
	$(this).parent().parent().hide("slow");
	var productLineCode = $("#productLineCodeN").val();
	location = "/system/cmsChannelController/queryChannelPage.sc?productLineCode="+productLineCode;
}); 
//弹框取消
$("#dialogCancel").click(function(){ 
	$(this).parent().parent().hide("slow");
}); 
