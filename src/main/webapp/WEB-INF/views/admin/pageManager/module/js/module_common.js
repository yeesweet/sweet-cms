//普通模块、推荐功能模块、轮播图公用js
var flag;
var productLineCode;
$(function(){ 
	var $_GETStyle = (function(){
        var url = window.document.location.href.toString();
        var u = url.split("?");
        if(typeof(u[1]) == "string"){
            u = u[1].split("&");
            var get = {};
            for(var i in u){
                var j = u[i].split("=");
                get[j[0]] = j[1];
            }
            return get;
        } else {
            return {};
        }
    })();
	flag = $_GETStyle['moduleStyle'];
	productLineCode = $_GETStyle['productLineCode'];
	
	//推荐模块增加右侧编辑模块
	var  clonearea="<div class='recommendlist'>" + $(".recommendlist").clone().html() + "</div>";
	var  clonearea1="<div class='Tj'>" + $(".Tj").clone().html() + "</div>";
	//自定义推荐模块增加
	$(".addArea2").click(function(){
			var rows = $("#rows").val();
			if(rows==''){
				alert("请设置模块行数");
				return false;
			}
			var cols = $("#cols").val();
			if(cols==''){
				alert("请设置模块列数");
				return false;
			}
			var num = $('.col'+cols).size();//parseInt(rows,10)*parseInt(cols,10);

		  var str=$(".addBox").html();
		  var str1=$(".TjAreaCon").last().html();
		  clonearea="<div class='recommendlist'>" + $(".recommendlist").clone().html() + "</div>";
		  clonearea1="<div class='Tj2'>" + $(".Tj2").clone().html() + "</div>";
		  $(".addBox").html(str+clonearea);
		  $(".TjAreaCon2").last().append(clonearea1);

	       //设置链接位置为0
		  $(".Tj2").last().children(".upload").children(".place").children("select").val(0);
		  $(".Tj2").last().children(".upload").children(".choosep").hide();

		  var number=$(".number").length;
		  for(var i=num+1;i<=number;i++){
		     $(".upload").eq(i-1).attr("id","upload"+i).find(".number").text(i);
		     $(".upload .uploadimgshow").eq(i-1).children("img").attr("src","/images/homepage/1img1.jpg");
		  	 $(".upload .uploadimgshow").eq(i-1).children("input").val("");
		     commonL(i,108,1);
		   }

		  var row_col = parseInt(rows,10)*parseInt(cols,10)
		  var index = number-row_col+1;
		  //alert("number:"+number+" index:"+index+" row_col:"+row_col);
		  for(var j=0;j<=row_col-1;j++){
		  	$(".recommendlist").eq((index-1)/row_col).find("img").eq(j).attr("id","fl108"+(index+j));
		  	$(".recommendlist").eq((index-1)/row_col).find("img").eq(j).attr("src","/images/homepage/tuijian1.jpg");
		  }

	  });
	//推荐模块删除
	$(".delete2").live("click", function() {
		var rows = $("#rows").val();
		if(rows==''){
			alert("请设置模块行数");
			return false;
		}
		var cols = $("#cols").val();
		if(cols==''){
			alert("请设置模块列数");
			return false;
		}
		var rows_cols = parseInt(rows,10)*parseInt(cols,10);
		var num=$(".recommendlist").size();
		var dataIndex = $(this).parent(".recommendlist").index();
		if(num>1){
			$(this).parent(".recommendlist").remove();
			$(".Tj2").get(dataIndex).remove();
			for(var i=0;i < num*rows_cols; i++){
				//修改左侧id和name值
				$(".recommendlist img").eq(i).attr("id","fl108"+(i+1));
				$(".recommendlist span").eq(i).html(i+1);

				//修改右侧id和name值
				commonL(i,108,2);
			}
		}
	});
	$(".addArea").click(function(){
		
		  var str=$(".addBox").html();
		  var str1=$(".TjAreaCon").last().html();  
		  $(".addBox").html(str+clonearea);   
		  $(".TjAreaCon").last().append(clonearea1);
		  
	       //设置链接位置为0
		  $(".Tj").last().children(".upload").children(".place").children("select").val(0);
		  $(".Tj").last().children(".upload").children(".choosep").hide();
		  
		  var number=$(".number").length;   
		  for(var i=5;i<=number;i++){
		     $(".upload").eq(i-1).attr("id","upload"+i).find(".number").text(i);
		     $(".upload .uploadimgshow").eq(i-1).children("img").attr("src","/images/homepage/1img1.jpg");
		  	 $(".upload .uploadimgshow").eq(i-1).children("input").val("");
		     commonL(i,102,1);
		   }
		  var index = number-3;
		  $(".recommendlist").eq((index-1)/4).find("img").eq(0).attr("id","fl102"+(index));
		  $(".recommendlist").eq((index-1)/4).find("img").eq(0).attr("src","/images/homepage/tuijian1.jpg");
		  $(".recommendlist").eq((index-1)/4).find("img").eq(1).attr("id","fl102"+(index+1));
		  $(".recommendlist").eq((index-1)/4).find("img").eq(1).attr("src","/images/homepage/tuijian1.jpg");
		  $(".recommendlist").eq((index-1)/4).find("img").eq(2).attr("id","fl102"+(index+2));
		  $(".recommendlist").eq((index-1)/4).find("img").eq(2).attr("src","/images/homepage/tuijian1.jpg");
		  $(".recommendlist").eq((index-1)/4).find("img").eq(3).attr("id","fl102"+(index+3));
		  $(".recommendlist").eq((index-1)/4).find("img").eq(3).attr("src","/images/homepage/tuijian1.jpg");
	  });
	//推荐模块删除
	$(".delete1").live("click", function() {
		var num=$(".recommendlist").size(); 
		var dataIndex = $(this).parent(".recommendlist").index();
		if(num>1){    
			$(this).parent(".recommendlist").remove();
			$(".Tj").get(dataIndex).remove();
			for(var i=0;i < num*4; i++){
				//修改左侧id和name值
				$(".recommendlist img").eq(i).attr("id","fl102"+(i+1));
				$(".recommendlist span").eq(i).html(i+1);
				
				//修改右侧id和name值
				commonL(i,102,2); 
			}
		}
	});

	//轮播或者优购快报增加右侧编辑模块
	var  cloneareaLb="<div class='lunboimgshow'>" + $(".lunboimgshow").clone().html() + "</div>";
	var str1="<div class='LbArea'>" + $(".LbArea").clone().html() + "</div>"; 
	$(".addLb").click(function(){
	       var str=$(".lunboimglist").html();
	       $(".lunboimglist").html(str+cloneareaLb);  
	       $("#wayCon").append(str1);   
	       var index=$(".lunboimgshow").size()-1;
	       //设置链接位置为0
	 	   $(".place").eq(index).children("select").val(0);
	 	   $(".upload").eq(index).children(".choosep").css("display","none");
	    
	  	   $(".upload").eq(index).find(".number").text(index+1); 
	  	   $(".uploadimgshow").eq(index).children("img").attr("src","/images/homepage/1img1.jpg");
	  	   $(".uploadimgshow").eq(index).children("input").val("");
	  	   commonL(index,flag,1);
	  	   var index1=index+1;
	  	   $(".lunboimgshow").eq(index).find("img").attr("id","fl"+flag+index1);
	  	   $(".lunboimgshow").eq(index).find("img").attr("src","/images/homepage/lunbo1.jpg");
	  	   if(flag==104){//优购快报
	  		   $(".megP").eq(index).find("span").attr("id","message"+index1);
	  	   }
	  });
	//轮播图删除或者优购快报
	$(".deleteL").live("click", function() {
		var num=$(".lunboimgshow").size();
		var dataIndex = $(this).parent(".lunboimgshow").index();
		if(num>1){    
			$(this).parent(".lunboimgshow").remove();
			$(".LbArea").get(dataIndex).remove();
			for(var i=dataIndex;i < (num-1); i++){
				//修改左侧id和name值
				$(".lunboimgshow img").eq(i).attr("id","fl"+flag+(i+1));
				//$(".lunboimgshow span").eq(i).html(i+1);
				if(flag==104){//优购快报
			  		$(".megP").eq(i).find("span").attr("id","message"+(i+1));
			  	}
				//修改右侧id和name值
				commonL(i,flag,2); 
			}
		} 
	});
	  
	//模块3复用板块
	$(".addone").click(function(){ 
	  var  cloneone="<div class='divs oneimg'>" + $(".oneimg").clone().html() + "</div>";
	  var cloneContent="<div class='Tj5'>" + $(".Tj5").clone().html() + "</div>";
	  var str=$(".addBox1").html();  
	  $(".addBox1").html(str+cloneone);   
	  var number=$(".oneimg").length; 
	  $("#wayCon").append(cloneContent);
	  var index=$(".upload").size()-1;  
	  //设置链接位置为0
	  $(".place").eq(index).children("select").val(0);
	  $(".upload").eq(index).children(".choosep").css("display","none");
	  
	  $(".upload").eq(index).find(".number").text(number); 
	  $(".uploadimgshow").eq(index).children("img").attr("src","/images/homepage/1img1.jpg");
 	  $(".uploadimgshow").eq(index).children("input").val("");
	  commonL(index,3,1); 
	  var index1=index+1;
	  $(".oneimg").eq(index).find("img").attr("id","fl3"+index1);
	  $(".oneimg").eq(index).find("img").attr("src","/images/homepage/img6.jpg");
	  });
	//模块3删除
	$(".delete3").live("click", function() {
		var num=$(".oneimg").size();
		var dataIndex = $(this).parent(".oneimg").index();
		if(num>1){    
			$(this).parent(".oneimg").remove();
			$(".Tj5").get(dataIndex).remove();
			for(var i=dataIndex;i < (num-1); i++){
				//修改左侧id和name值
				$(".oneimg img").eq(i).attr("id","fl3"+(i+1));
				$(".oneimg span").eq(i).html(i+1);
				
				//修改右侧id和name值
				commonL(i,3,2); 
			}
		}
	});	  
	 
	//模块5复用板块
	$(".addtwo").click(function(){ 
		var  clonetwo="<div class='divs twoimg'>" + $(".twoimg").clone().html() + "</div>";
		var  cloneContentTwo="<div class='Tj5'>" + $(".Tj5").clone().html() + "</div>";
		var str=$(".addBox2").html();
		var numss=$(".twoimg .num").length+2;
		$(".addBox2").html(str+clonetwo);
		   for(var i=0;i<numss;i++){  
		       $(".twoimg .num").eq(i).text(i+1);
		}
		$("#wayCon").append(cloneContentTwo);
		var index=$(".upload").size()-1; 
		
		//设置链接位置为0
		$(".Tj5").last().children(".upload").children(".place").children("select").val(0);
		$(".Tj5").last().children(".upload").children(".choosep").hide();
		
		for(var i=0;i<=index;i++){   
		   $(".upload").eq(i).find(".number").text(i+1);
		}
		var index1=index+1;
		for(var i=index;i<=index1;i++){
			$(".uploadimgshow").eq(i-1).children("img").attr("src","/images/homepage/1img1.jpg");
			$(".uploadimgshow").eq(i-1).children("input").val("");
			commonL(i,5,1);
		}
		$(".twoimg").eq((index-1)/2).find("img").eq(0).attr("id","fl5"+index);
		$(".twoimg").eq((index-1)/2).find("img").eq(0).attr("src","/images/homepage/2img1.jpg");
	    $(".twoimg").eq((index-1)/2).find("img").eq(1).attr("id","fl5"+index1);
	    $(".twoimg").eq((index-1)/2).find("img").eq(1).attr("src","/images/homepage/2img1.jpg");
	  });
	//模块5删除
	$(".delete5").live("click", function() {
		var num=$(".twoimg").size();
		var dataIndex = $(this).parent(".twoimg").index();
		if(num>1){    
			$(this).parent(".twoimg").remove();
			$(".Tj5").get(dataIndex).remove();
			for(var i=dataIndex*2;i < num*2; i++){
				//修改左侧id和name值
				$(".twoimg img").eq(i).attr("id","fl5"+(i+1));
				$(".twoimg span").eq(i).html(i+1);
				
				//修改右侧id和name值
				commonL(i,5,2); 
			}
		}
	});
	
	//模块11复用板块
	$(".addthree").click(function(){ 
	  var  cloneone="<div class='divs threeimg'>" + $(".threeimg").clone().html() + "</div>";
	  var cloneContent="<div class='Tj5'>" + $(".Tj5").clone().html() + "</div>";
	  var str=$(".addBox3").html();  
	  $(".addBox3").html(str+cloneone);   
	  var number=$(".threeimg").length; 
	  $("#wayCon").append(cloneContent);
	  var index=$(".upload").size()-1;  
	  //设置链接位置为0
	  $(".place").eq(index).children("select").val(0);
	  $(".upload").eq(index).children(".choosep").css("display","none");
	  
	  $(".upload").eq(index).find(".number").text(number); 
	  $(".uploadimgshow").eq(index).children("img").attr("src","/images/homepage/1img1.jpg");
 	  $(".uploadimgshow").eq(index).children("input").val("");
	  commonL(index,11,1); 
	  var index1=index+1;
	  $(".threeimg").eq(index).find("img").attr("id","fl11"+index1);
	  $(".threeimg").eq(index).find("img").attr("src","/images/homepage/img6.jpg");
	  });
	//模块11删除
	$(".delete11").live("click", function() {
		var num=$(".threeimg").size();
		var dataIndex = $(this).parent(".threeimg").index();
		if(num>1){    
			$(this).parent(".threeimg").remove();
			$(".Tj5").get(dataIndex).remove();
			for(var i=dataIndex;i < (num-1); i++){
				//修改左侧id和name值
				$(".threeimg img").eq(i).attr("id","fl11"+(i+1));
				$(".threeimg span").eq(i).html(i+1);
				
				//修改右侧id和name值
				commonL(i,11,2); 
			}
		}
	});	 
	
	//模块12复用板块
	$(".addfour").click(function(){ 
	  var number=$("#leftBoard17 .slbdiv").length; 
	  if(number>29){
		  alert("添加活动图片最大限度为30个!");
		  return false;
	  }
	  var  str="<div class='slbdiv'><img src='/images/homepage/2img1.jpg'/><a href='javascript:void(0);'><img class='close delModule17' src='/images/homepage/close.png'/></a></div>";
	  $("#leftBoard17").append(str);
	  var cloneContent="<div class='Tj5'>" + $(".Tj5").clone().html() + "</div>";
	  $("#wayCon").append(cloneContent);
	  var index=$(".upload").size()-1;  
	  //设置链接位置为0
	  $(".place").eq(index).children("select").val(0);
	  $(".upload").eq(index).children(".choosep").css("display","none");
	  
	  $(".upload").eq(index).find(".number").text(number); 
	  $(".uploadimgshow").eq(index).children("img").attr("src","/images/homepage/1img1.jpg");
 	  $(".uploadimgshow").eq(index).children("input").val("");
	  commonL(index,17,1); 
	  var index1=index+1;
	  $("#leftBoard17 .slbdiv").eq(index).find("img").eq(0).attr("id","fl17"+index1);
	  $("#leftBoard17 .slbdiv").eq(index).find("img").eq(0).attr("src","/images/homepage/2img1.jpg");
	});
	//模块12删除
	$(".delModule17").live("click", function() {
		var num=$("#leftBoard17 .slbdiv").size();
		var dataIndex = $(this).parent().parent(".slbdiv").index();
		if(num>4){    
			$(this).parent().parent(".slbdiv").remove();
			$(".Tj5").get(dataIndex).remove();
			for(var i=dataIndex;i < (num-1); i++){
				//修改左侧id和name值
				$("#leftBoard17 .slbdiv img").eq(i).eq(0).attr("id","fl17"+(i+1));
				
				//修改右侧id和name值
				commonL(i,17,2); 
			}
		}else{
			alert("活动图片最低限制为4个!");
			return false;
		}
	});

	//替换编辑和添加页右侧输入框id、name值    state(1 添加 2 删除)
	function commonL(index,type,state){
		var index1=index+1;
		if(type==5 || type==102 || type==108){
			index1 = index;
			index = index-1;
		}
		 $(".upload").eq(index).attr("id","upload"+index1);	
		 
		 $(".number").eq(index).html(index1);
		 
		 if(type==101){//轮播图
			 $(".time").eq(index).children("input").eq(0).attr("id","subStarttime"+index1).attr("name","moduleDetails["+index+"].subStarttime");
			 $(".time").eq(index).children("input").eq(1).attr("id","subEndtime"+index1).attr("name","moduleDetails["+index+"].subEndtime");
		 }
	     $(".upload .fileimg").eq(index).attr("id","fileimg"+index1);
	     $(".upload .uploadBtn").eq(index).attr("id","uploadBtn"+index1);
	     $(".upload .addImageBtn").eq(index).attr("onclick","javaScript:selectImage("+index1+")");
	     $(".upload .uploadimgshow").eq(index).children("img").attr("id","iptimg"+index1);
	     $(".upload .uploadimgshow").eq(index).children("input").attr("id","img"+index1).attr("name","moduleDetails["+index+"].imgUrl");
	     if(type==102 || type==104 || type==17){
	    	 $(".title input").eq(index).attr("id","title"+index1).attr("name","moduleDetails["+index+"].title");
	     }
	     $(".selector").eq(index).attr("id","typeList"+index1);
	     $(".upload").eq(index).find(".choosep").eq(0).attr("id","tip5"+index1);
	     $(".upload").eq(index).find(".choosep").eq(1).attr("id","tip100"+index1);
	     $(".upload").eq(index).find(".choosep").eq(2).attr("id","tip13"+index1);
	     $(".upload").eq(index).find(".choosep").eq(3).attr("id","tip1007"+index1);
	     $(".upload").eq(index).find(".choosep").eq(4).attr("id","tip1006"+index1);
	     $(".upload").eq(index).find(".choosep").eq(5).attr("id","tip9"+index1);
	     $(".upload").eq(index).find(".choosep").eq(6).attr("id","tip8"+index1);
	     $(".upload").eq(index).find(".choosep").eq(7).attr("id","tip1026"+index1);
	     $(".upload").eq(index).find(".choosep").eq(8).attr("id","tip1025"+index1);
	     $(".upload").eq(index).find(".choosep").eq(9).attr("id","tip2"+index1);
	     $(".upload").eq(index).find(".choosep").eq(10).attr("id","tip1"+index1);
	     $(".upload").eq(index).find(".choosep").eq(11).attr("id","tip7"+index1);
	     //促销专题id修改
	     $(".upload").eq(index).find(".choosep").eq(0).find("span").children("input").attr("id","topicsInput"+index1).attr("list","topicsName"+index1);
	     $(".upload").eq(index).find(".choosep").eq(0).find("span datalist").attr("id","topicsName"+index1);
	     //横滑专题id修改
	     $(".upload").eq(index).find(".choosep").eq(1).find("span").children("input").attr("id","subjectInput"+index1).attr("list","subjectName"+index1);
	     $(".upload").eq(index).find(".choosep").eq(1).find("span datalist").attr("id","subjectName"+index1);
	     //web专题
	     $(".upload").eq(index).find(".choosep").eq(2).find("span").children("input").attr("id","webInput"+index1);
	     //商品名称
	     $(".upload").eq(index).find(".choosep").eq(3).find("span").children("input").attr("id","commodityName"+index1);
	     $(".upload").eq(index).find(".choosep").eq(3).find("span a").attr("id","goods"+index1).attr("href","javascript:selectSingleGoods("+index1+");");
	     //分类选择
	     $(".upload").eq(index).find(".choosep").eq(4).find("span").children("input").attr("id","firstCategory"+index1).attr("list","firstCategoryName"+index1);
	     $(".upload").eq(index).find(".choosep").eq(4).find("span datalist").attr("id","firstCategoryName"+index1);
	     //请输入链接
	     $(".upload").eq(index).find(".choosep").eq(5).find("span").children("input").attr("id","urlInput"+index1);
	     //优购快报
	     $(".upload").eq(index).find(".choosep").eq(6).find("span").children("select").attr("id","articleName"+index1);
	     //页面列表id修改
	     $(".upload").eq(index).find(".choosep").eq(7).find("span").children("input").attr("id","activityInput"+index1).attr("list","activityName"+index1);
	     $(".upload").eq(index).find(".choosep").eq(7).find("span datalist").attr("id","activityName"+index1);
	     //竖滑专题id修改
	     $(".upload").eq(index).find(".choosep").eq(8).find("span").children("input").attr("id","subjectVerticalInput"+index1).attr("list","subjectVerticalName"+index1);
	     $(".upload").eq(index).find(".choosep").eq(8).find("span datalist").attr("id","subjectVerticalName"+index1);
	     //分类商品列表id修改
	     $(".upload").eq(index).find(".choosep").eq(9).find("span").children("input").attr("id","secondCateInput2"+index1).attr("list","secondeCateName2"+index1);
	     $(".upload").eq(index).find(".choosep").eq(9).find("span datalist").attr("id","secondeCateName2"+index1);
	     //品牌商品列表id修改
	     $(".upload").eq(index).find(".choosep").eq(10).find("span").children("input").attr("id","secondCateInput1"+index1).attr("list","secondeCateName1"+index1);
	     $(".upload").eq(index).find(".choosep").eq(10).find("span datalist").attr("id","secondeCateName1"+index1);
	     //搜索关键字商品列表id修改
	     $(".upload").eq(index).find(".choosep").eq(11).find("span").children("input").attr("id","secondCateInput7"+index1).attr("list","secondeCateName7"+index1);
	     $(".upload").eq(index).find(".choosep").eq(11).find("span datalist").attr("id","secondeCateName7"+index1);
	     
	     $(".upload").eq(index).children("input").eq(0).attr("id","sortNo"+index1).attr("name","moduleDetails["+index+"].sortNo");
	     if(type!=101 && type!=104){
	    	 $(".upload").eq(index).children("input").eq(0).val(index1);
	     }
	     $(".upload").eq(index).children("input").eq(1).attr("id","commonId"+index1).attr("name","moduleDetails["+index+"].commonId");
	     $(".upload").eq(index).children("input").eq(2).attr("id","subType"+index1).attr("name","moduleDetails["+index+"].subType");
	     $(".upload").eq(index).children("input").eq(3).attr("id","linkUrl"+index1).attr("name","moduleDetails["+index+"].linkUrl");
	     if(state == 1){
	    	 //设置commonId和linkUrl的值
	    	 $("#commonId"+index1).val("");
	    	 $("#subType"+index1).val("");
	    	 $("#linkUrl"+index1).val("");
	     }
	 }
	
	//删除图片
	$(".close1").live("click",function(){
		$(this).parent().siblings().eq(0).attr("src","/images/homepage/1img1.jpg");
		$(this).parent().siblings().eq(1).val("");
		var id = $(this).parent().siblings().eq(0).attr("id").substring(6);
		if(flag==101){
			$("#fl"+flag+id).attr("src","/images/homepage/lunbo1.jpg");
		}else if(flag==3||flag==9){
			$("#fl"+flag+id).attr("src","/images/homepage/img6.jpg");
		}else{
			$("#fl"+flag+id).attr("src","/images/homepage/1img1.jpg");
		}
	});
	
	/*模块12左右点击开始*/
	$(".clickLeft").click(function(){
		var allimgs = $(this).next(".allimgs");
		var imgs = $(this).next(".allimgs").children(".imgs");
        var w=allimgs.width();  
        var L1=imgs.css("left"); 
        var L1A=parseInt(L1);  
        if(L1A<0){
        	imgs.animate({left:"+="+w+"px"},function(){
        		var s=imgs.css("left");                    
        		var s1A=parseInt(s);   
        		if(s1A>0||s1A<440){                    
        			imgs.animate({left:"0"},0);                           
        		}
        	});              
        } 
	});
    $(".clickRight").click(function(){ 
    	 var allimgs = $(this).prev(".allimgs");
    	 var imgs = $(this).prev(".allimgs").children(".imgs");
    	 var slbdiv = $(this).prev(".allimgs").children(".imgs").children(".slbdiv");
    	 var allimgsW=allimgs.width();  
         var size=slbdiv.size(); 
         var slbdivW=slbdiv.width();           
         var s=slbdivW*size; 
         var L1=imgs.css("left");  
         var L1A=parseInt(L1);
         if(L1A>-s+440){
        	 imgs.animate({left:"+="+-allimgsW+"px"},function(){
        		 var s=size*110;
        		 var s1=imgs.css("left");     
        		 var s1A=parseInt(s1);
        		 if(-s1A>s){
        			 imgs.animate({left:-s},0); 
        		 }                  
        	 });
         }  
    });
    /*模块12左右点击结束*/
    
    //模块12、模块15商品删除
    $(".delCommodity").live("click",function(){
    	if(flag == 12){
    		var commoditySize = $(".slbdiv").size();
    		if(commoditySize <= 4){
    			alert("商品数量最低限制为4个");
    			return;
    		}
    	}
		var index = $(this).parent().parent().index();
		var commodity = "";
		var commodityArr = $("#commodity").val().split(",");
		for(var i=0;i<commodityArr.length;i++){
			if(i != index){
				commodity += commodityArr[i] + ",";
			}
		}
		commodity  = commodity.substring(0,commodity.length-1);
		$("#commodity").val(commodity);
		$("#commodityText").val(commodity);
		$(this).parent().parent().remove();
	});
});



//选择链接位置a
function getLinkTypeDate(em){
	var $this = $(em);
	var id =$this.attr("id").substring(8);
	var value =	$("#typeList"+id).children('option:selected').val();
	$("#commonId").val();
	//var effectRange =	$("#effectRange").val();
	var effectRange = value;
	var currentPLC = $("#currentPLC").val();
	$.ajax({
		type: "POST",
		url: "getLinkTypeDate.sc",
		data:{
			"linkType":value,
			"effectRange":effectRange,
			"productLineCode":currentPLC
		},
		 dataType:"json",
		 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		 success:function(data,status){
			showAdvertType(data,value,id);
		}
	});
}

function showAdvertType(data,value,id){
	var option="";
	$("#tip5"+id).hide(); 
    $("#tip100"+id).hide(); 
    $("#tip13"+id).hide(); 
    $("#tip1007"+id).hide(); 
    $("#tip1006"+id).hide(); 
    $("#tip9"+id).hide();
    $("#tip8"+id).hide(); 
    $("#tip1026"+id).hide(); 
    $("#tip1025"+id).hide(); 
    $("#tip2"+id).hide(); 
    $("#tip1"+id).hide(); 
    $("#tip7"+id).hide(); 
    $("#tip1029"+id).hide(); 
    $("#tip2000"+id).hide(); 
	$("#subtpye"+id).val(value);
	//专题列表
	if(value==5){
	     $("#tip"+value+id).show(); 
	     $("#tip"+value+id+" span").eq(1).empty();
	     option =option+"<input id='topicsInput"+id+"' list='topicsName"+id+"' class='ipt_text'/><datalist id='topicsName"+id+"' name='topicsName'>";
		 for(var i=0; i<data.length ; i ++){
			 option =option+ "<option id='"+data[i].id+"' value='"+data[i].topicsName+"'>"+data[i].topicsName+"</option>";
	  	 }
	  	 option =option+"</datalist>";
	  	 $("#tip"+value+id+" span").eq(1).append(option);
	  	 return false;
 	 }
	//横滑专题列表
	if(value==100 ){
	    $("#tip"+value+id).show(); 
	    $("#tip"+value+id+" span").eq(1).empty();
	    option =option+"<input id='subjectInput"+id+"' list='subjectName"+id+"' class='ipt_text'/><datalist id='subjectName"+id+"' name='subjectName'>";
		 for(var i=0; i<data.length ; i ++){
			 option =option+ "<option id='"+data[i].subjectId+"' value='"+data[i].subjectTitle+"'>"+data[i].subjectTitle+"</option>";
	  	 }
	  	 option =option+"</datalist>";
	  	$("#tip"+value+id+" span").eq(1).append(option);
	  	return false;
 	 }
	//竖滑专题列表
	if(value==1025 ){
	    $("#tip"+value+id).show(); 
	    $("#tip"+value+id+" span").eq(1).empty();
	    option =option+"<input id='subjectVerticalInput"+id+"' list='subjectVerticalName"+id+"' class='ipt_text'/><datalist id='subjectVerticalName"+id+"' name='subjectVerticalName'>";
		 for(var i=0; i<data.length ; i ++){
			 option =option+ "<option id='"+data[i].subjectId+"' value='"+data[i].subjectTitle+"'>"+data[i].subjectTitle+"</option>";
	  	 }
	  	 option =option+"</datalist>";
	  	$("#tip"+value+id+" span").eq(1).append(option);
	  	return false;
 	 }
	//web专题
	if(value==13){
	     $("#tip"+value+id).show(); 
	     $("#tip"+value+id+" span").eq(1).empty();
	     option =option+"<input type='text' id='webInput"+id+"' name='webInput' class='ipt_text' />";
	     $("#tip"+value+id+" span").eq(1).append(option);
	     return false;
	 } 
	//商品详情
	if(value==1007){
	     $("#tip"+value+id).show(); 
	     $("#tip"+value+id+" span").eq(1).empty();
	     option =option+"<input class='ipt_text' type='text' name='commodityName' id='commodityName"+id+"' readonly='readonly' size='50' maxlength='150' value=''/>";
	  	 option =option+"<a id='goods"+id+"' href='javascript:selectSingleGoods("+id+");'>&nbsp;&nbsp;选择</a>";
	  	 $("#tip"+value+id+" span").eq(1).append(option);
	  	return false;
 	 } 
	//分类二级页面
	if(value==1006){
		 $("#tip"+value+id).show(); 
	     $("#tip"+value+id+" span").eq(1).empty();
	     option =option+"<input id='firstCategory"+id+"' list='firstCategoryName"+id+"' class='ipt_text'/><datalist id='firstCategoryName"+id+"' name='firstCategoryName'>";
		 for(var i=0; i<data.length ; i ++){
			 option =option+ "<option id='"+data[i].categoryId+"' value='"+data[i].categoryName+"'>"+data[i].categoryName+"</option>";
	  	 }
	  	 option =option+"</datalist>";
	  	 $("#tip"+value+id+" span").eq(1).append(option);
	  	return false;
	}
	//手动输入链接
	if(value==9){
	     $("#tip"+value+id).show();
	     $("#tip"+value+id+" span").eq(1).empty();
	     option =option+"<input type='text' id='urlInput"+id+"' name='urlInput' class='ipt_text' />";
	     $("#tip"+value+id+" span").eq(1).append(option);
	     return false;
	 }  
	//手动输入链接
	if(value==8){
	     $("#tip"+value+id).show();
	     $("#tip"+value+id+" span").eq(1).empty();
	     option =option+"<select id='articleName"+id+"' name='articleName' class='ipt_text' onchange='getArticleName(this);'>";
	     option = option+"<option value=''>请选择</option>";
		 for(var i=0; i<data.length ; i ++){
			 option =option+ "<option value='"+data[i].id+";http://mobile.yougou.com/static/"+data[i].fileName+".html'>"+data[i].articleName+"</option>";
	  	 }
	  	 option =option+"</select>";
	     $("#tip"+value+id+" span").eq(1).append(option);
	     return false;
	 }
	//活动页页面列表
	if(value==1026){
		$("#tip"+value+id).show(); 
		$("#tip"+value+id+" span").eq(1).empty();
	    option =option+"<input id='activityInput"+id+"' list='activityName"+id+"' class='ipt_text'/><datalist id='activityName"+id+"' name='activityName'>";
		for(var i=0; i<data.length ; i ++){
			 option =option+ "<option id='"+data[i].id+"' value='"+data[i].activityName+"'>"+data[i].activityName+"</option>";
	  	}
	  	option =option+"</datalist>";
	  	$("#tip"+value+id+" span").eq(1).append(option);
	  	return false;
	} 
	//分类商品列表或品牌商品列表或关键字商品列表
	if(value==2 || value==1 || value==7){
		$("#tip"+value+id).show(); 
		$("#tip"+value+id+" span").eq(1).empty();
	    option =option+"<input id='secondCateInput"+value+id+"' list='secondCateName"+value+id+"' class='ipt_text' placeholder='请选择三级分类'/>"+
	    		"<datalist id='secondCateName"+value+id+"' name='secondCateName'>";
		for(var i=0; i<data.length ; i ++){
			 option =option+ "<option id='"+data[i].categoryId+"' value='"+data[i].name+"'>"+data[i].name+"</option>";
	  	}
	  	option =option+"</datalist>";
	  	$("#tip"+value+id+" span").eq(1).append(option);
	  	return false;
	} 
	//自定义参数
	if(value==2000){
	     $("#tip"+value+id).show(); 
	     $("#tip"+value+id+" span").eq(1).empty();
	     option =option+"<input type='text' id='paramInput"+id+"' name='paramInput' class='ipt_text' style='width:250px;'/>";
	     $("#tip"+value+id+" span").eq(1).append(option);
	     return false;
	 }
	//关键字列表
	if(value==1029){
		$("#tip"+value+id).show(); 
		$("#tip"+value+id+" span").eq(1).empty();
		option =option+"<input type='text' id='keyword"+id+"' name='keyword' class='ipt_text' style='width:150px;'/>";
		$("#tip"+value+id+" span").eq(1).append(option);
		return false;
	}
}
//添加商品
function selectSingleGoods(id){
	 commoditySingleSelector.open({},function(json){
	// 通过约定格式获取选定数据
		$.each(json,function(n,value) {
			$('#commodityName'+id).val(value.commodityName);
			$('#commonId'+id).val(value.no);
		});
	});
}
//上传图片
function ajaxImageUpload(em) {
	var $this = $(em);
	var id =$this.attr("id").substring(9);
	var imgType =	$("#imgType").val();
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
	            url: '../cmsImageControler/uploadImage.sc?type='+imgType, 
	            type: 'post',
	            secureuri: false, //一般设置为false
	            fileElementId: 'fileimg'+id, // 上传文件的id、name属性名
	            dataType: 'json', //返回值类型，一般设置为json、application/json
	            success: function(data){  
	                if(data.status == "success"){
	                	alert("上传成功！");
	                	$("#iptimg"+id).attr("src",data.picpath);
		                $("#img"+id).val(data.picpath);
		                $("#fl"+flag+id).attr("src",data.picpath);
	                }else{
	                	alert(data.errorDesc);
	                	$("#iptimg"+id).attr("src","/images/homepage/1img1.jpg");
		                $("#fl"+flag+id).attr("src","/images/homepage/1img1.jpg");
	                }
	            },
	            error: function(data, e){ 
	                alert(e);
	                alert("上传失败！");
	                $("#iptimg"+id).attr("src","/images/homepage/1img1.jpg");
	            }
	        });
	 }
}

//选择图片方法
function selectImage(id){
 	ImageSelector.open(1,function(json){
 		//通过约定格式获取选定数据
 		$.each(json,function(n,value) {
 			var imgUrl = value.imgName;
 			$("#img"+id).val(imgUrl);
 			$("#iptimg"+id).attr("src",imgUrl);
 			$("#fl"+flag+id).attr("src",imgUrl);
 		});
 	});
 }

function getArticleName(em){
	var $this = $(em);
	var id =$this.attr("id").substring(11);
	var txt =$("#articleName"+id+" option:selected").text();
	$("#message"+id).text(txt);
	$("#title"+id).val(txt);
}
//返回
function goto_back(navigationId,activityId){
	if(activityId == ''){
		location = "/system/CmsNavigationController/toEditNavigation.sc?navigationId="+navigationId;
	}else{
		location = "/system/CmsActivityController/toEditActivity.sc?activityId="+activityId+"&navigationId="+navigationId;
	}
	
}
function checkText(str){
	 return !(/^[^\|"'<>]*$/.test(str));
}

//启用停用功能；参数说明：moduleId模块id，status启用状态，currentPLC当前频道关联平台,activityId活动页id
function changeStatus(moduleId,status,currentPLC,activityId){
	if(status ==0){
		location="toChangeStatus.sc?status=0&moduleId="+moduleId+"&currentPLC="+currentPLC+"&activityId="+activityId;
	}else{
		location="toChangeStatus.sc?status=1&moduleId="+moduleId+"&currentPLC="+currentPLC+"&activityId="+activityId;
	}
}
//设置自定义推荐模块行/列
function setRecommend2Rows(){
	if(flag==108){
		var rows = $("#rows").val();
		if(rows==''){
			alert("请设置模块行数");
			return false;
		}
		var cols = $("#cols").val();
		if(cols==''){
			alert("请设置模块列数");
			return false;
		}
		var num = parseInt(rows,10)*parseInt(cols,10);
		var divHtml = '';
		for(var i = 1 ; i <= num ;i++){
			divHtml = divHtml + '<div class="col'+cols+'"><a href="#"><img id="fl108'+i+'" src="/images/homepage/tuijian1.jpg" /></a><span class="num" style="display:none;">'+i+'.</span><p>标题'+i+'</p></div>';

		}

		divHtml = divHtml + '<a href="javascript:void(0);" class="delete2">删除</a>';
		$('.recommendlist').html(divHtml);


		$.getScript(BasePath + "/js/activity/cmsModule.js",function(){  //加载js,成功后，执行回调函数
		  //alert("load cmsBoard.js");
		});
	}
}
function checkForm(){
	var moduleName = $("#moduleName").val();
	if(checkText(moduleName)){
		 alert("模块名称不能包含特殊字符");
		 return false;
	 }
	var starttime = $("#starttime").val();
	var endtime = $("#endtime").val();
	if(flag != 20){
		if(!((starttime=='' && endtime=='') || (starttime!='' && endtime!=''))){
			alert("开始时间、结束时间都为空 或者  开始时间、结束时间都不为空");
			return false;
		}
	}
	if(flag == 20){
		if(starttime ==''){
	    	alert("开始时间不为空");
	    	return false;
	    }
		if(endtime ==''){
			alert("结束时间不为空");
			return false;
		}
	}
	if(flag==108){
		var rows = $("#rows").val();
		if(rows==''){
			alert("请设置模块行数");
			return false;
		}
		var cols = $("#cols").val();
		if(cols==''){
			alert("请设置模块列数");
			return false;
		}
	}
    //模块19 预约模块活动开始时间不为空
    if(flag == 19){
    	var remindtime = $("#remindtime").val();
    	if(remindtime ==''){
    		alert("活动开始时间不为空");
    		return false;
    	}
    }
    if(flag==101 || flag==11 || flag==3 || flag==17 || flag==1 || flag==2 || flag==4 || flag==5
    		|| flag==7 || flag==8 || flag==10 || flag==108){//判断轮播图或者模块11宽高必填
    	var width = $("#width").val();
    	var height = $("#height").val();
    	if(flag!=108 && width==''){
    		alert("模块宽不为空");
        	return false;
    	}
    	if(height==''){
    		alert("模块高不为空");
        	return false;
    	}else {
    		if(parseInt(height,10)>0){
    		}else{
    			alert("模块高需大于0");
        		return false;
    		}
    		
    	}
    }
	var num = $(".upload").length;
	if(flag==101&&num<=1){//如果轮播图数量为1个则不能保存
		alert("轮播图数量不能少于2个！");
		return false;
	}
	if(flag == 12){
		var commodity = $("#commodity").val();
		var myIds = "";
		if(commodity.indexOf(",")>=0){
			myIds = commodity.split(',');
		}else{
			myIds = commodity.split('\n');
		}
		if(myIds.length<4){
			alert("添加商品数量最低限制为4个！本次录入了"+myIds.length+"个商品编号。");
			return false;
		}
	}
	if(flag == 15){
		var commodity = $("#commodity").val();
		if(commodity==""){
			alert("请输入商品编号!");
			return false;
		}
	}
	var space = $("#space").val();
	if(space==''){
		alert("请选择模块间距");
    	return false;
	}
	for(var i=1;i<=num;i++){
		var commonId = "";
		var subType = $("#typeList"+i+" option:selected").val();
		if(subType == ""){
			alert("请选择链接位置！");
			return false;
		}
		//专题列表和横滑专题列表
		if(subType==5 || subType==100 || subType==1025 || subType == 1006 || subType == 1026||subType == 1||subType == 2||subType == 7){
			var input = "";
			if(subType == 5){
				input = $("#topicsInput"+i)[0];
			}else if(subType == 100){
				input = $("#subjectInput"+i)[0];
			}else if(subType == 1025){
				input = $("#subjectVerticalInput"+i)[0];
			}else if(subType == 1026){
				input = $("#activityInput"+i)[0];
			}else if(subType == 1||subType == 2||subType == 7){
				input = $("#secondCateInput"+subType+i)[0];
			}else{
				input = $("#firstCategory"+i)[0];
			}
	    	var res = input.value;
	    	if(!res || res==""){
	    		if(subType == 1006||subType == 1||subType == 2||subType == 7){
	    			alert("请选择分类!");
	    		}else if(subType == 1026){
	    			alert("请选择页面列表!");
	    		}else{
	    			alert("请选择专题!");
	    		}
			 	return false;
	    	}else{
	    		var list = input.list;
	    		var options = $("#"+list.id+" option[value='"+res+"']");
		    	if(options && options.length>0){
		    		var option = options[0];
		    		commonId = option.id;
		    	}
	    	}
	   		 if(commonId == null || commonId ==""){
	   			if(subType == 1006||subType == 1||subType == 2||subType == 7){
	    			alert("请选择分类!");
	   			}else if(subType == 1026){
	    			alert("请选择页面列表!");
	    		}else{
	    			alert("请选择专题!");
	    		}
			 	return false;
			 }
	   		 $("#linkUrl"+i).val("");
	   		 $("#commonId"+i).val(commonId);
	     }
		//web专题或手动输入链接
		if(subType == 13 || subType == 9 || subType == 2000){
			var linkUrl = $("#webInput"+i).val();
			if(subType == 9){
				linkUrl = $("#urlInput"+i).val();
			}
			if(subType == 2000){
				linkUrl = $("#paramInput"+i).val();
			}
			if(!linkUrl || linkUrl==""){
				alert("请输入url链接!");
				return false;
			}else{
				$("#linkUrl"+i).val(linkUrl);
				$("#commonId"+i).val(commonId);
			}
		}
		//关键字列表
		if(subType == 1029){
			var commonId = $("#keyword"+i).val();
			if(!commonId || commonId==""){
				alert("请输入关键字!");
				return false;
			}else{
				$("#linkUrl"+i).val("");
				$("#commonId"+i).val(commonId);
			}
		}
		//商品详情页
		if(subType  == 1007){
			commonId =$("#commodityName"+i).val();
			if(commonId == null || commonId ==""){
			 	alert("请选择商品!");
			 	return false;
			 }
	 	 }
		//优购快报
		if(subType==8){
		   	commonId =$("#articleName"+i+" option:selected").val();
		   	if(commonId == null || commonId ==""){
			 	alert("请选择优购快报!");
			 	return false;
			}
	   		 var articleNameAndId = commonId.split(";");
	   		 $("#commonId"+i).val(articleNameAndId[0]);
			 $("#linkUrl"+i).val(articleNameAndId[1]);
		 }
		
		$("#subType"+i).val(subType);
		//判断轮播图必填项---begin
		if(flag==101){
			var subStarttime = $("#subStarttime"+i).val();
			var subEndtime = $("#subEndtime"+i).val();
			if(!((subStarttime=='' && subEndtime=='') || (subStarttime!='' && subEndtime!=''))){
		    	alert("开始时间、结束时间都为空 或者  开始时间、结束时间都不为空");
		    	return false;
		    }
		}//判断轮播图必填项---end
		if(flag==101||flag==104){//轮播图或者优购快报
			 var sortNo = $("#sortNo"+i).val();
			    if(sortNo ==''){
			    	alert("排序号不为空");
			    	return false;
			    }
		}
		if(flag==104){//优购快报标题
			var title = $("#title"+i).val();
		    if(title =='' || title == null){
		    	alert("快报标题不能为空");
		    	return false;
		    }
		    if(strlen(title) > 100){
				alert("快报标题长度超过了50个汉字，请重新输入!");
				$("#title"+i).focus();
				return false;
			}
		}
	}
	if(flag==105){
		var content = $("#content").val();
	    if(content==''){
	    	alert("图文内容不能为空");
	    	return false;
	    }
	}
	
	//webview
	if(flag == 103){
		//webview模块大小必填
		var moduleSize = $("#moduleSize").val();
		if(moduleSize == ""){
			alert("请选择模块大小");
			return false;
		}
		//webview url链接必填
		var linkUrl = $("#linkUrl1").val();
		if(linkUrl==""){
			alert("请输入模块中显示的H5网页地址!");
			return false;
		}
	}
	
    $("#form1").submit();
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

//按编号添加商品
function addCommodity(){
	var commodityText = $.trim($("#commodityText").val());
	if(commodityText==""){
		alert("请输入商品编号！");
		return;
	}
	//验证输入的商品编号
	var patten=/^[0-9,\r\n]+$/;
	if(!patten.test(commodityText)){
		alert("商品编号填写不合法，注意多个编号之间用英文逗号或换行隔开！");
		return false;
	}
	
	var myIds = "";
	if(commodityText.indexOf(",")>=0){
		myIds = commodityText.split(',');
	}else{
		myIds = commodityText.split('\n');
	}
	if(flag == 12){
		if(myIds.length<4){
			alert("添加商品数量最低限制为4个！本次录入了"+myIds.length+"个商品编号。");
			return false;
		}
		if(myIds.length>30){
			alert("添加商品数量最大限度30个！本次录入了"+myIds.length+"个商品编号。");
			return false;
		}
	}
	if(flag == 15){
		if(myIds.length>9){
			alert("添加商品数量最大限度9个！本次录入了"+myIds.length+"个商品编号。");
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
	//获得异步请求到得json数据
	$.getJSON("/system/CmsModuleController/getCommodityByIds.sc?para=new Date()",{ids:myId},function(data){
		//将填充到商品列表中的html代码
		var html="";
		//已添加的商品编号
		var commodityNos="";
		$.each(data.result, function(i,item){
			commodityNos+=item.commodityCode+",";
			if(flag == 12){
				html+="<div class='slbdiv'>"+
			          "<img src='"+item.defaultPic+"'/>"+
			          "<p>库存："+item.inventoryNumber+"</p>"+
			          "<p>￥"+item.salePriceN+"<span>/￥<del>"+item.publicPrice+"</del></span></p>"+
		              "<a href='javascript:void(0);'><img class='close delCommodity' src='/images/homepage/close.png'></a></div>";
			}
			if(flag == 15){
				html+="<div class='goodThreediv'>"+
				"<img src='"+item.defaultPic+"' class='goodDivImg'/>"+
				"<p>库存："+item.inventoryNumber+"</p>"+
				"<p>￥"+item.salePriceN+"<span>/￥<del>"+item.publicPrice+"</del></span></p>"+
				"<a href='javascript:void(0);'><img class='close delCommodity' src='/images/homepage/close.png'></a></div>";
			}
		});
		$("#commodity").val("");
		$("#commodityText").val("");
		if(html==""){
			alert("没有找到跟输入商品编号匹配的商品！");
		}else{
			commodityNos = commodityNos.substring(0,commodityNos.length-1);
			$("#commodity").val(commodityNos);
			$("#commodityText").val(commodityNos);
			alert("全部添加商品成功！");
		}
		$("#leftModule"+flag).html(html);
		var errorIds="";
		$.each(data.errorid,function(i,item){
			errorIds+=","+item;
		});
		if(errorIds!=""){
			alert("以下商品已下架"+errorIds+",其他商品添加完毕");
		}
		var soldOutIds="";
		$.each(data.soldOutList,function(i,item){
			soldOutIds+=","+item;
		});
		if(soldOutIds!=""){
			alert("以下商品已售罄"+soldOutIds+",其他商品添加完毕");
		}
	});
}

/**
 * 验证ref标题是否存在
 */
function validateRefTitle(){
	var refTitle = $("#refTitle").val();
	if(refTitle == null && refTitle != ""){
		alert("ref标题不能为空");
		return false;
	}
	var refTitleO = $("#refTitleO").val();
	if(refTitleO != refTitle){
		$.ajax({  
            async:true,
            type: "POST",  
            url: "/system/CmsModuleController/validateRefTitle.sc?para=new Date()",  
            data: "refTitle="+refTitle,  
            success: function(data){  
            	if(data == "1"){
    				alert("ref标题已存在,请重新输入");
    				$("#refTitle").val("");
    				return false;
    			}
            }  
        }); 
	}
}

//获取模块大小
function getModuleSize(){
	var moduleSize = $("#moduleSize").val();
	if(moduleSize == ""){
		$("#width").val("");
		$("#height").val("");
	}
	if(moduleSize == 1){
		$("#width").val(640);
		$("#height").val(1);
	}
	if(moduleSize == 2){
		$("#width").val(640);
		$("#height").val(500);
	}
	if(moduleSize == 3){
		$("#width").val(640);
		$("#height").val(300);
	}
	if(moduleSize == 4){
		$("#width").val(640);
		$("#height").val(200);
	}
}


function getRecommend2RowNums(num,isRows){
	var n = parseInt(num,10);

	//最大行/列数
	var maxNum = isRows?10:6;

	//最小行/列数
	var minNum = isRows?1:2;

	if(n<minNum){
		n=minNum
	}else if(n>maxNum){
		n=maxNum;
	}
	return  n;
}
