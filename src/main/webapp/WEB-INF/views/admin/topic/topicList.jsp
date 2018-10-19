<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var topicDataGrid;
    $(function() {
        topicDataGrid = $('#topicDataGrid').datagrid({
        url : '${path}/topic/dataGrid',
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        idField : 'id',
        sortName : 'id',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
        frozenColumns : [ [ {
            width : '60',
            title : '编号',
            field : 'id',
            sortable : true
        }, {
            width : '60',
            title : '专题名称',
            field : 'name',
            sortable : true
        }, {
            width : '60',
            title : '状态',
            field : 'isDisplay',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                case 0:
                    return '停用';
                case 1:
                    return '启用';
                }
            }
        }, {
            width : '280',
            title : '起止时间',
            field : 'startTime',
            sortable : true,
            formatter : function(value, row, index) {
                if(value != null && value != ""){
                    value = value.substring(0,19);
                }
                var endTime = row.endTime;
                if(endTime != null && endTime != ""){
                    endTime = endTime.substring(0,19);
                }
                return value + "至" + endTime;
            }
        }, {
            width : '60',
            title : '有效期',
            field : 'effectiveType',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                    case 1:
                        return '未开始';
                    case 2:
                        return '未过期';
                    case 3:
                        return '已过期';
                    case 4:
                        return '无有效期';
                }
            }
        }, {
            width : '60',
            title : '商品总数',
            field : 'commitityCount',
            sortable : true
        }, {
            width : '60',
            title : '活动排序',
            field : 'sortNo',
            sortable : true
        }, {
            width : '140',
            title : '创建时间',
            field : 'createTime',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/topic/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="topic-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="topicEditFun(\'{0}\');" >编辑</a>', row.id);
                </shiro:hasPermission>
                <shiro:hasPermission name="/topic/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="topic-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="topicDeleteFun(\'{0}\');" >删除</a>', row.id);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.topic-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.topic-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#topicToolbar'
    });
});

/**
 * 添加框
 * @param url
 */
function topicAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 1000,
        height : 600,
        href : '${path}/topic/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = topicDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#topicAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function topicEditFun(id) {
    if (id == undefined) {
        var rows = topicDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        topicDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 1000,
        height : 600,
        href :  '${path}/topic/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = topicDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#topicEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function topicDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = topicDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         topicDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/topic/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     topicDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function topicCleanFun() {
    $('#topicSearchForm input').val('');
    $('#isDisplay').val('');
    $('#effectiveType').val(0);
    topicDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function topicSearchFun() {
     topicDataGrid.datagrid('load', $.serializeObject($('#topicSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="overflow: hidden; background-color: rgb(255, 255, 255); width: 1204px; height:60px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <form id="topicSearchForm">
            <table>
                <tr>
                    <th>活动id：</th>
                    <td><input id="id" name="id" value="${topic.id}" type="text" style="width:150px;"/></td>
                    <th>名称:</th>
                    <td><input name="name" placeholder="活动名称"/></td>
                    <th >活动状态：</th>
                    <td><select name="isDisplay" id="isDisplay" style="width:150px;">
                        <option value="">请选择</option>
                        <option value="1" <c:if test="${topic.isDisplay!=null && topic.isDisplay!='' &&(topic.isDisplay==1)}">selected</c:if>>启用</option>
                        <option value="0" <c:if test="${topic.isDisplay!=null && topic.isDisplay!='' &&(topic.isDisplay==0)}">selected</c:if>>停用</option>
                    </select></td>
                </tr>
                <tr>
                    <th>有效期：</th>
                    <td><select name="effectiveType" id="effectiveType">
                        <option value="0">请选择</option>
                        <option value="1" <c:if test="${topic.effectiveType!=null && topic.effectiveType!='' &&(topic.effectiveType==1)}">selected</c:if> >未开始</option>
                        <option value="2" <c:if test="${topic.effectiveType!=null && topic.effectiveType!='' &&(topic.effectiveType==2)}">selected</c:if>>未过期</option>
                        <option value="3" <c:if test="${topic.effectiveType!=null && topic.effectiveType!='' &&(topic.effectiveType==3)}">selected</c:if>>已过期</option>
                        <option value="4" <c:if test="${topic.effectiveType!=null && topic.effectiveType!='' &&(topic.effectiveType==4)}">selected</c:if>>无有效期</option>
                    </select></td>
                    <th>活动时间：</th>
                    <td><input class="g-ipt" type="text" readonly="readonly"  name="startTime" id="startTime"  class="Wdate"  value="<c:if test='${(topic.startTime!=""&&topic.startTime!="null")>topic.startTime}'></c:if>"
                           onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
						maxDate:'#F{$dp.$D(\'endTime\')||\'2020-10-01 00:00:00\'}'})" size="20" />&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="g-ipt" type="text" readonly="readonly"  name="endTime" id="endTime"  class="Wdate" value="<c:if test='${(topic.endTime!=""&&topic.endTime!="null")>topic.endTime}'></c:if>"
                           onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,
								minDate:'%y-%M-{%d}'&&'#F{$dp.$D(\'startTime\')}'})" size="20"  />
                    </td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="topicSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="topicCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="topicDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="topicToolbar" style="display: none;">
    <shiro:hasPermission name="/topic/add">
        <a onclick="topicAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>