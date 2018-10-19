<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑专题</title>

    <script src="${staticPath}/static/My97DatePicker/WdatePicker.js"></script>
    <script src="${staticPath}/static/topic/updateTopicsCommodity.js"></script>
</head>
<script type="text/javascript">
    $(function() {
        $('#topicEditForm').form({
            url : '${path}/topic/edit',
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
                    var form = $('#topicEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });
        
        $("#editStatus").val('${topic.status}'); 
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: auto;padding: 3px;">
        <form id="topicEditForm" method="post">
            <input name="id" id="id" type="hidden" value="${topic.id}">
            <table class="grid">
                <tr>
                    <td>专题名称<font color="red"></font></td>
                    <td><input name="name" id="name" type="text" placeholder="请输入名称" class="easyui-validatebox span2"
                               data-options="required:true" value="${topic.name}"></td>
                </tr>
                <tr>
                    <td>副标题<font color="red"></font></td>
                    <td>
                        <input type="text" id="title" name="title"  placeholder="请输入副标题" class="easyui-validatebox span2"
                               data-options="required:true" value="${topic.title}"/>
                    </td>
                </tr>
                <tr>
                    <td>有效期设置<font color="red">*</font> </td>
                    <td>
                        <input name="startTime" id="startTime" type="text" placeholder="点击选择时间" value="${topic.startTime}"
                               onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"
                               placeholder="请输入开始时间" class="easyui-validatebox span2" data-options="required:true"/>至
                        <input  name="endTime" id="endTime" type="text" placeholder="点击选择时间" value="${topic.endTime}"
                                onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"
                                placeholder="请输入结束时间" class="easyui-validatebox span2" data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td >活动排序<font color="red">*</font></td>
                    <td>
                        <input type="text" id="sortNo" name="sortNo" size="4"  maxLength="3" style="width:50px;" value="${topic.sortNo}"
                               onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
                               class="easyui-validatebox span2" data-options="required:true"/><font color="gray">(必须输入数字)</font>
                    </td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="isDisplay1" name="isDisplay" type="radio" value="1"
                                                ${(topic.isDisplay!=null && topic.isDisplay!='' && topic.isDisplay==1)?'checked':''}
                                                  class="ipt_text"/>启用
                        </div>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="isDisplay2" name="isDisplay" type="radio" value="0"
                                                ${(topic.isDisplay!=null && topic.isDisplay!='' && topic.isDisplay==0)?'checked':''}
                                                     class="ipt_text"/>停用
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>列表排序</td>
                    <td>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="listSort3" name="listSort" type="radio" value="3"
                                                     ${(topic.listSort!=null && topic.listSort!='' && topic.listSort==3)?'checked':''}
                                                     class="ipt_text"/>新品
                        </div>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="listSort4" name="listSort" type="radio" value="4"
                                                ${(topic.listSort!=null && topic.listSort!='' && topic.listSort==4)?'checked':''}
                                                     class="ipt_text"/>销量
                        </div>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="listSort5" name="listSort" type="radio" value="5"
                                                ${(topic.listSort!=null && topic.listSort!='' && topic.listSort==5)?'checked':''}
                                                     class="ipt_text"/>价格升序
                        </div>
                        <div style="float: left;">
                            &nbsp;&nbsp;&nbsp;<input id="listSort6" name="listSort" type="radio" value="6"
                                                ${(topic.listSort!=null && topic.listSort!='' && topic.listSort==6)?'checked':''}
                                                     class="ipt_text"/>价格降序
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
                                        <c:if test="${topic.commodityList != null && topic.commodityList.size()>0}">
                                            <c:forEach items="${topic.commodityList}" var="item" varStatus="topicCommS">
                                                <script type="text/javascript">
                                                    commodityNos+="${item.commodityNo},";
                                                </script>
                                                <tr id="commodityNo_${item.commodityNo}">
                                                    <td >
                                                        <input type="checkbox" name="chk" value="${item.commodityNo}" />
                                                        <input type='hidden' name='topicCommodityId' value="${item.id}" />
                                                        <input type="hidden" id="commodityNo${item.commodityNo}" name="commodityNo${item.commodityNo}" value="${item.commodityNo}">
                                                    </td>
                                                    <td><img src="${item.defaultPic}" height='40px' width='40px' /></td>
                                                    <td>${item.commodityName}</td>
                                                    <td>${item.commodityNo}</td>
                                                    <td>${item.stock}</td>
                                                    <td>${item.marketPrice}</td>
                                                    <td>${item.salePrice}</td>
                                                    <td>${item.propNo}</td>
                                                    <td><c:choose>
                                                        <c:when test="${item.status!=null && item.status!='' && item.status==2}">上架</c:when>
                                                        <c:otherwise>下架</c:otherwise>
                                                        </c:choose></td>
                                                    <td><input class="inputtxt" type='text' style='width:20px;' name='sortNoComm' onblur="if(this.value.trim()!=''){if(this.value!=${item.sortNo}){changeOrderNo('${item.commodityNo}',this,'${item.id}')}}else{alert('排序号不允许为空！');this.value=${item.sortNo}}" value="${item.sortNo}"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" ></td>
                                                    <td>
                                                        <input type='button' class='btn-add-normal' onclick='deleteMyComm(this,"${item.commodityNo}","${item.id}")' value='删除' />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>

                                    </tbody>
                                    <tbody id="commodityCheckboxlist">
                                    <td colspan="13"><input onClick="allChk(this,'chk');" id="chkb" type="checkbox" />
                                        <a href="javascript:batchDeleteCommodity();"  style="padding-left: 8px;">批量删除</a>
                                    </td>
                                    </tbody>
                                </table>
                                <br/><br/>
                                <span>已添加商品数：<span id="commCount" style="color:red;">${(topic.commitityCount!=""&&topic.commitityCount!=null)?topic.commitityCount:0 }</span></span>
                            </div>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>