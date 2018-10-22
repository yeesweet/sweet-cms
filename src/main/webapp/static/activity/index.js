$(document).ready(function(){
    //首页展示
    showIndex();
});

//首页展示
function showIndex(){
	//模块12左右点击事件
	$(".clickLeft").click(function(){
		var allimgs = $(this).next(".allimgs");
		var slbdiv = $(this).prev(".allimgs").children(".imgs").children(".slbdiv");
		var size=slbdiv.size(); 
        var slbdivW=slbdiv.width();           
        var s=slbdivW*size; 
		var imgs = $(this).next(".allimgs").children(".imgs");
        var w=allimgs.width();  
        var L1=imgs.css("left"); 
        var L1A=parseInt(L1);  
        if(L1A<0){       	
        	imgs.animate({left:"+="+w+"px"});              
        } else{
        	var s=imgs.css("left");                    
    		var s1A=parseInt(s);         		
    		if(s1A>0||s1A<440){                    
    			imgs.animate({left:"0"},0);                           
    		}        	
        }
	});
    $(".clickRight").click(function(){ 
    	 var allimgs = $(this).prev(".allimgs");
    	 var widths=$(".slbdiv").width();    	 
    	 var imgs = $(this).prev(".allimgs").children(".imgs");
    	 var slbdiv = $(this).prev(".allimgs").children(".imgs").children(".slbdiv");
    	 var allimgsW=allimgs.width();  
         var size=slbdiv.size(); 
         var slbdivW=slbdiv.width();           
         var s=slbdivW*size; 
         var L1=imgs.css("left");  
         var L1A=parseInt(L1);
         if(L1A>-s+440){
        	 imgs.animate({left:"+="+-allimgsW+"px"});
         }  else{
        	 var s=size*widths;
    		 var s1=imgs.css("left");     
    		 var s1A=parseInt(s1);
    		 if(-s1A>s){
    			 imgs.animate({left:-s},0); 
    		 } 
        	 
         }
    });
    
	//优购快报轮播
	atuoScroll();
	if ($(".megUl li").length>1){
		setInterval("atuoScroll()",3000);
	}
	
    //轮播图滑动
    $(".slider").yxMobileSlider({width:440,height:220,during:3000});

    //内容拖动效果
    $("#contwrap").dragsort({ dragSelector: "li",dragBetween: false, placeHolderTemplate: "<li></li>" });
    
    //频道滑动效果
    channelRoll();
	
	//显示与隐藏事件，默认显示状态
    $(".imgState").css("display","block");
	$(".imgStateLb").css("display","block");
	$("#show").click(function(){
		$(".imgState").css("display","block");
		$(".imgStateLb").css("display","block");
	}); 
	$("#hide").click(function(){         
		$(".imgState").css("display","none");
		$(".imgStateLb").css("display","none");
	});

	//关闭按钮事件
	$("body").on("click",".close", function() {
		var content = $(this).parent().parent().parent();
		var dataIndex = content.index();
		var moduleId = $("input[name='moduleId']")[dataIndex].value;
		var activityId = $("#activityId").val();
		var navigationId = $("#navigationId").val();
		if(moduleId != ""){
			if(window.confirm("确定要删除该模块？")==true){
				$.post("/cmsModuleController/deleteModule.sc",
						{"moduleId":moduleId,"activityId":activityId,"navigationId":navigationId},function(str){
					if(str == "success"){
						content.remove();
						return;
					}
					alert("删除模块失败!");
					return;
				});
			}
			return;
		}
		content.remove();
	});

	//模块双击进入添加或编辑模块页面
	$("body").on("dblclick",".a1", function() {
		var dataIndex = $(this).index();
		var moduleId = $("input[name='moduleId']")[dataIndex].value;
		var moduleStyle = $("input[name='moduleStyle']")[dataIndex].value;
		var moduleType = $("input[name='moduleType']")[dataIndex].value;
		var pageManagerId = $("#pageManagerId").val();
		// if(editPageDialog){
         //    $(editPageDialog).window('close');
         //    return;
		// }
		location="/cmsModuleController/toAddModule.sc?id="+moduleId+"&moduleStyle="+moduleStyle+"" +
				"&moduleType="+moduleType+"&pageManagerId="+pageManagerId;
	});
	
	//右侧模块点击事件
	$(".boardbtn").click(function(){
		var navigationId = $("#navigationId").val();
		var id=$(this).parent().attr("id"); 
		if(id == "moduleNav"){
			var display = $("#menuroll").css("display");
			if(display == "block"){
				alert("导航已经添加");
				return;
			}
			$("#menuroll").css("display","block");
			return;
		}else{
			if(navigationId == ""){
				alert("请先添加导航！");
			}else{
		        var cloneHtml=$("#area"+id).html();
		        var contwrapLen = $("#contwrap").find("li").length; 
		        var cloneLi="<li class='a1' id='a"+contwrapLen+"' name='a"+contwrapLen+"'>"+cloneHtml+"</li>";			 
		        $('#contwrap').append(cloneLi); 

		        //设置描点
		        var idTop=document.getElementById("a"+contwrapLen).offsetTop;
		        setWindowScrollTop(idTop);
			}
		}
   });
	
    //回到顶部
	$(".up").click(function(){
    	parent.scrollTo(0,0);
	});
}

//设置描点
function setWindowScrollTop(idTop){
	if(window.document.documentElement){
		parent.document.documentElement.scrollTop = idTop;
    }
    if(window.document.body){
    	parent.document.body.scrollTop = idTop;
    }
}

//频道滑动效果
function channelRoll(){
    var index=$(".menulistCur").index();
    var sing = 0;
    if(index > 4){
    	sing=index*96;
    }
    $(".menulist").css("left",-sing);
    var w=$(".bx_wrap").width();
    $(".prev").click(function(){          
    	var L1=$(".menulist").css("left");
    	var L1A=parseInt(L1);           
    	if(L1A<0){
    		$(".menulist").animate({left:"+="+w+"px"},function(){
    			var s=$(".menulist").css("left");                    
    			var s1A=parseInt(s);         
    			if(s1A>0&&s1A<480){                    
    				$(".menulist").animate({left:"0"},0);                      
    			}
    		});              
    	} 
    });
    $(".next").click(function(){            
    	var size=$(".menulist li").size(); 
    	var w1=$(".menulist li").width();           
    	var s=w1*size; 
    	var L1=$(".menulist").css("left");  
    	var L1A=parseInt(L1);
    	if(L1A>-s+480){
    		$(".menulist").animate({left:"+="+-w+"px"},function(){
    			var size=$(".menulist li").size();
    			var s=size*100;
    			var s1=$(".menulist").css("left");     
    			var s1A=parseInt(s1);
    			if(-s1A>s){
    				$(".menulist").animate({left:-s},0); 
    			}
    			
    		});
    	}  
    });
}

//优购快报轮播
function atuoScroll(){
	var hh=$(".megUl li").height();
	var $ul=$(".megUl");
	$ul.animate({marginTop:-hh},500,function(){
		$(".megUl li:first").appendTo($ul);
		$(".megUl li:last").hide();
		$ul.css("marginTop",0);
		$(".megUl li:last").fadeIn(0);
    });
}

//切换频道内容
function changeNavigation(activityId,navigationId){
	location="/system/CmsActivityController/toEditActivity.sc?activityId="+activityId+"&navigationId="+navigationId;
}

//首页根据时间查询模块
function selectBoardByTime(activityId){
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	if(startTime=="" && endTime==""){
		alert("请输入开始时间或者结束时间");
		return false;
	}
	var url = "/system/CmsActivityController/toEditActivity.sc?activityId="+activityId;
	if(startTime != ""){
		url = url+"&startTime="+startTime;
	}
	if(endTime != ""){
		url = url+"&endTime="+endTime;
	}
	location=url;
}

//异步添加促销专题商品数据
function getTopicCommodityMore(topicId,moduleId,page){
	$.getJSON("/system/CmsModuleController/getTopicCommodityMore.sc?para=new Date()",{"topicId":topicId,"page":page},function(data){
		var html="";
		$.each(data.moduleCommodityList, function(i,item){
			html+="<div class='goodTwodiv'>"+
			"<img src='"+item.defaultPic+"' class='goodDivImg'/>"+
			"<p>库存："+item.inventoryNumber+"</p>"+
			"<p>¥"+item.salePrice+"<span>/¥<del>"+item.marketPrice+"</del></span></p></div>";
		});
		$("#goodTwoCon"+moduleId).append(html);
		if(!data.hasNext){
			$("#btnMore"+moduleId).html("没有更多");
		}else{
			var htmlMore = "<a href='javascript:getTopicCommodityMore(\""+topicId+"\",\""+moduleId+"\",\""+(page*1+1)+"\")'>查看更多</a>";
			$("#btnMore"+moduleId).html(htmlMore);
		}
	});
}
