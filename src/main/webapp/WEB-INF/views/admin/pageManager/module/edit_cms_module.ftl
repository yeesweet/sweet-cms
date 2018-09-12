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
			        <li class="curr"><span>编辑</span></li>
			    </ul>
			  </div>
        <!--当前位置end-->
	<!--主体start--> 
    <div id="modify" class="modify_homepage">
		<!-- <div class="left"></div> -->
	    <div class="right">
	      <div class="leftCon1">
	         <div class="divlist">
	         	<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==103>
		          	<div class="editDiv" id="editDiv0" style="display:block">              
		              	<div class="divs">
		                	<div class="writetext"><img src="/images/homepage/img3.jpg" /></div>
		             	</div>
		              	<p class="areaName">webview</p>
		            </div>
		        </#if>
	            <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==1>
		            <div class="editDiv" id="editDiv1" style="display:block">              
		            	<div class="divs">
		                	<div class="fl fl1"  style="width:40%;height:224px;">
		                   		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img id="fl11" src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
			                    	<img id="fl11" src="/images/homepage/1img1.jpg" />
		                        </#if>	
		                         <span class="num">1.</span>
		                    </div>
		                    <div class="fl fl1" style="width:60%;">
		                         <div style="height:93px;">
		                         	<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
			                        	<img id="fl12" src="${cmsModule.moduleDetails[1].imgUrl!}" />
			                        <#else>
			                            <img id="fl12" src="/images/homepage/1img2.jpg" />
			                        </#if>	
		                            <span class="num">2.</span>
		                         </div>
		                         <div style="height:130px;">
		                         	<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
			                        	<img id="fl13" src="${cmsModule.moduleDetails[2].imgUrl!}" />
			                        <#else>
			                            <img id="fl13" src="/images/homepage/1img2.jpg" />
			                        </#if>	
		                            <span class="num">3.</span>
		                         </div>
		                    </div>
		              	</div>
		              	<p class="areaName">模块1</p>
		            </div>
	            </#if>
	            <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==2>
		            <div class="editDiv" id="editDiv2" style="display:block">              
		              	<div class="divs">
		                   <div class="fl fl2" style="width:40%;height:225px;">
		                   		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img id="fl21" src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
			                        <img id="fl21" src="/images/homepage/1img1.jpg" />
		                        </#if>	
		                        <span class="num">1.</span>
		                    </div>
		                    <div class="fl fl2" style="width:60%;">
		                         <div style="height:93px;">
		                         	<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
			                        	<img id="fl22" src="${cmsModule.moduleDetails[1].imgUrl!}" />
			                        <#else>
		                            	<img id="fl22" src="/images/homepage/1img2.jpg" />
			                        </#if>	
		                            <span class="num">2.</span>
		                         </div>
		                         <div style="height:131px;">
		                             <div style="width:50%;">
		                             	<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
				                        	<img id="fl23" src="${cmsModule.moduleDetails[2].imgUrl!}" />
				                        <#else>
			                                <img id="fl23" src="/images/homepage/2img1.jpg" />
				                        </#if>	
		                                <span class="num">3.</span>
		                            </div>
		                             <div style="width:50%;">
		                             	<#if cmsModule.moduleDetails[3]?? && cmsModule.moduleDetails[3].imgUrl?? && cmsModule.moduleDetails[3].imgUrl != ''>
				                        	<img id="fl24" src="${cmsModule.moduleDetails[3].imgUrl!}" />
				                        <#else>
			                                <img id="fl24" src="/images/homepage/2img1.jpg" />
				                        </#if>	
		                                <span class="num">4.</span>
		                            </div>
		                         </div>
		                    </div>
		              	</div>
		              	<p class="areaName">模块2</p>
		            </div>
		        </#if>
		        <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==3>
		            <div class="editDiv" id="editDiv3" style="display:block">
		              	<div class="addBox1">              
	                    	<#if cmsModule.moduleDetails??>
		                    	<#list cmsModule.moduleDetails as cmsModuleDetail>
		                    		<div class="divs oneimg">
	                    				<div class="fl fl3" style="width:100%;">
					                		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
					                        	<img id="fl3${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
					                        <#else>
					                			<img id="fl3${cmsModuleDetail_index+1}" src="/images/homepage/img6.jpg" />
					                        </#if>
					                        <span class="num"></span>
					            		</div>                  
						                <a class="delete3" href="javascript:void(0);">删除</a>
					                </div>
								</#list>
							</#if>
		              	</div>
		               	<div class="Addimg">                  
		                	<a href="javascript:void(0)" class="addone">＋</a>
		              	</div>
		              	<p class="areaName">模块3</p>
					</div>
				</#if>
				<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==4>
		           	<div class="editDiv" id="editDiv4" style="display:block">              
		              	<div class="divs">
		                  	<div class="fl fl4" style="width:33.3%;">
			                  	<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img id="fl41" src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
				                    <img id="fl41" src="/images/homepage/2img1.jpg" />
		                        </#if>
			                    <span class="num">1.</span>
		                  	</div>
		                  	<div class="fl fl4" style="width:33.3%;">
			                  	<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
		                        	<img id="fl42" src="${cmsModule.moduleDetails[1].imgUrl!}" />
		                        <#else>
				                    <img id="fl42" src="/images/homepage/2img1.jpg" />
		                        </#if>
			                    <span class="num">2.</span>
		                 	</div>
		                  	<div class="fl fl4" style="width:33.3%;">
			                  	<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
		                        	<img id="fl43" src="${cmsModule.moduleDetails[2].imgUrl!}" />
		                        <#else>
				                    <img id="fl43" src="/images/homepage/2img1.jpg" />
		                        </#if>
			                    <span class="num">3.</span>
		                  	</div>
		              	</div>
		              	<p class="areaName">模块4</p>
		            </div>
		        </#if>
		        <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==5>
		            <div class="editDiv" id="editDiv5" style="display:block">
		            	<div class="addBox2">              
		                	<#if cmsModule.moduleDetails??>
		                		<#list cmsModule.moduleDetails as cmsModuleDetail>
				                	<#if cmsModuleDetail?? && cmsModuleDetail_index%2==0>
				                		<div class="divs twoimg">
					                    	<div class="fl fl5" style="float:left;width:237px;height:185px;">
					                    		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
					                      			<img id="fl5${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
					                      		<#else>
					                      			<img id="fl5${cmsModuleDetail_index+1}" src="/images/homepage/2img1.jpg" />
					                      		</#if>
					                      		<span class="num">${cmsModuleDetail_index+1}</span>
					                    	</div>
									<#else>
					                    	<div class="fl fl5" style="width:237px;float:right;height:185px;">
					                      		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
					                      			<img id="fl5${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
					                      		<#else>
					                      			<img id="fl5${cmsModuleDetail_index+1}" src="/images/homepage/2img1.jpg" />
					                      		</#if>
					                      		<span class="num">${cmsModuleDetail_index+1}</span>
					                    	</div>
							                <a class="delete5" href="javascript:void(0);">删除</a>
					                	</div>
					            	</#if>
				            	</#list>
		                    </#if>
		              	</div>
		               	<div class="Addimg">                  
		                  	<a href="javascript:void(0)" class="addtwo">＋</a>
		              	</div>
		              	<p class="areaName">模块5</p>
		            </div>
		        </#if>
		        <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==6>
		            <div class="editDiv" id="editDiv6" style="display:block">              
		              	<div class="divs">
		                	<div class="fl fl6" style="width:226px;margin-left:7px;height:184px;">
		                		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img id="fl61" src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
				                	<img id="fl61" src="/images/homepage/2img1.jpg" />
		                        </#if>	
			                    <span class="num">1.</span>
			            	</div>
		                  	<div class="fl fl6" style="width:226px;float:right;margin-right:7px">
		                    	<div style="height:85px;">
		                    		<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
			                        	<img id="fl62" src="${cmsModule.moduleDetails[1].imgUrl!}" />
			                        <#else>
			                        	<img id="fl62" src="/images/homepage/1img2.jpg" />
			                        </#if>	
		                         	<span class="num">2.</span>
		                    	</div>
		                    	<div style="height:85px;margin-top:4px;">
		                    		<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
			                        	<img id="fl63" src="${cmsModule.moduleDetails[2].imgUrl!}" />
			                        <#else>
			                        	<img id="fl63" src="/images/homepage/1img2.jpg" />
			                        </#if>	
		                        	<span class="num">3.</span>
		                    	</div>
		                  	</div> 
		              	</div>
		              	<p class="areaName">模块6</p>
		            </div>
		        </#if>
		        <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==7>
		            <div class="editDiv" id="editDiv7" style="display:block">              
		              	<div class="divs">
		                	<div class="fl fl7" style="width:226px;margin-left:7px;">
		                    	<div style="height:85px;">
		                    		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
			                        	<img id="fl71" src="${cmsModule.moduleDetails[0].imgUrl!}" />
			                        <#else>
			                        	<img id="fl71" src="/images/homepage/1img2.jpg" />
			                        </#if>	
		                           	<span class="num">1.</span>
		                      	</div>
		                      	<div style="height:85px;margin-top:4px;">
		                      		<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
			                        	<img id="fl72" src="${cmsModule.moduleDetails[1].imgUrl!}" />
			                        <#else>
			                          	<img id="fl72" src="/images/homepage/1img2.jpg" />
			                        </#if>	
		                          	<span class="num">2.</span>
		                      	</div>
		                  	</div>   
		                  	<div class="fl fl7"  style="width:226px;height:184px;float:right;margin-right:7px">
		                  		<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
		                        	<img id="fl73" src="${cmsModule.moduleDetails[2].imgUrl!}" />
		                        <#else>
			                    	<img id="fl73" src="/images/homepage/2img1.jpg" />
		                        </#if>
		                    	<span class="num">3.</span>
		                  	</div>
		              	</div>
		              	<p class="areaName">模块7</p>
		            </div>
		        </#if>
		        <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==8>
		            <div class="editDiv" id="editDiv8" style="display:block">              
		            	<div class="divs">
		                	<div class="fl fl8" style="width:50%;height:185px;">
		                		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img id="fl81" src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
				                    <img id="fl81" src="/images/homepage/2img1.jpg" /> 
		                        </#if>
			                    <span class="num">1.</span>                   
		                  	</div>   
		                  	<div class="fl fl8" style="width:50%;height:185px;">
		                  		<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
		                        	<img id="fl82" src="${cmsModule.moduleDetails[1].imgUrl!}" />
		                        <#else>
				                    <img id="fl82" src="/images/homepage/2img1.jpg" /> 
		                        </#if>
			                    <span class="num">2.</span> 
		                  	</div>
		              	</div>
		              	<p class="areaName">模块8</p>
		            </div>
		        </#if>
		        <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==9>
		            <div class="editDiv" id="editDiv9" style="display:block">              
		            	<div class="divs">
		                	<div class="fl fl9" style="width:466px;margin:0 7px 15px 7px;">
		                		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img id="fl91" src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
			                    	<img id="fl91" src="/images/homepage/img6.jpg" />
		                        </#if>                   
		                      	<span class="num">1.</span>                                       
		                  	</div>
		                  	<div class="fl fl9" style="width:226px;height:185px;float:left;margin-left:7px;;">  
		                  		<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
		                        	<img id="fl92" src="${cmsModule.moduleDetails[1].imgUrl!}" />
		                        <#else>
			                    	<img id="fl92" src="/images/homepage/img1.jpg" />
		                        </#if>                   
		                      	<span class="num">2.</span>                                       
		                  	</div>   
		                  	<div class="fl fl9" style="width:226px;height:185px;float:right;margin-right:7px;">
		                  		<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
		                        	<img id="fl93" src="${cmsModule.moduleDetails[2].imgUrl!}" />
		                        <#else>
				                    <img id="fl93" src="/images/homepage/img1.jpg" /> 
		                        </#if> 
			                    <span class="num">3.</span> 
		                  	</div>
		            	</div>
		              	<p class="areaName">模块9</p>
		            </div>
		        </#if>
		        <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==10>
		            <div class="editDiv" id="editDiv10" style="display:block">              
		            	<div class="divs">
		            		<#if cmsModule.moduleDetails??>
		            			<#list cmsModule.moduleDetails as cmsModuleDetail>
			              			<div class="fl fl10" style="width:25%;height:138px;">
				                		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
				                        	<img id="fl10${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
				                        <#else>
				                			<img id="fl10${cmsModuleDetail_index+1}" src="/images/homepage/2img1.jpg" />  
				                        </#if>
				                        <span class="num">${cmsModuleDetail_index+1}.</span>
				                	</div>
								</#list>    
			                </#if>
		         		</div>
		              	<p class="areaName">模块10</p>
		            </div>
		        </#if>
		        <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==11>
		            <div class="editDiv" id="editDiv11" style="display:block">
		              	<div class="addBox3">              
	                    	<#if cmsModule.moduleDetails??>
		                    	<#list cmsModule.moduleDetails as cmsModuleDetail>
		                    		<div class="divs threeimg">
	                    				<div class="fl fl11" style="width:466px;margin:0 7px 10px 7px;">
					                		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
					                        	<img id="fl11${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
					                        <#else>
					                			<img id="fl11${cmsModuleDetail_index+1}" src="/images/homepage/img6.jpg" />
					                        </#if>
					                        <span class="num"></span>
					            		</div>                  
						                <a class="delete11" href="javascript:void(0);">删除</a>
					                </div>
								</#list>
							</#if>
		              	</div>
		               	<div class="Addimg">                  
		                	<a href="javascript:void(0)" class="addthree">＋</a>
		              	</div>
		              	<p class="areaName">模块11</p>
					</div>
				</#if>
				<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==12>
					<div class="editDiv" id="editDiv12" style="display:block">
		                <div class="divs">                       
		                  	<div class="fl fl12" style="width:100%;" >
		                      	<a href="javascript:void(0);" class="clickLeft"><img src="/images/activity/div_arrowleft.jpg" /></a>
		                      	<div class="allimgs">
	                          		<div class="imgs" id="leftModule12">
		                          		<#if cmsModule.moduleCommoditys??>
		                    				<#list cmsModule.moduleCommoditys as moduleCommodity>
				                              	<div class="slbdiv">
				                              		<#if moduleCommodity.defaultPic?? && moduleCommodity.defaultPic!=''>
						                            	<img src="${moduleCommodity.defaultPic!}" />
				                              		<#else>
				                              			<img src="/images/homepage/2img1.jpg" />
				                              		</#if>
					                            	<p>库存：${moduleCommodity.inventoryNumber!}</p>
					                            	<p>￥${moduleCommodity.salePriceN!}<span>/￥<del>${moduleCommodity.publicPrice!}</del></span></p>
					                            	<a href="javascript:void(0);"><img class="close delCommodity" src="/images/homepage/close.png"></a>
				                              	</div>
				                            </#list>
				                    	</#if>
				                    </div>
		                    	</div>
		                      	<a href="javascript:void(0);" class="clickRight"><img src="/images/activity/div_arrowright.jpg" /></a>
		                  	</div>                                          
		              	</div>
		              	<p class="areaName">商品模块</p>
		            </div>
		     	</#if>
				<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==15>
					<div class="editDiv" id="editDiv15" style="display:block">
		                <div class="divs">                   
		                  	<div class="fl" style="width:100%;" id="leftModule15">
                          		<#if cmsModule.moduleCommoditys??>
                    				<#list cmsModule.moduleCommoditys as moduleCommodity>
		                              	<div class="goodThreediv">
		                              		<#if moduleCommodity.defaultPic?? && moduleCommodity.defaultPic!=''>
				                            	<img src="${moduleCommodity.defaultPic!}" class='goodDivImg'/>
		                              		<#else>
		                              			<img src="/images/homepage/2img1.jpg" class='goodDivImg'/>
		                              		</#if>
			                            	<p>库存：${moduleCommodity.inventoryNumber!}</p>
			                            	<p>￥${moduleCommodity.salePriceN!}<span>/￥<del>${moduleCommodity.publicPrice!}</del></span></p>
			                            	<a href="javascript:void(0);"><img class="close delCommodity" src="/images/homepage/close.png"></a>
		                              	</div>
		                            </#list>
		                    	</#if>
		                  	</div>                                          
		              	</div>
		              	<p class="areaName">商品模块</p>
		            </div>
		     	</#if>
				<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==16>
					<div class="editDiv" id="editDiv16" style="display:block">
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
		     	</#if>
		     	<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==17>
					<div class="editDiv" id="editDiv17" style="display:block">
		                <div class="divs">                     
		                  	<div class="fl fl17" style="width:100%;" >
		                      	<a href="javascript:void(0);" class="clickLeft"><img src="/images/activity/div_arrowleft.jpg" /></a>
		                      	<div class="allimgs">
	                          		<div class="imgs" id="leftBoard17">
		                          		<#if cmsModule.moduleDetails??>   
		                    				<#list cmsModule.moduleDetails as cmsModuleDetail>
				                              	<div class="slbdiv">
				                              		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
							                        	<img id="fl17${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
							                        <#else>
							                			<img id="fl17${cmsModuleDetail_index+1}" src="/images/homepage/2img1.jpg" />
							                        </#if>
					                            	<p>${cmsModuleDetail.title!}</p>
					                            	<a href="javascript:void(0);"><img class="close delModule17" src="/images/homepage/close.png"/></a>
				                              	</div>
				                            </#list>
				                    	</#if>
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
		     	</#if>
		     	<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==18>
					<div class="editDiv" id="editDiv18" style="display:block">
		                <span class="num" style="display:none"></span>
		                <div class="divs">
			            	<div class="fl fl14" style="width:466px;margin:0 7px 0 7px;">
			                	<img src="/images/homepage/img15.jpg" />
			              	</div>
			          	</div>
		              	<p class="areaName">秒杀</p>
		            </div>
		     	</#if>
		     	<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==19>
		            <div class="editDiv" id="editDiv19" style="display:block">
		              	<div>              
	                    	<#if cmsModule.moduleDetails??>
		                    	<#list cmsModule.moduleDetails as cmsModuleDetail>
		                    		<div class="divs">
	                    				<div class="fl fl19" style="width:100%;">
					                		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
					                        	<img id="fl19${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
					                        <#else>
					                			<img id="fl19${cmsModuleDetail_index+1}" src="/images/homepage/img6.jpg" />
					                        </#if>
					                        <span class="num"></span>
					            		</div>                  
					                </div>
								</#list>
							</#if>
		              	</div>
		              	<p class="areaName">预约</p>
					</div>
				</#if>
		     	<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle==20>
		            <div class="editDiv" id="editDiv19" style="display:block">
		              	<div>              
	                    	<#if cmsModule.moduleDetails??>
		                    	<#list cmsModule.moduleDetails as cmsModuleDetail>
		                    		<div class="divs">
	                    				<div class="fl fl19" style="width:100%;">
					                		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
					                        	<img id="fl19${cmsModuleDetail_index+1}" src="${cmsModuleDetail.imgUrl!}" />
					                        <#else>
					                			<img id="fl19${cmsModuleDetail_index+1}" src="/images/homepage/img6.jpg" />
					                        </#if>
					                        <span class="num"></span>
					            		</div>                  
					                </div>
								</#list>
							</#if>
		              	</div>
		              	<p class="areaName">倒计时</p>
					</div>
				</#if>
	         </div><!--divlist-->
	
	      </div><!--leftCon-->
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
	              <#if moduleStyle?? && moduleStyle==19>
	              <p><span class="red">*</span>活动开始时间：
	              	 <input type="text" class="ipt_text" readonly="readonly" name="remindtime" id="remindtime" class="Wdate" 
	              	 		value="<#if cmsModule.remindTime??>${cmsModule.remindTime?string('yyyy-MM-dd HH:mm:ss')}</#if>"
				            onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" size="20"/>&nbsp;&nbsp;
	              </p>
	              </#if>
	              <#if moduleStyle?? && moduleStyle!=20>
	              <p><span class="red">*</span>模块尺寸：
	              	宽*高=<input type="text" class="ipt_text" name="width" id="width" value="${cmsModule.width!''}"/>px
				     *&nbsp;&nbsp;<input type="text" class="ipt_text" name="height" id="height" value="${cmsModule.height!''}"/>px
	              </p>
	              </#if>
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
	          <div class="wayCon" id="wayCon" <#if cmsModule.moduleStyle==12 || cmsModule.moduleStyle==15>style="display:none"</#if>>
	          	<#if cmsModule.moduleDetails?? && cmsModule.moduleStyle!=12 && cmsModule.moduleStyle!=15>
	          		<#list cmsModule.moduleDetails as cmsModuleDetail>
	          			<#if cmsModuleDetail??>
	          				<#if cmsModule.moduleStyle?? && ((cmsModule.moduleStyle==5 && cmsModuleDetail_index%2==0) || cmsModule.moduleStyle == 3 || cmsModule.moduleStyle == 11 || cmsModule.moduleStyle == 17)>
	          					<div class='Tj5'>
	          				</#if>
							<div class="upload" id="upload${cmsModuleDetail_index+1}">
								<#if !(cmsModule.moduleStyle==16 || cmsModule.moduleStyle==20)>
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
								</#if>
								<#if cmsModule.moduleStyle==17>
									<p class="title"><span class="red">&nbsp;</span>模块名称：
										<input id="title${cmsModuleDetail_index+1}" class="ipt_text" type="text"
											   value="${cmsModuleDetail.title! }" name="moduleDetails[${cmsModuleDetail_index}].title"/>
									</p>
								</#if>
								<#if cmsModule.moduleStyle!=19>
								<#include "/manager/activity/module/module_link_position.ftl">
								</#if>
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].sortNo" id="sortNo${cmsModuleDetail_index+1}" value="${cmsModuleDetail_index+1}" />
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].commonId" id="commonId${cmsModuleDetail_index+1}" value="${cmsModuleDetail.commonId!}"/>
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].subType" id="subType${cmsModuleDetail_index+1}" value="${cmsModuleDetail.subType!}"/>
								<input type="hidden" name="moduleDetails[${cmsModuleDetail_index}].linkUrl" id="linkUrl${cmsModuleDetail_index+1}" value="${cmsModuleDetail.linkUrl!}"/>
	          				</div>
							<#if cmsModule.moduleStyle?? &&  ((cmsModule.moduleStyle==5 && cmsModuleDetail_index%2!=0) || cmsModule.moduleStyle == 3 || cmsModule.moduleStyle == 11 || cmsModule.moduleStyle == 17)>
	          					</div>
	          				</#if>
						</#if>
					</#list>
				</#if>
			   </div>
			   <#if moduleStyle?? && (moduleStyle==12 || moduleStyle==15)>
		           <div class="wayCon">
		           		<div>
			                <p><span style="color:#f00;margin-right:44px;">请输入商品标号，以逗号或换行分隔</span><input type="button" onclick="addCommodity();" value="上传商品"></p>
	            			<textarea rows="10" cols="50" style="border:1px solid #999" name="commodityText" id="commodityText"><#if cmsModule.moduleCommoditys??><#list cmsModule.moduleCommoditys as moduleCommodity>${moduleCommodity.commodityCode!}<#if cmsModule.moduleCommoditys?size!=moduleCommodity_index+1>,</#if></#list></#if></textarea>
		                	<input type="hidden" name="commodity" id="commodity" <#if cmsModule.moduleCommoditys??>value="<#list cmsModule.moduleCommoditys as moduleCommodity>${moduleCommodity.commodityCode!}<#if cmsModule.moduleCommoditys?size!=moduleCommodity_index+1>,</#if></#list>"</#if>/>
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
