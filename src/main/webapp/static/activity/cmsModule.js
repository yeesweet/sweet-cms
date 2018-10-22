/*编辑页面*/
$(function(){ 
   
  var $_GET = (function(){
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
//alert($_GET['flag']);  
var data=$_GET['moduleStyle'];//模块样式
var currentPLC = $_GET['productLineCode'];//当前编辑平台

$("#editDiv"+data).show().siblings(".editDiv").hide();



var num=$("#editDiv"+data+" .num").length;
var clones=$(".upload").show().clone();
var divHtml="<input type='hidden' id='currentPLC' name='currentPLC' value='"+currentPLC+"'>";
if(data == 102){//推荐功能模块
	divHtml=divHtml +"<div class='TjArea'><div class='TjAreaCon'><div class='Tj'>";
}
if(data == 108){//推荐功能模块二
	divHtml=divHtml +"<div class='TjArea2'><div class='TjAreaCon2'><div class='Tj2'>";
}
if(data == 101||data==104){//轮播图或者优购快报
	divHtml=divHtml +"<div class='LbArea'>";
}
if(data == 5 || data == 3 || data == 11){//复用模块
	divHtml=divHtml +"<div class='Tj5'>";
}
for(var i=1;i<=num;i++){
	if(data == 17){//复用模块
    	divHtml=divHtml +"<div class='Tj5'>";
    }
    divHtml=divHtml+"<div class='upload' id='upload"+i+"'>";
    if(data==101){//轮播图
    	divHtml=divHtml+"<p class='time'>起止时间：<input type='text' class='ipt_text' readonly='readonly' name='moduleDetails["+(i-1)+"].subStarttime' id='subStarttime"+i+"' " +
    		"class='Wdate' onFocus='WdatePicker({dateFmt:\"yyyy-MM-dd HH:mm:ss\",readOnly:true})' size='20'/>&nbsp;&nbsp;"+
			"至  &nbsp;&nbsp;<input type='text' class='ipt_text' readonly='readonly'  name='moduleDetails["+(i-1)+"].subEndtime' id='subEndtime"+i+"' class='Wdate'" +
			"onFocus='WdatePicker({dateFmt:\"yyyy-MM-dd HH:mm:ss\",readOnly:true})' size='20'  />";
    }
    if(!(data==16 || data==105 || data==20)){
    	divHtml=divHtml+"<p>图片<span class='number'>"+i+"</span>：<input type='file' name='file' id='fileimg"+i+"' class='fileimg'/>"+
            "<input type='button' id='uploadBtn"+i+"' class='uploadBtn' value='上传图片' onclick='javascript:ajaxImageUpload(this)'/>" +
            "<input type='button' class='addImageBtn' value='添加图片' onclick='javaScript:selectImage("+i+");'/></p>"+
            "<div class='uploadimgshow'>"+
              "<a href='javascript:void(0)'><img src='/static/style/images/homepage/close.png'  class='close1'/></a>"+
              "<img src='/static/style/images/homepage/1img1.jpg' id='iptimg"+i+"' class='iptimgs'/>"+
              "<input type='hidden' id='img"+i+"' name='moduleDetails["+(i-1)+"].imgUrl'/>"+
            "</div>";
    }
    if(data==102 || data==17){//推荐功能模块和模块17和推荐功能模块二
    	divHtml=divHtml+"<p class='title'><span class='red'>&nbsp;</span>模块名称：<input type='text' id='title"+i+"' name='moduleDetails["+(i-1)+"].title' class='ipt_text'/></p>";
    }
    if(data==104){//优购快报
    	divHtml=divHtml+"<p class='title'><span class='red'>*</span>快报标题：<input type='text' id='title"+i+"' name='moduleDetails["+(i-1)+"].title' class='ipt_text' style='width:300px;'/>(50个字以内)</p>";
    }
    if(data != 19){
	    if(data == 16){
	    	divHtml=divHtml+"<span style='color:red;margin-bottom:10px;display:block;'>请选择促销专题上传商品</span>";
	    }
	    divHtml=divHtml+"<p class='place'><span class='red'>*</span>链接位置：<select name='typeList' id='typeList"+i+"' onchange='javascript:getLinkTypeDate(this);' class='selector'>"+
	            "<option value='0' >请选择</option>"+
	            "<option value='0' >无跳转</option>";
	    if(data != 18){
	    	divHtml=divHtml+"<option value='5'>专题列表</option>";
	    }
	    if(data == 18){
	    	divHtml=divHtml+"<option value='1027'>秒杀页面</option>";
	    }
	    if(!(data==16 || data == 18)){
	//	    if(currentPLC.indexOf("vm8")>=0 && currentPLC.indexOf("wap")<0 && currentPLC!="ALL"){
		    	divHtml=divHtml+"<option value='100'>横滑专题列表(app专用)</option>"+
		    					"<option value='1025'>竖滑专题列表(app专用)</option>"+
		    					"<option value='13'>web专题列表(app专用)</option>"+
		    					"<option value='1028'>账户管理(app专用)</option>"+
		    					"<option value='1001'>摇一摇页面(app专用)</option>";
	//	    }
		    	//divHtml=divHtml+"<option value='1003'>品牌页面</option>"+
		    	divHtml=divHtml+"<option value='1007'>商品详情页</option>";
		            // "<option value='1005'>分类一级页面</option>"+
	/*		        "<option value='1006'>分类二级页面</option>"+*/
		            // "<option value='1008'>购物车页</option>"+
		            // "<option value='1011'>查看物流</option>"+
		            // // "<option value='9'>手动输入链接</option>"+
		            // "<option value='8'>优购快报</option>";
	//	    if(currentPLC.indexOf("wap")>=0 && currentPLC.indexOf("vm8")<0 && currentPLC!="ALL"){
		    	divHtml=divHtml+"<option value='1023'>会员中心(h5专用)</option>"+
		    					"<option value='22'>我的优购(h5专用)</option>"+
		    					"<option value='1014'>我的订单(h5专用)</option>"+
		    					"<option value='1015'>我的收藏(h5专用)</option>";
	//	    }
		    divHtml=divHtml+"<option value='1026'>页面列表</option>";
		    divHtml=divHtml+"<option value='2'>分类列表</option>";
		    // divHtml=divHtml+"<option value='1'>品牌列表</option>";
		    // divHtml=divHtml+"<option value='7'>搜索关键字</option>";
		    // divHtml=divHtml+"<option value='1029'>关键字列表</option>";
		    // divHtml=divHtml+"<option value='2000'>自定义参数</option>";
	    }
	    divHtml=divHtml+"</select></p>"+
	            "<p id='tip5"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>促销专题：<span></span></p>"+
				"<p id='tip100"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>横滑专题：<span></span></p>"+
		 		"<p id='tip13"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>web专题：<span></span></p>"+
		 		"<p id='tip1007"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>商品名称：<span></span></p>"+	 
		 		"<p id='tip1006"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>分类选择：<span></span></p>"+
		 		"<p id='tip9"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>请输入链接：<span></span></p>"+
	    		"<p id='tip8"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>优购快报：<span></span></p>"+
	    		"<p id='tip1026"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>页面列表：<span></span></p>"+
	    		"<p id='tip1025"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>竖滑专题：<span></span></p>"+
	    		"<p id='tip2"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类：<span></span></p>"+
	    		"<p id='tip1"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌：<span></span></p>"+
	    		"<p id='tip7"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>关&nbsp;&nbsp;键&nbsp;字：<span></span></p>"+
	    		"<p id='tip1029"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>关&nbsp;&nbsp;键&nbsp;字：<span></span></p>"+
	    		"<p id='tip2000"+i+"' class='choosep' style='display:none;'><span class='red'>*</span>自定义参数：<span></span></p>";
    }
	if(data == 101||data==104){//轮播图或者优购快报
    	divHtml=divHtml+"<span class='red'>*</span>排&nbsp;序&nbsp;&nbsp;号：<input type='text' class='ipt_text' name='moduleDetails["+(i-1)+"].sortNo' id='sortNo"+i+"' value='' />";
    }else{
    	divHtml=divHtml+"<input type='hidden' name='moduleDetails["+(i-1)+"].sortNo' id='sortNo"+i+"' value='"+i+"' />";
    }
    divHtml=divHtml+"<input type='hidden' name='moduleDetails["+(i-1)+"].commonId' id='commonId"+i+"' />"+
			"<input type='hidden' name='moduleDetails["+(i-1)+"].subType' id='subType"+i+"' />"+
	 		"</div>";
    if(data == 17){//复用模块
    	divHtml=divHtml +"</div>";
    }
}
if(data == 102){//推荐功能模块
	divHtml=divHtml +"</div></div></div>";
}
if(data == 108){//推荐功能模块二
	divHtml=divHtml +"</div></div></div>";
}
if(data == 101){////轮播图
	divHtml=divHtml +"</div>";
}
if(data == 5 || data == 3 || data == 11){//复用模块
	divHtml=divHtml +"</div>";
}
    $("#wayCon").html(divHtml);


$(".delete").click(function(){
      $(this).parent().hide();
   });

});

