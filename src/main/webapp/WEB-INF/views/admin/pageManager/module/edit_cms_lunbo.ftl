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
			        <li class="curr"><span>编辑轮播图</span></li>
			    </ul>
			  </div>
        <!--当前位置end-->
	<!--主体start--> 
    <div id="modify" class="modify_homepage">
		<!-- <div class="left"></div> -->
	    <div class="right">
	      <div class="leftCon1" style="">
		      <div class="divlist">
	              <div class="lunboimglist">
                  	<#if cmsModule.moduleDetails??>
						<#list cmsModule.moduleDetails as cmsModuleDetail>
                  			<div class="lunboimgshow">
								<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">    
		                    		<img id="fl101${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
								<#else>         
		                    		<img id="fl101${cmsModuleDetail_index+1}" src="/images/homepage/lunbo1.jpg" />
		                    	</#if>
		                      	<span class="num" style="display:none;">${cmsModuleDetail_index+1}.</span>
		                      	<a href="javascript:void(0);" class="deleteL">删除</a>
                   			</div>                 
                  		</#list>
                  	</#if>
	              </div>
	              <div class="Addimg">                 
	                  <a href="javascript:void(0)" class="addLb">＋</a>
	              </div>
	          </div>
	      </div><!--leftCon1-->
	      <div class="rightCon1">
	      <form id="form1" name="form1" action="${BasePath}/system/CmsModuleController/updateModule.sc" method="post">
	      	  <input type="hidden" id="id" name="id" value="${cmsModule.id!}" />
	      	  <input type="hidden" id="effectRange" name="effectRange" value="1" />
	      	  <input type="hidden" id="imgType" name="imgType" value="1" /><!-- 图片类型：1：轮播图 -->
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
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="${cmsModule.width!''}"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="${cmsModule.height!''}"/>px
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
	          			<#if cmsModuleDetail??><div class="LbArea">
							<div class="upload" id="upload${cmsModuleDetail_index+1}">
								<p class='time'>
									起止时间：
									<input class="g-ipt" type="text" readonly="readonly"  name="moduleDetails[${cmsModuleDetail_index}].subStarttime" id="subStarttime${cmsModuleDetail_index+1}"  class="Wdate"  
									value="<#if cmsModuleDetail.subStartTime??>${cmsModuleDetail.subStartTime?string('yyyy-MM-dd HH:mm:ss')}</#if>"
			    					onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,})" size="20" />至
									<input class="g-ipt" type="text" readonly="readonly"  name="moduleDetails[${cmsModuleDetail_index}].subEndtime" id="subEndtime${cmsModuleDetail_index+1}"  class="Wdate" 
									value="<#if cmsModuleDetail.subEndTime??>${cmsModuleDetail.subEndTime?string('yyyy-MM-dd HH:mm:ss')}</#if>"
		        					onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" size="20"  />
								</p>
								<p>
									图片<span class="number">${cmsModuleDetail_index+1}</span>：<input type="file" name="file" id="fileimg${cmsModuleDetail_index+1}" class="fileimg"/>
									<input type="button" id="uploadBtn${cmsModuleDetail_index+1}" class="uploadBtn" value="上传图片" onclick="javascript:ajaxImageUpload(this)"/>
									<input type="button" class="addImageBtn" value="添加图片" onclick="javaScript:selectImage(${cmsModuleDetail_index+1});" />
								</p>
								<div class="uploadimgshow">
									<a href="javascript:void(0)"><img src="/images/homepage/close.png"  class="close1"/></a>
									<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
										<img src="${cmsModuleDetail.imgUrl!}" id="iptimg${cmsModuleDetail_index+1}" class="iptimgs"/>
									<#else>
										<img src="/images/homepage/1img1.jpg" id="iptimg${cmsModuleDetail_index+1}" class="iptimgs"/>
									</#if>
									<input type="hidden" id="img${cmsModuleDetail_index+1}" name="moduleDetails[${cmsModuleDetail_index}].imgUrl" value="${cmsModuleDetail.imgUrl!}"/>
								</div>
								<#include "/manager/activity/module/module_link_position.ftl">
								<span class='red'>*</span>排&nbsp;序&nbsp;&nbsp;号： <input type="text" class="ipt_text" name="moduleDetails[${cmsModuleDetail_index}].sortNo" id="sortNo${cmsModuleDetail_index+1}" value="${cmsModuleDetail_index+1}"/>
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].commonId" id="commonId${cmsModuleDetail_index+1}" value="${cmsModuleDetail.commonId}"/>
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].subType" id="subType${cmsModuleDetail_index+1}" value="${cmsModuleDetail.subType}"/>
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].linkUrl" id="linkUrl${cmsModuleDetail_index+1}" value="${cmsModuleDetail.linkUrl}"/>
	          				</div>
						</div></#if>
					</#list>
				</#if>
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
