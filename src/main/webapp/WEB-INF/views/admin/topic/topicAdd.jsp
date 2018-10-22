<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script src="/static/My97DatePicker/WdatePicker.js"></script>
<script src="/static/topic/topicsCommodity.js"></script>
<script type="text/javascript">
    $(function() {
        $('#topicAddForm').form({
            url : '${path}/topic/add',
            onSubmit : function() {
                var commodityNoArr = "";
                var checkObj=$("input[name='chk']");
                checkObj.each(function(index, element) {
                    commodityNoArr = $(this).val();
                    if(index != (checkObj.length-1)){
                        commodityNoArr = ",";
                    }
                });
                $("#commodityNoArr").val(commodityNoArr);
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
                    var form = $('#topicAddForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });
    });

    function selectGoods() {
        parent.$.modalDialog({
            title : '选择商品',
            width : 1000,
            height : 600,
            href : '${path}/topic/getCommodityList',
            buttons : [ {
                text : '确定',
                handler : function() {
                    $.modalDialog.close();
                }
            } ]
        });
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: auto;padding: 3px;" >
        <form id="topicAddForm" method="post">
            <input type="hidden" id="commodityNoArr" name="commodityNoArr"/>
            <table class="grid">
                <tr>
                    <td>专题名称<font color="red"></font></td>
                    <td><input name="name" id="name" type="text" placeholder="请输入名称" class="easyui-validatebox span2" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>副标题<font color="red"></font></td>
                    <td>
                        <input type="text" id="title" name="title"  placeholder="请输入副标题" class="easyui-validatebox span2" data-options="required:true" value=""/>
                    </td>
                </tr>
                <tr>
                    <td>有效期设置<font color="red">*</font> </td>
                    <td>
                        <input name="startTime" id="startTime" type="text" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" placeholder="请输入开始时间" class="easyui-validatebox span2" data-options="required:true"/>至
                        <input  name="endTime" id="endTime" type="text" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" placeholder="请输入结束时间" class="easyui-validatebox span2" data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td >活动排序<font color="red">*</font></td>
                    <td>
                        <input type="text" id="sortNo" name="sortNo" size="4"  maxLength="3" style="width:50px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" class="easyui-validatebox span2" data-options="required:true"/><font color="gray">(必须输入数字)</font>
                    </td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="isDisplay1" name="isDisplay" type="radio" value="1" checked class="ipt_text"/>启用
                        </div>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="isDisplay2" name="isDisplay" type="radio" value="0"  class="ipt_text"/>停用
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>列表排序</td>
                    <td>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="listSort3" name="listSort" type="radio" value="3" checked class="ipt_text"/>新品
                        </div>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="listSort4" name="listSort" type="radio" value="4"  class="ipt_text"/>销量
                        </div>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="listSort5" name="listSort" type="radio" value="5"  class="ipt_text"/>价格升序
                        </div>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="listSort6" name="listSort" type="radio" value="6"  class="ipt_text"/>价格降序
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;
                        <fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid;">
                            <legend style="font-weight:bold;">&nbsp;&nbsp;添加活动商品&nbsp;&nbsp;</legend>
                            <div style="padding:5px;margin:10px;border:dotted 1px red;">
                                商品编号：
                                <textarea rows="5" cols="35" name="activeTopicIds"></textarea>
                                <span>&nbsp;</span><span></span>
                                <a class="l-btn" onclick="addCommodityByIds(this)" ><span>添加商品</span></a>&nbsp;&nbsp;
                                <a class="l-btn" onclick="javascript:selectGoods();"><span>按条件添加商品</span></a>
                                &nbsp;&nbsp;
                                <br/><br/>
                                <span style="margin-left:55px;">(多个商品编号之间用<span style="color:red;">英文逗号或换行</span>隔开，最多
                                                <span style="color:red;">100</span>个商品)</span>
                            </div>
                            <div style="padding:5px;margin:10px;border:dotted 1px blue;">
                                <table width="100%" class="list_table">
                                    <thead>
                                    <tr>
                                        <th style="width:5%;"></th>
                                        <th style="width:5%;">图片</th>
                                        <th style="width:20%;">商品名称</th>
                                        <th style="width:7%;">商品编号</th>
                                        <th style="width:5%;">库存</th>
                                        <th style="width:5%;">市场价</th>
                                        <th style="width:5%;">当前售价</th>
                                        <th style="width:5%;">规格</th>
                                        <th style="width:5%;">状态</th>
                                        <th style="width:5%;">排序号</th>
                                        <th style="width:6%;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="commodityShow">

                                    </tbody>
                                    <tbody id="commodityCheckboxlist" style="display:none;" >
                                    <td colspan="13"><input onClick="allChk(this,'chk');" id="chkb" type="checkbox" />
                                        <a href="javascript:batchDeleteCommodity();"  style="padding-left: 8px;">批量删除</a>
                                    </td>
                                    </tbody>
                                </table>
                                <br/><br/>
                                <span>已添加商品数：<span id="commCount" style="color:red;">0</span></span>
                            </div>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>