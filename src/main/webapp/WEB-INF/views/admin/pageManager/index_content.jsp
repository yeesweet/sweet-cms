<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${not empty cmsModuleList && !(cmsModuleList eq null)}">
	<c:forEach  items="${cmsModuleList}" var="cmsModule">

			<c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null) && cmsModule.moduleStyle == 101}">
				<li class="a1 lb" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
	            	<div class="area101">
	              		<a hre<c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 101}">f="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		                <div class="slider">
			                <dl>
								<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
			                    	<dd>
										<c:if test="${not empty cmsModuleDetail.subStartTime && !(cmsModuleDetail.subStartTime eq null) && not empty cmsModuleDetail.subEndTime && !(cmsModuleDetail.subEndTime eq null)}">
				                    		<time class="timer">
												<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModuleDetail.subStartTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModuleDetail.subEndTime}" />
							        		</time>
										</c:if>
										<c:choose>
											<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
												<img src="${cmsModuleDetail.imgUrl}"/>
											</c:when>
											<c:otherwise>
												<img src="${staticPath }/static/style/images/homepage/img1.jpg" />
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${not empty cmsModuleDetail.onlineState && !(cmsModuleDetail.onlineState eq null)}">
												<img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModuleDetail.onlineState}.png' class='imgStateLb' style="display:none"/>
											</c:when>
											<c:otherwise>
												<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgStateLb' style="display:none"/>
											</c:otherwise>
										</c:choose>
			                    	</dd>
								</c:forEach>
			                </dl>
		                </div>
	              	</div>           
	        	</li>
			</c:if>
		</c:if>
		<c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 102}">
			<c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
				<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		            <div class="area102">
						<c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
						<c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
			            	<p class="timer">
								<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
			        		</p>
						</c:if>
		              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		              	<div class="recommendlist">
							<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
			                  	<div>
									<c:choose>
										<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null)  && cmsModuleDetail.imgUrl !=''}">
											<img src="${cmsModuleDetail.imgUrl}" />
										</c:when>
										<c:otherwise>
											<img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />
										</c:otherwise>
									</c:choose>
			                      	<p>${cmsModuleDetail.title}</p>
			                  	</div>
							</c:forEach>
		              	</div>
						<c:choose>
							<c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
								<img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
							</c:when>
							<c:otherwise>
								<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
							</c:otherwise>
						</c:choose>
		            </div>
	        	</li>
			</c:if>
		</c:if>
		<c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 108}">
			<c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
            <li class="a1" style="margin-top:${cmsModule.space}px">
                <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                <div class="area102">
					<c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
					<c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
						<p class="timer">
							<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
						</p>
					</c:if>
                    <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                    <div class="recommendlist">
						<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
							<div>
							<c:choose>
								<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
									<img src="${cmsModuleDetail.imgUrl}" />
								</c:when>
								<c:otherwise>
									<img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />
								</c:otherwise>
							</c:choose>
								<p>${cmsModuleDetail.title}</p>
							</div>
						</c:forEach>
                    </div>
					<c:choose>
						<c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
							<img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
						</c:when>
						<c:otherwise>
							<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
						</c:otherwise>
					</c:choose>
                </div>
            </li>
			</c:if>
		</c:if>
		<c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 1}">
			<c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
				<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		            <div class="area1">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null)  && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
		                   	<div class="fl" style="width:40%;height:224px;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                        <img src="${cmsModule.moduleDetails[0].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${staticPath }/static/style/images/homepage/1img1.jpg" />
                                    </c:otherwise>
                                </c:choose>
		                    </div>
		                    <div class="fl" style="width:60%;">
		                         <div style="height:93px;">
                                     <c:choose>
                                         <c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
                                             <img src="${cmsModule.moduleDetails[1].imgUrl}" />
                                         </c:when>
                                         <c:otherwise>
                                             <img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                         </c:otherwise>
                                     </c:choose>
		                         </div>
		                         <div style="height:130px;">
                                     <c:choose>
                                         <c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
                                             <img src="${cmsModule.moduleDetails[2].imgUrl}" />
                                         </c:when>
                                         <c:otherwise>
                                             <img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                         </c:otherwise>
                                     </c:choose>
		                         </div>
		                    </div>
		              	</div>
						<c:choose>
							<c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
								<img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
							</c:when>
							<c:otherwise>
								<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
							</c:otherwise>
						</c:choose>
		            </div>
	        	</li>
			</c:if>
		</c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 2}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
				<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		            <div class="area2">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
		                   	<div class="fl" style="width:40%;height:225px;">
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                        <img src="${cmsModule.moduleDetails[0].imgUrl}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${staticPath }/static/style/images/homepage/1img1.jpg" />
                                    </c:otherwise>
                                </c:choose>
		                    </div>
		                	<div class="fl" style="width:60%;">
		                         <div style="height:93px;">
                                     <c:choose>
                                         <c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
                                             <img src="${cmsModule.moduleDetails[1].imgUrl}" />
                                         </c:when>
                                         <c:otherwise>
                                             <img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                         </c:otherwise>
                                     </c:choose>
		                         </div>
		                         <div style="height:131px;">
		                             <div style="width:50%;">
                                         <c:choose>
                                             <c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
                                                 <img src="${cmsModule.moduleDetails[2].imgUrl}" />
                                             </c:when>
                                             <c:otherwise>
                                                 <img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                             </c:otherwise>
                                         </c:choose>
		                             </div>
		                             <div style="width:50%;">
                                         <c:choose>
                                             <c:when test="${not empty cmsModule.moduleDetails[3] && !(cmsModule.moduleDetails[3] eq null) && not empty cmsModule.moduleDetails[3].imgUrl && !(cmsModule.moduleDetails[3].imgUrl eq null)  && cmsModule.moduleDetails[3].imgUrl != ''}">
                                                 <img src="${cmsModule.moduleDetails[3].imgUrl}" />
                                             </c:when>
                                             <c:otherwise>
                                                 <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                             </c:otherwise>
                                         </c:choose>
		                             </div>
		                         </div>
		                	</div>
		              	</div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
	        	</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 3}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		        	<div class="area3">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
			            	<div class="fl" style="width:100%;">
                                <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
                                    <c:choose>
                                        <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                            <img src="${cmsModuleDetail.imgUrl}" style="margin-bottom:5px;height:${(cmsModule.height eq "") or (cmsModule.height eq null)?'128':cmsModule.height}px;"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${staticPath }/static/style/images/homepage/img6.jpg" style="margin-bottom:5px;height:${(cmsModule.height eq "") or (cmsModule.height eq null)?'128':cmsModule.height}px;"/>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
			            	</div>
		              	</div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
	          	</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 4}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		            <div class="area4">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
			            	<div class="fl" style="width:33.3%;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[0].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
									</c:otherwise>
								</c:choose>
			            	</div>
			            	<div class="fl" style="width:33.3%;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[1].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
									</c:otherwise>
								</c:choose>
			            	</div>
			            	<div class="fl" style="width:33.3%;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[2].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
									</c:otherwise>
								</c:choose>
			            	</div>
		              	</div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
	          	</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 5}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		        	<div class="area5">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
			            <div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
							<c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
								<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
									<c:choose>
										<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
											<img src="${cmsModuleDetail.imgUrl}" />
										</c:when>
										<c:otherwise>
											<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
			        	</div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
				</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 6}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		            <div class="area6">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		            	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		              	<div class="divs">
		                  	<div class="fl" style="width:226px;margin-left:7px;height:184px;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[0].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
									</c:otherwise>
								</c:choose>
		                  	</div>
		                  	<div class="fl" style="width:226px;float:right;margin-right:7px">
			                    <div style="height:85px;">
									<c:choose>
										<c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
											<img src="${cmsModule.moduleDetails[1].imgUrl}" />
										</c:when>
										<c:otherwise>
											<img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
										</c:otherwise>
									</c:choose>
			                    </div>
			                    <div style="height:85px;margin-top:13px;">
									<c:choose>
										<c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
											<img src="${cmsModule.moduleDetails[2].imgUrl}" />
										</c:when>
										<c:otherwise>
											<img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
										</c:otherwise>
									</c:choose>
			                    </div>
		                  	</div>                 
		            	</div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
	        	</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 7}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		            <div class="area7">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
		                  	<div class="fl" style="width:50%;height:184px;">
			                    <div style="height:50%;">
									<c:choose>
										<c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
											<img src="${cmsModule.moduleDetails[0].imgUrl}" />
										</c:when>
										<c:otherwise>
											<img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
										</c:otherwise>
									</c:choose>
			                    </div>
			                    <div style="height:50%;">
									<c:choose>
										<c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
											<img src="${cmsModule.moduleDetails[1].imgUrl}" />
										</c:when>
										<c:otherwise>
											<img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
										</c:otherwise>
									</c:choose>
			                    </div>
		                  	</div>   
	                  		<div class="fl" style="width:50%;height:184px;float:right;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[2].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
									</c:otherwise>
								</c:choose>
	                  		</div>
		              	</div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
				</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 8}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		            <div class="area8">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		            	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		            	<div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
		                  	<div class="fl" style="width:50%;height:185px;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[0].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
									</c:otherwise>
								</c:choose>
		                  	</div>   
		                  	<div class="fl" style="width:50%;height:185px;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[1].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
									</c:otherwise>
								</c:choose>
		                  	</div>
						</div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
				</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 9}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		            <div class="area9">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		              	<div class="divs">
		                  	<div class="fl" style="width:466px;margin:0 7px 15px 7px;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[0].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/img6.jpg" />
									</c:otherwise>
								</c:choose>

		                    	<span class="num"></span>                                       
		                  	</div>
		                  	<div class="fl" style="width:226px;height:185px;float:left;margin-left:7px;;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[1] && !(cmsModule.moduleDetails[1] eq null) && not empty cmsModule.moduleDetails[1].imgUrl && !(cmsModule.moduleDetails[1].imgUrl eq null)  && cmsModule.moduleDetails[1].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[1].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/img1.jpg" />
									</c:otherwise>
								</c:choose>
		                      	<span class="num"></span>                                       
		                  	</div>   
		                  	<div class="fl" style="width:226px;height:185px;float:right;margin-right:7px;">
								<c:choose>
									<c:when test="${not empty cmsModule.moduleDetails[2] && !(cmsModule.moduleDetails[2] eq null) && not empty cmsModule.moduleDetails[2].imgUrl && !(cmsModule.moduleDetails[2].imgUrl eq null)  && cmsModule.moduleDetails[2].imgUrl != ''}">
										<img src="${cmsModule.moduleDetails[2].imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/img1.jpg" />
									</c:otherwise>
								</c:choose>
		                    	<span class="num"></span> 
		                  	</div>                             
		              	</div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
				</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 10}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
	            	<div class="area10">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
	              		<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
	              		<div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
							<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
								<div class="fl" style="width:25%;height:138px;">
								<c:choose>
									<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
										<img src="${cmsModuleDetail.imgUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
									</c:otherwise>
								</c:choose>
								</div>
							</c:forEach>
			            </div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
				</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 104}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
	            	<div class="area10">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
	              		<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
	              		<div class="divs">
	              			<div id="liud">
                            	<ul class="megUl">
									<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
										<li class="meglist">
										<c:choose>
											<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
												<img src="${cmsModuleDetail.imgUrl}" />
											</c:when>
											<c:otherwise>
												<img src="${staticPath }/static/style/images/homepage/icon1.jpg" />
											</c:otherwise>
										</c:choose>
												${cmsModuleDetail.title}
										</li>
									</c:forEach>
                            	</ul>
                            </div>
			            </div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
				</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 11}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
	          	<li class="a1" style="margin-top:${cmsModule.space}px">
					<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
					<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
					<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
		        	<div class="area3">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
		              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
		              	<div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
			            	<div class="fl" style="width:100%;">
								<c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
									<c:choose>
										<c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
											<img src="${cmsModuleDetail.imgUrl}" style="margin-bottom:5px;height:${cmsModule.height}px;"/>
										</c:when>
										<c:otherwise>
											<img src="${staticPath }/static/style/images/homepage/img6.jpg" style="margin-bottom:5px;height:${cmsModule.height}px;"/>
										</c:otherwise>
									</c:choose>
								</c:forEach>
			            	</div>
		              	</div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
		            </div>
	          	</li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 12}">
          	<li class="a1" style="margin-top:${cmsModule.space}px">
				<input type="hidden" name="moduleId" value="${cmsModule.id}"/>
				<input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
				<input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
	        	<div class="area3">
                    <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                    <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                        <p class="timer">
                            <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                        </p>
                    </c:if>
	              	<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
	              	<div class="divs">
		            	<div class="fl" style="width:100%;" >
                        	<a href="javascript:void(0);" class="clickLeft"><img src="/images/activity/div_arrowleft.jpg" /></a>
                        	<div class="allimgs">
                            	<div class="imgs">
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
                                            <p>库存：${cmsModuleCommodity.inventoryNumber}</p>
                                            <p>¥${cmsModuleCommodity.salePrice}<span>/¥<del>${cmsModuleCommodity.marketPrice}</del></span></p>
										</div>
									</c:forEach>
                            	</div>
                            </div>
                        	<a href="javascript:void(0);" class="clickRight"><img src="/images/activity/div_arrowright.jpg" /></a>
                    	</div>
	              	</div>
                    <c:choose>
                        <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                            <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                        </c:when>
                        <c:otherwise>
                            <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                        </c:otherwise>
                    </c:choose>
	            </div>
          	</li>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 13}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                <li class="a1" style="margin-top:${cmsModule.space}px">
                    <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                    <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                    <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                    <div class="area3">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
                        <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                        <div class="divs">
                            <div class="fl" style="width:100%;">
                                <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
                                    <c:choose>
                                        <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                            <img src="${cmsModuleDetail.imgUrl}" style="margin-bottom:5px;"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${staticPath }/static/style/images/homepage/img6.jpg" style="margin-bottom:5px;"/>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 15}">
            <li class="a1" style="margin-top:${cmsModule.space}px">
                <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                <div class="area3">
                    <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                    <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                        <p class="timer">
                            <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                        </p>
                    </c:if>
                    <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                    <div class="divs">
                        <div class="fl" style="width:100%;" >
                            <c:forEach  items="${cmsModule.moduleCommoditys}" var="cmsModuleCommodity">
                                <div class="goodThreediv">
                                    <c:choose>
                                        <c:when test="${not empty cmsModuleCommodity.defaultPic && !(cmsModuleCommodity.defaultPic eq null) && cmsModuleCommodity.defaultPic != ''}">
                                            <img src="${cmsModuleCommodity.defaultPic}" class='goodDivImg'/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                        </c:otherwise>
                                    </c:choose>
                                    <p>库存：${cmsModuleCommodity.inventoryNumber}</p>
                                    <p>¥${cmsModuleCommodity.salePrice}<span>/¥<del>${cmsModuleCommodity.marketPrice}</del></span></p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                            <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                        </c:when>
                        <c:otherwise>
                            <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </li>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 16}">
            <li class="a1" style="margin-top:${cmsModule.space}px">
                <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                <div class="area3">
                    <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                    <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                        <p class="timer">
                            <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                        </p>
                    </c:if>
                    <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                    <div class="divs">
                        <div class="fl" style="width:100%;" >
                            <div class="goodTwoCon">
                                <div id="goodTwoCon${cmsModule.id}">
                                    <c:forEach  items="${cmsModule.moduleCommoditys}" var="cmsModuleCommodity">
                                        <div class="goodTwodiv">
                                            <c:choose>
                                                <c:when test="${not empty cmsModuleCommodity.defaultPic && !(cmsModuleCommodity.defaultPic eq null) && cmsModuleCommodity.defaultPic != ''}">
                                                    <img src="${cmsModuleCommodity.defaultPic}" class='goodDivImg'/>
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                </c:otherwise>
                                            </c:choose>
                                            <p>库存：${cmsModuleCommodity.inventoryNumber}</p>
                                            <p>¥${cmsModuleCommodity.salePrice}<span>/¥<del>${cmsModuleCommodity.marketPrice}</del></span></p>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div id="btnMore${cmsModule.id}" class="btn_more">
                                    <a href="javascript:getTopicCommodityMore('${cmsModule.moduleDetails[0].commonId}','${cmsModule.id}','2')">
                                        查看更多
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                            <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                        </c:when>
                        <c:otherwise>
                            <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </li>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 17}">
            <li class="a1" style="margin-top:${cmsModule.space}px">
                <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                <div class="area3">
                    <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                    <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                        <p class="timer">
                            <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                        </p>
                    </c:if>
                    <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                    <div class="divs">
                        <div class="fl" style="width:100%;" >
                            <a href="javascript:void(0);" class="clickLeft"><img src="${staticPath }/static/style/images/activity/div_arrowleft.jpg" /></a>
                            <div class="allimgs">
                                <div class="imgs">
                                    <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
                                        <div class="slbdiv">
                                            <c:choose>
                                                <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                                    <img src="${cmsModuleDetail.imgUrl}" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                </c:otherwise>
                                            </c:choose>
                                            <p>${cmsModuleDetail.title}</p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <a href="javascript:void(0);" class="clickRight"><img src="${staticPath }/static/style/images/activity/div_arrowright.jpg" /></a>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                            <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                        </c:when>
                        <c:otherwise>
                            <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </li>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 105}">
            <li class="a1" style="margin-top:${cmsModule.space}px">
                <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                <div class="area3">
                    <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                    <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                        <p class="timer">
                            <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                        </p>
                    </c:if>
                    <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                    <div class="divs">
                            ${cmsModule.moduleDetails[0].content}
                    </div>
                    <c:choose>
                        <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                            <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                        </c:when>
                        <c:otherwise>
                            <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </li>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 103}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                <li class="a1" style="margin-top:${cmsModule.space}px">
                    <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                    <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                    <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                    <div class="area0">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
                        <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                        <div>
                            <div><img src="${staticPath }/static/style/images/homepage/img3.jpg"  style="width:100%"/></div>
                            <div>${cmsModule.moduleDetails[0].linkUrl}</div>
                        </div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 18}">
            <li class="a1" style="margin-top:${cmsModule.space}px">
                <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                <div class="area3">
                    <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                    <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                        <p class="timer">
                            <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                        </p>
                    </c:if>
                    <p>
                        <c:if test="${not empty cmsModule.secImg && !(cmsModule.secImg eq null) && cmsModule.secImg != ''}">
                            <img style="vertical-align:middle;" src="${cmsModule.secImg}" />
                        </c:if>
                        <c:if test="${not empty cmsModule.secType && !(cmsModule.secType eq null)}">
                            <c:choose>
                                <c:when test="${cmsModule.secType==1}">
                                    结束日期
                                </c:when>
                                <c:when test="${cmsModule.secType==2}">
                                    今日即将开始
                                </c:when>
                                <c:when test="${cmsModule.secType==3}">
                                    明日即将开始
                                </c:when>
                                <c:when test="${cmsModule.secType==4}">
                                    即将开始
                                </c:when>
                            </c:choose>
                            <c:if test="${not empty cmsModule.secTime && !(cmsModule.secTime eq null) && cmsModule.secTime != ''}">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.secTime}" />
                            </c:if>
                        </c:if>
                    </p>
                    <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                    <div class="divs">
                        <div class="fl" style="width:100%;" >
                            <a href="javascript:void(0);" class="clickLeft"><img src="${staticPath }/static/style/images/activity/div_arrowleft.jpg" /></a>
                            <div class="allimgs">
                                <div class="imgs">
                                    <c:forEach  items="${cmsModule.moduleDetails}" var="cmsModuleDetail">
                                        <div class="slbdiv">
                                            <c:choose>
                                                <c:when test="${not empty cmsModuleDetail.imgUrl && !(cmsModuleDetail.imgUrl eq null) && cmsModuleDetail.imgUrl != ''}">
                                                    <img src="${cmsModuleDetail.imgUrl}" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                </c:otherwise>
                                            </c:choose>
                                            <p>¥${cmsModuleCommodity.salePrice}<span>/¥<del>${cmsModuleCommodity.marketPrice}</del></span></p>
                                            <p>
                                                <c:if test="${not empty cmsModule.secState && !(cmsModule.secState eq null)}">
                                                    <c:choose>
                                                        <c:when test="${cmsModuleDetail.secState == 0}">
                                                            抢购中
                                                        </c:when>
                                                        <c:when test="${cmsModuleDetail.secState == 1}">
                                                            即将开始
                                                        </c:when>
                                                        <c:when test="${cmsModuleDetail.secState == 2}">
                                                            售罄
                                                        </c:when>
                                                    </c:choose>
                                                </c:if>
                                            </p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <a href="javascript:void(0);" class="clickRight"><img src="${staticPath }/static/style/images/activity/div_arrowright.jpg" /></a>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                            <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                        </c:when>
                        <c:otherwise>
                            <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </li>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 19}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                <li class="a1" style="margin-top:${cmsModule.space}px">
                    <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                    <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                    <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                    <div class="area3">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
                        <c:if test="${not empty cmsModule.remindTime && !(cmsModule.remindTime eq null)}">
                            <p class="timer">活动开始时间:<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.remindTime}" /></p>
                        </c:if>

                        <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                        <div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
                            <div class="fl" style="width:100%;">
                                <input type="button" value="预约" style="position: absolute;top:0px;left:0px;margin-top: 10px;margin-left: 10px;width: 100px;height: 30px;"/>
                                <c:choose>
                                    <c:when test="${not empty cmsModule.moduleDetails[0] && !(cmsModule.moduleDetails[0] eq null) && not empty cmsModule.moduleDetails[0].imgUrl && !(cmsModule.moduleDetails[0].imgUrl eq null)  && cmsModule.moduleDetails[0].imgUrl != ''}">
                                        <img src="${cmsModule.moduleDetails[0].imgUrl}" style="margin-bottom:5px;height:${(cmsModule.height==null||cmsModule.height="")?'128':cmsModule.height}px;"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${staticPath }/static/style/images/homepage/img6.jpg" style="margin-bottom:5px;height:${(cmsModule.height==null||cmsModule.height="")?'128':cmsModule.height}px;"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </li>
            </c:if>
        </c:if>
        <c:if test="${not empty cmsModule.moduleStyle && !(cmsModule.moduleStyle eq null) && cmsModule.moduleStyle == 20}">
            <c:if test="${not empty cmsModule.moduleDetails && !(cmsModule.moduleDetails eq null)}">
                <li class="a1" style="margin-top:${cmsModule.space}px">
                    <input type="hidden" name="moduleId" value="${cmsModule.id}"/>
                    <input type="hidden" name="moduleStyle" value="${cmsModule.moduleStyle}"/>
                    <input type="hidden" name="moduleType" value="${cmsModule.moduleType}"/>
                    <div class="area3">
                        <c:if test="${not empty cmsModule.moduleName && !(cmsModule.moduleName eq null) && cmsModule.moduleName != ''}"><p class="titleName"><span></span>${cmsModule.moduleName}</p></c:if>
                        <c:if test="${not empty cmsModule.startTime && !(cmsModule.startTime eq null) && not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                            <p class="timer">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.startTime}" /> 至  <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />
                            </p>
                        </c:if>
                        <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                        <div class="divs" <c:if test="${not empty cmsModule.spaceLr && !(cmsModule.spaceLr eq null) && cmsModule.spaceLr == 10}">style="width:98%;margin:0 5px;"</c:if>>
                            <div class="fl" style="width:100%;">
                                倒计时时间:
                                <c:if test="${not empty cmsModule.endTime && !(cmsModule.endTime eq null)}">
                                    <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${cmsModule.endTime}" />

                                </c:if>

                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${not empty cmsModule.onlineState && !(cmsModule.onlineState eq null)}">
                                <img src='${staticPath }/static/style/images/homepage/prompt_img${cmsModule.onlineState}.png' class='imgState' style="display:none"/>
                            </c:when>
                            <c:otherwise>
                                <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </li>
            </c:if>
        </c:if>
	</c:forEach>
</c:if>
