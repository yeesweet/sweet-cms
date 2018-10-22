<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/commons/basejs.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="Keywords" content=" , ,优购网,B网络营销系统,商品管理" />
	<meta name="Description" content=" , ,B网络营销系统-商品管理" />
	<title>编辑模块</title>

    <link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-base.css?v=201809242210" />
    <link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-global.css?v=201809242210" />
    <link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-activity.css?v=201809242210" />

    <%--<script type="text/javascript" src="${staticPath }/static/homepage/jquery-1.6.2.min.js?v=201809242210"></script>--%>
    <script type="text/javascript" src="${staticPath }/static/homepage/common.min.js"></script>

    <script type="text/javascript" src="${staticPath }/static/My97DatePicker/WdatePicker.js?v=201809242210"></script>
    <script type="text/javascript" src="${staticPath }/static/component/commoditySingleSelector.js?v=201809242210"></script>
    <script type="text/javascript" src="${staticPath }/static/component/imageSelector.js?v=201809242210"></script>
    <script type="text/javascript" src="${staticPath }/static/ygdialog/lhgdialog.min.js?s=chrome"></script>
    <script type="text/javascript" src="${staticPath }/static/jquery/ajaxfileupload.js"></script>
    <%--<script type="text/javascript" src="${staticPath }/static/activity/cmsModule.js?v=201809242210"></script>--%>
    <script type="text/javascript" src="${staticPath }/static/activity/module_common.js?v=201809242210"></script>
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
			        <li class="curr"><span>编辑</span></li>
			    </ul>
		</div>
        <!--当前位置end-->
	<!--主体start-->
    <div id="modify" class="modify_homepage">
		<!-- <div class="left"></div> -->
	    <div class="right">
	      <div class="leftCon1">
	         <div class="divlist"><c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null)}">
				 <c:choose>
				<c:when test="${cmsModule.moduleStyle==103}">
		          	<div class="editDiv" id="editDiv0" style="display:block">
		              	<div class="divs">
		                	<div class="writetext"><img src="${staticPath }/static/style/images/homepage/img3.jpg" /></div>
		             	</div>
		              	<p class="areaName">webview</p>
		            </div>
				</c:when>
                <c:when test="${cmsModule.moduleStyle==1}">
		            <div class="editDiv" id="editDiv1" style="display:block">
		            	<div class="divs">
		                	<div class="fl fl1"  style="width:40%;height:224px;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                        <img id="fl11" src="${cmsModule.moduleDetails[0].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl11" src="${staticPath }/static/style/images/homepage/1img1.jpg" />
                                    </c:otherwise>
                                </c:choose>
		                         <span class="num">1.</span>
		                    </div>
		                    <div class="fl fl1" style="width:60%;">
		                         <div style="height:93px;">
                                     <c:choose>
                                         <c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
                                             <img id="fl12" src="${cmsModule.moduleDetails[1].imgUrl}" />
                                         </c:when>
                                         <c:otherwise>
                                             <img id="fl12" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                         </c:otherwise>
                                     </c:choose>
		                            <span class="num">2.</span>
		                         </div>
		                         <div style="height:130px;">
                                     <c:choose>
                                         <c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
                                             <img id="fl13" src="${cmsModule.moduleDetails[2].imgUrl}" />
                                         </c:when>
                                         <c:otherwise>
                                             <img id="fl13" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                         </c:otherwise>
                                     </c:choose>
		                            <span class="num">3.</span>
		                         </div>
		                    </div>
		              	</div>
		              	<p class="areaName">模块1</p>
		            </div>
                </c:when>
                <c:when test="${cmsModule.moduleStyle==2}">
		            <div class="editDiv" id="editDiv2" style="display:block">
		              	<div class="divs">
		                   <div class="fl fl2" style="width:40%;height:225px;">
                               <c:choose>
                                   <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                       <img id="fl21" src="${cmsModule.moduleDetails[0].imgUrl}" />
                                   </c:when>
                                   <c:otherwise>
                                       <img id="fl21" src="${staticPath }/static/style/images/homepage/1img1.jpg" />
                                   </c:otherwise>
                               </c:choose>
		                        <span class="num">1.</span>
		                    </div>
		                    <div class="fl fl2" style="width:60%;">
		                         <div style="height:93px;">
                                     <c:choose>
                                         <c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
                                             <img id="fl22" src="${cmsModule.moduleDetails[1].imgUrl}" />
                                         </c:when>
                                         <c:otherwise>
                                             <img id="fl22" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                         </c:otherwise>
                                     </c:choose>
		                            <span class="num">2.</span>
		                         </div>
		                         <div style="height:131px;">
		                             <div style="width:50%;">
                                         <c:choose>
                                             <c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
                                                 <img id="fl23" src="${cmsModule.moduleDetails[2].imgUrl}" />
                                             </c:when>
                                             <c:otherwise>
                                                 <img id="fl23" src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                             </c:otherwise>
                                         </c:choose>
		                                <span class="num">3.</span>
		                            </div>
		                             <div style="width:50%;">
                                         <c:choose>
                                             <c:when test="${not empty cmsModule.moduleDetails[3] && !(cmsModule.moduleDetails[3] eq null) && not empty cmsModule.moduleDetails[3].imgUrl && !(cmsModule.moduleDetails[3].imgUrl eq null)  && cmsModule.moduleDetails[3].imgUrl != ''}">
                                                 <img id="fl24" src="${cmsModule.moduleDetails[3].imgUrl}" />
                                             </c:when>
                                             <c:otherwise>
                                                 <img id="fl24" src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                             </c:otherwise>
                                         </c:choose>
		                                <span class="num">4.</span>
		                            </div>
		                         </div>
		                    </div>
		              	</div>
		              	<p class="areaName">模块2</p>
		            </div>
                </c:when>
                <c:when test="${cmsModule.moduleStyle==3}">
		            <div class="editDiv" id="editDiv3" style="display:block">
		              	<div class="addBox1">
                            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                                <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
                                    <div class="divs oneimg">
                                        <div class="fl fl3" style="width:100%;">
                                    <c:choose>
                                        <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                            <img id="fl3${cmsModuleDetailS.index+1}" src="${cmsModuleDetail.imgUrl}" />
                                        </c:when>
                                        <c:otherwise>
                                            <img id="fl3${cmsModuleDetailS.index+1}" src="${staticPath }/static/style/images/homepage/img6.jpg" />
                                        </c:otherwise>
                                    </c:choose>
                                        <span class="num"></span>
										</div>
										<a class="delete3" href="javascript:void(0);">删除</a>
									 </div>
                                </c:forEach>
							</c:if>
		              	</div>
		               	<div class="Addimg">
		                	<a href="javascript:void(0)" class="addone">＋</a>
		              	</div>
		              	<p class="areaName">模块3</p>
					</div>
                </c:when>
                <c:when test="${cmsModule.moduleStyle==4}">
		           	<div class="editDiv" id="editDiv4" style="display:block">
		              	<div class="divs">
		                  	<div class="fl fl4" style="width:33.3%;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                        <img id="fl41" src="${cmsModule.moduleDetails[0].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl41" src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                    </c:otherwise>
                                </c:choose>
			                    <span class="num">1.</span>
		                  	</div>
		                  	<div class="fl fl4" style="width:33.3%;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
                                        <img id="fl42" src="${cmsModule.moduleDetails[1].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl42" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                    </c:otherwise>
                                </c:choose>
			                    <span class="num">2.</span>
		                 	</div>
		                  	<div class="fl fl4" style="width:33.3%;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
                                        <img id="fl43" src="${cmsModule.moduleDetails[2].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl43" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                    </c:otherwise>
                                </c:choose>
			                    <span class="num">3.</span>
		                  	</div>
		              	</div>
		              	<p class="areaName">模块4</p>
		            </div>
                </c:when>
                 <c:when test="${cmsModule.moduleStyle==5}">
		            <div class="editDiv" id="editDiv5" style="display:block">
		            	<div class="addBox2">
                            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                                <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
                                    <div class="divs twoimg">
                                    <c:choose>
                                        <c:when test="${not empty cmsModuleDetail && !(cmsModuleDetail eq null) && cmsModuleDetailS.index%2==0}">
                                            <div class="fl fl5" style="float:left;width:237px;height:185px;">
											<c:choose>
												<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
													<img id="fl5${cmsModuleDetailS.index+1}" src="${cmsModuleDetail.imgUrl}"/>
												</c:when>
												<c:otherwise>
													<img id="fl5${cmsModuleDetailS.index+1}" src="${staticPath }/static/style/images/homepage/2img1.jpg"/>
												</c:otherwise>
											</c:choose>
                                                <span class="num">${cmsModuleDetailS.index+1}</span>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="fl fl5" style="width:237px;float:right;height:185px;">
                                                <c:choose>
                                                    <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                                        <img id="fl5${cmsModuleDetailS.index+1}" src="${cmsModuleDetail.imgUrl}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img id="fl5${cmsModuleDetailS.index+1}" src="${staticPath }/static/style/images/homepage/2img1.jpg"/>
                                                    </c:otherwise>
                                                </c:choose>
                                                <span class="num">${cmsModuleDetailS.index+1}</span>
                                            </div>
                                            <a class="delete5" href="javascript:void(0);">删除</a>
                                        </c:otherwise>
                                    </c:choose>
                                    </div>
                                </c:forEach>
		                    </c:if>
		              	</div>
		               	<div class="Addimg">
		                  	<a href="javascript:void(0)" class="addtwo">＋</a>
		              	</div>
		              	<p class="areaName">模块5</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==6}">
		            <div class="editDiv" id="editDiv6" style="display:block">
		              	<div class="divs">
		                	<div class="fl fl6" style="width:226px;margin-left:7px;height:184px;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                        <img id="fl61" src="${cmsModule.moduleDetails[0].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl61" src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                    </c:otherwise>
                                </c:choose>
			                    <span class="num">1.</span>
			            	</div>
		                  	<div class="fl fl6" style="width:226px;float:right;margin-right:7px">
		                    	<div style="height:85px;">
                                    <c:choose>
                                        <c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
                                            <img id="fl62" src="${cmsModule.moduleDetails[1].imgUrl}" />
                                        </c:when>
                                        <c:otherwise>
                                            <img id="fl62" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                        </c:otherwise>
                                    </c:choose>
		                         	<span class="num">2.</span>
		                    	</div>
		                    	<div style="height:85px;margin-top:4px;">
                                    <c:choose>
                                        <c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
                                            <img id="fl63" src="${cmsModule.moduleDetails[2].imgUrl}" />
                                        </c:when>
                                        <c:otherwise>
                                            <img id="fl63" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                        </c:otherwise>
                                    </c:choose>
		                        	<span class="num">3.</span>
		                    	</div>
		                  	</div>
		              	</div>
		              	<p class="areaName">模块6</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==7}">
		            <div class="editDiv" id="editDiv7" style="display:block">
		              	<div class="divs">
		                	<div class="fl fl7" style="width:226px;margin-left:7px;">
		                    	<div style="height:85px;">
                                    <c:choose>
                                        <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                            <img id="fl71" src="${cmsModule.moduleDetails[0].imgUrl}" />
                                        </c:when>
                                        <c:otherwise>
                                            <img id="fl71" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                        </c:otherwise>
                                    </c:choose>
		                           	<span class="num">1.</span>
		                      	</div>
		                      	<div style="height:85px;margin-top:4px;">
                                    <c:choose>
                                        <c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
                                            <img id="fl72" src="${cmsModule.moduleDetails[1].imgUrl}" />
                                        </c:when>
                                        <c:otherwise>
                                            <img id="fl72" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                        </c:otherwise>
                                    </c:choose>
		                          	<span class="num">2.</span>
		                      	</div>
		                  	</div>
		                  	<div class="fl fl7"  style="width:226px;height:184px;float:right;margin-right:7px">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
                                        <img id="fl73" src="${cmsModule.moduleDetails[2].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl73" src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                    </c:otherwise>
                                </c:choose>
		                    	<span class="num">3.</span>
		                  	</div>
		              	</div>
		              	<p class="areaName">模块7</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==8}">
		            <div class="editDiv" id="editDiv8" style="display:block">
		            	<div class="divs">
		                	<div class="fl fl8" style="width:50%;height:185px;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                        <img id="fl81" src="${cmsModule.moduleDetails[0].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl81" src="${staticPath }/static/style/images/homepage/1img1.jpg" />
                                    </c:otherwise>
                                </c:choose>
			                    <span class="num">1.</span>
		                  	</div>
		                  	<div class="fl fl8" style="width:50%;height:185px;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
                                        <img id="fl82" src="${cmsModule.moduleDetails[1].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl82" src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                    </c:otherwise>
                                </c:choose>
			                    <span class="num">2.</span>
		                  	</div>
		              	</div>
		              	<p class="areaName">模块8</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==9}">
		            <div class="editDiv" id="editDiv9" style="display:block">
		            	<div class="divs">
		                	<div class="fl fl9" style="width:466px;margin:0 7px 15px 7px;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                        <img id="fl91" src="${cmsModule.moduleDetails[0].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl91" src="${staticPath }/static/style/images/homepage/img6.jpg" />
                                    </c:otherwise>
                                </c:choose>
		                      	<span class="num">1.</span>
		                  	</div>
		                  	<div class="fl fl9" style="width:226px;height:185px;float:left;margin-left:7px;;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
                                        <img id="fl92" src="${cmsModule.moduleDetails[1].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl92" src="${staticPath }/static/style/images/homepage/img1.jpg" />
                                    </c:otherwise>
                                </c:choose>
		                      	<span class="num">2.</span>
		                  	</div>
		                  	<div class="fl fl9" style="width:226px;height:185px;float:right;margin-right:7px;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
                                        <img id="fl93" src="${cmsModule.moduleDetails[2].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="fl93" src="${staticPath }/static/style/images/homepage/img1.jpg" />
                                    </c:otherwise>
                                </c:choose>
			                    <span class="num">3.</span>
		                  	</div>
		            	</div>
		              	<p class="areaName">模块9</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==10}">
		            <div class="editDiv" id="editDiv10" style="display:block">
		            	<div class="divs">
                            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
								<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
                               <div class="fl fl10" style="width:25%;height:138px;">
									<c:choose>
										<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
											<img id="fl10${cmsModuleDetailS.index+1}" src="${cmsModuleDetail.imgUrl}"/>
										</c:when>
										<c:otherwise>
											<img id="fl10${cmsModuleDetailS.index+1}" src="${staticPath }/static/style/images/homepage/2img1.jpg"/>
										</c:otherwise>
									</c:choose>
                                    <span class="num">${cmsModuleDetailS.index+1}.</span>
                        		</div>
								</c:forEach>
                            </c:if>
		         		</div>
		              	<p class="areaName">模块10</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==11}">
		            <div class="editDiv" id="editDiv11" style="display:block">
		              	<div class="addBox3">
                            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                                <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
                                    <div class="divs threeimg">
                                        <div class="fl fl11" style="width:466px;margin:0 7px 10px 7px;">
                                        <c:choose>
                                            <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                                <img id="fl11${cmsModuleDetailS.index+1}" src="${cmsModuleDetail.imgUrl}"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img id="fl11${cmsModuleDetailS.index+1}" src="${staticPath }/static/style/images/homepage/img6.jpg"/>
                                            </c:otherwise>
                                        </c:choose>
                                            <span class="num"></span>
                                        </div>
                                        <a class="delete11" href="javascript:void(0);">删除</a>
                                    </div>
                                </c:forEach>
                            </c:if>
		              	</div>
		               	<div class="Addimg">
		                	<a href="javascript:void(0)" class="addthree">＋</a>
		              	</div>
		              	<p class="areaName">模块11</p>
					</div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==12}">
					<div class="editDiv" id="editDiv12" style="display:block">
		                <div class="divs">
		                  	<div class="fl fl12" style="width:100%;" >
		                      	<a href="javascript:void(0);" class="clickLeft"><img src="${staticPath }/static/style/images/activity/div_arrowleft.jpg" /></a>
		                      	<div class="allimgs">
	                          		<div class="imgs" id="leftModule12">
                                        <c:if test="${not empty cmsModule.moduleCommoditys && !(cmsModule.moduleCommoditys eq null)}">
                                            <c:forEach  items="${cmsModule.moduleCommoditys}" var="cmsModuleCommodity">
                                                <div class="slbdiv">
                                                    <c:choose>
                                                        <c:when test="${not empty cmsModuleCommodity.defaultPic && !(cmsModuleCommodity.defaultPic eq null) && cmsModuleCommodity.defaultPic != ''}">
                                                            <img src="${cmsModuleCommodity.defaultPic}" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                        </c:otherwise>

                                                    </c:choose>
                                                    <p>库存：${moduleCommodity.inventoryNumber}</p>
                                                    <p>¥${moduleCommodity.salePrice}<span>/¥<del>${moduleCommodity.marketPrice}</del></span></p>
                                                    <a href="javascript:void(0);"><img class="close delCommodity" src="${staticPath }/static/style/images/homepage/close.png"></a>
                                                </div>
                                            </c:forEach>
				                    	</c:if>
				                    </div>
		                    	</div>
		                      	<a href="javascript:void(0);" class="clickRight"><img src="${staticPath }/static/style/images/activity/div_arrowright.jpg" /></a>
		                  	</div>
		              	</div>
		              	<p class="areaName">商品模块</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==15}">
					<div class="editDiv" id="editDiv15" style="display:block">
		                <div class="divs">
		                  	<div class="fl" style="width:100%;" id="leftModule15">
                                <c:if test="${not empty cmsModule.moduleCommoditys && !(cmsModule.moduleCommoditys eq null)}">
                                    <c:forEach  items="${cmsModule.moduleCommoditys}" var="cmsModuleCommodity">
                                        <div class="goodThreediv">
                                            <c:choose>
                                                <c:when test="${not empty cmsModuleCommodity.defaultPic && !(cmsModuleCommodity.defaultPic eq null) && cmsModuleCommodity.defaultPic != ''}">
                                                    <img src="${cmsModuleCommodity.defaultPic}" class='goodDivImg' />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${staticPath }/static/style/images/homepage/2img1.jpg"  class='goodDivImg'/>
                                                </c:otherwise>

                                            </c:choose>
                                            <p>库存：${moduleCommodity.inventoryNumber}</p>
                                            <p>¥${moduleCommodity.salePrice}<span>/¥<del>${moduleCommodity.marketPrice}</del></span></p>
                                            <a href="javascript:void(0);"><img class="close delCommodity" src="${staticPath }/static/style/images/homepage/close.png"></a>
                                        </div>
                                    </c:forEach>
                                </c:if>
		                  	</div>
		              	</div>
		              	<p class="areaName">商品模块</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==16}">
					<div class="editDiv" id="editDiv16" style="display:block">
		                <span class="num" style="display:none"></span>
		                <div class="divs">
			            	<div class="fl" style="width:100%;" >
				            	<div class="goodTwoCon">
	                               <div class="goodTwodiv">
	                            		<img src="${staticPath }/static/style/images/homepage/2img1.jpg"/>
	                               </div>
	                               <div class="goodTwodiv">
	                            		<img src="${staticPath }/static/style/images/homepage/2img1.jpg"/>
	                               </div>
		                    	</div>
	                    	</div>
		              	</div>
		              	<p class="areaName">商品模块</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==17}">
					<div class="editDiv" id="editDiv17" style="display:block">
		                <div class="divs">
		                  	<div class="fl fl17" style="width:100%;" >
		                      	<a href="javascript:void(0);" class="clickLeft"><img src="${staticPath }/static/style/images/activity/div_arrowleft.jpg" /></a>
		                      	<div class="allimgs">
	                          		<div class="imgs" id="leftBoard17">
                                        <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                                            <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
                                                <div class="slbdiv">
                                                    <c:choose>
                                                        <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                                            <img id="fl17${cmsModuleDetailS.index+1}" src="${cmsModuleDetail.imgUrl}"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img id="fl17${cmsModuleDetailS.index+1}" src="${staticPath }/static/style/images/homepage/2img1.jpg"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <p>${cmsModuleDetail.title}</p>
                                                    <a href="javascript:void(0);"><img class="close delModule17" src="${staticPath }/static/style/images/homepage/close.png"/></a>
                                                </div>
                                            </c:forEach>
                                        </c:if>
				                    </div>
		                    	</div>
		                      	<a href="javascript:void(0);" class="clickRight"><img src="${staticPath }/static/style/images/activity/div_arrowright.jpg" /></a>
		                  	</div>
		              	</div>
		              	<div class="Addimg">
		                  <a href="javascript:void(0)" class="addfour">＋</a>
		              	</div>
		              	<p class="areaName">模块12</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==18}">
					<div class="editDiv" id="editDiv18" style="display:block">
		                <span class="num" style="display:none"></span>
		                <div class="divs">
			            	<div class="fl fl14" style="width:466px;margin:0 7px 0 7px;">
			                	<img src="${staticPath }/static/style/images/homepage/img15.jpg" />
			              	</div>
			          	</div>
		              	<p class="areaName">秒杀</p>
		            </div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==19}">
		            <div class="editDiv" id="editDiv19" style="display:block">
		              	<div>
                            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                                <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
                                    <div class="divs">
                                        <div class="fl fl19" style="width:100%;">
                                        <c:choose>
                                            <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                                <img id="fl19${cmsModuleDetailS.index+1}" src="${cmsModuleDetail.imgUrl}"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img id="fl19${cmsModuleDetailS.index+1}" src="${staticPath }/static/style/images/homepage/img6.jpg"/>
                                            </c:otherwise>
                                        </c:choose>
                                            <span class="num"></span>
                                    </div>
                                </c:forEach>
                            </c:if>
		              	</div>
		              	<p class="areaName">预约</p>
					</div>
                 </c:when>
                 <c:when test="${cmsModule.moduleStyle==20}">
		            <div class="editDiv" id="editDiv19" style="display:block">
		              	<div>
                            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                                <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
                                    <div class="divs">
                                        <div class="fl fl19" style="width:100%;">
                                            <c:choose>
                                                <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                                    <img id="fl19${cmsModuleDetailS.index+1}" src="${cmsModuleDetail.imgUrl}"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <img id="fl19${cmsModuleDetailS.index+1}" src="${staticPath }/static/style/images/homepage/img6.jpg"/>
                                                </c:otherwise>
                                            </c:choose>
                                            <span class="num"></span>
                                        </div>
                                </c:forEach>
                            </c:if>
		              	</div>
		              	<p class="areaName">倒计时</p>
					</div>
                 </c:when>
				</c:choose>
             </c:if></div><!--divlist-->

	      </div><!--leftCon-->
	      <div class="rightCon1">
	      <form id="form1" name="form1" action="${path}/cmsModuleController/updateModule.sc" method="post">
	      	  <input type="hidden" id="id" name="id" value="${cmsModule.id}" />
	      	  <input type="hidden" id="effectRange" name="effectRange" value="1" />
	      	  <input type="hidden" id="imgType" name="imgType" value="5" /><!-- 图片类型：5：专题icon -->
      	  	  <input type="hidden" id="moduleStyle" name="moduleStyle" value="${moduleStyle}" />
              <input type="hidden" id="moduleType" name="moduleType" value="${(moduleType == null || moduleType == "")?'1':moduleType}" />
              <input type="hidden" id="pageManagerId" name="pageManagerId" value="${pageManagerId}" />
	          <div style="color:#3d4245;font-size:14px;">
	          	<p>当前状态：
                    <c:choose><c:when test="${cmsModule.isDisplay==1}">启用<input type="button" value="停用" onclick="changeStatus('${cmsModule.id}',0,'${currentPLC}','${activityId}');" style="margin-left:40px;"/>
                    </c:when><c:otherwise>停用</c:otherwise></c:choose>
				</p>
	          </div>
	          <div class="wayCon">
	              <p><span class="red">&nbsp;</span>模块名称：
	              	 <input type="text" id="moduleName" name="moduleName" value="${cmsModule.moduleName}" class="ipt_text" style="width:340px;"/>
	              </p>
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
                  <c:if test="${not empty moduleStyle && !(moduleStyle eq null) && moduleStyle==19}">
	              <p><span class="red">*</span>活动开始时间：
	              	 <input type="text" class="ipt_text" readonly="readonly" name="remindtime" id="remindtime" class="Wdate"
	              	 		value='<c:if test="${not empty cmsModule.remindTime && !(cmsModule.remindTime eq null)}"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.remindTime}" /></c:if>'
				            onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" size="20"/>&nbsp;&nbsp;
	              </p>
	              </c:if>
                  <c:if test="${not empty moduleStyle && !(moduleStyle eq null) && moduleStyle!=20}">
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="${cmsModule.width}"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="${cmsModule.height}"/>px
	              </p>
                  </c:if>
	              <p style="display:none;"><span class="red">*</span>模块间距：
	              	<select class="ipt_text" name="space" id="space">
	              		<option value="0" <c:if test="${not empty cmsModule.space && !(cmsModule.space eq null) && cmsModule.space==0}">selected="selected"</c:if>>无间距</option>
	              		<option value="10" <c:if test="${not empty cmsModule.space && !(cmsModule.space eq null) && cmsModule.space==10}">selected="selected"</c:if>>有间距</option>
	              	</select>
	              </p>
	              <p><span class="red">*</span>模块左右间距：
	              	<select class="ipt_text" name="spaceLr" id="spaceLr">
	              		<option value="0" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 0}">selected="selected"</c:if>>无间距</option>
	              		<option value="10" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">selected="selected"</c:if>>有间距</option>
	              	</select>
	              </p>
	          </div>
	          <div class="wayCon" id="wayCon" <c:if test="${cmsModule.moduleStyle == 12 ||  cmsModule.moduleStyle == 15}">style="display:none"</c:if>>
              <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)  && cmsModule.moduleStyle!=12 && cmsModule.moduleStyle!=15}">
                  <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail" varStatus="cmsModuleDetailS">
                      <c:if test="${not empty cmsModuleDetail && !(cmsModuleDetail eq null)}">
                          <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null)  && ((cmsModule.moduleStyle==5 && cmsModuleDetailS.index%2==0) || cmsModule.moduleStyle == 3 || cmsModule.moduleStyle == 11 || cmsModule.moduleStyle == 17)}">
                              <div class='Tj5'>
						  </c:if>
                          <div class="upload" id="upload${cmsModuleDetailS.index+1}">
                                  <c:if test="${ !(cmsModule.moduleStyle==16 || cmsModule.moduleStyle==20)}">
                                      <p>
                                          图片<span class="number">${cmsModuleDetailS.index+1}</span>：<input type="file" name="file" id="fileimg${cmsModuleDetailS.index+1}" class="fileimg"/>
                                          <input type="button" id="uploadBtn${cmsModuleDetailS.index+1}" class="uploadBtn" value="上传图片" onclick="javascript:ajaxImageUpload(this)"/>
                                          <input type="button" class="addImageBtn" value="添加图片" onclick="javaScript:selectImage(${cmsModuleDetailS.index+1});" />
                                      </p>
                                      <div class="uploadimgshow">
                                          <a href="javascript:void(0)"><img src="${staticPath }/static/style/images/homepage/close.png"  class="close1"/></a>
                                          <c:choose>
                                              <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                                  <img id="iptimg${cmsModuleDetailS.index+1}" class="iptimgs" src="${cmsModuleDetail.imgUrl}"/>
                                              </c:when>
                                              <c:otherwise>
                                                  <img id="iptimg${cmsModuleDetailS.index+1}" class="iptimgs" src="${staticPath }/static/style/images/homepage/2img1.jpg"/>
                                              </c:otherwise>
                                          </c:choose>
                                          <input type="hidden" id="img${cmsModuleDetailS.index+1}" name="moduleDetails[${cmsModuleDetailS.index}].imgUrl" value="${cmsModuleDetail.imgUrl}"/>
                                      </div>
								  </c:if>
                                  <c:if test="${cmsModule.moduleStyle==17}">
                                      <p class="title"><span class="red">&nbsp;</span>模块名称：
                                          <input id="title${cmsModuleDetailS.index+1}" class="ipt_text" type="text" value="${cmsModuleDetail.title}" name="moduleDetails[${cmsModuleDetailS.index}].title"/>
								  </c:if>
								  <c:if test="${cmsModule.moduleStyle!=19}">
                                      <%@ include file="/WEB-INF/views/admin/pageManager/module/module_link_position.jsp" %>
								  </c:if>
                              <input type="hidden" name="moduleDetails[${cmsModuleDetailS.index}].sortNo" id="sortNo${cmsModuleDetailS.index+1}" value="${cmsModuleDetailS.index+1}" />
                              <input type="hidden" name="moduleDetails[${cmsModuleDetailS.index}].commonId" id="commonId${cmsModuleDetailS.index+1}" value="${cmsModuleDetail.commonId}"/>
                              <input type="hidden" name="moduleDetails[${cmsModuleDetailS.index}].subType" id="subType${cmsModuleDetailS.index+1}" value="${cmsModuleDetail.subType}"/>
                              <%--<input type="hidden" name="moduleDetails[${cmsModuleDetailS.index}].linkUrl" id="linkUrl${cmsModuleDetailS.index+1}" value="${cmsModuleDetail.linkUrl}"/>--%>
                          </div>
                          <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null)  && ((cmsModule.moduleStyle==5 && cmsModuleDetailS.index%2!=0) || cmsModule.moduleStyle == 3 || cmsModule.moduleStyle == 11 || cmsModule.moduleStyle == 17)}">
          					</div>
						  </c:if>
					  </c:if>
                  </c:forEach>
              </c:if>
			   </div>
				<c:if test="${not empty moduleStyle && !(moduleStyle eq null)  && (moduleStyle==12 || moduleStyle==15)}">
                    <div class="wayCon">
                        <div>
                            <p><span style="color:#f00;margin-right:44px;">请输入商品标号，以逗号或换行分隔</span><input type="button" onclick="addCommodity();" value="上传商品"></p>
                            <textarea rows="10" cols="50" style="border:1px solid #999" name="commodityText" id="commodityText">
							<c:if test="${not empty cmsModule.moduleCommoditys && !(cmsModule.moduleCommoditys eq null)}">
								<c:forEach  items="${cmsModule.moduleCommoditys}" var="moduleCommodity" varStatus="moduleCommodityS">
									${moduleCommodity.commodityCode}
										<c:if test="${fn:length(cmsModule.moduleCommoditys)!=moduleCommodityS+1}">,</c:if>
								</c:forEach>
                            </c:if>
							</textarea>
                            <input type="hidden" name="commodity" id="commodity" <c:if test="${not empty cmsModule.moduleCommoditys && !(cmsModule.moduleCommoditys eq null)}">value='<c:forEach  items="${cmsModule.moduleCommoditys}" var="moduleCommodity" varStatus="moduleCommodityS">${moduleCommodity.commodityCode}<c:if test="${fn:length(cmsModule.moduleCommoditys)!=moduleCommodityS+1}">,</c:if></c:forEach>'</c:if>/>
                        </div>
                    </div>
				</c:if>
	           <div>
	           		<a class="btn_save" onclick="checkForm()" style="color:#fff;">保存</a>
	           </div>
			</form>
	      </div><!--rightCon-->
	    </div>
	  </div>
	</div>
</div>
    </div></div>
</body>
</html>
