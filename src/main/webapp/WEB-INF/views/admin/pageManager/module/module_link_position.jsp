<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${cmsModule.moduleStyle ==16}">
	<span style="color:red;margin-bottom:10px;display:block;">请选择促销专题上传商品</span>
</c:if>
<p class="place">
	<input type="hidden" id="currentPLC" name="currentPLC" value="${currentPLC}">
	<span class="red">*</span>链接位置：
	<select name="typeList" id="typeList${cmsModuleDetailS.index+1}" onchange="javascript:getLinkTypeDate(this);" class="selector">
  		<option value="0" >请选择</option>
  		<option value="0" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType ==0}">style="display:none;"</c:if>>无跳转</option>
		<c:choose>
			<c:when test="${cmsModule.moduleStyle == 18}">
				<option value="1027" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType ==1027}">selected</c:if>>秒杀页面</option>
			</c:when>
			<c:otherwise>
				<option value="5" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType ==5}">selected</c:if>>专题列表</option>
			</c:otherwise>
		</c:choose>
		<c:if test="${cmsModule.moduleStyle != 16 && cmsModule.moduleStyle != 18}">
	  		<%--<option value="100" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 100}">selected</c:if>>横滑专题列表(app专用)</option>--%>
			<%--<option value="1025" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1025}">selected</c:if>>竖滑专题列表(app专用)</option>--%>
			<%--<option value="13" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 13}">selected</c:if>>web专题列表(app专用)</option>--%>
			<%--<option value="1028" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1028}">selected</c:if>>账户管理(app专用)</option>--%>
			<%--<option value="1001" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1001}">selected</c:if>>摇一摇页面(app专用)</option>--%>
			<option value="1007" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1007}">selected</c:if>>商品详情页</option>
			<%--<option value="1005" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1005}">selected</c:if>>分类一级页面</option>--%>
			<%--<option value="1008" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1008}">selected</c:if>>购物车页</option>--%>
			<%--<option value="1011" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1011}">selected</c:if>>查看物流</option>--%>
			<option value="9" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 9}">selected</c:if>>手动输入链接</option>
			<%--<option value="8" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 8}">selected</c:if>>优购快报</option>--%>
			<%--<option value="1023" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1023}">selected</c:if>>会员中心(h5专用)</option>--%>
			<%--<option value="22" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 22}">selected</c:if>>我的优购(h5专用)</option>--%>
			<%--<option value="1014" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1014}">selected</c:if>>我的订单(h5专用)</option>--%>
			<%--<option value="1015" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 100}">selected</c:if>1015>我的收藏(h5专用)</option>--%>
			<option value="1026" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1026}">selected</c:if>>页面列表</option>
			<%--<option value="2" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 2}">selected</c:if>>分类列表</option>--%>
			<%--<option value="1" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1}">selected</c:if>>品牌列表</option>--%>
			<%--<option value="7" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 7}">selected</c:if>>搜索关键字</option>--%>
			<%--<option value="1029" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 1029}">selected</c:if>>关键字列表</option>--%>
			<%--<option value="2000" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType == 2000}">selected</c:if>>自定义参数</option>--%>
		</c:if>
	</select>
</p>
<p id="tip5${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 5}">style="display:none;"</c:if>>
	<span class="red">*</span>促销专题：
	<span>
		<%! int cmsModuleFlag=0; %>
		<c:if test="${not empty topicList && !(topicList eq null)}">
			<c:forEach  items="${topicList}" var="cmsTopics">
				<c:if test="${not empty cmsModuleDetail.commonId && !(cmsModuleDetail.commonId eq null) && cmsModuleDetail.commonId==cmsTopics.id}">
					<% cmsModuleFlag++; %>
					<input list="topicsName${cmsModuleDetailS.index+1}" value="${cmsTopics.name}" id="topicsInput${cmsModuleDetailS.index+1}" class="ipt_text"/>
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${cmsModuleFlag==0}">
			<input list="topicsName${cmsModuleDetailS.index+1}" id="topicsInput${cmsModuleDetailS.index+1}" class="ipt_text"/>
		</c:if>
		<datalist id="topicsName${cmsModuleDetailS.index+1}" name="topicsName" >

			<c:if test="${not empty topicList && !(topicList eq null)}">
				<c:forEach  items="${topicList}" var="cmsTopics">
          			<option id="${cmsTopics.id}" value="${cmsTopics.name}" >${cmsTopics.name}</option>
				</c:forEach>
			</c:if>
        </datalist>
	</span>
</p>
<%--<p id="tip100${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 100}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>横滑专题：--%>
	<%--<span>--%>
		<%--<%! int subjectListFlag=0; %>--%>
		<%--<c:if test="${not empty subjectList && !(subjectList eq null)}">--%>
			<%--<c:forEach  items="${subjectList}" var="cmsSubject">--%>
				<%--<c:if test="${not empty cmsModuleDetail.commonId && !(cmsModuleDetail.commonId eq null) && cmsModuleDetail.commonId==cmsSubject.subjectId }">--%>
					<%--<% subjectListFlag++; %>--%>
					<%--<input list="subjectName${cmsModuleDetailS.index+1}" value="${cmsSubject.subjectTitle}" id="subjectInput${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
				<%--</c:if>--%>
			<%--</c:forEach>--%>
		<%--</c:if>--%>
		<%--<c:if test="${subjectListFlag==0}">--%>
			<%--<input list="subjectName${cmsModuleDetailS.index+1}" id="subjectInput${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
		<%--</c:if>--%>
		<%--<datalist id="subjectName${cmsModuleDetailS.index+1}" name="subjectName" >--%>
			<%--<c:if test="${not empty subjectList && !(subjectList eq null)}">--%>
				<%--<c:forEach  items="${subjectList}" var="cmsSubject">--%>
					<%--<option id="${cmsSubject.subjectId}" value="${cmsSubject.subjectTitle}" >${cmsSubject.subjectTitle}</option>--%>
				<%--</c:forEach>--%>
			<%--</c:if>--%>
        <%--</datalist>--%>
	<%--</span>--%>
<%--</p>--%>
<%--<p id="tip13${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 13}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>web专题：--%>
	<%--<span><input type="text" id="webInput${cmsModuleDetailS.index+1}" name="webInput" class="ipt_text" value="${cmsModuleDetail.linkUrl}"/></span>--%>
<%--</p>--%>
<p id="tip1007${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 1007}">style="display:none;"</c:if>>
	<span class="red">*</span>商品名称：
	<span>
		<c:choose>
			<c:when test="${not empty cmsModuleDetail.commodityName && !(cmsModuleDetail.commodityName eq null)}">
				<input type="text" name="commodityName" id="commodityName${cmsModuleDetailS.index+1}" readonly="readonly" size="50" maxlength="150" value="${cmsModuleDetail.commodityName}"/>
			</c:when>
			<c:otherwise>
				<input type="text" name="commodityName" id="commodityName${cmsModuleDetailS.index+1}" readonly="readonly" size="50" maxlength="150" value=""/>
			</c:otherwise>
		</c:choose>
		<a id="goods${cmsModuleDetailS.index+1}" href="javascript:selectSingleGoods(${cmsModuleDetailS.index+1});">&nbsp;&nbsp;选择</a>
	</span>
</p>	 
<%--<p id="tip1006${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 1006}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>分类选择：--%>
	<%--<span>--%>
		<%--<%! int categoryListFlag=0; %>--%>
		<%--<c:if test="${not empty categoryList && !(categoryList eq null)}">--%>
			<%--<c:forEach  items="${categoryList}" var="cmsCategory">--%>
				<%--<c:if test="${not empty cmsModuleDetail.commonId && !(cmsModuleDetail.commonId eq null) && cmsModuleDetail.commonId==cmsCategory.categoryId}">--%>
					<%--<% categoryListFlag++; %>--%>
					<%--<input id="firstCategory${cmsModuleDetailS.index+1}" list="firstCategoryName${cmsModuleDetailS.index+1}" value="${cmsCategory.categoryName}" class="ipt_text"/>--%>
				<%--</c:if>--%>
			<%--</c:forEach>--%>
		<%--</c:if>--%>
		<%--<c:if test="${categoryListFlag==0}">--%>
			<%--<input id="firstCategory${cmsModuleDetailS.index+1}" list="firstCategoryName${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
		<%--</c:if>--%>
		<%--<datalist id="firstCategoryName${cmsModuleDetailS.index+1}" name="firstCategoryName">--%>
			<%--<c:if test="${not empty categoryList && !(categoryList eq null)}">--%>
				<%--<c:forEach  items="${categoryList}" var="firstCategory">--%>
					<%--<option id="${firstCategory.categoryId}" value="${firstCategory.categoryName}">${firstCategory.categoryName}</option>--%>
				<%--</c:forEach>--%>
			<%--</c:if>--%>
        <%--</datalist>--%>
	<%--</span>--%>
<%--</p>--%>
<p id="tip9${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 9}">style="display:none;"</c:if>>
	<span class="red">*</span>请输入链接：<span><input type="text" id="urlInput${cmsModuleDetailS.index+1}" name="urlInput" class="ipt_text" value="${cmsModuleDetail.commonId}"/></span>
</p>
<%--<p id="tip8${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 8}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>优购快报：--%>
	<%--<span>--%>
	  <%--<select id="articleName${cmsModuleDetailS.index+1}" name='articleName' class='ipt_text' onchange='getArticleName(this);'>--%>
		<%--<option value="">请选择</option>--%>
		  <%--<c:if test="${not empty lstCmsArticle && !(lstCmsArticle eq null)}">--%>
			  <%--<c:forEach  items="${lstCmsArticle}" var="item">--%>
		  		<%--<option value="${item.id};http://mobile.yougou.com/static/${item.fileName}.html" <c:if test="${cmsModuleDetail.commonId==item.id}">selected</c:if>>${item.articleName}</option>--%>
			  <%--</c:forEach>--%>
		  <%--</c:if>--%>
	  <%--</select>--%>
	<%--</span>--%>
<%--</p>--%>
<p id="tip1026${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 1026}">style="display:none;"</c:if>>
	<span class="red">*</span>页面列表：
	<span>
		<%! int pageManagerListFlag=0; %>
		<c:if test="${not empty pageManagerList && !(pageManagerList eq null)}">
			<c:forEach  items="${pageManagerList}" var="pageManager">
				<c:if test="${not empty cmsModuleDetail.commonId && !(cmsModuleDetail.commonId eq null) && cmsModuleDetail.commonId==pageManager.id}">
					<% pageManagerListFlag++; %>
					<input list="activityName${cmsModuleDetailS.index+1}" value="${pageManager.name}" id="activityInput${cmsModuleDetailS.index+1}" class="ipt_text"/>
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${pageManagerListFlag==0}">
			<input list="activityName${cmsModuleDetailS.index+1}" id="activityInput${cmsModuleDetailS.index+1}" class="ipt_text"/>
		</c:if>
		<datalist id="activityName${cmsModuleDetailS.index+1}" name="activityName">
			<c:if test="${not empty pageManagerList && !(pageManagerList eq null)}">
				<c:forEach  items="${pageManagerList}" var="pageManager">
					<option id="${pageManager.id}" value="${pageManager.name}" >${pageManager.name}</option>
				</c:forEach>
			</c:if>
        </datalist>
	</span>
</p>
<%--<p id="tip1025${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 1025}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>竖滑专题：--%>
	<%--<span>--%>
		<%--<%! int flag1025=0; %>--%>
		<%--<c:if test="${not empty subjectList && !(subjectList eq null)}">--%>
			<%--<c:forEach  items="${subjectList}" var="cmsSubject">--%>
				<%--<c:if test="${not empty cmsModuleDetail.commonId && !(cmsModuleDetail.commonId eq null) &&  cmsModuleDetail.commonId==cmsSubject.subjectId}">--%>
					<%--<% flag1025++; %>--%>
					<%--<input list="subjectVerticalName${cmsModuleDetailS.index+1}" value="${cmsSubject.subjectTitle}" id="subjectVerticalInput${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
				<%--</c:if>--%>
			<%--</c:forEach>--%>
		<%--</c:if>--%>
		<%--<c:if test="${flag1025==0}">--%>
			<%--<input list="subjectVerticalName${cmsModuleDetailS.index+1}" id="subjectVerticalInput${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
		<%--</c:if>--%>
		<%--<datalist id="subjectVerticalName${cmsModuleDetailS.index+1}" name="subjectVerticalName" >--%>
			<%--<c:if test="${not empty subjectList && !(subjectList eq null)}">--%>
				<%--<c:forEach  items="${subjectList}" var="cmsSubject">--%>
					<%--<option id="${cmsSubject.subjectId}" value="${cmsSubject.subjectTitle}" >${cmsSubject.subjectTitle}</option>--%>
				<%--</c:forEach>--%>
			<%--</c:if>--%>
        <%--</datalist>--%>
	<%--</span>--%>
<%--</p>--%>
<%--<p id="tip2${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 2}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类：--%>
	<%--<span>--%>
		<%--<%! int flag2=0; %>--%>
		<%--<c:if test="${not empty secondCateList2 && !(secondCateList2 eq null)}">--%>
			<%--<c:forEach  items="${secondCateList2}" var="cmsClassify">--%>
				<%--<c:if test="${not empty cmsModuleDetail.commonId && !(cmsModuleDetail.commonId eq null) &&  cmsModuleDetail.commonId==cmsClassify.categoryId}">--%>
					<%--<% flag2++; %>--%>
					<%--<input list="secondCateName2${cmsModuleDetailS.index+1}" value="${cmsClassify.name}" id="secondCateInput2${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
				<%--</c:if>--%>
			<%--</c:forEach>--%>
		<%--</c:if>--%>
		<%--<c:if test="${flag2==0}">--%>
			<%--<input list="secondCateName2${cmsModuleDetailS.index+1}" id="secondCateInput2${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
		<%--</c:if>--%>
		<%--<datalist id="secondCateName2${cmsModuleDetailS.index+1}" name="secondeCateName">--%>
			<%--<c:if test="${not empty secondCateList2 && !(secondCateList2 eq null)}">--%>
				<%--<c:forEach  items="${secondCateList2}" var="cmsClassify">--%>
					<%--<option id="${cmsClassify.categoryId}" value="${cmsClassify.name}" >${cmsClassify.name}</option>--%>
				<%--</c:forEach>--%>
			<%--</c:if>--%>
        <%--</datalist>--%>
	<%--</span>--%>
<%--</p>--%>
<%--<p id="tip1${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 1}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌：--%>
	<%--<span>--%>
		<%--<%! int flag1=0; %>--%>
		<%--<c:if test="${not empty secondCateList1 && !(secondCateList1 eq null)}">--%>
			<%--<c:forEach  items="${secondCateList1}" var="cmsClassify">--%>
				<%--<c:if test="${not empty cmsModuleDetail.commonId && !(cmsModuleDetail.commonId eq null) &&  cmsModuleDetail.commonId==cmsClassify.categoryId}">--%>
					<%--<% flag1++; %>--%>
					<%--<input list="secondCateName1${cmsModuleDetailS.index+1}" value="${cmsClassify.name}" id="secondCateInput1${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
				<%--</c:if>--%>
			<%--</c:forEach>--%>
		<%--</c:if>--%>
		<%--<c:if test="${flag1==0}">--%>
			<%--<input list="secondCateName1${cmsModuleDetailS.index+1}" id="secondCateInput1${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
		<%--</c:if>--%>
		<%--<datalist id="secondCateName2${cmsModuleDetailS.index+1}" name="secondeCateName">--%>
			<%--<c:if test="${not empty secondCateList1 && !(secondCateList1 eq null)}">--%>
				<%--<c:forEach  items="${secondCateList1}" var="cmsClassify">--%>
					<%--<option id="${cmsClassify.categoryId}" value="${cmsClassify.name}" >${cmsClassify.name}</option>--%>
				<%--</c:forEach>--%>
			<%--</c:if>--%>
        <%--</datalist>--%>
	<%--</span>--%>
<%--</p>--%>
<%--<p id="tip7${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 7}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>关&nbsp;&nbsp;键&nbsp;字：--%>
	<%--<span>--%>
		<%--<%! int flag7=0; %>--%>
		<%--<c:if test="${not empty secondCateList7 && !(secondCateList7 eq null)}">--%>
			<%--<c:forEach  items="${secondCateList7}" var="cmsClassify">--%>
				<%--<c:if test="${not empty cmsModuleDetail.commonId && !(cmsModuleDetail.commonId eq null) &&  cmsModuleDetail.commonId==cmsClassify.categoryId}">--%>
					<%--<% flag7++; %>--%>
					<%--<input list="secondCateName7${cmsModuleDetailS.index+1}" value="${cmsClassify.name}" id="secondCateInput7${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
				<%--</c:if>--%>
			<%--</c:forEach>--%>
		<%--</c:if>--%>
		<%--<c:if test="${flag7==0}">--%>
			<%--<input list="secondCateName1${cmsModuleDetailS.index+1}" id="secondCateInput1${cmsModuleDetailS.index+1}" class="ipt_text"/>--%>
		<%--</c:if>--%>
		<%--<datalist id="secondCateName2${cmsModuleDetailS.index+1}" name="secondeCateName">--%>
			<%--<c:if test="${not empty secondCateList7 && !(secondCateList7 eq null)}">--%>
				<%--<c:forEach  items="${secondCateList7}" var="cmsClassify">--%>
					<%--<option id="${cmsClassify.categoryId}" value="${cmsClassify.name}" >${cmsClassify.name}</option>--%>
				<%--</c:forEach>--%>
			<%--</c:if>--%>
        <%--</datalist>--%>
	<%--</span>--%>
<%--</p>--%>
<%--<p id="tip2000${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType !=2000}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>自定义参数：--%>
	<%--<span><input type="text" id="paramInput${cmsModuleDetailS.index+1}" name="paramInput" style="width:250px;" class="ipt_text" value="${cmsModuleDetail.linkUrl}"/></span>--%>
<%--</p>--%>
<%--<p id="tip1029${cmsModuleDetailS.index+1}" class="choosep" <c:if test="${not empty cmsModuleDetail.subType && !(cmsModuleDetail.subType eq null) && cmsModuleDetail.subType != 1029}">style="display:none;"</c:if>>--%>
	<%--<span class="red">*</span>自定义参数：--%>
	<%--<span><input type="text" id="keyword${cmsModuleDetailS.index+1}" name="keyword" style="width:150px;" class="ipt_text" value="${cmsModuleDetail.commonId}"/></span>--%>
<%--</p>--%>
