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
<%--<script type="text/javascript" src="${staticPath }/static/ygdialog/lhgdialog.min.js?s=chrome"></script>--%>
<script type="text/javascript" src="${staticPath }/static/jquery/ajaxfileupload.js"></script>

<script type="text/javascript">
    $(function () {
        $('#addActivityForm').form({
        url : '${path}/pageManager/edit',
        onSubmit : function() {
        progressLoad();
        var isValid = $(this).form('validate');
        if (!isValid) {
        progressClose();
        }
        return isValid;
        },
        success : function(result) {
        progressClose();
        result = $.parseJSON(result);
        if (result.success) {
        parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
        parent.$.modalDialog.handler.dialog('close');
        } else {
        var form = $('#pageManagerEditForm');
        parent.$.messager.alert('错误', eval(result.msg), 'error');
        }
        }
        });


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

    function edit(){
        var activityName =$("#activityName").val();
        if(activityName == null || activityName ==""){
            alert("请填写活动页名称!");
            return false;
        }
        if(checkText(activityName)){
            alert("活动页名称不能包含特殊字符！");
            return false;
        }
        if(strlen(activityName) > 20){
            alert("活动页名称长度超过了10个汉字或20个字母，请重新输入!");
            return false;
        }
        var topName =$("#topName").val();
        if(topName == null || topName ==""){
            alert("请填写顶部标题!");
            return false;
        }
        if(checkText(topName)){
            alert("顶部标题不能包含特殊字符！");
            return false;
        }
        if(strlen(topName) > 20){
            alert("顶部标题长度超过了10个汉字或20个字母，请重新输入!");
            return false;
        }

        //产品线数据封装处理
        var productLineCodeStr ='';
        var productLineCodes = document.getElementsByName('productLineCodes');
        var productLineCodesLength =0;
        for(var i = 0 ; i < productLineCodes.length ;i++){
            if(productLineCodes[i].checked){
                productLineCodeStr +=productLineCodes[i].value+";";
                productLineCodesLength +=1;
            }
        }
        // if(productLineCodeStr ==''){
        // 	alert("至少要选择一个关联平台.");
        // 	return false;
        // }
        if(productLineCodesLength == productLineCodes.length){
            productLineCodeStr ="ALL";
        }
        $("#productLineCode").val(productLineCodeStr);

        var shareContent =$("#shareContent").val();
        if(shareContent != null && shareContent !="" && strlen(shareContent) > 100){
            alert("分享说明长度超过了50个汉字或100个字母，请重新输入!");
            $("#shareContent").focus();
            return false;
        }

        var moduleIds = "";
        $("input[name='moduleId']").each(function(){
            if($(this).val() != ""){
                moduleIds += $(this).val()+";";
            }
        });
        $("#moduleIds").val(moduleIds);
        // $("#editActivityForm").submit();

        var moduleIds = "";
        $("input[name='moduleId']").each(function(){
            if($(this).val() != ""){
                moduleIds += $(this).val()+";";
            }
        });
        $("#moduleIds").val(moduleIds);
        $.ajax({
            url:"${path}/pageManager/edit",//提交地址
            data:$("#editActivityForm").serialize(),//将表单数据序列化
            type:"POST",
            dataType:"json",
            success:function(result){
                if (result.success) {
                    window.location.href="${path}/index?tab=/pageManager/manager";
                } else {
                }
            }
        });
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="editActivityForm" method="post" action="${path}/pageManager/edit">
            <input type="hidden" id="id" name="id" value="${pageManager.id}"/>
            <input type="hidden" id="pageManagerId" name="pageManagerId" value="${pageManager.id}"/>
            <input type="hidden" id="moduleIds" name="moduleIds"/>
            <input type="hidden" id="actName" name="actName" value="${pageManager.name}"/>
            <table class="grid">
                <tr>
                    <td>活动页名称</td>
                    <td><input name="name" id="activityName" type="text" placeholder="" class="easyui-validatebox span2"
                               data-options="required:true"
                               value="${pageManager.name}"></td>
                </tr>
                <tr>
                    <td>顶部标题</td>
                    <td><input name="topName" type="text" placeholder="" id="topName"  class="easyui-validatebox span2"
                               data-options="required:true"
                               value="${pageManager.topName}"></td>
                </tr>
                <tr>
                    <td>模块背景：</td>
                    <td>
                        <select class="ipt_text" name="typeBg" id="typeBg"
                                onchange="javascript:getTypeBg();">
                            <option value="0" ${(pageManager.typeBg==null || pageManager.typeBg=='' || pageManager.typeBg==0)?'selected="selected"':''}>请选择</option>
                            <option value="2" ${(pageManager.typeBg!=null && pageManager.typeBg!='' && pageManager.typeBg==2)?'selected="selected"':''}>背景色</option>
                        </select>
                        <input id="bg" name="bg" type="hidden" value="${pageManager.bg}"/>
                    </td>
                </tr>
                <tr id="bg2" ${(pageManager.typeBg!=null && pageManager.typeBg!='' && pageManager.typeBg==2)?'':'style="display:none"'}>
                    <td>色值：</td>
                    <td>
                        <div style="float:left;"><input id="bgColor" name="bgColor" type="text" class="ipt_text"
                                                        onblur="javascript:changeBgColor();" value="${pageManager.bg}"/></div>
                        <div id="bgColorBlock"
                             style="width: 15px;height: 15px;margin: 5px 20px 0 10px;float:left;"></div>
                    </td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td>
                        <select id="isDisplay" name="isDisplay" class="easyui-combobox"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="1" ${(pageManager.isDisplay!=null && pageManager.isDisplay!='' && pageManager.isDisplay==1)?'selected':''}>启用</option>
                            <option value="0" ${(pageManager.isDisplay!=null && pageManager.isDisplay!='' && pageManager.isDisplay==0)?'selected':''}>停用</option>
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
            <div style="width:600px;height: 60px;"></div>
        </form>
        <div id="pageManager-goods-window" class="easyui-window" title="选择商品" data-options="iconCls:'icon-save',closed:true,model:true"
             style="width:1000px;height:600px;padding:5px;">
            <div class="easyui-panel" data-options="href : '${path}/commodity/getCommodityList',fit:true" id="topic-win-panel" style="width:1000px;height:300px;padding:5px;overflow-y: auto">


            </div>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;width: 1000px;height: 100px;">
                <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:getSelectGoods()" style="width:80px">确定</a>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:$('#pageManager-goods-window').window('close');" style="width:80px">取消</a>
            </div>
        </div>
    </div>
</div>