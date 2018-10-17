<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-base.css?v=201809242210" />
<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-global.css?v=201809242210" />
<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/page-edit.css?v=201809242210" />

<%--<script type="text/javascript" src="${staticPath }/static/homepage/jquery-1.6.2.min.js?v=201809242210"></script>--%>
<script type="text/javascript" src="${staticPath }/static/homepage/common.min.js"></script>
<script type="text/javascript" src="${staticPath }/static/activity/list_activity.js?v=201809242210"></script>
<script type="text/javascript" src="${staticPath }/static/jquery/jquery.dragsort-0.5.2.min.js"></script>
<script type="text/javascript" src="${staticPath }/static/homepage/yxMobileSlider.js?v=201809242210"></script>
<script type="text/javascript" src="${staticPath }/static/activity/index.js?v=201809242210"></script>

<script type="text/javascript" src="${staticPath }/static/My97DatePicker/WdatePicker.js?v=201809242210"></script>
<script type="text/javascript" src="${staticPath }/static/component/imageSelector.js?v=201809242210"></script>
<script type="text/javascript" src="${staticPath }/static/ygdialog/lhgdialog.min.js?s=chrome"></script>
<script type="text/javascript" src="${staticPath }/static/jquery/ajaxfileupload.js"></script>

<script type="text/javascript">
    $(function() {
        <%--$('#pageManagerEditForm').form({--%>
            <%--url : '${path}/pageManager/edit',--%>
            <%--onSubmit : function() {--%>
                <%--progressLoad();--%>
                <%--var isValid = $(this).form('validate');--%>
                <%--if (!isValid) {--%>
                    <%--progressClose();--%>
                <%--}--%>
                <%--return isValid;--%>
            <%--},--%>
            <%--success : function(result) {--%>
                <%--progressClose();--%>
                <%--result = $.parseJSON(result);--%>
                <%--if (result.success) {--%>
                    <%--parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了--%>
                    <%--parent.$.modalDialog.handler.dialog('close');--%>
                <%--} else {--%>
                    <%--var form = $('#pageManagerEditForm');--%>
                    <%--parent.$.messager.alert('错误', eval(result.msg), 'error');--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>


    });
    //切换换肤背景类型
    function getTypeBg(){
        var typeBg = $("#typeBg").val();
        $("#bg2").css("display","none");
        $("#bgColor").val("");
        $("#bgColorBlock").css("background-color","");
        $("#bg").val("");
        if(typeBg != ""){
            $("#bg"+typeBg).css("display","");
        }
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="pageManagerEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>活动页名称</td>
                    <td><input name="name" type="text" placeholder="" class="easyui-validatebox span2" data-options="required:true"
                               value=""></td>
                </tr>
                <tr>
                    <td>顶部标题</td>
                    <td><input name="topName" type="text" placeholder="" class="easyui-validatebox span2" data-options="required:true"
                               value=""></td>
                </tr>
                <tr>
                    <td>模块背景：</td>
                    <td>
                        <select class="ipt_text" name="typeBg" id="typeBg"
                                onchange="javascript:getTypeBg();">
                            <option value="0" selected="selected">请选择</option>
                            <option value="2">背景色</option>
                        </select>
                        <input id="bg" name="bg" type="hidden"/>
                    </td>
                </tr>
                <tr id="bg2" style="display:none">
                    <td>色值：</td>
                    <td>
                        <div style="float:left;"><input id="bgColor" name="bgColor" type="text" class="ipt_text" onblur="javascript:changeBgColor();"/></div>
                        <div id="bgColorBlock" style="width: 15px;height: 15px;margin: 5px 20px 0 10px;float:left;"></div>
                    </td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td >
                        <select id="editStatus" name="status" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <table>
                       <div class="list_content">
                           <div class="right">
                               <div class="leftCon">
                                   <p class="onlinestate">
                                       上线状态: <label for="show"><input type="radio" name="show" id="show" checked> 显示 </label>
                                       <label for="hide"><input type="radio" name="show" id="hide"> 隐藏 </label>
                                   </p>
                                   <p class="onlinestate">
                                       预览: <input type="text" class="ipt_text" readonly="readonly" name="startTime" id="startTime" class="Wdate"
                                                  onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
										            maxDate:'#F{$dp.$D(\'endTime\')||\'2020-10-01 00:00:00\'}'})"
                                                  value="<c:if test="${not empty startTime && !(startTime eq null) }">${startTime?string('yyyy-MM-dd HH:mm:ss')}</c:if>" size="20"/>&nbsp;&nbsp;
                                       至  &nbsp;&nbsp;<input type="text" class="ipt_text" readonly="readonly"  name="endTime" id="endTime"  class="Wdate"
                                                             onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
										    		minDate:'%y-%M-{%d}'&&'#F{$dp.$D(\'startTime\')}'})"
                                                             value="<c:if test="${not empty endTime && !(endTime eq null) }">${endTime?string('yyyy-MM-dd HH:mm:ss')}</c:if>" size="20"  />
                                       <input type="button" value="确定" onclick="selectBoardByTime('${cmsActivity.id}','${navigationId}');"/>
                                   </p>
                                   <div class="contentshow" >
                                       <div class="moveBox" id="moveBox">
                                           <div class="search">
                                               <div id="titleName"><p style="font-size:20px;width:100%;text-align:center;padding-top:20px;font-weight:bold;">${cmsActivity.topName}</p></div>
                                           </div>
                                           <div class="menuroll" id="menuroll" <c:if test="${not empty navigationList && !(navigationList eq null) && fn:length(navigationList)<=1}">style="display:none"</c:if>>
                                       <a class="prev" href="javascript:void(0);">left</a><a class="next" href="javascript:void(0);">right</a>
                                       <div class="bx_wrap" style="width:476px;border:2px solid green">
                                           <div class="bx_container">
                                               <ul id="example1" class="menulist">
                                                   <c:forEach  items="${navigationList}" var="navigation">
                                                       <li onclick="changeNavigation('${cmsActivity.id}','${navigation.id}')" <c:if test="${navigationId == navigation.id}">class="menulistCur"</c:if>>
                                                               ${navigation.navigationName}
                                                           <span>
                                                               <c:choose>
                                                                   <c:when test ="${navigation.isDisplay == 1}">
                                                                       <img src='${staticPath }/static/style/images/homepage/prompt_img1.png' class='imgState' style="display:none"/>
                                                                   </c:when>
                                                                   <c:otherwise>
                                                                       <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>
                                                                   </c:otherwise>
                                                               </c:choose>
                                                           </span>
                                                       </li>
                                                   </c:forEach>

                                           </ul>
                                           <img src="${staticPath }/static/style/images/activity/u67.png" style="position: absolute;right:0px;top:10px;" onclick="toAddActNav()"/>
                                       </div>
                                   </div>
                               </div>
                               <ul class="contwrap"  id="contwrap">
                                   <%@ include file="/WEB-INF/views/admin/pageManager/index_content.jsp" %>
                               </ul>
                           </div>

                        <input type="button" value="保存并发布" style="color:#fff;margin:20px 0px 20px 210px"
                               class="btn_save" onclick="edit()"/>

                               <div class="rightCon">
                                   <ul class="showlist" id="top">
                                       <li class="div1" id="module101">
                                           <a class="boardbtn"><img src="${staticPath }/static/style/images/homepage/btn1.jpg"/></a>
                                           <img src="${staticPath }/static/style/images/homepage/img1.jpg"/>
                                       </li>
                                       <%--<li class="div1" id="module102">--%>
                                           <%--<a class="boardbtn"><img src="${staticPath }/static/style/images/homepage/btn2.jpg"/></a>--%>
                                           <%--<img src="${staticPath }/static/style/images/homepage/img2.jpg"/>--%>
                                       <%--</li>--%>
                                       <!--推荐功能模块二-->
                                       <li class="div1" id="board108">
                                           <a class="boardbtn"><img src="${staticPath }/static/style/images/homepage/btn4.png"/></a>
                                           <img src="${staticPath }/static/style/images/homepage/img2.jpg"/>
                                       </li>
                                       <%--<#if mark == "act">--%>
                                       <%--<li class="div1" style="height:70px;" id="moduleNav">--%>
                                           <%--<a class="boardbtn">自定义导航</a>--%>
                                       <%--</li>--%>
                                       <%--<li class="div1" style="height:70px;">--%>
                                       <%--</li>--%>
                                   <%--</#if>--%>
                                   <li class="div1" id="module1">
                                       <a class="boardbtn">模块1</a>
                                       <img src="${staticPath }/static/style/images/homepage/img4.jpg"/>
                                   </li>
                                   <%--<li class="div1" id="module2">--%>
                                       <%--<a class="boardbtn">模块2</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img5.jpg"/>--%>
                                   <%--</li>--%>
                                   <li class="div1" id="module2">
                                       <a class="boardbtn">模块2</a>
                                       <img src="${staticPath }/static/style/images/homepage/img11.jpg"/>
                                   </li>
                                   <li class="div1" id="module3">
                                     <a class="boardbtn">模块3</a>
                                     <img src="${staticPath }/static/style/images/homepage/img6.jpg"/>
                                   </li>
                                   <li class="div1" id="module4">
                                       <a class="boardbtn">模块4</a>
                                       <img src="${staticPath }/static/style/images/homepage/img7.jpg"/>
                                   </li>
                                   <!-- <li class="div1" id="module5">
                                     <a class="boardbtn">模块5</a>
                                     <img src="${staticPath }/static/style/images/homepage/img8.jpg"/>
                                   </li>
                                   <li class="div1" id="module6">
                                     <a class="boardbtn">模块6</a>
                                     <img src="${staticPath }/static/style/images/homepage/img9.jpg"/>
                                   </li> -->
                                   <%--<li class="div1" id="module7">--%>
                                       <%--<a class="boardbtn">模块7</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img10.jpg"/>--%>
                                   <%--</li>--%>
                                   <%--<li class="div1" id="module8">--%>
                                       <%--<a class="boardbtn">模块8</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img11.jpg"/>--%>
                                   <%--</li>--%>
                                   <!-- <li class="div1" id="module9">
                                     <a class="boardbtn">模块9</a>
                                     <img src="${staticPath }/static/style/images/homepage/img12.jpg"/>
                                   </li> -->
                                   <%--<li class="div1" id="module10">--%>
                                       <%--<a class="boardbtn">模块10</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img13.jpg"/>--%>
                                   <%--</li>--%>
                                   <%--<li class="div1" id="module104">--%>
                                       <%--<a class="boardbtn">优购快报</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img14.jpg"/>--%>
                                   <%--</li>--%>
                                   <%--<li class="div1" id="module11">--%>
                                       <%--<a class="boardbtn">模块11</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img6.jpg"/>--%>
                                   <%--</li>--%>
                                   <%--<li class="div1" id="module12">--%>
                                       <%--<a class="boardbtn">商品列表</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img15.jpg"/>--%>
                                   <%--</li>--%>
                                   <!--   <li class="div1" id="module13">
                                      <a class="boardbtn">优惠券</a>
                                      <img src="${staticPath }/static/style/images/homepage/img6.jpg"/>
                                    </li>
                                    <li class="div1" id="module14">
                                      <a class="boardbtn">优惠券</a>
                                      <img src="/images/activity/img16.jpg"/>
                                    </li>-->
                                   <%--<li class="div1" id="module15">--%>
                                       <%--<a class="boardbtn">商品列表</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img7.jpg"/>--%>
                                   <%--</li>--%>
                                   <li class="div1" id="module16">
                                       <a class="boardbtn">商品列表</a>
                                       <img src="${staticPath }/static/style/images/activity/img17.jpg"/>
                                   </li>
                                   <%--<li class="div1" id="module17">--%>
                                       <%--<a class="boardbtn">模块12</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img15.jpg"/>--%>
                                   <%--</li>--%>
                                   <%--<li class="div1" style="height:100px;" id="module105">--%>
                                       <%--<a class="boardbtn">图文</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img14.jpg"/>--%>
                                   <%--</li>--%>
                                   <%--<li class="div1" id="module103">--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/btn3.jpg" class="boardbtn"/>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img3.jpg"/>--%>
                                   <%--</li>--%>
                                   <%--<li class="div1" id="module18">--%>
                                       <%--<a class="boardbtn">秒杀</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img15.jpg"/>--%>
                                   <%--</li>--%>
                                   <%--<li class="div1" id="module19">--%>
                                       <%--<a class="boardbtn">预约</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img6.jpg"/>--%>
                                   <%--</li>--%>
                                   <%--<li class="div1" id="module20">--%>
                                       <%--<a class="boardbtn">倒计时</a>--%>
                                       <%--<img src="${staticPath }/static/style/images/homepage/img6.jpg"/>--%>
                                   <%--</li>--%>
                                   </ul>
                                   <div class="realdiv">
                                       <div class="areaDiv" id="areamodule101">
                                           <input type="hidden" name="moduleId"/>
                                           <input type="hidden" name="moduleStyle" value="101"/>
                                           <input type="hidden" name="moduleType" value="3"/>
                                           <div class="area101" >
                                               <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                                               <div class="lunbolist">
                                                   <div><img src="${staticPath }/static/style/images/homepage/img1.jpg" /></div>
                                               </div>
                                               <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>
                                           </div>
                                       </div>
                                       <%--<div class="areaDiv" id="areamodule102">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="102"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="2"/>--%>
                                           <%--<div class="area102" id="">--%>
                                               <%--<p class="titleName"><span></span>推荐</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="recommendlist">--%>
                                                   <%--<div>--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />--%>
                                                       <%--<p>标题1</p>--%>
                                                   <%--</div>--%>
                                                   <%--<div>--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />--%>
                                                       <%--<p>标题1</p>--%>
                                                   <%--</div>--%>
                                                   <%--<div>--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />--%>
                                                       <%--<p>标题1</p>--%>
                                                   <%--</div>--%>
                                                   <%--<div>--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />--%>
                                                       <%--<p>标题1</p>--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <!--推荐模块二-->
                                       <div class="areaDiv" id="areaboard108">
                                           <input type="hidden" name="moduleId"/>
                                           <input type="hidden" name="moduleStyle" value="108"/>
                                           <input type="hidden" name="moduleType" value="108"/>
                                           <div class="area108" id="">
                                               <p class="titleName"><span></span>自定义模块</p>
                                               <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                                               <div class="recommendlist">
                                                   <div>
                                                       <img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />
                                                       <p>标题1</p>
                                                   </div>
                                                   <div>
                                                       <img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />
                                                       <p>标题2</p>
                                                   </div>
                                                   <div>
                                                       <img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />
                                                       <p>标题3</p>
                                                   </div>
                                                   <div>
                                                       <img src="${staticPath }/static/style/images/homepage/tuijian1.jpg" />
                                                       <p>标题4</p>
                                                   </div>
                                               </div>
                                               <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>
                                           </div>
                                       </div>
                                       <div class="areaDiv" id="areamodule1">
                                           <input type="hidden" name="moduleId"/>
                                           <input type="hidden" name="moduleStyle" value="1"/>
                                           <input type="hidden" name="moduleType" value="1"/>
                                           <div class="area1">
                                               <p class="titleName"><span></span>模块1</p>
                                               <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                                               <div class="divs">
                                                   <div class="fl fl1" style="width:40%;height:224px;">
                                                       <img src="${staticPath }/static/style/images/homepage/1img1.jpg" />
                                                   </div>
                                                   <div class="fl fl1" style="width:60%;">
                                                       <div style="height:93px;">
                                                           <img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                                       </div>
                                                       <div style="height:130px;">
                                                           <img src="${staticPath }/static/style/images/homepage/1img2.jpg" />
                                                       </div>
                                                   </div>
                                               </div>
                                               <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>
                                           </div>
                                       </div>
                                       <%--<div class="areaDiv" id="areamodule2">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="2"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area2">--%>
                                               <%--<p class="titleName"><span></span>模块2</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl2" style="width:40%;height:225px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/1img1.jpg" />--%>
                                                   <%--</div>--%>
                                                   <%--<div class="fl fl2" style="width:60%;">--%>
                                                       <%--<div style="height:93px;">--%>
                                                           <%--<img src="${staticPath }/static/style/images/homepage/1img2.jpg" />--%>
                                                       <%--</div>--%>
                                                       <%--<div style="height:131px;">--%>
                                                           <%--<div style="width:50%;"><img src="${staticPath }/static/style/images/homepage/2img1.jpg" /></div>--%>
                                                           <%--<div style="width:50%;"><img src="${staticPath }/static/style/images/homepage/2img1.jpg" /></div>--%>
                                                       <%--</div>--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <div class="areaDiv" id="areamodule3">
                                           <input type="hidden" name="moduleId"/>
                                           <input type="hidden" name="moduleStyle" value="3"/>
                                           <input type="hidden" name="moduleType" value="1"/>
                                           <div class="area3">
                                               <p class="titleName"><span></span>模块3</p>
                                               <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                                               <div class="divs">
                                                   <div class="fl fl3" style="width:100%;">
                                                       <img src="${staticPath }/static/style/images/homepage/img6.jpg" />
                                                   </div>
                                               </div>
                                               <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>
                                           </div>
                                       </div>
                                       <div class="areaDiv" id="areamodule4">
                                           <input type="hidden" name="moduleId"/>
                                           <input type="hidden" name="moduleStyle" value="4"/>
                                           <input type="hidden" name="moduleType" value="1"/>
                                           <div class="area4">
                                               <p class="titleName"><span></span>模块4</p>
                                               <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                                               <div class="divs">
                                                   <div class="fl fl4" style="width:33.3%;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                                   <div class="fl fl4" style="width:33.3%;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                                   <div class="fl fl4" style="width:33.3%;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                               </div>
                                               <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>
                                           </div>
                                       </div>
                                       <%--<div class="areaDiv" id="areamodule5">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="5"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area5">--%>
                                               <%--<p class="titleName"><span></span>模块5</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl5" style="float:left;width:237px;height:185px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />--%>
                                                   <%--</div>--%>
                                                   <%--<div class="fl fl5" style="width:237px;float:right;height:185px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule6">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="6"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area6">--%>
                                               <%--<p class="titleName"><span></span>模块6</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl6" style="width:226px;margin-left:7px;height:184px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />--%>
                                                   <%--</div>--%>
                                                   <%--<div class="fl fl6" style="width:226px;float:right;margin-right:7px">--%>
                                                       <%--<div style="height:85px;">--%>
                                                           <%--<img src="${staticPath }/static/style/images/homepage/1img2.jpg" />--%>
                                                       <%--</div>--%>
                                                       <%--<div style="height:85px;margin-top:4px;">--%>
                                                           <%--<img src="${staticPath }/static/style/images/homepage/1img2.jpg" />--%>
                                                       <%--</div>--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule7" >--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="7"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area7">--%>
                                               <%--<p class="titleName"><span></span>模块7</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl7" style="width:226px;margin-left:7px;">--%>
                                                       <%--<div style="height:85px;">--%>
                                                           <%--<img src="${staticPath }/static/style/images/homepage/1img2.jpg" />--%>
                                                       <%--</div>--%>
                                                       <%--<div style="height:85px;margin-top:4px;">--%>
                                                           <%--<img src="${staticPath }/static/style/images/homepage/1img2.jpg" />--%>
                                                       <%--</div>--%>
                                                   <%--</div>--%>
                                                   <%--<div class="fl fl7" style="width:226px;height:184px;float:right;margin-right:7px">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <div class="areaDiv" id="areamodule2">
                                           <input type="hidden" name="moduleId"/>
                                           <input type="hidden" name="moduleStyle" value="8"/>
                                           <input type="hidden" name="moduleType" value="1"/>
                                           <div class="area2">
                                               <p class="titleName"><span></span>模块2</p>
                                               <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                                               <div class="divs">
                                                   <div class="fl fl2"  style="width:50%;height:185px;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                                   <div class="fl fl2"  style="width:50%;height:185px;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                               </div>
                                               <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>
                                           </div>
                                       </div>
                                       <%--<div class="areaDiv" id="areamodule9">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="9"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area9">--%>
                                               <%--<p class="titleName"><span></span>模块9</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl9" style="width:466px;margin:0 7px 15px 7px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img6.jpg" />--%>
                                                       <%--<span class="num"></span>--%>
                                                   <%--</div>--%>
                                                   <%--<div class="fl fl9" style="width:226px;height:185px;float:left;margin-left:7px;;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img1.jpg" />--%>
                                                       <%--<span class="num"></span>--%>
                                                   <%--</div>--%>
                                                   <%--<div class="fl fl9" style="width:226px;height:185px;float:right;margin-right:7px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img1.jpg" />--%>
                                                       <%--<span class="num"></span>--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule10">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="10"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area10">--%>
                                               <%--<p class="titleName"><span></span>模块10</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl10" style="width:25%;height:138px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />--%>
                                                   <%--</div>--%>
                                                   <%--<div class="fl fl10" style="width:25%;height:138px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />--%>
                                                   <%--</div>--%>
                                                   <%--<div class="fl fl10" style="width:25%;height:138px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />--%>
                                                   <%--</div>--%>
                                                   <%--<div class="fl fl10" style="width:25%;height:138px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/2img1.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>

                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule104">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="104"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="4"/>--%>
                                           <%--<div class="area10">--%>
                                               <%--<p class="titleName"><span></span>优购快报</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl11" style="width:100%;height:50px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img14.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule11">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="11"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area3">--%>
                                               <%--<p class="titleName"><span></span>模块11</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl3" style="width:466px;margin:0 7px 0 7px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img6.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule12">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="12"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area3">--%>
                                               <%--<p class="titleName"><span></span>商品模块</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl14" style="width:466px;margin:0 7px 0 7px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img15.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule13">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="13"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area3">--%>
                                               <%--<p class="titleName"><span></span>优惠券</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl13" style="width:100%;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img6.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule14">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="14"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area3">--%>
                                               <%--<p class="titleName"><span></span>优惠券</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl14" style="width:466px;margin:0 7px 0 7px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/activity/img16.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <div class="areaDiv" id="areamodule15">
                                           <input type="hidden" name="moduleId"/>
                                           <input type="hidden" name="moduleStyle" value="15"/>
                                           <input type="hidden" name="moduleType" value="1"/>
                                           <div class="area4">
                                               <p class="titleName"><span></span>商品列表</p>
                                               <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                                               <div class="divs">
                                                   <div class="fl fl4" style="width:33.3%;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                                   <div class="fl fl4" style="width:33.3%;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                                   <div class="fl fl4" style="width:33.3%;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                               </div>
                                               <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>
                                           </div>
                                       </div>
                                       <div class="areaDiv" id="areamodule16">
                                           <input type="hidden" name="moduleId"/>
                                           <input type="hidden" name="moduleStyle" value="16"/>
                                           <input type="hidden" name="moduleType" value="1"/>
                                           <div class="area5">
                                               <p class="titleName"><span></span>商品列表</p>
                                               <a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>
                                               <div class="divs">
                                                   <div class="fl fl5" style="float:left;width:237px;height:185px;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                                   <div class="fl fl5" style="width:237px;float:right;height:185px;">
                                                       <img src="${staticPath }/static/style/images/homepage/2img1.jpg" />
                                                   </div>
                                               </div>
                                               <img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>
                                           </div>
                                       </div>
                                       <%--<div class="areaDiv" id="areamodule17">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="17"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area3">--%>
                                               <%--<p class="titleName"><span></span>模块12</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl14" style="width:466px;margin:0 7px 0 7px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img15.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule105">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="105"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="5"/>--%>
                                           <%--<div class="area10">--%>
                                               <%--<p class="titleName"><span></span>图文</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl11" style="width:100%;height:50px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img14.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule103">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="103"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="6"/>--%>
                                           <%--<div class="area0">--%>
                                               <%--<p class="titleName"><span></span>webview</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="writetext"><img src="${staticPath }/static/style/images/homepage/img3.jpg" /></div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule18">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="18"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area3">--%>
                                               <%--<p class="titleName"><span></span>秒杀</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl14" style="width:466px;margin:0 7px 0 7px;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img15.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule19">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="19"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area3">--%>
                                               <%--<p class="titleName"><span></span>预约</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl19" style="width:100%;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img6.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                       <%--<div class="areaDiv" id="areamodule20">--%>
                                           <%--<input type="hidden" name="moduleId"/>--%>
                                           <%--<input type="hidden" name="moduleStyle" value="20"/>--%>
                                           <%--<input type="hidden" name="moduleType" value="1"/>--%>
                                           <%--<div class="area3">--%>
                                               <%--<p class="titleName"><span></span>倒计时</p>--%>
                                               <%--<a href="javascript:void(0);"><img src="${staticPath }/static/style/images/homepage/close.png" class="close"/></a>--%>
                                               <%--<div class="divs">--%>
                                                   <%--<div class="fl fl20" style="width:100%;">--%>
                                                       <%--<img src="${staticPath }/static/style/images/homepage/img6.jpg" />--%>
                                                   <%--</div>--%>
                                               <%--</div>--%>
                                               <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style='display:none'/>--%>
                                           <%--</div>--%>
                                       <%--</div>--%>
                                   </div>
                                   <div class="up">
                                       <a href="#top"><img src="${staticPath }/static/style/images/homepage/up.png" /></a>
                                   </div>
                               </div><!--rightCon-->
                       </div><!--contentshow-->
                    </table>

                </tr>
            </table>
        </form>
    </div>
</div>