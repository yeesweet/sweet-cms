//切换启用和禁用状态
function toChangeDisplayStatus(id,isDisplay,page){
	location="/system/CmsNavigationController/toChangeDisplayStatus.sc?id="+id+"&isDisplay="+isDisplay+"&page="+page;
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

//进入到添加频道页面
function toAddNavigation(){
	location="/system/CmsNavigationController/toAddNavigation.sc";
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
	var navigationName =$("#navigationName").val();
	if(navigationName == null || navigationName ==""){
	 	alert("请填写频道名称!");
	 	return false;
	}
	if(checkText(navigationName)){
		alert("频道名称不能包含特殊字符！");
		return false;
	}
	if(strlen(navigationName) > 20){
		alert("频道名称长度超过了10个汉字或20个字母，请重新输入!");
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
	if(productLineCodeStr ==''){
		alert("至少要选择一个关联平台.");
		return false;
	}
	if(productLineCodesLength == productLineCodes.length){
		productLineCodeStr ="ALL";
	}
	$("#productLineCode").val(productLineCodeStr);
    $("#form1").submit();
}

//删除频道数据
function physicalDeleteById(id,isDisplay,page){
	if(isDisplay == 1){
		alert("该活动页是启用状态不允许删除");
	}else{
		if(window.confirm("确定要删除此项内容？")==true){
			location="/system/CmsNavigationController/physicalDeleteById.sc?id="+id+"&page="+page;
		}
	}
}

function toEditNavigation(id,page){
	location="/system/CmsNavigationController/toEditNavigation.sc?navigationId="+id+"&mark=nav";
}

function edit(){
	var navigationName =$("#navigationName").val();
	if(navigationName == null || navigationName ==""){
	 	alert("请填写频道名称!");
	 	return false;
	}
	if(checkText(navigationName)){
		alert("频道名称不能包含特殊字符！");
		return false;
	}
	if(strlen(navigationName) > 20){
		alert("频道名称长度超过了10个汉字或20个字母，请重新输入!");
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
	if(productLineCodeStr ==''){
		alert("至少要选择一个关联平台.");
		return false;
	}
	if(productLineCodesLength == productLineCodes.length){
		productLineCodeStr ="ALL";
	}
	$("#productLineCode").val(productLineCodeStr);
	
	var moduleIds = "";
	$("input[name='moduleId']").each(function(){
		if($(this).val() != ""){
			moduleIds += $(this).val()+";";
		}
	});
	$("#moduleIds").val(moduleIds);
    $("#editNavigationForm").submit();
}


