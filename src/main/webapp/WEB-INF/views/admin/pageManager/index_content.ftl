<#if cmsModuleList??>
	<#list cmsModuleList as cmsModule>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 101>
			<#if cmsModule.moduleDetails??>
				<li class="a1 lb" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	            	<div class="area101">
	              		<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		                <div class="slider">
			                <dl>
			                	<#list cmsModule.moduleDetails as cmsModuleDetail>
			                    	<dd>
			                    		<#if cmsModuleDetail.subStartTime?? && cmsModuleDetail.subEndTime??>
				                    		<time class="timer">
							        			${cmsModuleDetail.subStartTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModuleDetail.subEndTime?string('yyyy-MM-dd HH:mm:ss')}
							        		</time>
							        	</#if>
			                    		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
				                        	<img src="${cmsModuleDetail.imgUrl!}"/>
				                        <#else>
				                			<img src="/images/homepage/img1.jpg" />
				                        </#if>
			                    		<#if cmsModuleDetail.onlineState??>
						                	<img src='/images/homepage/prompt_img${cmsModuleDetail.onlineState!}.png' class='imgStateLb' style="display:none"/>
						                <#else>
						                	<img src='/images/homepage/prompt_img3.png' class='imgStateLb' style="display:none"/>
						                </#if>
			                    	</dd>
			                    </#list>
			                </dl>
		                </div>
	              	</div>           
	        	</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 102>
			<#if cmsModule.moduleDetails??>
				<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		            <div class="area102">
		            	<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="recommendlist">
			              	<#list cmsModule.moduleDetails as cmsModuleDetail>
			                  	<div>
		                      		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
			                        	<img src="${cmsModuleDetail.imgUrl!}" />
			                        <#else>
			                			<img src="/images/homepage/tuijian1.jpg" />
			                        </#if>
			                      	<p>${cmsModuleDetail.title!}</p>
			                  	</div>
							</#list>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	        	</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 108>
			<#if cmsModule.moduleDetails??>
            <li class="a1" style="margin-top:${cmsModule.space!}px">
                <input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
                <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
                <input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
                <div class="area102">
					<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>
					<#if cmsModule.startTime?? && cmsModule.endTime??>
                        <p class="timer">
						${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
                        </p>
					</#if>
                    <a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
                    <div class="recommendlist">
						<#list cmsModule.moduleDetails as cmsModuleDetail>
                            <div>
								<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
                                    <img src="${cmsModuleDetail.imgUrl!}" />
								<#else>
                                    <img src="/images/homepage/tuijian1.jpg" />
								</#if>
                                <p>${cmsModuleDetail.title!}</p>
                            </div>
						</#list>
                    </div>
					<#if cmsModule.onlineState??>
                        <img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
					<#else>
                        <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
					</#if>
                </div>
            </li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 1>
			<#if cmsModule.moduleDetails??>
				<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		            <div class="area1">
		            	<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
		                   	<div class="fl" style="width:40%;height:224px;">
		                   		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
		                        	<img src="/images/homepage/1img1.jpg" />
		                        </#if>	
		                    </div>
		                    <div class="fl" style="width:60%;">
		                         <div style="height:93px;">
		                         	<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
			                        	<img src="${cmsModule.moduleDetails[1].imgUrl!}" />
			                        <#else>
			                        	<img src="/images/homepage/1img2.jpg" />
			                        </#if>
		                         </div>
		                         <div style="height:130px;">
		                            <#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
			                        	<img src="${cmsModule.moduleDetails[2].imgUrl!}" />
			                        <#else>
			                        	<img src="/images/homepage/1img2.jpg" />
			                        </#if>
		                         </div>
		                    </div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	        	</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 2>
			<#if cmsModule.moduleDetails??>
				<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		            <div class="area2">
		            	<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
		                   	<div class="fl" style="width:40%;height:225px;">
		                   		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
		                        	<img src="/images/homepage/1img1.jpg" />
		                        </#if>	
		                    </div>
		                	<div class="fl" style="width:60%;">
		                         <div style="height:93px;">
		                         	<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
			                        	<img src="${cmsModule.moduleDetails[1].imgUrl!}" />
			                        <#else>
			                            <img src="/images/homepage/1img2.jpg" />
			                        </#if>	
		                         </div>
		                         <div style="height:131px;">
		                             <div style="width:50%;">
		                             	<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
				                        	<img src="${cmsModule.moduleDetails[2].imgUrl!}" />
				                        <#else>
			                             	<img src="/images/homepage/2img1.jpg" />
				                        </#if>	
		                             </div>
		                             <div style="width:50%;">
		                             	<#if cmsModule.moduleDetails[3]?? && cmsModule.moduleDetails[3].imgUrl?? && cmsModule.moduleDetails[3].imgUrl != ''>
				                        	<img src="${cmsModule.moduleDetails[3].imgUrl!}" />
				                        <#else>
			                             	<img src="/images/homepage/2img1.jpg" />
				                        </#if>	
		                             </div>
		                         </div>
		                	</div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	        	</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 3>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		        	<div class="area3">
		        		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
			            	<div class="fl" style="width:100%;">
			                	<#list cmsModule.moduleDetails as cmsModuleDetail>
			                		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
			                        	<img src="${cmsModuleDetail.imgUrl!}" style="margin-bottom:5px;height:${cmsModule.height!'128'}px;"/>
			                        <#else>
			                			<img src="/images/homepage/img6.jpg" style="margin-bottom:5px;height:${cmsModule.height!'128'}px;"/>
			                        </#if>
								</#list>
			            	</div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	          	</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 4>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		            <div class="area4">
		            	<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
			            	<div class="fl" style="width:33.3%;">
			            		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
			                		<img src="/images/homepage/2img1.jpg" />
		                        </#if>	
			            	</div>
			            	<div class="fl" style="width:33.3%;">
			                	<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[1].imgUrl!}" />
		                        <#else>
			                		<img src="/images/homepage/2img1.jpg" />
		                        </#if>	
			            	</div>
			            	<div class="fl" style="width:33.3%;">
			                	<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[2].imgUrl!}" />
		                        <#else>
			                		<img src="/images/homepage/2img1.jpg" />
		                        </#if>	
			            	</div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	          	</li>
			</#if>
		</#if>       
	    <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 5>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		        	<div class="area5">
		            	<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
			            <div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
			            	<#list cmsModule.moduleDetails as cmsModuleDetail>
		                		<#if cmsModuleDetail?? && cmsModuleDetail_index%2==0>
		                        	<div class="fl" style="float:left;width:50%;height:185px;margin-bottom:5px;">
		                        		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
				                        	<img src="${cmsModuleDetail.imgUrl!}" />
				                        <#else>
					                    	<img src="/images/homepage/2img1.jpg" />
				                        </#if>
					            	</div>
		                        <#else>
		                			<div class="fl" style="width:50%;float:right;height:185px;margin-bottom:5px;">
		                				<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
				                        	<img src="${cmsModuleDetail.imgUrl!}" />
				                        <#else>
						                    <img src="/images/homepage/2img1.jpg" />
				                        </#if>
					            	</div>   
		                        </#if>
							</#list>
			        	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
				</li>
			</#if>
		</#if>   
	    <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 6>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		            <div class="area6">
		            	<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>	
		            	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs">
		                  	<div class="fl" style="width:226px;margin-left:7px;height:184px;">
		                  		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
			                    	<img src="/images/homepage/2img1.jpg" />
		                        </#if>	
		                  	</div>
		                  	<div class="fl" style="width:226px;float:right;margin-right:7px">
			                    <div style="height:85px;">
			                    	<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
			                        	<img src="${cmsModule.moduleDetails[1].imgUrl!}" />
			                        <#else>
			                        	<img src="/images/homepage/1img2.jpg" />
			                        </#if>	
			                    </div>
			                    <div style="height:85px;margin-top:13px;">
			                    	<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
			                        	<img src="${cmsModule.moduleDetails[2].imgUrl!}" />
			                        <#else>
			                        	<img src="/images/homepage/1img2.jpg" />
			                        </#if>	
			                    </div>
		                  	</div>                 
		            	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	        	</li>
			</#if>
		</#if>   
	    <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 7>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		            <div class="area7">
		            	<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
		                  	<div class="fl" style="width:50%;height:184px;">
			                    <div style="height:50%;">
			                    	<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
			                        	<img src="${cmsModule.moduleDetails[0].imgUrl!}" />
			                        <#else>
			                         	<img src="/images/homepage/1img2.jpg" />
			                        </#if>	
			                    </div>
			                    <div style="height:50%;">
			                        <#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
			                        	<img src="${cmsModule.moduleDetails[1].imgUrl!}" />
			                        <#else>
			                         	<img src="/images/homepage/1img2.jpg" />
			                        </#if>	
			                    </div>
		                  	</div>   
	                  		<div class="fl" style="width:50%;height:184px;float:right;">
	                  			<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[2].imgUrl!}" />
		                        <#else>
	                    			<img src="/images/homepage/2img1.jpg" />
		                        </#if>	
	                  		</div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
				</li>
			</#if>
		</#if>   
	    <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 8>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		            <div class="area8">
		            	<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		            	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		            	<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
		                  	<div class="fl" style="width:50%;height:185px;">
		                  		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
			                    	<img src="/images/homepage/2img1.jpg" />                    
		                        </#if>	
		                  	</div>   
		                  	<div class="fl" style="width:50%;height:185px;">
		                    	<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[1].imgUrl!}" />
		                        <#else>
			                    	<img src="/images/homepage/2img1.jpg" />                    
		                        </#if>	
		                  	</div>
						</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
				</li>
			</#if>
		</#if>   
	    <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 9>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		            <div class="area9">
		            	<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs">
		                  	<div class="fl" style="width:466px;margin:0 7px 15px 7px;"> 
		                  		<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[0].imgUrl!}" />
		                        <#else>
			                    	<img src="/images/homepage/img6.jpg" />
		                        </#if>	                  
		                    	<span class="num"></span>                                       
		                  	</div>
		                  	<div class="fl" style="width:226px;height:185px;float:left;margin-left:7px;;">
		                  		<#if cmsModule.moduleDetails[1]?? && cmsModule.moduleDetails[1].imgUrl?? && cmsModule.moduleDetails[1].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[1].imgUrl!}" />
		                        <#else>
			                      	<img src="/images/homepage/img1.jpg" />
		                        </#if>	                   
		                      	<span class="num"></span>                                       
		                  	</div>   
		                  	<div class="fl" style="width:226px;height:185px;float:right;margin-right:7px;">
		                    	<#if cmsModule.moduleDetails[2]?? && cmsModule.moduleDetails[2].imgUrl?? && cmsModule.moduleDetails[2].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[2].imgUrl!}" />
		                        <#else>
			                      	<img src="/images/homepage/img1.jpg" />
		                        </#if>	
		                    	<span class="num"></span> 
		                  	</div>                             
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
				</li>
			</#if>
		</#if>   
	    <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 10>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	            	<div class="area10">
	            		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
	              		<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
	              		<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
	              			<#list cmsModule.moduleDetails as cmsModuleDetail>
		              			<div class="fl" style="width:25%;height:138px;">
			                		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
			                        	<img src="${cmsModuleDetail.imgUrl!}" />
			                        <#else>
			                			<img src="/images/homepage/2img1.jpg" />  
			                        </#if>
			                	</div>
							</#list>               
			            </div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
				</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 104>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	            	<div class="area10">
	            		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
	              		<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
	              		<div class="divs">
	              			<div id="liud">            
                            	<ul class="megUl">                                 
	              					<#list cmsModule.moduleDetails as cmsModuleDetail>
                                    	<li class="meglist">
                                    		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
					                        	<img src="${cmsModuleDetail.imgUrl!}" />
					                        <#else>
	                                    		<img src="/images/homepage/icon1.jpg" />
					                        </#if>
                                    		${cmsModuleDetail.title!}
                                    	</li>
									</#list>               
                            	</ul>          
                            </div>
			            </div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
				</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 11>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		        	<div class="area3">
		        		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
			            	<div class="fl" style="width:100%;">
			                	<#list cmsModule.moduleDetails as cmsModuleDetail>
			                		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
			                        	<img src="${cmsModuleDetail.imgUrl!}" style="margin-bottom:5px;height:${cmsModule.height!}px;"/>
			                        <#else>
			                			<img src="/images/homepage/img6.jpg" style="margin-bottom:5px;height:${cmsModule.height!}px;"/>
			                        </#if>
								</#list>
			            	</div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	          	</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 12>
          	<li class="a1" style="margin-top:${cmsModule.space!}px">
				<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
				<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
				<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	        	<div class="area3">
	        		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
	            	<#if cmsModule.startTime?? && cmsModule.endTime??>
		            	<p class="timer">
		        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
		        		</p>
	        		</#if>
	              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
	              	<div class="divs">
		            	<div class="fl" style="width:100%;" >
                        	<a href="javascript:void(0);" class="clickLeft"><img src="/images/activity/div_arrowleft.jpg" /></a>
                        	<div class="allimgs">
                            	<div class="imgs">
                                   <#list cmsModule.moduleCommoditys as cmsModuleCommodity>
                                       <div class="slbdiv">
                                       	<#if cmsModuleCommodity.defaultPic?? && cmsModuleCommodity.defaultPic != "">
				                        	<img src="${cmsModuleCommodity.defaultPic!}" />
				                        <#else>
                                    		<img src="/images/homepage/2img1.jpg" />
				                        </#if>
                                           <p>库存：${cmsModuleCommodity.inventoryNumber!}</p>
                                           <p>￥${cmsModuleCommodity.salePriceN!}<span>/￥<del>${cmsModuleCommodity.publicPrice!}</del></span></p>
                                       </div>
                                    </#list>                                                 
                            	</div>
                            </div>
                        	<a href="javascript:void(0);" class="clickRight"><img src="/images/activity/div_arrowright.jpg" /></a>
                    	</div> 
	              	</div>
	              	<#if cmsModule.onlineState??>
						<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
					<#else>
					    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
					</#if>
	            </div>
          	</li>
		</#if>
	    <#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 13>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		        	<div class="area3">
		        		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs">
			            	<div class="fl" style="width:100%;">
			                	<#list cmsModule.moduleDetails as cmsModuleDetail>
			                		<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
			                        	<img src="${cmsModuleDetail.imgUrl!}" style="margin-bottom:5px;"/>
			                        <#else>
			                			<img src="/images/homepage/img6.jpg" style="margin-bottom:5px;"/>
			                        </#if>
								</#list>
			            	</div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	          	</li>
			</#if>
		</#if>  
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 15>
			<li class="a1" style="margin-top:${cmsModule.space!}px">
	        	<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
				<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
				<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	        	<div class="area3">
	        		<p class="titleName"><span></span><#if cmsModule.moduleName?? && cmsModule.moduleName != "">${cmsModule.moduleName!}</#if></p>
	            	<#if cmsModule.startTime?? && cmsModule.endTime??>
		            	<p class="timer">
		        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
		        		</p>
	        		</#if>
	              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
	              	<div class="divs">
		            	<div class="fl" style="width:100%;" >
		            		<#list cmsModule.moduleCommoditys as cmsModuleCommodity>
                               <div class="goodThreediv">
                               		<#if cmsModuleCommodity.defaultPic?? && cmsModuleCommodity.defaultPic != "">
                    					<img src="${cmsModuleCommodity.defaultPic!}" class='goodDivImg'/>
                    				<#else>
                            			<img src="/images/homepage/2img1.jpg" class='goodDivImg'/>
                    				</#if>
                                   	<p>库存：${cmsModuleCommodity.inventoryNumber!}</p>
                                   	<p>￥${cmsModuleCommodity.salePriceN!}<span>/￥<del>${cmsModuleCommodity.publicPrice!}</del></span></p>
                               </div>
                            </#list>
                    	</div> 
	              	</div>
					<#if cmsModule.onlineState??>
						<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
					<#else>
					    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
					</#if>
	            </div>
          	</li>
		</#if>    	
		<#if cmsModule.moduleStyle?? && cmsModule.moduleDetails?? && cmsModule.moduleStyle == 16>
			<li class="a1" style="margin-top:${cmsModule.space!}px">
	        	<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
				<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
				<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	        	<div class="area3">
	        		<p class="titleName"><span></span><#if cmsModule.moduleName?? && cmsModule.moduleName != "">${cmsModule.moduleName!}</#if></p>	
	            	<#if cmsModule.startTime?? && cmsModule.endTime??>
		            	<p class="timer">
		        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
		        		</p>
	        		</#if>
	              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
	              	<div class="divs">
		            	<div class="fl" style="width:100%;" >
			            	<div class="goodTwoCon">
			            		<div id="goodTwoCon${cmsModule.id!}">
				            		<#list cmsModule.moduleCommoditys as cmsModuleCommodity>
		                               <div class="goodTwodiv">
		                               		<#if cmsModuleCommodity.defaultPic?? && cmsModuleCommodity.defaultPic != "">
		                    					<img src="${cmsModuleCommodity.defaultPic!}" class='goodDivImg'/>
		                    				<#else>
		                            			<img src="/images/homepage/2img1.jpg"/>
		                    				</#if>
		                                   	<p>库存：${cmsModuleCommodity.inventoryNumber!}</p>
		                                   	<p>￥${cmsModuleCommodity.salePriceN!}<span>/￥<del>${cmsModuleCommodity.publicPrice!}</del></span></p>
		                               </div>
		                            </#list>
			            		</div>
			            		<div id="btnMore${cmsModule.id!}" class="btn_more">
		                            <a href="javascript:getTopicCommodityMore('${cmsModule.moduleDetails[0].commonId!}','${cmsModule.id!}','2')">
		                            	查看更多
		                            </a>
			            		</div>
	                    	</div>
                    	</div> 
	              	</div>
					<#if cmsModule.onlineState??>
						<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
					<#else>
					    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
					</#if>
	            </div>
          	</li>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 17>
          	<li class="a1" style="margin-top:${cmsModule.space!}px">
				<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
				<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
				<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	        	<div class="area3">
	        		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
	            	<#if cmsModule.startTime?? && cmsModule.endTime??>
		            	<p class="timer">
		        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
		        		</p>
	        		</#if>
	              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
	              	<div class="divs">
		            	<div class="fl" style="width:100%;" >
                               <a href="javascript:void(0);" class="clickLeft"><img src="/images/activity/div_arrowleft.jpg" /></a>
                               <div class="allimgs">
                                   <div class="imgs">
                                   <#list cmsModule.moduleDetails as cmsModuleDetail>
                                       <div class="slbdiv">
                                       	<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
				                        	<img src="${cmsModuleDetail.imgUrl!}" />
				                        <#else>
				                			<img src="/images/homepage/2img1.jpg" />  
				                        </#if>
                                           <p>${cmsModuleDetail.title!}</p>
                                       </div>
                                    </#list>                                                 
                                   </div>
                             </div>
                               <a href="javascript:void(0);" class="clickRight"><img src="/images/activity/div_arrowright.jpg" /></a>
                           </div> 
	              	</div>
	              	<#if cmsModule.onlineState??>
						<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
					<#else>
					    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
					</#if>
	            </div>
          	</li>
		</#if>     	
		<#if cmsModule.moduleStyle?? && cmsModule.moduleDetails?? && cmsModule.moduleStyle == 105>
			<li class="a1" style="margin-top:${cmsModule.space!}px">
	        	<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
				<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
				<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	        	<div class="area3">
	        		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
	            	<#if cmsModule.startTime?? && cmsModule.endTime??>
		            	<p class="timer">
		        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
		        		</p>
	        		</#if>
	              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
	              	<div class="divs">
		            	${cmsModule.moduleDetails[0].content!}
	              	</div>
					<#if cmsModule.onlineState??>
						<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
					<#else>
					    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
					</#if>
	            </div>
          	</li>
		</#if>    	
		<#if cmsModule.moduleStyle?? && cmsModule.moduleDetails?? && cmsModule.moduleStyle == 103>
			<#if cmsModule.moduleDetails??>
				<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	            	<div class="area0">
	            		<p class="titleName"><span></span><#if cmsModule.moduleName?? && cmsModule.moduleName != "">${cmsModule.moduleName!}</#if></p>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div>
		              		<div><img src="/images/homepage/img3.jpg"  style="width:100%"/></div>
		              		<div>${cmsModule.moduleDetails[0].linkUrl!}</div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
	            	</div>
	        	</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleDetails?? && cmsModule.moduleStyle == 18>
          	<li class="a1" style="margin-top:${cmsModule.space!}px">
				<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
				<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
				<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
	        	<div class="area3">
	        		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
	            	<#if cmsModule.startTime?? && cmsModule.endTime??>
		            	<p class="timer">
		        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
		        		</p>
	        		</#if>
	        		<p>
	        			<#if cmsModule.secImg?? && cmsModule.secImg != "">
	        				<img style="vertical-align:middle;" src="${cmsModule.secImg!}" />
	        			</#if>
	        			<#if cmsModule.secType?? && cmsModule.secType==1>
	        				结束日期 
	        				<#if cmsModule.secTime??>
	        					${cmsModule.secTime?string('yyyy-MM-dd HH:mm:ss')}
	        				</#if>
	        			</#if>
	        			<#if cmsModule.secType?? && cmsModule.secType==2>
	        				今日即将开始
	        				<#if cmsModule.secTime??>
	        					${cmsModule.secTime?string('yyyy-MM-dd HH:mm:ss')}
	        				</#if>
	        			</#if>
	        			<#if cmsModule.secType?? && cmsModule.secType==3>
	        				明日即将开始
	        				<#if cmsModule.secTime??>
	        					${cmsModule.secTime?string('yyyy-MM-dd HH:mm:ss')}
	        				</#if>
	        			</#if>
	        			<#if cmsModule.secType?? && cmsModule.secType==4>
	        				即将开始
	        				<#if cmsModule.secTime??>
	        					${cmsModule.secTime?string('yyyy-MM-dd HH:mm:ss')}
	        				</#if>
	        			</#if>
	        		</p>
	              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
	              	<div class="divs">
		            	<div class="fl" style="width:100%;" >
                               <a href="javascript:void(0);" class="clickLeft"><img src="/images/activity/div_arrowleft.jpg" /></a>
                               <div class="allimgs">
                                   <div class="imgs">
                                   <#list cmsModule.moduleDetails as cmsModuleDetail>
                                       <div class="slbdiv">
                                       	<#if cmsModuleDetail.imgUrl?? && cmsModuleDetail.imgUrl != "">
				                        	<img src="${cmsModuleDetail.imgUrl!}" />
				                        <#else>
                                    		<img src="/images/homepage/2img1.jpg" />
				                        </#if>
                                           <p>￥${cmsModuleDetail.salePriceN!}<span>/￥<del>${cmsModuleDetail.publicPrice!}</del></span></p>
                                           <p>
                                           		<#if cmsModuleDetail.secState?? && cmsModuleDetail.secState == 0>
                                           			抢购中
                                           		</#if>
                                           		<#if cmsModuleDetail.secState?? && cmsModuleDetail.secState == 1>
                                           			即将开始
                                           		</#if>
                                           		<#if cmsModuleDetail.secState?? && cmsModuleDetail.secState == 2>
                                           			售罄
                                           		</#if>
                                           </p>
                                       </div>
                                    </#list>                                                 
                                   </div>
                             </div>
                               <a href="javascript:void(0);" class="clickRight"><img src="/images/activity/div_arrowright.jpg" /></a>
                           </div> 
	              	</div>
	              	<#if cmsModule.onlineState??>
						<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
					<#else>
					    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
					</#if>
	            </div>
          	</li>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 19>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		        	<div class="area3">
		        		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		            	<#if cmsModule.remindTime??>
			            	<p class="timer">
			        			活动开始时间: ${cmsModule.remindTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
			            	<div class="fl" style="width:100%;">
								<input type="button" value="预约" style="position: absolute;top:0px;left:0px;margin-top: 10px;margin-left: 10px;width: 100px;height: 30px;"/>	
								<#if cmsModule.moduleDetails[0]?? && cmsModule.moduleDetails[0].imgUrl?? && cmsModule.moduleDetails[0].imgUrl != ''>
		                        	<img src="${cmsModule.moduleDetails[0].imgUrl!}" style="margin-bottom:5px;height:${cmsModule.height!'128'}px;"/>
		                        <#else>
		                        	<img src="/images/homepage/img6.jpg" style="margin-bottom:5px;height:${cmsModule.height!'128'}px;"/>
		                        </#if>
			            	</div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	          	</li>
			</#if>
		</#if>
		<#if cmsModule.moduleStyle?? && cmsModule.moduleStyle == 20>
			<#if cmsModule.moduleDetails??>
	          	<li class="a1" style="margin-top:${cmsModule.space!}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id!}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle!}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType!}"/>
		        	<div class="area3">
		        		<#if cmsModule.moduleName?? && cmsModule.moduleName != ""><p class="titleName"><span></span>${cmsModule.moduleName!}</p></#if>	
		            	<#if cmsModule.startTime?? && cmsModule.endTime??>
			            	<p class="timer">
			        			${cmsModule.startTime?string('yyyy-MM-dd HH:mm:ss')} 至  ${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
			        		</p>
		        		</#if>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <#if cmsModule.spaceLr?? && cmsModule.spaceLr == 10>style="width:98%;margin:0 5px;"</#if>>
			            	<div class="fl" style="width:100%;">
		                                                             倒计时时间:
		                        <#if cmsModule.endTime??>
					            	${cmsModule.endTime?string('yyyy-MM-dd HH:mm:ss')}
				        		</#if>
			            	</div>
		              	</div>
		              	<#if cmsModule.onlineState??>
							<img src='/images/homepage/prompt_img${cmsModule.onlineState!}.png' class='imgState' style="display:none"/>
						<#else>
						    <img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</#if>
		            </div>
	          	</li>
			</#if>
		</#if>
	</#list>
				<!--<li class="a1">
		        	<div class="area3">
		        		<p class="titleName"><span></span>优惠券14</p>	
		            	<p class="timer">
		        			2016-01-28 17:31:22 至
		        			2016-01-31 17:31:22
		        		</p>
		              	<a href="javascript:void(0);"><img src="/images/homepage/close.png" class="close"/></a>
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
						<img src='/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
		            </div>
	          	</li>--> 
</#if>
