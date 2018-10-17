<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/commons/basejs.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑推荐模块</title>
	<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-base.css?v=201809242210" />
	<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-global.css?v=201809242210" />
	<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-activity.css?v=201809242210" />

	<script type="text/javascript" src="${staticPath }/static/homepage/jquery-1.6.2.min.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/homepage/common.min.js"></script>

	<script type="text/javascript" src="${staticPath }/static/My97DatePicker/WdatePicker.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/component/commoditySingleSelector.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/component/imageSelector.js?v=201809242210"></script>
	<script type="text/javascript" src="${staticPath }/static/ygdialog/lhgdialog.min.js?s=chrome"></script>
	<script type="text/javascript" src="${staticPath }/static/jquery/ajaxfileupload.js"></script>
	<script type="text/javascript" src="${staticPath }/static/activity/module_re_bg.js?v=201809242210"></script>
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
				<c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
					<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="status">
					<c:if test="${not empty cmsModuleDetail && !(cmsModuleDetail eq null) && status.index%(Integer.valueOf(cmsModule.rows)*Integer.valueOf(cmsModule.cols))==0}">
	             	<div class="recommendlist"  id="editDiv108" >
					   </c:if>
	                    <div class="col${cmsModule.cols?default(4)}">
	                        <a href="#">
								<c:choose>
									<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
										<img id="fl108${status.index+1}" src="${cmsModuleDetail.imgUrl}" />
									</c:when>
									<c:otherwise>
										<img id="fl108${status.index+1}" src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />
									</c:otherwise>
								</c:choose>
	                        </a>
	                        <span class="num" style="display:none;">${status.index+1}.</span>
	                        <p>${cmsModuleDetail.title}</p>
	                    </div>
						<c:if test="${not empty cmsModuleDetail && !(cmsModuleDetail eq null) && status.index%(Integer.valueOf(cmsModule.rows)*Integer.valueOf(cmsModule.cols))==(Integer.valueOf(cmsModule.rows)*Integer.valueOf(cmsModule.cols)-1)}">
	                    <a href="javascript:void(0);" class="delete2">删除</a>
					</div>
						</c:if>
			  		</c:forEach>
				</c:if>
	              </div>
	              <div class="Addimg">                  
	                  <a href="javascript:void(0)" class="addArea">＋</a>
	              </div>
	          </div>
	      </div><!--leftCon1-->
	      <div class="rightCon1">
	      <form id="form1" name="form1" action="${BasePath}/system/CmsModuleController/updateModule.sc" method="post">
	      	  <input type="hidden" id="id" name="id" value="${cmsModule.id}" />
			  <input type="hidden" id="effectRange" name="effectRange" value="1" />
			  <input type="hidden" id="moduleStyle" name="moduleStyle" value="${moduleStyle}" />
			  <input type="hidden" id="moduleType" name="moduleType" value="${(moduleType == null || moduleType == "")?'108':moduleType}" />
			  <input type="hidden" id="pageManagerId" name="pageManagerId" value="${pageManagerId}" />
	          <div style="color:#3d4245;font-size:14px;">
	          	<p>当前状态：
					<c:choose>
						<c:when test="${cmsModule.isDisplay==1}">
							启用<input type="button" value="停用" onclick="changeStatus('${cmsModule.id}',0,'${currentPLC}','${activityId}');" style="margin-left:40px;"/>
						</c:when>
						<c:otherwise>
							停用
						</c:otherwise>
					</c:choose>
				</p>
	          </div>
	          <div class="wayCon">
	              <p><span class="pl10"></span>起止时间：
	              	 <input type="text" class="ipt_text" readonly="readonly" name="starttime" id="starttime" class="Wdate" 
	              	 		value='<c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null)}"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /></c:if>'
				            onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
				            maxDate:'#F{$dp.$D(\'endtime\')||\'2020-10-01 00:00:00\'}'})" size="20"/>&nbsp;&nbsp;
				          至  &nbsp;&nbsp;<input type="text" class="ipt_text" readonly="readonly"  name="endtime" id="endtime"  class="Wdate"
												value='<c:if test="${not empty cmsModule.endTime && !(cmsModule.endTime eq null)}"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" /></c:if>'
				    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
				    		minDate:'%y-%M-{%d}'&&'#F{$dp.$D(\'starttime\')}'})" size="20"  />
	              </p>
	              <p style="display:none;"><span class="red">*</span>模块间距：
	              	<select class="ipt_text" name="space" id="space">
	              		<option value="0" <c:if test="${not empty cmsModule.space && !(cmsModule.space eq null)  && cmsModule.space==0}">selected="selected"</c:if>>无间距</option>
	              		<option value="10" <c:if test="${not empty cmsModule.space && !(cmsModule.space eq null)  && cmsModule.space==10}">selected="selected"</c:if>>有间距</option>
	              	</select>
	              </p>
	              <p><span class="red">*</span>模块左右间距：
	              	<select class="ipt_text" name="spaceLr" id="spaceLr">
	              		<option value="0" <c:if test="${not empty cmsModule.space && !(cmsModule.space eq null)  && cmsModule.space==0}">selected="selected"</c:if>>无间距</option>
	              		<option value="10" <c:if test="${not empty cmsModule.space && !(cmsModule.space eq null)  && cmsModule.space==10}">selected="selected"</c:if>>有间距</option>
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
                          <option value="0" <c:if test="${not empty cmsModule.typeBg && !(cmsModule.typeBg eq null)  && cmsModule.typeBg==0}">selected="selected"</c:if>>请选择</option>
                          <option value="1" <c:if test="${not empty cmsModule.typeBg && !(cmsModule.typeBg eq null)  && cmsModule.typeBg==1}">selected="selected"</c:if>>背景图</option>
                          <option value="2" <c:if test="${not empty cmsModule.typeBg && !(cmsModule.typeBg eq null)  && cmsModule.typeBg==2}">selected="selected"</c:if>>背景色</option>
                      </select>
                  </p>
                  <div id="bg1" style="margin-left: 10px;<#if !(cmsModule.typeBg?? && cmsModule.typeBg==1)>display:none</#if>">
                      <p>图片：
                          <input id="fileimg0" class="fileimg" type="file" name="file"/>
                          <input id="uploadBtn0" class="uploadBtn" type="button" onclick="javascript:ajaxImageUploadBg(this)" value="上传图片"/>
                          <input type="button" class="addImageBtn" value="添加图片" onclick="javaScript:selectBgImage();" />
                      </p>
                      <div class="uploadimgshow">
                          <a href="javascript:void(0)"><img class="closeBg" src="${staticPath }/static/style/images/homepage/close.png"/></a>
						  <c:choose>
							  <c:when test="${not empty cmsModule.bg && !(cmsModule.bg eq null) && cmsModule.bg != ''}">
								  <img src="${cmsModule.bg}" id="iptimg0" class="iptimgs" style="height:50px;"/>
							  </c:when>
							  <c:otherwise>
								  <img src="${staticPath }/static/style/images/homepage/2img1.jpg" id="iptimg0" class="iptimgs" style="height:50px;"/>
							  </c:otherwise>
						  </c:choose>
                      </div>
                  </div>
                  <div id="bg2" style="margin:0 0 35px 10px;<#if !(cmsModule.typeBg?? && cmsModule.typeBg==2)>display:none</#if>">
                      <div style="float:left;"><p>色值：<input id="bgColor" name="bgColor" type="text" class="ipt_text" value="${cmsModule.bg}" onblur="javascript:changeBgColor();"/></p></div>
                      <div id="bgColorBlock" style="width: 15px;height: 15px;margin: 5px 20px 0 10px;float:left;background-color:${cmsModule.bg};"></div>
                  </div>
                  <input id="bg" name="bg" type="hidden" value="${cmsModule.bg}"/>
	          </div>
	          <div class="wayCon" id="wayCon">
	          	<div class="TjArea">
	          		<div class="TjAreaCon">
						<c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
							<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="status">
							<c:if test="${not empty cmsModuleDetail && !(cmsModuleDetail eq null) && status.index%4==0}">
			              	 <div class="Tj">
							</c:if>
			              	 	<div id="upload${status.index+1}" class="upload">
			              	 		<p>图片<span class="number">${status.index+1}</span>：
			              	 		<input id="fileimg${status.index+1}" class="fileimg" type="file" name="file"/>
									<input id="uploadBtn${status.index+1}" class="uploadBtn" type="button" onclick="javascript:ajaxImageUpload(this)" value="上传图片"/>
									<input type="button" class="addImageBtn" value="添加图片" onclick="javaScript:selectImage(${status.index+1});" />
									</p>
									<div class="uploadimgshow">
									   <a href="javascript:void(0)"><img class="close1" src="${staticPath }/static/style/images/homepage/close.png"/></a>
										<c:choose>
											<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
												<img src="${cmsModuleDetail.imgUrl}" id="iptimg${status.index+1}" class="iptimgs"/>
											</c:when>
											<c:otherwise>
												<img src="${staticPath }/static/style/images/homepage/1img1.jpg" id="iptimg${status.index+1}" class="iptimgs"/>
											</c:otherwise>
										</c:choose>
									<input id="img${status.index+1}" type="hidden" name="moduleDetails[${status.index}].imgUrl" value="${cmsModuleDetail.imgUrl}"/>
									</div>
									<!--
									<p class="title"><span class="red">&nbsp;</span>模块名称：
										<input id="title${status.index+1}" class="ipt_text" type="text"
											   value="${cmsModuleDetail.title! }" name="moduleDetails[${status.index}].title"/>
									</p>
									-->
									<%@ include file="/WEB-INF/views/admin/pageManager/module/module_link_position.jsp" %>
									<input type="hidden" name="moduleDetails[${status.index}].sortNo" id="sortNo${status.index+1}" value="${status.index+1}" />
									<input type="hidden" name="moduleDetails[${status.index}].commonId" id="commonId${status.index+1}" value="${cmsModuleDetail.commonId}"/>
									<input type="hidden" name="moduleDetails[${status.index}].subType" id="subType${status.index+1}" value="${cmsModuleDetail.subType}"/>
			              	 	</div>
								<c:if test="${not empty cmsModuleDetail && !(cmsModuleDetail eq null) && status.index%4==3}">
								<div class="Tj">
									</c:if>
					  		</c:forEach>
						</c:if>
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
