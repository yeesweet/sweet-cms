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
	<script type="text/javascript" src="/component/commoditySingleSelector.js?${YOUGOU_JS_VERSION}"></script>
	<script type="text/javascript" src="/component/imageSelector.js?${YOUGOU_JS_VERSION}"></script>
	<script type="text/javascript" src="${BasePath}/js/common.min.js"></script> 
	<script type="text/javascript" src="${BasePath}/js/ygdialog/lhgdialog.min.js?s=chrome"></script> 
	<script type="text/javascript" src="${BasePath}/js/activity/cmsModule.js"></script>
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
			        <li class="curr"><span>新增</span></li>
			    </ul>
			  </div>
        <!--当前位置end-->
	<!--主体start--> 
    <div id="modify" class="modify_homepage">
		<!-- <div class="left"></div> -->
	    <div class="right">
	      <div class="leftCon1" style="">
	         <div class="divlist">
	          <div class="editDiv" id="editDiv0" >              
	              <div class="divs">
	                   <div class="writetext"><img src="/images/homepage/img3.jpg" /></div>
	              </div>
	              <p class="areaName">webview</p>
	            </div>
	            <div class="editDiv" id="editDiv1" >              
	              <div class="divs">
	                   <div class="fl fl1"  style="width:40%;height:224px;">
	                         <img id="fl11" src="/images/homepage/1img1.jpg" />
	                         <span class="num">1.</span>
	                    </div>
	                    <div class="fl fl1" style="width:60%;">
	                         <div style="height:93px;">
	                            <img id="fl12" src="/images/homepage/1img2.jpg" />
	                            <span class="num">2.</span>
	                         </div>
	                         <div style="height:130px;">
	                            <img id="fl13" src="/images/homepage/1img2.jpg" />
	                            <span class="num">3.</span>
	                         </div>
	                    </div>
	              </div>
	              <p class="areaName">模块1</p>
	            </div>
	            <div class="editDiv" id="editDiv2">              
	              <div class="divs">
	                   <div class="fl fl2" style="width:40%;height:225px;">
	                         <img id="fl21" src="/images/homepage/1img1.jpg" />
	                         <span class="num">1.</span>
	                    </div>
	                    <div class="fl fl2" style="width:60%;">
	                         <div style="height:93px;">
	                            <img id="fl22" src="/images/homepage/1img2.jpg" />
	                            <span class="num">2.</span>
	                         </div>
	                         <div style="height:131px;">
	                             <div style="width:50%;">
	                                <img id="fl23" src="/images/homepage/2img1.jpg" />
	                                <span class="num">3.</span>
	                            </div>
	                             <div style="width:50%;">
	                                <img id="fl24" src="/images/homepage/2img1.jpg" />
	                                <span class="num">4.</span>
	                            </div>
	                         </div>
	                    </div>
	              </div>
	              <p class="areaName">模块2</p>
	            </div>
	            <div class="editDiv" id="editDiv3">
	              <div class="addBox1">              
	                <div class="divs oneimg">
	                    <div class="fl fl3" style="width:100%;">
	                      <img id="fl31" src="/images/homepage/img6.jpg" />
	                      <span class="num" style="display:none"></span>
	                    </div>  
	                    <a class="delete3" href="javascript:void(0);">删除</a>                
	                </div>
	              </div>
	               <div class="Addimg">                  
	                  <a href="javascript:void(0)" class="addone">＋</a>
	              </div>
	              <p class="areaName">模块3</p>
	            </div>
	           <div class="editDiv" id="editDiv4">              
	              <div class="divs">
	                  <div class="fl fl4" style="width:33.3%;">
	                    <img id="fl41" src="/images/homepage/2img1.jpg" />
	                    <span class="num">1.</span>
	                  </div>
	                  <div class="fl fl4" style="width:33.3%;">
	                    <img id="fl42" src="/images/homepage/2img1.jpg" />
	                    <span class="num">2.</span>
	                  </div>
	                  <div class="fl fl4" style="width:33.3%;">
	                    <img id="fl43" src="/images/homepage/2img1.jpg" />
	                    <span class="num">3.</span>
	                  </div>
	              </div>
	              <p class="areaName">模块4</p>
	            </div>
	            <div class="editDiv" id="editDiv5" >
	              <div class="addBox2">              
	                <div class="divs twoimg">
	                     <div class="fl fl5" style="float:left;width:237px;height:185px;">
	                      <img id="fl51" src="/images/homepage/2img1.jpg" />
	                      <span class="num">1</span>
	                    </div>
	                    <div class="fl fl5" style="width:237px;float:right;height:185px;">
	                      <img id="fl52" src="/images/homepage/2img1.jpg" />
	                      <span class="num">2</span>
	                    </div>
	                    <a class="delete5" href="javascript:void(0);">删除</a>
	                </div>
	
	              </div>
	               <div class="Addimg">                  
	                  <a href="javascript:void(0)" class="addtwo">＋</a>
	              </div>
	              <p class="areaName">模块5</p>
	            </div>
	            <div class="editDiv" id="editDiv6" >              
	              <div class="divs">
	                   <div class="fl fl6" style="width:226px;margin-left:7px;height:184px;">
	                    <img id="fl61" src="/images/homepage/2img1.jpg" />
	                    <span class="num">1.</span>
	                  </div>
	                  <div class="fl fl6" style="width:226px;float:right;margin-right:7px">
	                    <div style="height:85px;">
	                         <img id="fl62" src="/images/homepage/1img2.jpg" />
	                         <span class="num">2.</span>
	                    </div>
	                    <div style="height:85px;margin-top:4px;">
	                        <img id="fl63" src="/images/homepage/1img2.jpg" />
	                        <span class="num">3.</span>
	                    </div>
	                  </div> 
	              </div>
	              <p class="areaName">模块6</p>
	            </div>
	            <div class="editDiv" id="editDiv7">              
	              <div class="divs">
	                  <div class="fl fl7" style="width:226px;margin-left:7px;">
	                      <div style="height:85px;">
	                           <img id="fl71" src="/images/homepage/1img2.jpg" />
	                           <span class="num">1.</span>
	                      </div>
	                      <div style="height:85px;margin-top:4px;">
	                          <img id="fl72" src="/images/homepage/1img2.jpg" />
	                          <span class="num">2.</span>
	                      </div>
	                  </div>   
	                  <div class="fl fl7"  style="width:226px;height:184px;float:right;margin-right:7px">
	                    <img id="fl73" src="/images/homepage/2img1.jpg" />
	                    <span class="num">3.</span>
	                  </div>
	              </div>
	              <p class="areaName">模块7</p>
	            </div>
	            <div class="editDiv" id="editDiv8">              
	              <div class="divs">
	                  <div class="fl fl8" style="width:50%;height:185px;">
	                    <img id="fl81" src="/images/homepage/2img1.jpg" /> 
	                    <span class="num">1.</span>                   
	                  </div>   
	                  <div class="fl fl8" style="width:50%;height:185px;">
	                    <img id="fl82" src="/images/homepage/2img1.jpg" /> 
	                    <span class="num">2.</span> 
	                  </div>
	              </div>
	              <p class="areaName">模块8</p>
	            </div>
	            <div class="editDiv" id="editDiv9">              
	              <div class="divs">
	                  <div class="fl fl9" style="width:466px;margin:0 7px 15px 7px;">                    
	                      <img id="fl91" src="/images/homepage/img6.jpg" />
	                      <span class="num">1.</span>                                       
	                  </div>
	                  <div class="fl fl9" style="width:226px;height:185px;float:left;margin-left:7px;;">                    
	                      <img id="fl92" src="/images/homepage/img1.jpg" />
	                      <span class="num">2.</span>                                       
	                  </div>   
	                  <div class="fl fl9" style="width:226px;height:185px;float:right;margin-right:7px;">
	                    <img id="fl93" src="/images/homepage/img1.jpg" /> 
	                    <span class="num">3.</span> 
	                  </div>
	              </div>
	              <p class="areaName">模块9</p>
	            </div>
	             <div class="editDiv" id="editDiv10" style="display:block">              
	              <div class="divs">
	                  <div class="fl fl10" style="width:25%;height:138px;">
	                    <img id="fl101" src="/images/homepage/2img1.jpg" />
	                    <span class="num">1.</span>  
	                  </div>
	                  <div class="fl fl10" style="width:25%;height:138px;">
	                    <img id="fl102" src="/images/homepage/2img1.jpg" /> 
	                    <span class="num">2.</span> 
	                  </div>
	                  <div class="fl fl10" style="width:25%;height:138px;">
	                    <img id="fl103" src="/images/homepage/2img1.jpg" />
	                    <span class="num">3.</span>  
	                  </div>
	                  <div class="fl fl10" style="width:25%;height:138px;">
	                    <img id="fl104" src="/images/homepage/2img1.jpg" /> 
	                    <span class="num">4.</span> 
	                  </div>
	              </div>
	              <p class="areaName">模块10</p>
	            </div>
	            <div class="editDiv" id="editDiv11">
	              <div class="addBox3">              
	                <div class="divs threeimg">
	                    <div class="fl fl11" style="width:466px;margin:0 7px 10px 7px;">
	                      <img id="fl111" src="/images/homepage/img6.jpg" />
	                      <span class="num" style="display:none"></span>
	                    </div>  
	                    <a class="delete11" href="javascript:void(0);">删除</a>                
	                </div>
	              </div>
	               <div class="Addimg">                  
	                  <a href="javascript:void(0)" class="addthree">＋</a>
	              </div>
	              <p class="areaName">模块11</p>
	            </div>
	            <div class="editDiv" id="editDiv12">
	            	<div class="divs">                      
	                  	<div class="fl fl12" style="width:100%;" >
	                      	<a href="javascript:void(0);" class="clickLeft"><img src="/images/activity/div_arrowleft.jpg" /></a>
	                      	<div class="allimgs">
	                          	<div class="imgs" id="leftModule12">
	                              	<div class="slbdiv">
		                            	<img src="/images/homepage/2img1.jpg" />
	                              	</div>
	                              	<div class="slbdiv">
		                            	<img src="/images/homepage/2img1.jpg" />
	                              	</div>
	                              	<div class="slbdiv">
		                            	<img src="/images/homepage/2img1.jpg" />
	                              	</div>
	                              	<div class="slbdiv">
		                            	<img src="/images/homepage/2img1.jpg" />
	                              	</div>
	                          	</div>
	                    	</div>
	                      	<a href="javascript:void(0);" class="clickRight"><img src="/images/activity/div_arrowright.jpg" /></a>
	                  	</div>                                          
	              	</div>
	              	<p class="areaName">商品模块</p>
	            </div>
	            <div class="editDiv" id="editDiv13">
	              <div class="addBox1">              
	                <div class="divs oneimg">
	                    <div class="fl fl13" style="width:100%;">
	                      <img id="fl131" src="/images/homepage/img6.jpg" />
	                      <span class="num" style="display:none"></span>
	                    </div>  
	                    <a class="delete13" href="javascript:void(0);">删除</a>                
	                </div>
	              </div>
	               <div class="Addimg">                  
	                  <a href="javascript:void(0)" class="addone">＋</a>
	              </div>
	              <p class="areaName">优惠券</p>
	            </div>
	            <div class="editDiv" id="editDiv14">
	              <div class="divs">
		          	<div class="fl" style="width:100%;" >
	                	<a href="javascript:void(0);" class="clickLeft"><img src="/images/activity/div_arrowleft.jpg" /></a>
	                    	<div class="allimgs">
                                <div class="imgs">
                                   	<div class="slbdiv slbdivTwo">
                                		<img src="/images/homepage/1img2.jpg" />
                                   	</div>
                                   	<div class="slbdiv slbdivTwo">
                                		<img src="/images/homepage/1img2.jpg" />
                                   	</div>
                                </div>
	                        </div>
	                	<a href="javascript:void(0);" class="clickRight"><img src="/images/activity/div_arrowright.jpg" /></a>
	              	</div> 
	              </div>
	              <p class="areaName">优惠券</p>
	            </div>
	            <div class="editDiv" id="editDiv15">
	            	<div class="divs">
		            	<div class="fl" style="width:100%;" id="leftModule15">
                            <div class="goodThreediv">
	                         	<img src="/images/homepage/2img1.jpg" />
                            </div>
                            <div class="goodThreediv">
	                         	<img src="/images/homepage/2img1.jpg" />
                            </div>
                            <div class="goodThreediv">
	                         	<img src="/images/homepage/2img1.jpg" />
                            </div>
                        </div> 
	              	</div>
	              	<p class="areaName">商品模块</p>
	            </div>
	            <div class="editDiv" id="editDiv16">
	            	<span class="num" style="display:none"></span>
	            	<div class="divs">
		            	<div class="fl" style="width:100%;" >
			            	<div class="goodTwoCon">
                               <div class="goodTwodiv">
                            		<img src="/images/homepage/2img1.jpg"/>
                               </div>
                               <div class="goodTwodiv">
                            		<img src="/images/homepage/2img1.jpg"/>
                               </div>
	                    	</div>
                    	</div> 
	              	</div>
	              	<p class="areaName">商品模块</p>
	            </div>
	            <div class="editDiv" id="editDiv17">
	            	<div class="divs">                      
	                  	<div class="fl fl17" style="width:100%;" >
	                      	<a href="javascript:void(0);" class="clickLeft"><img src="/images/activity/div_arrowleft.jpg" /></a>
	                      	<div class="allimgs">
	                          	<div class="imgs" id="leftBoard17">
	                              	<div class="slbdiv">
		                            	<img id="fl171" src="/images/homepage/2img1.jpg" />
		                            	<a href="javascript:void(0);"><img class="close delModule17" src="/images/homepage/close.png"/></a>
		                            	<span class="num"></span> 
	                              	</div>
	                              	<div class="slbdiv">
		                            	<img id="fl172" src="/images/homepage/2img1.jpg" />
		                            	<a href="javascript:void(0);"><img class="close delModule17" src="/images/homepage/close.png"/></a>
		                            	<span class="num"></span> 
	                              	</div>
	                              	<div class="slbdiv">
		                            	<img id="fl173" src="/images/homepage/2img1.jpg" />
		                            	<a href="javascript:void(0);"><img class="close delModule17" src="/images/homepage/close.png"/></a>
		                            	<span class="num"></span> 
	                              	</div>
	                              	<div class="slbdiv">
		                            	<img id="fl174" src="/images/homepage/2img1.jpg" />
		                            	<a href="javascript:void(0);"><img class="close delModule17" src="/images/homepage/close.png"/></a>
		                            	<span class="num"></span> 
	                              	</div>
	                          	</div>
	                    	</div>
	                      	<a href="javascript:void(0);" class="clickRight"><img src="/images/activity/div_arrowright.jpg" /></a>
	                  	</div>                                          
	              	</div>
	              	<div class="Addimg">                  
	                  <a href="javascript:void(0)" class="addfour">＋</a>
	              	</div>
	              	<p class="areaName">模块12</p>
	            </div>
	            <div class="editDiv" id="editDiv18">
	            	<span class="num" style="display:none"></span>
	                <div class="divs">
		            	<div class="fl fl14" style="width:466px;margin:0 7px 0 7px;">
		                	<img src="/images/homepage/img15.jpg" />
		              	</div>
		          	</div>
	              	<p class="areaName">商品模块</p>
	            </div>
	            <div class="editDiv" id="editDiv19">
	              <div>              
	                <div class="divs">
	                    <div class="fl fl19" style="width:100%;">
	                      <img id="fl191" src="/images/homepage/img6.jpg" />
	                      <span class="num" style="display:none"></span>
	                    </div>  
	                </div>
	              </div>
	              <p class="areaName">预约</p>
	            </div>
	            <div class="editDiv" id="editDiv20">
	              <div>              
	                <div class="divs">
	                    <div class="fl fl20" style="width:100%;">
	                      <img id="fl201" src="/images/homepage/img6.jpg" />
	                      <span class="num" style="display:none"></span>
	                    </div>  
	                </div>
	              </div>
	              <p class="areaName">预约</p>
	            </div>
	         </div><!--divlist-->
	
	      </div><!--leftCon-->
	      <div class="rightCon1">
	      <form id="form1" name="form1" action="${BasePath}/system/CmsModuleController/saveModule.sc" method="post">
	      	  <input type="hidden" id="effectRange" name="effectRange" value="1" />
	      	  <input type="hidden" id="imgType" name="imgType" value="5" /><!-- 图片类型：5：专题icon -->
	      	  <input type="hidden" id="moduleStyle" name="moduleStyle" value="${moduleStyle!''}" />
	      	  <input type="hidden" id="moduleType" name="moduleType" value="${moduleType!'1'}" />
	          <input type="hidden" id="navigationId" name="navigationId" value="${navigationId!''}" />
	          <input type="hidden" id="activityId" name="activityId" value="${activityId!''}" />
	          <div class="wayCon">
	              <p><span class="red">&nbsp;</span>模块名称：
	              	 <input type="text" id="moduleName" name="moduleName" class="ipt_text" style="width:340px;"/>
	              </p>
	              <p><span class="pl10"></span>起止时间：
	              	 <input type="text" class="ipt_text" readonly="readonly" name="starttime" id="starttime" class="Wdate" 
				            onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
				            maxDate:'#F{$dp.$D(\'endtime\')||\'2020-10-01 00:00:00\'}'})" size="20"/>&nbsp;&nbsp;
				          至  &nbsp;&nbsp;<input type="text" class="ipt_text" readonly="readonly"  name="endtime" id="endtime"  class="Wdate"
				    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
				    		minDate:'%y-%M-{%d}'&&'#F{$dp.$D(\'starttime\')}'})" size="20"  />
	              </p>
	              <#if moduleStyle?? && moduleStyle==19>
	              <p><span class="red">*</span>活动开始时间：
	              	 <input type="text" class="ipt_text" readonly="readonly" name="remindtime" id="remindtime" class="Wdate" 
				            onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" size="20"/>&nbsp;&nbsp;
	              </p>
	              </#if>
	              <#if moduleStyle?? && (moduleStyle==1 || moduleStyle==2 || moduleStyle==7 || moduleStyle==11)>
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="640"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="300"/>px
	              </p>
	              </#if>
	              <#if moduleStyle?? && (moduleStyle==3 || moduleStyle==4 || moduleStyle==19)>
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="640"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="250"/>px
	              </p>
	              </#if>
	              <#if moduleStyle?? && (moduleStyle==5 || moduleStyle==8 || moduleStyle==12)>
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="640"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="150"/>px
	              </p>
	              </#if>
	              <#if moduleStyle?? && moduleStyle==10>
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="640"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="184"/>px
	              </p>
	              </#if>
	              <#if moduleStyle?? && moduleStyle==17>
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="204"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="204"/>px
	              </p>
	              </#if>
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
	          <#if moduleStyle?? && moduleStyle!=12 && moduleStyle!=15>
		          <div class="wayCon" id="wayCon"></div>
	          </#if>
	          <#if moduleStyle?? && (moduleStyle==12 || moduleStyle==15)>
		      <div class="wayCon">
		           	<div>
		                <p><span style="color:#f00;margin-right:44px;">请输入商品标号，以逗号或换行分隔</span><input type="button" onclick="addCommodity();" value="上传商品"></p>
		                <textarea rows="10" cols="50" style="border:1px solid #999" name="commodityText" id="commodityText"></textarea>
		                <input type="hidden" name="commodity" id="commodity"/>
	           		</div>
		       </div>
	           </#if>
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
