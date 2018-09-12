<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="Keywords" content=" , ,优购网,B网络营销系统,商品管理" />
	<meta name="Description" content=" , ,B网络营销系统-商品管理" />
	<title>优购手机CMS后台管理-优购网</title>
	
	<link rel="stylesheet" type="text/css" href="${BasePath}/styles/sys-base.css"/>
	<link rel="stylesheet" type="text/css" href="${BasePath}/styles/sys-global.css"/>
	<link rel="stylesheet" type="text/css" href="${BasePath}/styles/sys-activity.css"/>
	<script type="text/javascript" src="${BasePath}/js/jquery/jquery-1.6.2.min.js"></script> 
	<script type="text/javascript" src="${BasePath}/js/datepicker/WdatePicker.js?${YOUGOU_JS_VERSION}"></script>
	<script type="text/javascript" src="${BasePath}/js/ajaxfileupload.js"></script>
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
			        <li class="curr"><span>编辑推荐模块</span></li>
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
	            <#if cmsModule.moduleDetails??>
	              <#list cmsModule.moduleDetails as cmsModuleDetail>
	              <#if cmsModuleDetail?? && cmsModuleDetail_index%(cmsModule.rows?default(0)?number*cmsModule.cols?default(0)?number)==0>
	               <div class="recommendlist"  id="editDiv108" >
	               </#if>
	                    <div class="col${cmsModule.cols?default(4)}">
	                        <a href="#">
	                        <#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
	                        	<img id="fl108${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
	                        <#else>
	                        	<img id="fl108${cmsModuleDetail_index+1}" src="/images/homepage/tuijian1.jpg" />
	                        </#if>
	                        </a>
	                        <span class="num" style="display:none;">${cmsModuleDetail_index+1}.</span> 
	                        <p>${cmsModuleDetail.title!}</p>
	                    </div>
	                    <#if cmsModuleDetail?? && cmsModuleDetail_index%(cmsModule.rows?default(0)?number*cmsModule.cols?default(0)?number)==((cmsModule.rows?default(0)?number*cmsModule.cols?default(0)?number)-1)>
							<a href="javascript:void(0);" class="delete2">删除</a>
					</div>
					</#if>
				   </#list>
	              </#if>
	              </div>
	              <div class="Addimg">                  
	                  <a href="javascript:void(0)" class="addArea">＋</a>
	              </div>
	          </div>
	      </div><!--leftCon1-->
	      <div class="rightCon1">
	      <form id="form1" name="form1" action="${BasePath}/system/CmsModuleController/updateModule.sc" method="post">
	      	  <input type="hidden" id="id" name="id" value="${cmsModule.id!}" />
	      	  <input type="hidden" id="effectRange" name="effectRange" value="1" />
	      	  <input type="hidden" id="imgType" name="imgType" value="5" /><!-- 图片类型：5：专题icon -->
      	  	  <input type="hidden" id="moduleStyle" name="moduleStyle" value="${moduleStyle!''}" />
	      	  <input type="hidden" id="moduleType" name="moduleType" value="${moduleType!'1'}" />
	          <input type="hidden" id="navigationId" name="navigationId" value="${navigationId!''}" />
	          <input type="hidden" id="activityId" name="activityId" value="${activityId!''}" />
	          <div style="color:#3d4245;font-size:14px;">
	          	<p>当前状态：
	          		<#if cmsModule.isDisplay==1>启用<input type="button" value="停用" onclick="changeStatus('${cmsModule.id!}',0,'${currentPLC!}','${activityId!}');" style="margin-left:40px;"/>
	          		<#else>停用</#if>
				</p>
	          </div>
	          <div class="wayCon">
	              <p><span class="pl10"></span>起止时间：
	              	 <input type="text" class="ipt_text" readonly="readonly" name="starttime" id="starttime" class="Wdate" 
	              	 		value="<#if cmsModule.startTime??>${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')}</#if>"
				            onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
				            maxDate:'#F{$dp.$D(\'endtime\')||\'2020-10-01 00:00:00\'}'})" size="20"/>&nbsp;&nbsp;
				          至  &nbsp;&nbsp;<input type="text" class="ipt_text" readonly="readonly"  name="endtime" id="endtime"  class="Wdate"
				          	value="<#if cmsModule.endTime??>${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}</#if>"
				    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
				    		minDate:'%y-%M-{%d}'&&'#F{$dp.$D(\'starttime\')}'})" size="20"  />
	              </p>
	              <p style="display:none;"><span class="red">*</span>模块间距：
	              	<select class="ipt_text" name="space" id="space">
	              		<option value="0" <#if cmsModule.space?? && cmsModule.space==0>selected="selected"</#if>>无间距</option>
	              		<option value="10" <#if cmsModule.space?? && cmsModule.space==10>selected="selected"</#if>>有间距</option>
	              	</select>
	              </p>
	              <p><span class="red">*</span>模块左右间距：
	              	<select class="ipt_text" name="spaceLr" id="spaceLr">
	              		<option value="0" <#if cmsModule.spaceLr?? && cmsModule.spaceLr==0>selected="selected"</#if>>无间距</option>
	              		<option value="10" <#if cmsModule.spaceLr?? && cmsModule.spaceLr==10>selected="selected"</#if>>有间距</option>
	              	</select>
	              </p>
                  <p><span class="red">*</span>模块行数：
                      <input class="ipt_text" name="rows" id="rows" value="${cmsModule.rows?default(0)}" />
                  </p>
                  <p><span class="red">*</span>模块列数：
                      <input class="ipt_text" name="cols" id="cols" value="${cmsModule.cols?default(0)}" />
                  </p>
                  <p><span class="red">*</span>模块高：
                      <input class="ipt_text" name="height" id="height" value="${cmsModule.height?default(0)}" />
                      <input style="display: none" class="ipt_text" name="width" id="width" value="640" />
				  </p>
                  <p style="margin-left: 10px;">模块背景：
                      <select class="ipt_text" name="typeBg" id="typeBg" onchange="javascript:getTypeBg();">
                          <option value="0" <#if cmsModule.typeBg?? && cmsModule.typeBg=0>selected="selected"</#if>>请选择</option>
                          <option value="1" <#if cmsModule.typeBg?? && cmsModule.typeBg==1>selected="selected"</#if>>背景图</option>
                          <option value="2" <#if cmsModule.typeBg?? && cmsModule.typeBg==2>selected="selected"</#if>>背景色</option>
                      </select>
                  </p>
                  <div id="bg1" style="margin-left: 10px;<#if !(cmsModule.typeBg?? && cmsModule.typeBg==1)>display:none</#if>">
                      <p>图片：
                          <input id="fileimg0" class="fileimg" type="file" name="file"/>
                          <input id="uploadBtn0" class="uploadBtn" type="button" onclick="javascript:ajaxImageUploadBg(this)" value="上传图片"/>
                          <input type="button" class="addImageBtn" value="添加图片" onclick="javaScript:selectBgImage();" />
                      </p>
                      <div class="uploadimgshow">
                          <a href="javascript:void(0)"><img class="closeBg" src="/images/homepage/close.png"/></a>
					  <#if cmsModule.bg?? && cmsModule.bg!="">
                          <img src="${cmsModule.bg!}" id="iptimg0" class="iptimgs" style="height:50px;"/>
					  <#else>
                          <img src="/images/homepage/2img1.jpg" id="iptimg0" class="iptimgs" style="height:50px;"/>
					  </#if>
                      </div>
                  </div>
                  <div id="bg2" style="margin:0 0 35px 10px;<#if !(cmsModule.typeBg?? && cmsModule.typeBg==2)>display:none</#if>">
                      <div style="float:left;"><p>色值：<input id="bgColor" name="bgColor" type="text" class="ipt_text" value="${cmsModule.bg!}" onblur="javascript:changeBgColor();"/></p></div>
                      <div id="bgColorBlock" style="width: 15px;height: 15px;margin: 5px 20px 0 10px;float:left;background-color:${cmsModule.bg!};"></div>
                  </div>
                  <input id="bg" name="bg" type="hidden" value="${cmsModule.bg!}"/>
	          </div>
	          <div class="wayCon" id="wayCon">
	          	<div class="TjArea">
	          		<div class="TjAreaCon">
			            <#if cmsModule.moduleDetails??>
			              <#list cmsModule.moduleDetails as cmsModuleDetail>
			               <#if cmsModuleDetail?? && cmsModuleDetail_index%4==0>
			              	 <div class="Tj">
			              	 </#if>
			              	 	<div id="upload${cmsModuleDetail_index+1}" class="upload">
			              	 		<p>图片<span class="number">${cmsModuleDetail_index+1}</span>：
			              	 		<input id="fileimg${cmsModuleDetail_index+1}" class="fileimg" type="file" name="file"/>
									<input id="uploadBtn${cmsModuleDetail_index+1}" class="uploadBtn" type="button" onclick="javascript:ajaxImageUpload(this)" value="上传图片"/>
									<input type="button" class="addImageBtn" value="添加图片" onclick="javaScript:selectImage(${cmsModuleDetail_index+1});" />
									</p>
									<div class="uploadimgshow">
									   <a href="javascript:void(0)"><img class="close1" src="/images/homepage/close.png"/></a>
									   <#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
											<img src="${cmsModuleDetail.imgUrl!}" id="iptimg${cmsModuleDetail_index+1}" class="iptimgs"/>
									   <#else>
											<img src="/images/homepage/1img1.jpg" id="iptimg${cmsModuleDetail_index+1}" class="iptimgs"/>
										</#if>
									<input id="img${cmsModuleDetail_index+1}" type="hidden" name="moduleDetails[${cmsModuleDetail_index}].imgUrl" value="${cmsModuleDetail.imgUrl!}"/>
									</div>
									<!--
									<p class="title"><span class="red">&nbsp;</span>模块名称：
										<input id="title${cmsModuleDetail_index+1}" class="ipt_text" type="text"
											   value="${cmsModuleDetail.title! }" name="moduleDetails[${cmsModuleDetail_index}].title"/>
									</p>
									-->
									<#include "/manager/activity/module/module_link_position.ftl">
									<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].sortNo" id="sortNo${cmsModuleDetail_index+1}" value="${cmsModuleDetail_index+1}" />
									<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].commonId" id="commonId${cmsModuleDetail_index+1}" value="${cmsModuleDetail.commonId!}"/>
									<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].subType" id="subType${cmsModuleDetail_index+1}" value="${cmsModuleDetail.subType!}"/>
									<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].linkUrl" id="linkUrl${cmsModuleDetail_index+1}" value="${cmsModuleDetail.linkUrl!}"/>
			              	 	</div>
			              	 <#if cmsModuleDetail?? && cmsModuleDetail_index%4==3>
			              	 </div>
			              	 </#if>
			              </#list>
			            </#if>
		            </div>
	            </div>
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
