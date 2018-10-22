<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/commons/basejs.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加轮播图</title>

	<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-base.css?v=201809242210" />
	<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-global.css?v=201809242210" />
	<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-activity.css?v=201809242210" />

	<%--<script type="text/javascript" src="${staticPath }/static/homepage/jquery-1.6.2.min.js?v=201809242210"></script>--%>
	<script type="text/javascript" src="${staticPath }/static/homepage/common.min.js"></script>
	<script type="text/javascript" src="${staticPath }/static/activity/list_activity.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/jquery/jquery.dragsort-0.5.2.min.js"></script>
	<script type="text/javascript" src="${staticPath }/static/homepage/yxMobileSlider.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/activity/index.js?v=201809242210"></script>

	<script type="text/javascript" src="${staticPath }/static/My97DatePicker/WdatePicker.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/component/commoditySingleSelector.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/component/imageSelector.js?v=201809242210"></script>
	<%--<script type="text/javascript" src="${staticPath }/static/ygdialog/lhgdialog.min.js?s=chrome"></script>--%>
	<script type="text/javascript" src="${staticPath }/static/jquery/ajaxfileupload.js"></script>
	<script type="text/javascript" src="${staticPath }/static/activity/cmsModule.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/activity/module_common.js?v=201809242210"></script>
</head>
<body style="background:#f6f6f6">
<div class="container">
  	<!--工具栏start--> 
    <div class="toolbar">
			<div class="t-content"> <!--操作按钮start-->
				<div class="btn" onclick="goto_back('${pageManagerId}')">
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
			        <li class="curr"><span>添加轮播图</span></li>
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
	                  <div class="lunboimgshow" id="editDiv101">
	                      <img id="fl1011" src="${staticPath }/static/style/images/homepage/lunbo1.jpg" />
	                      <span class="num" style="display:none;">1.</span>
	                      <a href="javascript:void(0);" class="deleteL">删除</a>
	                  </div>                  
	              </div>
	
	              <div class="Addimg">                 
	                  <a href="javascript:void(0)" class="addLb">＋</a>
	              </div>
	          </div>
	      </div><!--leftCon1-->
	      <div class="rightCon1">
	      <form id="form1" name="form1" action="${BasePath}/cmsModuleController/saveModule.sc" method="post">
	      	  <input type="hidden" id="effectRange" name="effectRange" value="1" />
	      	  <input type="hidden" id="moduleStyle" name="moduleStyle" value="${moduleStyle}" />
	      	  <input type="hidden" id="moduleType" name="moduleType" value="${(moduleType == null || moduleType == "")?'3':moduleType}" />
	          <input type="hidden" id="pageManagerId" name="pageManagerId" value="${pageManagerId}" />
	          <div class="wayCon">
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="640"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="400"/>px
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
