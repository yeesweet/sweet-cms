<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="Keywords" content=" , ,优购网,B网络营销系统,商品管理" />
	<meta name="Description" content=" , ,B网络营销系统-商品管理" />
	<title>优购手机CMS后台管理-优购网</title>
	<script type="text/javascript">
		BasePath = "${BasePath}";
    </script>
	<link rel="stylesheet" type="text/css" href="${BasePath}/styles/sys-base.css"/>
	<link rel="stylesheet" type="text/css" href="${BasePath}/styles/sys-global.css"/>
	<link rel="stylesheet" type="text/css" href="${BasePath}/styles/sys-activity.css"/>
	<script type="text/javascript" src="${BasePath}/js/jquery/jquery-1.6.2.min.js"></script> 
	<script type="text/javascript" src="${BasePath}/js/datepicker/WdatePicker.js?${YOUGOU_JS_VERSION}"></script>
	<script type="text/javascript" src="${BasePath}/js/ajaxfileupload.js"></script>
	<!--
	<script type="text/javascript" src="${BasePath}/js/homepage/cmsBoard.js"></script>
	-->
	<script type="text/javascript" src="${BasePath}/component/commoditySingleSelector.js?${YOUGOU_JS_VERSION}"></script>
	<script type="text/javascript" src="/component/imageSelector.js?${YOUGOU_JS_VERSION}"></script>
	<script type="text/javascript" src="${BasePath}/js/common.min.js"></script> 
	<script type="text/javascript" src="${BasePath}/js/ygdialog/lhgdialog.min.js?s=chrome"></script>
    <script type="text/javascript" src="${BasePath}/js/activity/module_re_bg.js"></script>
    <script type="text/javascript" src="${BasePath}/js/activity/module_common.js"></script>
</head>
<body style="background:#f6f6f6">
<div class="container">
  	<!--工具栏start--> 
    <div class="toolbar">
			<div class="t-content"> <!--操作按钮start-->
				<div class="btn" onclick="goto_back('${navigationId!}','${activityId!}')">
					<span class="btn-back"></span>
					<b class="ico_btn back"></b>
					<span class="btn_txt">返回</span>
					<span class="btn_r"></span> 
				</div>
			</div>
		</div>
    <!--工具栏end-->
  	<!-- 活动专题正文部分 -->
	<div class="list_content">
		<!--当前位置start--> 
        <div class="top clearfix">
			    <ul class="tab">
			        <li class="curr"><span>添加推荐模块二</span></li>
			    </ul>
			  </div>
        <!--当前位置end-->
	<!--主体start--> 
    <div id="modify" class="modify_homepage">
		<!-- <div class="left"></div> -->
	    <div class="right">
	      <div class="leftCon1" style="">
	          <div class="divlist">
	            <div class="addBox">
	               <div class="recommendlist"  id="editDiv108" >
	                    <div>
	                        <a href="#"><img id="fl1081" src="/images/homepage/tuijian1.jpg" /></a>
	                        <span class="num" style="display:none;">1.</span> 
	                        <p>标题</p>
	                    </div>
	                     <div>
	                        <a href="#"><img id="fl1082" src="/images/homepage/tuijian1.jpg" /></a>
	                        <span class="num" style="display:none;">2.</span> 
	                        <p>标题</p>
	                    </div>
	                     <div>
	                        <a href="#"><img id="fl1083" src="/images/homepage/tuijian1.jpg" /></a>
	                        <span class="num" style="display:none;">3.</span> 
	                        <p>标题</p>
	                    </div>
	                     <div>
	                        <a href="#"><img id="fl1084" src="/images/homepage/tuijian1.jpg" /></a>
	                        <span class="num" style="display:none;">4.</span> 
	                        <p>标题</p>
	                    </div>
						<a href="javascript:void(0);" class="delete1">删除</a>
						</div>
	                
	            </div>
	              <div class="Addimg">                  
	                  <a href="javascript:void(0)" class="addArea2">＋</a>
	              </div>
	          </div>
	      </div><!--leftCon1-->
	      <div class="rightCon1">
	      <form id="form1" name="form1" action="${BasePath}/system/CmsModuleController/saveModule.sc" method="post">
	      	  <input type="hidden" id="effectRange" name="effectRange" value="1" />
	      	  <input type="hidden" id="imgType" name="imgType" value="5" /><!-- 图片类型：5：专题icon -->
	      	  <input type="hidden" id="moduleStyle" name="moduleStyle" value="${moduleStyle!''}" />
	      	  <input type="hidden" id="moduleType" name="moduleType" value="${moduleType!'1'}" />
	          <input type="hidden" id="navigationId" name="navigationId" value="${navigationId!''}" />
	          <input type="hidden" id="activityId" name="activityId" value="${activityId!''}" />
	          <div class="wayCon">
	              <p><span class="pl10"></span>起止时间：
	              	 <input type="text" class="ipt_text" readonly="readonly" name="starttime" id="starttime" class="Wdate" 
				            onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
				            maxDate:'#F{$dp.$D(\'endtime\')||\'2020-10-01 00:00:00\'}'})" size="20"/>&nbsp;&nbsp;
				          至  &nbsp;&nbsp;<input type="text" class="ipt_text" readonly="readonly"  name="endtime" id="endtime"  class="Wdate"
				    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
				    		minDate:'%y-%M-{%d}'&&'#F{$dp.$D(\'starttime\')}'})" size="20"  />
	              </p>
	              <p style="display:none;"><span class="red">*</span>模块间距：
	              	<select class="ipt_text" name="space" id="space">
	              		<option value="0" selected="selected">无间距</option>
	              		<option value="10">有间距</option>
	              	</select>
	              </p>
	              <p><span class="red">*</span>模块左右间距：
	              	<select class="ipt_text" name="spaceLr" id="spaceLr">
	              		<option value="0" selected="selected">无间距</option>
	              		<option value="10">有间距</option>
	              	</select>
	              </p>
                 <p><span class="red">*</span>模块行数：
                      <input class="ipt_text" name="rows" id="rows" type="text" maxlength="1" onkeyup="this.value=getRecommend2RowNums(this.value.replace(/\D/g,''),true)" onafterpaste="this.value=getRecommend2RowNums(this.value.replace(/\D/g,''),true)"/>
                  </p>
                  <p><span class="red">*</span>模块列数：
                      <input class="ipt_text" name="cols" id="cols" type="text"  maxlength="1" onkeyup="this.value=getRecommend2RowNums(this.value.replace(/\D/g,''))" onafterpaste="this.value=getRecommend2RowNums(this.value.replace(/\D/g,''))"/>
                  </p>
                  <p><span class="red">*</span>模块高：
                      <input class="ipt_text" name="boardHeight" id="boardHeight" />
                      <input style="display: none" class="ipt_text" name="boardWidth" id="boardWidth" value="640" />
                  </p>
                  <div>
		              <a class="btn_save" onclick="setRecommend2Rows()" style="color:#fff;">确定行列数</a>
		          </div>
                  <p style="margin-left: 10px;">模块背景：
                      <select class="ipt_text" name="typeBg" id="typeBg" onchange="javascript:getTypeBg();">
                          <option value="0" selected="selected">请选择</option>
                          <option value="1">背景图</option>
                          <option value="2">背景色</option>
                      </select>
                  </p>
                  <div id="bg1" style="margin-left: 10px;display:none">
                      <p>图片：
                          <input id="fileimg0" class="fileimg" type="file" name="file"/>
                          <input id="uploadBtn0" class="uploadBtn" type="button" onclick="javascript:ajaxImageUploadBg(this)" value="上传图片"/>
                          <input type="button" class="addImageBtn" value="添加图片" onclick="javaScript:selectBgImage();" />
                      </p>
                      <div class="uploadimgshow">
                          <a href="javascript:void(0)"><img class="closeBg" src="/images/homepage/close.png"/></a>
                          <img src="/images/homepage/2img1.jpg" id="iptimg0" class="iptimgs" style="height:50px;"/>
                      </div>
                  </div>
                  <div id="bg2" style="margin:0 0 35px 10px;display:none">
                      <div style="float:left;"><p>色值：<input id="bgColor" name="bgColor" type="text" class="ipt_text" onblur="javascript:changeBgColor();"/></p></div>
                      <div id="bgColorBlock" style="width: 15px;height: 15px;margin: 5px 20px 0 10px;float:left;"></div>
                  </div>
                  <input id="bg" name="bg" type="hidden"/>
	          </div>
	          <div class="wayCon" id="wayCon">
	            
	           </div>          
			   <div>
	              <a class="btn_save" onclick="checkForm()" style="color:#fff;">保存</a>
	           </div>
	           </form>
	      </div><!--rightCon-->
	    </div>
	</div>
  </div>
</div>	  
</body>


</html>
