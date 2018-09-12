<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#pageManagerAddForm').form({
            url : '${path}/pageManager/add',
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
                    //之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    var form = $('#pageManagerAddForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });
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
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;" >
        <form id="pageManagerAddForm" method="post">
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
            </table>
        </form>
    </div>
</div>