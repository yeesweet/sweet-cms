		
//全局变量
var idIsExists=false;//编号是否存在
var commodityNos="";//已添加的商品编号

//按编号添加商品
function addCommodityByIds(obj){
	var commodityText1 = $.trim($(obj).prev().prev().prev().val());
	if(commodityText1==""){
		alert("请输入商品编号！");
		return;
	}
	// 过滤掉所有空格
	var myIdsLine = "";
    if(commodityText1.indexOf(",")>=0){
        myIdsLine = commodityText1.split(',');
    }else{
        myIdsLine = commodityText1.split('\n');
    }
    var commodityText = "";
    for(var i=0;i<myIdsLine.length;i++){
		commodityText = commodityText.concat(myIdsLine[i].replace(/\s/ig,'')).concat("\n");
	}

	//验证输入的商品编号
	var patten=/^[0-9,\r\n]+$/;
	if(!patten.test(commodityText)){
		alert("商品编号填写不合法，注意多个编号之间用英文逗号或换行隔开！");
		$(obj).prev().prev().prev().select();
		return false;
	}

	var myIds = "";
	if(commodityText.indexOf(",")>=0){
		myIds = commodityText.split(',');
	}else{
		myIds = commodityText.split('\n');
	}
	if(myIds.length>100){
		alert("提交编号过多，最多可以添加100个商品，请减少编号数量！本次录入了"+myIds.length+"个商品编号。");
		$(obj).prev().prev().prev().select();
		return false;
	}
	for(var i=0;i<myIds.length;i++){
		if(myIds[i] !="" && commodityNos.indexOf(myIds[i])>=0){
			alert("编号为"+myIds[i]+"的商品已经添加过了！请删掉在添！");
			$(obj).prev().prev().prev().select();
			return false;
		}
	}
	var myId = "";
	for(var i=0;i<myIds.length;i++){
		if(i == myIds.length-1){
			myId += myIds[i];
		}else{
			myId += myIds[i] + ",";
		}
	}
	var sortNum=commodityNos.split(",").length-1;//排序号等于上次添加的商品的最大排序号开始
	if(commodityNos==""){
		sortNum=0;
	}
	//可以添加的商品编号 过滤下架的商品
	var comIds="";
	//将添加的商品页面节点显示出来
	var html="";//将填充到商品列表中的html代码
	//获得异步请求到得json数据
    $.getJSON("/topic/getCommodityByNo.sc?para=new Date()",{"commodityCodes":myId},function(data){
        var sellIds="";
        $.each(data.sellIds,function(i,item){
            myId=myId.substring(0,myId.indexOf(item))+myId.substring((myId.indexOf(item)+1)+(item+"").length);
            sellIds+=","+item;
        });
        if(sellIds!=""){
            alert("下面的商品是已经售罄的商品"+sellIds+"已被自动过滤掉!");
        }
        $.each(data.result, function(i,item){
            myId=myId.substring(0,myId.indexOf(item.commodityNo))+myId.substring((myId.indexOf(item.commodityNo)+1)+(item.commodityNo+"").length);
            commodityNos=commodityNos+item.commodityNo+",";
            comIds=comIds+item.commodityNo+",";
            if(item.status==2){
                item.status="上架";
            }else{
                item.status="下架";
            }
            html="<tr id='commodityNo_"+item.commodityNo+"' >"+
                "<td >" +
				"<input type='checkbox' name='chk' value='"+item.commodityNo+"' />" +
                "<input type='hidden' name='topicCommodityId' value='"+item.id+"' />"+
                "<input type='hidden' id='commodityNo'"+item.commodityNo+"' name='commodityNo'"+item.commodityNo+"' value='"+item.commodityNo+"'>"+
				"</td>"+
                "<td><img src="+item.defaultPic+" height='40px' width='40px' /><input type='hidden' name='commodityCode' value="+item.commodityNo+"></td>"+
                "<td>"+item.commodityName+"</td>"+
                "<td>"+item.commodityNo+"</td>"+
                "<td>"+item.stock+"</td>"+
                "<td>"+item.marketPrice+"</td>"+
                "<td>"+item.salePrice+"</td>"+
                "<td>"+item.propNo+"</td>"+
                "<td>"+item.status+"</td>"+
                "<td><input class='inputtxt' type='text' style='width:20px;' name='sortNoComm' value="+(sortNum+1+i)+" ></td>"+
                "<td><input type='button' class='btn-add-normal' onclick='deleteMyComm(this,"+item.commodityNo+")' value='删除' /></td></tr>";
            $("#commodityShow").append(html);
        });
		//将添加的商品保存到活动商品表
		if(comIds!=""){
			$.get("/topic/addCommodityByIds.sc?para=new Date()",{"commodityCodes":comIds,"id":$("#id").val(),"sortNum":sortNum},function(data){
				alert("添加商品成功！");
			});
		}

		if(html==""){
			alert("没有找到跟输入商品编号匹配的商品！");
		}else{
			alert("全部添加商品成功！");
		}

		if(myId!=""){
			alert("编号"+myId+"找不到商品");
		}
		//当前栏目的商品总数
		$("#commCount").html((commodityNos.split(",").length)-1);
		if(commodityNos==""){
			$("#commCount").html("0");
		}
	});

	var commodityLength = $("#commodityShow tr").length;
	if(commodityLength ==0){
		$("#commodityCheckboxlist").hide();
	}else{
		$("#commodityCheckboxlist").show();
	}
}

function allChk(obj,chkName){
    var id = obj.id;
    if($("#"+id).prop("checked")) {
        $("input[name='"+chkName+"']").prop("checked",'true');//全选
    }else{
        $("input[name='"+chkName+"']").removeProp("checked");//取消全选
    }
}


// //添加商品
// function addActityCommodity(){
// 	promotionCommoditySelector.open({},function(json){
// 	// 通过约定格式获取选定数据
// 		var checkIds = "";
// 		$.each(json,function(n,value) {
// 			checkIds+=value.no;
// 			if(n!=json.length-1)
// 			{
// 				checkIds+=',';
// 			}
// 		});
// 		$("#addProducts").html(checkIds);
// 		fillProduct();
// 	});
//  }
//
// //添加商品
// function selectGoods(){
// 	commoditySelector.open({},function(json){
// 	// 通过约定格式获取选定数据
// 		var checkIds = "";
// 		$.each(json,function(n,value) {
// 			checkIds+=value.no;
// 			if(n!=json.length-1)
// 			{
// 				checkIds+=',';
// 			}
// 		});
// 		$("#addProducts").html(checkIds);
// 		fillProduct();
// 	});
// }
//
// //将添加的商品显示到列表中
// function fillProduct(){
// 	var myId=$("#addProducts").html().Trim();
// 	if(myId.length<=0){
// 		return false;
// 	}
// 	var sortNum=commodityNos.split(",").length-1;//排序号等于上次添加的商品的最大排序号开始
// 	if(commodityNos==""){
// 		sortNum=0;
// 	}
// 	//可以添加的商品编号 过滤下架的商品
// 	var comIds="";
// 	////////////将添加的商品页面节点显示出来
// 	var html="";//将填充到商品列表中的html代码
// 	//获得异步请求到得json数据
// 	$.getJSON("/system/cmsTopicsController/getCommodityByIds.sc?para=new Date()",{ids:myId},function(data){
// 		var errorIds="";
// 		$.each(data.errorid,function(i,item){
// 			myId=myId.substring(0,myId.indexOf(item))+myId.substring((myId.indexOf(item)+1)+(item+"").length);
// 			errorIds+=","+item;
// 		});
// 		if(errorIds!=""){
// 			alert("下面的商品是已经下架的商品"+errorIds+"已被自动过滤掉!");
// 		}
// 		var sellIds="";
// 		$.each(data.sellid,function(i,item){
// 			myId=myId.substring(0,myId.indexOf(item))+myId.substring((myId.indexOf(item)+1)+(item+"").length);
// 			sellIds+=","+item;
// 		});
// 		if(sellIds!=""){
// 			alert("下面的商品是已经售罄的商品"+sellIds+"已被自动过滤掉!");
// 		}
// 		$.each(data.result, function(i,item){
// 			var commodityObj = $("#commodityCode"+item.no).val();
// 			if(commodityObj == null){
// 				myId=myId.substring(0,myId.indexOf(item.no))+myId.substring((myId.indexOf(item.no)+1)+item.no.length);
// 				commodityNos=commodityNos+item.no+",";
// 				comIds=comIds+item.no+",";
// 				if(item.commodityStatus==2){
// 					item.commodityStatus="上架";
// 				}else{
// 					item.commodityStatus="下架";
// 				}
// 				html="<tr id='commodityNo_"+item.no+"' >"+
// 					"<td ><input type='checkbox' name='chk' value='"+item.no+"' /></td>"+
// 					"<td><img src="+item.picSmall+" height='40px' width='40px' /><input type='hidden' id='commodityCode"+item.no+"'  name='commodityCode"+item.no+"' value="+item.no+"><input type='hidden' name='commodityCode' value="+item.no+"></td>"+
// 					"<td>"+item.commodityName+"</td>"+
// 					"<td>"+item.no+"</td>"+
// 					"<td>"+item.inventoryNumber+"</td>"+
// 					"<td>"+item.publicPrice+"</td>"+
// 					"<td>"+item.salePrice+"</td>"+
// 					"<td>"+item.catName+"</td>"+//所属分类
// 					"<td>"+item.specName+"</td>"+
// 					"<td>"+item.commodityStatus+"</td>"+
// 					"<td><input class='inputtxt' type='text' style='width:20px;' name='sortNoComm' onblur=changeOrderNo('"+item.no+"',this) value="+(sortNum+i+1)+" ></td>"+
// 					"<td><select class='selecttxt' name='isDisplayComm' onchange=changeDisplay('"+item.no+"',this) ><option value='1'>是</option><option value='0'>否</option></select></td>"+
// 					"<td><input type='button' class='btn-add-normal' onclick='deleteMyComm(this,"+item.no+")' value='删除' /></td></tr>";
// 					$("#commodityShow").append(html);
// 			}
// 		});
//
// 		////////////将添加的商品保存到活动商品表
// 		if(comIds!=""){
// 			$.get("/system/cmsTopicsController/addCommodityByIds.sc?para=new Date()",{ids:comIds,topicsId:$("#id").val(),sortNum:sortNum},function(data){
// 				if(data=="success"){
// 					alert("添加商品成功！");
// 				}else{
// 					alert("添加商品失败！");
// 				}
// 			});
// 		}
//
// 		//当前栏目的商品总数
// 		$("#commCount").html((commodityNos.split(",").length)-1);
// 		if(commodityNos==""){
// 			$("#commCount").html("0");
// 		}
// 		var commodityLength = $("#commodityShow tr").length;
// 		if(commodityLength ==0){
// 			$("#commodityCheckboxlist").hide();
// 		}else{
// 			$("#commodityCheckboxlist").show();
// 		}
// 	});
// }

//删除当前栏目的商品
function deleteMyComm(obj,no,commodityId){
	$(obj).parent().parent().remove();
	//如果删掉当前栏目的商品，对应保存栏目商品的数组中的商品编号也要删除，否则不能再添加
	commodityNos=commodityNos.substring(0,commodityNos.indexOf(no))+commodityNos.substring(commodityNos.indexOf(no)+(no+"").length+1);
	//当前栏目的商品总数
	$("#commCount").html((commodityNos.split(",").length)-1);
	var commodityLength = $("#commodityShow tr").length;
	if(commodityLength ==0){
		$("#commodityCheckboxlist").hide();
	}else{
		$("#commodityCheckboxlist").show();
	}
	$.ajax({
		type: "POST",
		url: "/topic/deleteTopicCommodity.sc",
		data:{
			"id":commodityId
		},
		 dataType:"json",
		 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		 success:function(data,status){
		 }
	});
	$("#chkb").removeAttr("checked");
}


//批量删除
function batchDeleteCommodity(){
	if(confirm("确定要删除吗?")){
		var topics_isDisplay = $("topics_isDisplay").val();
		var commCount ="1";
		var checkObj=$("input[name='chk']:checked");
		checkObj.each(function(index, element) {
		   var vals=$(this).val().split(';');
		   $("#commodityNo_"+vals[0]).remove();
			commodityNos=commodityNos.substring(0,commodityNos.indexOf(vals[0]))+commodityNos.substring(commodityNos.indexOf(vals[0])+(vals[0]+"").length+1);
			//当前栏目的商品总数
			$("#commCount").html((commodityNos.split(",").length)-1);
			var commodityLength = $("#commodityShow tr").length;
			if(commodityLength ==0){
				$("#commodityCheckboxlist").hide();
			}else{
				$("#commodityCheckboxlist").show();
			}
			var id =$(this).next().val();
			if(id !=""){
				$.ajax({
					type: "POST",
					url: "/topic/deleteTopicCommodity.sc",
					data:{
						"id":id
					},
					 dataType:"json",
					 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					 success:function(data,status){
					}
				});
			}
			$("#chkb").removeAttr("checked");
		});
	}
}

//修改商品排序
function changeOrderNo(commodityNo,obj,commodityId){
	var commoditySortNo=$(obj).val().trim();//排序号
	if(commoditySortNo==''){
		alert("排序号不允许为空！");
		return;
	}
	$.get("/topic/updateTopicCommoditySortNo.sc",{id:commodityId,sortNo:commoditySortNo},function(data){
		if(data=="success"){
			alert("修改排序成功！");
		}else{
            alert("修改排序失败！");
		}
	});
}
