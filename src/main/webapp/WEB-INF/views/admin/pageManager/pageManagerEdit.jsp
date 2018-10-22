<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<%@ include file="/commons/basejs.jsp" %>
<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-base.css?v=201809242210"/>
<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/sys-global.css?v=201809242210"/>
<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/page-edit.css?v=201809242210"/>

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
    $(function () {
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
    function getTypeBg() {
        var typeBg = $("#typeBg").val();
        $("#bg2").css("display", "none");
        $("#bgColor").val("");
        $("#bgColorBlock").css("background-color", "");
        $("#bg").val("");
        if (typeBg != "") {
            $("#bg" + typeBg).css("display", "");
        }
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="pageManagerEditForm" method="post">
            <input type="hidden" id="id" name="id" value="${pageManager.id}"/>
            <input type="hidden" id="pageManagerId" name="pageManagerId" value="${pageManager.id}"/>
            <input type="hidden" id="moduleIds" name="moduleIds"/>
            <input type="hidden" id="actName" name="actName" value="${pageManager.name}"/>
            <table class="grid">
                <tr>
                    <td>活动页名称</td>
                    <td><input name="name" type="text" placeholder="" class="easyui-validatebox span2"
                               data-options="required:true"
                               value=""></td>
                </tr>
                <tr>
                    <td>顶部标题</td>
                    <td><input name="topName" type="text" placeholder="" class="easyui-validatebox span2"
                               data-options="required:true"
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
                        <div style="float:left;"><input id="bgColor" name="bgColor" type="text" class="ipt_text"
                                                        onblur="javascript:changeBgColor();"/></div>
                        <div id="bgColorBlock"
                             style="width: 15px;height: 15px;margin: 5px 20px 0 10px;float:left;"></div>
                    </td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td>
                        <select id="editStatus" name="status" class="easyui-combobox"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
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
                                        上线状态: <label for="show"><input type="radio" name="show" id="show" checked> 显示
                                    </label>
                                        <label for="hide"><input type="radio" name="show" id="hide"> 隐藏 </label>
                                    </p>
                                    <p class="onlinestate">
                                        预览: <input type="text" class="ipt_text" readonly="readonly" name="startTime"
                                                   id="startTime" class="Wdate"
                                                   onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
										            maxDate:'#F{$dp.$D(\'endTime\')||\'2020-10-01 00:00:00\'}'})"
                                                   value="<c:if test="${not empty startTime && !(startTime eq null) }"><fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>"
                                                   size="20"/>&nbsp;&nbsp;
                                        至 &nbsp;&nbsp;<input type="text" class="ipt_text" readonly="readonly"
                                                             name="endTime" id="endTime" class="Wdate"
                                                             onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
										    		minDate:'%y-%M-{%d}'&&'#F{$dp.$D(\'startTime\')}'})"
                                                             value="<c:if test="${not empty endTime && !(endTime eq null) }"><fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>"
                                                             size="20"/>
                                        <input type="button" value="确定"
                                               onclick="selectBoardByTime('${pageManager.id}');"/>
                                    </p>
                                    <div class="contentshow">
                                        <div class="moveBox" id="moveBox">
                                            <div class="search">
                                                <div id="titleName"><p
                                                        style="font-size:20px;width:100%;text-align:center;padding-top:20px;font-weight:bold;">${pageManager.topName}</p>
                                                </div>
                                            </div>
                                            <%--<div class="menuroll" id="menuroll" <c:if test="${not empty navigationList && !(navigationList eq null) && fn:length(navigationList)<=1}">style="display:none"</c:if>>--%>
                                            <%--<a class="prev" href="javascript:void(0);">left</a><a class="next" href="javascript:void(0);">right</a>--%>
                                            <%--<div class="bx_wrap" style="width:476px;border:2px solid green">--%>
                                            <%--<div class="bx_container">--%>
                                            <%--<ul id="example1" class="menulist">--%>
                                            <%--<c:forEach  items="${navigationList}" var="navigation">--%>
                                            <%--<li onclick="changeNavigation('${cmsActivity.id}','${navigation.id}')" <c:if test="${navigationId == navigation.id}">class="menulistCur"</c:if>>--%>
                                            <%--${navigation.navigationName}--%>
                                            <%--<span>--%>
                                            <%--<c:choose>--%>
                                            <%--<c:when test ="${navigation.isDisplay == 1}">--%>
                                            <%--<img src='${staticPath }/static/style/images/homepage/prompt_img1.png' class='imgState' style="display:none"/>--%>
                                            <%--</c:when>--%>
                                            <%--<c:otherwise>--%>
                                            <%--<img src='${staticPath }/static/style/images/homepage/prompt_img3.png' class='imgState' style="display:none"/>--%>
                                            <%--</c:otherwise>--%>
                                            <%--</c:choose>--%>
                                            <%--</span>--%>
                                            <%--</li>--%>
                                            <%--</c:forEach>--%>

                                            <%--</ul>--%>
                                            <%--<img src="${staticPath }/static/style/images/activity/u67.png" style="position: absolute;right:0px;top:10px;" onclick="toAddActNav()"/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <ul class="contwrap" id="contwrap">
                                                <%@ include file="/WEB-INF/views/admin/pageManager/index_content.jsp" %>
                                            </ul>
                                        </div>

                                        <input type="button" value="保存并发布" style="color:#fff;margin:20px 0px 20px 210px"
                                               class="btn_save" onclick="edit()"/>


                                    </div><!--contentshow-->
                                </div>
                                <%@ include file="/WEB-INF/views/admin/pageManager/index_rightcon.jsp" %>
                            </div>
                        </div>
                    </table>

                </tr>
            </table>
        </form>
    </div>
</div>