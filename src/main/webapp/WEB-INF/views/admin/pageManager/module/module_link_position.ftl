<#if cmsModule.moduleStyle == 16>
	<span style="color:red;margin-bottom:10px;display:block;">请选择促销专题上传商品</span>
</#if>
<p class="place">
	<input type="hidden" id="currentPLC" name="currentPLC" value="${currentPLC!}">
	<span class="red">*</span>链接位置：
	<select name="typeList" id="typeList${cmsModuleDetail_index+1}" onchange="javascript:getLinkTypeDate(this);" class="selector">
  		<option value="0" >请选择</option>
  		<option value="0" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==0>selected</#if>>无跳转</option>
  		<#if cmsModule.moduleStyle != 18>
  			<option value="5" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==5>selected</#if>>专题列表</option>
  		</#if>
  		<#if cmsModule.moduleStyle != 16>
  			<option value="1027" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1027>selected</#if>>秒杀页面</option>
  		</#if>
  		<#if !(cmsModule.moduleStyle == 16 || cmsModule.moduleStyle == 18)>
	  		<option value="100" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==100>selected</#if>>横滑专题列表(app专用)</option>
			<option value="1025" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1025>selected</#if>>竖滑专题列表(app专用)</option>
			<option value="13" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==13>selected</#if>>web专题列表(app专用)</option>
			<option value="1028" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1028>selected</#if>>账户管理(app专用)</option>
			<option value="1001" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1001>selected</#if>>摇一摇页面(app专用)</option>
			<!-- <option value="1003" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1003>selected</#if>>品牌页面</option> -->
			<option value="1007" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1007>selected</#if>>商品详情页</option>
			<option value="1005" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1005>selected</#if>>分类一级页面</option>
			<!--<option value="1006" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1006>selected</#if>>分类二级页面</option> -->
			<option value="1008" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1008>selected</#if>>购物车页</option>
			<option value="1011" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1011>selected</#if>>查看物流</option>
			<option value="9" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==9>selected</#if>>手动输入链接</option>
			<option value="8" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==8>selected</#if>>优购快报</option>
			<option value="1023" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1023>selected</#if>>会员中心(h5专用)</option>
			<option value="22" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==22>selected</#if>>我的优购(h5专用)</option>
			<option value="1014" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1014>selected</#if>>我的订单(h5专用)</option>
			<option value="1015" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1015>selected</#if>>我的收藏(h5专用)</option>
			<option value="1026" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1026>selected</#if>>页面列表</option>
			<option value="2" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==2>selected</#if>>分类列表</option>
			<option value="1" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1>selected</#if>>品牌列表</option>
			<option value="7" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==7>selected</#if>>搜索关键字</option>
			<option value="1029" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==1029>selected</#if>>关键字列表</option>
			<option value="2000" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType==2000>selected</#if>>自定义参数</option>
		</#if>
	</select>
</p>
<p id="tip5${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=5>style="display:none;"</#if>>
	<span class="red">*</span>促销专题：
	<span>
		<#assign flag=false>
		<#if topicsList ??>
			<#list topicsList as cmsTopics>	            			
				<#if cmsModuleDetail.commonId?? && cmsModuleDetail.commonId==cmsTopics.id >
 				<#assign flag=true>
 				<input list="topicsName${cmsModuleDetail_index+1}" value="${cmsTopics.topicsName}" id="topicsInput${cmsModuleDetail_index+1}" class="ipt_text"/>
				</#if>
			</#list>
		</#if>
		<#if !flag>
			<input list="topicsName${cmsModuleDetail_index+1}" id="topicsInput${cmsModuleDetail_index+1}" class="ipt_text"/>
		</#if>
		<datalist id="topicsName${cmsModuleDetail_index+1}" name="topicsName" >
         	<#if topicsList??>
          		<#list topicsList as cmsTopics>	            			
          			<option id="${cmsTopics.id}" value="${cmsTopics.topicsName}" >${cmsTopics.topicsName}</option>
          		</#list>
         	</#if>
        </datalist>
	</span>
</p>
<p id="tip100${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=100>style="display:none;"</#if>>
	<span class="red">*</span>横滑专题：
	<span>
		<#assign flag=false>
		<#if subjectList??>
         	<#list subjectList as cmsSubject>	            			
         		<#if cmsModuleDetail.commonId?? && cmsModuleDetail.commonId==cmsSubject.subjectId >
          			<#assign flag=true>
          			<input list="subjectName${cmsModuleDetail_index+1}" value="${cmsSubject.subjectTitle}" id="subjectInput${cmsModuleDetail_index+1}" class="ipt_text"/>
         		</#if>
         	</#list>
        </#if>
        <#if !flag>
    		<input list="subjectName${cmsModuleDetail_index+1}" id="subjectInput${cmsModuleDetail_index+1}" class="ipt_text"/>
    	</#if>
		<datalist id="subjectName${cmsModuleDetail_index+1}" name="subjectName" >
         	<#if subjectList??>
          		<#list subjectList as cmsSubject>	            			
        			<option id="${cmsSubject.subjectId}" value="${cmsSubject.subjectTitle}" >${cmsSubject.subjectTitle}</option>
        		</#list>
         	</#if>
        </datalist>
	</span>
</p>
<p id="tip13${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=13>style="display:none;"</#if>>
	<span class="red">*</span>web专题：
	<span><input type="text" id="webInput${cmsModuleDetail_index+1}" name="webInput" class="ipt_text" value="${cmsModuleDetail.linkUrl!}"/></span>
</p>
<p id="tip1007${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=1007>style="display:none;"</#if>>
	<span class="red">*</span>商品名称：
	<span>
		<#if cmmodityStyle??>
			<input type="text" name="commodityName" id="commodityName${cmsModuleDetail_index+1}" readonly="readonly" size="50" maxlength="150" value="${cmsModuleDetail.commodityName?default("")}"/>
    	<#else>
    		<input type="text" name="commodityName" id="commodityName${cmsModuleDetail_index+1}" readonly="readonly" size="50" maxlength="150" value=""/>
    	</#if>
		<a id="goods${cmsModuleDetail_index+1}" href="javascript:selectSingleGoods(${cmsModuleDetail_index+1});">&nbsp;&nbsp;选择</a>
	</span>
</p>	 
<p id="tip1006${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=1006>style="display:none;"</#if>>
	<span class="red">*</span>分类选择：
	<span>
		<#assign flag=false>
		<#if categoryList??>
         	<#list categoryList as cmsCategory>	            			
         		<#if cmsModuleDetail.commonId?? && cmsModuleDetail.commonId==cmsCategory.categoryId >
          			<#assign flag=true>
          			<input id="firstCategory${cmsModuleDetail_index+1}" list="firstCategoryName${cmsModuleDetail_index+1}" value="${cmsCategory.categoryName}" class="ipt_text"/>
         		</#if>
         	</#list>
        </#if>
        <#if !flag>
			<input id="firstCategory${cmsModuleDetail_index+1}" list="firstCategoryName${cmsModuleDetail_index+1}" class="ipt_text"/>
        </#if>
		<datalist id="firstCategoryName${cmsModuleDetail_index+1}" name="firstCategoryName">
			<#if categoryList??>
				<#list categoryList as firstCategory>
					<option id="${firstCategory.categoryId}" value="${firstCategory.categoryName}">${firstCategory.categoryName}</option>
				</#list>
			</#if>
		</datalist>
	</span>
</p>
<p id="tip9${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=9>style="display:none;"</#if>>
	<span class="red">*</span>请输入链接：<span><input type="text" id="urlInput${cmsModuleDetail_index+1}" name="urlInput" class="ipt_text" value="${cmsModuleDetail.linkUrl!}"/></span>
</p>
<p id="tip8${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=8>style="display:none;"</#if>>
	<span class="red">*</span>优购快报：
	<span>
	  <select id="articleName${cmsModuleDetail_index+1}" name='articleName' class='ipt_text' onchange='getArticleName(this);'>
		<option value="">请选择</option>
		 <#if lstCmsArticle ??>
				 <#list lstCmsArticle as item>	            			
				<option value="${item.id};http://mobile.yougou.com/static/${item.fileName}.html" <#if  cmsModuleDetail.commonId==item.id >selected</#if> >${item.articleName}</option>
			</#list>
		</#if>
	  </select>
	</span>
</p>
<p id="tip1026${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=1026>style="display:none;"</#if>>
	<span class="red">*</span>页面列表：
	<span>
		<#assign flag=false>
		<#if cmsActivityList??>
			<#list cmsActivityList as cmsActivity>	            			
				<#if cmsModuleDetail.commonId?? && cmsModuleDetail.commonId==cmsActivity.id >
 				<#assign flag=true>
 				<input list="activityName${cmsModuleDetail_index+1}" value="${cmsActivity.activityName}" id="activityInput${cmsModuleDetail_index+1}" class="ipt_text"/>
				</#if>
			</#list>
		</#if>
		<#if !flag>
			<input list="activityName${cmsModuleDetail_index+1}" id="activityInput${cmsModuleDetail_index+1}" class="ipt_text"/>
		</#if>
		<datalist id="activityName${cmsModuleDetail_index+1}" name="activityName">
         	<#if cmsActivityList??>
          		<#list cmsActivityList as cmsActivity>	            			
          			<option id="${cmsActivity.id}" value="${cmsActivity.activityName}" >${cmsActivity.activityName}</option>
          		</#list>
         	</#if>
        </datalist>
	</span>
</p>
<p id="tip1025${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=1025>style="display:none;"</#if>>
	<span class="red">*</span>竖滑专题：
	<span>
		<#assign flag=false>
		<#if subjectList??>
         	<#list subjectList as cmsSubject>	            			
         		<#if cmsModuleDetail.commonId?? && cmsModuleDetail.commonId==cmsSubject.subjectId >
          			<#assign flag=true>
          			<input list="subjectVerticalName${cmsModuleDetail_index+1}" value="${cmsSubject.subjectTitle}" id="subjectVerticalInput${cmsModuleDetail_index+1}" class="ipt_text"/>
         		</#if>
         	</#list>
        </#if>
        <#if !flag>
    		<input list="subjectVerticalName${cmsModuleDetail_index+1}" id="subjectVerticalInput${cmsModuleDetail_index+1}" class="ipt_text"/>
    	</#if>
		<datalist id="subjectVerticalName${cmsModuleDetail_index+1}" name="subjectVerticalName" >
         	<#if subjectList??>
          		<#list subjectList as cmsSubject>	            			
        			<option id="${cmsSubject.subjectId}" value="${cmsSubject.subjectTitle}" >${cmsSubject.subjectTitle}</option>
        		</#list>
         	</#if>
        </datalist>
	</span>
</p>
<p id="tip2${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=2>style="display:none;"</#if>>
	<span class="red">*</span>分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类：
	<span>
		<#assign flag=false>
		<#if secondCateList2??>
			<#list secondCateList2 as cmsClassify>	            			
				<#if cmsModuleDetail.commonId?? && cmsModuleDetail.commonId==cmsClassify.categoryId >
 				<#assign flag=true>
 				<input list="secondCateName2${cmsModuleDetail_index+1}" value="${cmsClassify.name}" id="secondCateInput2${cmsModuleDetail_index+1}" class="ipt_text"/>
				</#if>
			</#list>
		</#if>
		<#if !flag>
			<input list="secondCateName2${cmsModuleDetail_index+1}" id="secondCateInput2${cmsModuleDetail_index+1}" class="ipt_text"/>
		</#if>
		<datalist id="secondCateName2${cmsModuleDetail_index+1}" name="secondeCateName">
         	<#if secondCateList2??>
          		<#list secondCateList2 as cmsClassify>	            			
          			<option id="${cmsClassify.categoryId}" value="${cmsClassify.name}" >${cmsClassify.name}</option>
          		</#list>
         	</#if>
        </datalist>
	</span>
</p>
<p id="tip1${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=1>style="display:none;"</#if>>
	<span class="red">*</span>品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌：
	<span>
		<#assign flag=false>
		<#if secondCateList1??>
			<#list secondCateList1 as cmsClassify>	            			
				<#if cmsModuleDetail.commonId?? && cmsModuleDetail.commonId==cmsClassify.categoryId >
 				<#assign flag=true>
 				<input list="secondCateName1${cmsModuleDetail_index+1}" value="${cmsClassify.name}" id="secondCateInput1${cmsModuleDetail_index+1}" class="ipt_text"/>
				</#if>
			</#list>
		</#if>
		<#if !flag>
			<input list="secondCateName1${cmsModuleDetail_index+1}" id="secondCateInput1${cmsModuleDetail_index+1}" class="ipt_text"/>
		</#if>
		<datalist id="secondCateName1${cmsModuleDetail_index+1}" name="secondeCateName">
         	<#if secondCateList1??>
          		<#list secondCateList1 as cmsClassify>	            			
          			<option id="${cmsClassify.categoryId}" value="${cmsClassify.name}" >${cmsClassify.name}</option>
          		</#list>
         	</#if>
        </datalist>
	</span>
</p>
<p id="tip7${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=7>style="display:none;"</#if>>
	<span class="red">*</span>关&nbsp;&nbsp;键&nbsp;字：
	<span>
		<#assign flag=false>
		<#if secondCateList7??>
			<#list secondCateList7 as cmsClassify>	            			
				<#if cmsModuleDetail.commonId?? && cmsModuleDetail.commonId==cmsClassify.categoryId >
 				<#assign flag=true>
 				<input list="secondCateName7${cmsModuleDetail_index+1}" value="${cmsClassify.name}" id="secondCateInput7${cmsModuleDetail_index+1}" class="ipt_text"/>
				</#if>
			</#list>
		</#if>
		<#if !flag>
			<input list="secondCateName7${cmsModuleDetail_index+1}" id="secondCateInput7${cmsModuleDetail_index+1}" class="ipt_text"/>
		</#if>
		<datalist id="secondCateName7${cmsModuleDetail_index+1}" name="secondeCateName">
         	<#if secondCateList7??>
          		<#list secondCateList7 as cmsClassify>	            			
          			<option id="${cmsClassify.categoryId}" value="${cmsClassify.name}" >${cmsClassify.name}</option>
          		</#list>
         	</#if>
        </datalist>
	</span>
</p>
<p id="tip2000${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=2000>style="display:none;"</#if>>
	<span class="red">*</span>自定义参数：
	<span><input type="text" id="paramInput${cmsModuleDetail_index+1}" name="paramInput" style="width:250px;" class="ipt_text" value="${cmsModuleDetail.linkUrl!}"/></span>
</p>
<p id="tip1029${cmsModuleDetail_index+1}" class="choosep" <#if cmsModuleDetail.subType?? && cmsModuleDetail.subType!=1029>style="display:none;"</#if>>
	<span class="red">*</span>自定义参数：
	<span><input type="text" id="keyword${cmsModuleDetail_index+1}" name="keyword" style="width:150px;" class="ipt_text" value="${cmsModuleDetail.commonId!}"/></span>
</p>
