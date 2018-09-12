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
            width : '120',
            title : '起止时间',
            field : 'startTime',
            sortable : true,
            formatter : function(value, row, index) {
                return value + "至" + row.endTime;
            }
        }, {
            width : '140',
            title : '创建时间',
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
            width : '140',
            title : '商品总数',
            field : 'commitityCount',
            sortable : true
        }, {
            width : '140',
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
        width : 700,
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
        width : 700,
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
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="topicSearchForm">
            <table>
                <tr>
                    <th>名称:</th>
                    <td><input name="name" placeholder="搜索条件"/></td>
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