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
	<script type="text/javascript" src="${BasePath}/js/activity/module_common.js"></script>
	<script type="text/javascript" src="${BasePath}/js/kindeditor/kindeditor.js?${YOUGOU_JS_VERSION}"></script> 
	<style type="text/css">
		.upload p:nth-of-type(1){padding-left:0px;}
	</style>
</head>
<body style="background:#f6f6f6">
<div class="container">
  	<!--工具栏start--> 
    <div class="toolbar">
		<div class="t-content"> <!--操作按钮start-->
			<div class="btn" onclick="goto_back('${navigationId}','${activityId}')">
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
			        <li class="curr"><span>编辑图文</span></li>
			    </ul>
			  </div>
        <!--当前位置end-->
	<!--主体start--> 
    <div id="modify" class="modify_homepage">
		<!-- <div class="left"></div> -->
	    <div class="right">
	      <div class="leftCon1" style="display:none">
		      <div class="divlist">
	             
	          </div>
	      </div><!--leftCon1-->
	      <div class="rightCon1" style="float:left;width:680px;">
	      <form id="form1" name="form1" action="${BasePath}/system/CmsModuleController/updateModule.sc" method="post">
	      	  <input type="hidden" id="id" name="id" value="${cmsModule.id}" />
	      	  <input type="hidden" id="effectRange" name="effectRange" value="1" />
	      	  <input type="hidden" id="imgType" name="imgType" value="5" /><!-- 图片类型：5：专题icon -->
	      	  <input type="hidden" id="moduleStyle" name="moduleStyle" value="${moduleStyle!''}" />
	      	  <input type="hidden" id="moduleType" name="moduleType" value="${moduleType!'1'}" />
	          <input type="hidden" id="navigationId" name="navigationId" value="${navigationId!''}" />
	          <input type="hidden" id="activityId" name="activityId" value="${activityId!''}" />
	          <div style="color:#3d4245;font-size:14px;">
	          	<p>当前状态：
	          		<#if cmsModule.isDisplay==1>启用<input type="button" value="停用" onclick="changeStatus('${cmsModule.id}',0,'${currentPLC}','${activityId}');" style="margin-left:40px;"/>
	          		<#else>停用</#if>
				</p>
	          </div>
	          <div class="wayCon">
	              <p><span class="red">&nbsp;</span>模块名称：
	              	 <input type="text" id="moduleName" name="moduleName" value="${cmsModule.moduleName}" class="ipt_text" style="width:340px;"/>
	              </p>
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
	          </div>
	          <div class="wayCon" id="wayCon">
		          <#if cmsModule.moduleDetails??>
	          		<#list cmsModule.moduleDetails as cmsModuleDetail>
	          			<#if cmsModuleDetail??>
	          				<div class="upload">
								<#include "/manager/activity/module/module_link_position.ftl">
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].commonId" id="commonId${cmsModuleDetail_index+1}" value="${cmsModuleDetail.commonId}"/>
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].subType" id="subType${cmsModuleDetail_index+1}" value="${cmsModuleDetail.subType}"/>
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].linkUrl" id="linkUrl${cmsModuleDetail_index+1}" value="${cmsModuleDetail.linkUrl}"/>
							</div>
						</#if>
					</#list>
				</#if>
	          </div> 
	          <div class="wayCon" style="margin-top:0px;">
		          <textarea name="moduleDetails[0].content" id="content" style="border:none;display:none;height:400px">${cmsModule.moduleDetails[0].content}</textarea>
	          </div>          
			  <div>
	              <a class="btn_save" onclick="checkForm()" style="color:#fff;margin: 20px 0 20px 180px;">保存</a>
	          </div>
	        </form>
	      </div><!--rightCon-->
	    </div>
	</div>
  </div>
</div>	
<script>
KE.init({
	id: "content",
	newlineTag: "p",
	width: '640px',
	height:'200px',
	afterChange : function(id) {KE.util.setData("content");}
});
KE.create("content");
</script>  
</body>
</html>
