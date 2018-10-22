<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/commons/basejs.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑轮播图</title>

	<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-base.css?v=201809242210" />
	<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-global.css?v=201809242210" />
	<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-activity.css?v=201809242210" />

	<%--<script type="text/javascript" src="${staticPath }/static/homepage/jquery-1.6.2.min.js?v=201809242210"></script>--%>
	<script type="text/javascript" src="${staticPath }/static/homepage/common.min.js"></script>

	<script type="text/javascript" src="${staticPath }/static/My97DatePicker/WdatePicker.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/component/commoditySingleSelector.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/component/imageSelector.js?v=201809242210"></script>
	<%--<script type="text/javascript" src="${staticPath }/static/ygdialog/lhgdialog.min.js?s=chrome"></script>--%>
	<script type="text/javascript" src="${staticPath }/static/jquery/ajaxfileupload.js"></script>
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
					<c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
						<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
							<div class="lunboimgshow">
							<c:choose>
								<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
									<img id="fl101${cmsModuleDetailS.index+1}" src="${cmsModuleDetail.imgUrl}" />
								</c:when>
								<c:otherwise>
									<img id="fl101${cmsModuleDetailS.index+1}" src="${staticPath }/static/style/images/homepage/lunbo1.jpg" />
								</c:otherwise>
							</c:choose>
								<span class="num" style="display:none;">${cmsModuleDetailS.index+1}.</span>
								<a href="javascript:void(0);" class="deleteL">删除</a>
							</div>
						</c:forEach>
			  		</c:if>
	              </div>
	              <div class="Addimg">
	                  <a href="javascript:void(0)" class="addLb">＋</a>
	              </div>
	          </div>
	      </div><!--leftCon1-->
	      <div class="rightCon1">
	      <form id="form1" name="form1" action="${BasePath}/cmsModuleController/updateModule.sc" method="post">
	      	  <input type="hidden" id="id" name="id" value="${cmsModule.id}" />
	      	  <input type="hidden" id="effectRange" name="effectRange" value="1" />
			  <input type="hidden" id="moduleStyle" name="moduleStyle" value="${moduleStyle}" />
			  <input type="hidden" id="moduleType" name="moduleType" value="${(moduleType == null || moduleType == "")?'3':moduleType}" />
			  <input type="hidden" id="pageManagerId" name="pageManagerId" value="${pageManagerId}" />
	          <div style="color:#3d4245;font-size:14px;">
	          	<p>当前状态：<c:choose><c:when test="${cmsModule.isDisplay==1}">启用<input type="button" value="停用" onclick="changeStatus('${cmsModule.id}',0,'${currentPLC}','${activityId}');" style="margin-left:40px;"/></c:when><c:otherwise>停用</c:otherwise></c:choose>
				</p>
	          </div>
	          <div class="wayCon">
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="${(cmsModule.width==null||cmsModule.width=="")?'':cmsModule.width}"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="${(cmsModule.height==null||cmsModule.height=="")?'':cmsModule.height}"/>px
	              </p>
	              <p style="display:none;"><span class="red">*</span>模块间距：
	              	<select class="ipt_text" name="space" id="space">
	              		<option value="0" <c:if test="${not empty cmsModule.space && !(cmsModule.space eq null) && cmsModule.space==0}">selected="selected"</c:if>>无间距</option>
	              		<option value="10" <c:if test="${not empty cmsModule.space && !(cmsModule.space eq null) && cmsModule.space==0}">selected="selected"</c:if>>有间距</option>
	              	</select>
	              </p>
	              <p><span class="red">*</span>模块左右间距：
	              	<select class="ipt_text" name="spaceLr" id="spaceLr">
						<option value="0" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr==0}">selected="selected"</c:if>>无间距</option>
						<option value="10" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr==0}">selected="selected"</c:if>>有间距</option>
	              	</select>
	              </p>
	          </div>
	          <div class="wayCon" id="wayCon">
				<c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
					<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
						<c:if test="${not empty cmsModuleDetail && !(cmsModuleDetail eq null)}">
						<div class="LbArea">
							<div class="upload" id="upload${cmsModuleDetailS.index+1}">
								<p class='time'>
									起止时间：
									<input class="g-ipt" type="text" readonly="readonly"  name="moduleDetails[${cmsModuleDetailS.index}].subStarttime" id="subStarttime${cmsModuleDetailS.index+1}"  class="Wdate"
									value="<c:if test="${not empty cmsModuleDetail.subStartTime && !(cmsModuleDetail.subStartTime eq null)}"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModuleDetail.subStartTime}" /></c:if>"
			    					onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,})" size="20" />至
									<input class="g-ipt" type="text" readonly="readonly"  name="moduleDetails[${cmsModuleDetailS.index}].subEndtime" id="subEndtime${cmsModuleDetailS.index+1}"  class="Wdate"
									value="<c:if test="${not empty cmsModuleDetail.subEndTime && !(cmsModuleDetail.subEndTime eq null)}"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModuleDetail.subEndTime}" /></c:if>"
		        					onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" size="20"  />
								</p>
								<p>
									图片<span class="number">${cmsModuleDetailS.index+1}</span>：<input type="file" name="file" id="fileimg${cmsModuleDetailS.index+1}" class="fileimg"/>
									<input type="button" id="uploadBtn${cmsModuleDetailS.index+1}" class="uploadBtn" value="上传图片" onclick="javascript:ajaxImageUpload(this)"/>
									<input type="button" class="addImageBtn" value="添加图片" onclick="javaScript:selectImage(${cmsModuleDetailS.index+1});" />
								</p>
								<div class="uploadimgshow">
									<a href="javascript:void(0)"><img src="${staticPath }/static/style/images/homepage/close.png"  class="close1"/></a>
									<c:choose>
										<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
											<img src="${cmsModuleDetail.imgUrl}" id="iptimg${cmsModuleDetailS.index+1}" class="iptimgs"/>
										</c:when>
										<c:otherwise>
											<img src="${staticPath }/static/style/images/homepage/1img1.jpg" id="iptimg${cmsModuleDetailS.index+1}" class="iptimgs"/>
										</c:otherwise>
									</c:choose>
									<input type="hidden" id="img${cmsModuleDetailS.index+1}" name="moduleDetails[${cmsModuleDetailS.index}].imgUrl" value="${cmsModuleDetail.imgUrl}"/>
								</div>
								<%@ include file="/WEB-INF/views/admin/pageManager/module/module_link_position.jsp" %>
								<span class='red'>*</span>排&nbsp;序&nbsp;&nbsp;号： <input type="text" class="ipt_text" name="moduleDetails[${cmsModuleDetailS.index}].sortNo" id="sortNo${cmsModuleDetailS.index+1}" value="${cmsModuleDetailS.index+1}"/>
								<input type="hidden" name="moduleDetails[${cmsModuleDetailS.index}].commonId" id="commonId${cmsModuleDetailS.index+1}" value="${cmsModuleDetail.commonId}"/>
								<input type="hidden" name="moduleDetails[${cmsModuleDetailS.index}].subType" id="subType${cmsModuleDetailS.index+1}" value="${cmsModuleDetail.subType}"/>
	          				</div>
						</div>
			  			</c:if>
			  		</c:forEach>
			  </c:if>
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
