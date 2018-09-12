<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var pageManagerDataGrid;
    $(function() {
        pageManagerDataGrid = $('#pageManagerDataGrid').datagrid({
        url : '${path}/pageManager/dataGrid',
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
            title : '页面id',
            field : 'id',
            sortable : true
        }, {
            width : '60',
            title : '页面名称',
            field : 'name',
            sortable : true
        }, {
            width : '60',
            title : '顶部标题',
            field : 'topName',
            sortable : true
        }, {
            width : '60',
            title : '页面类型',
            field : 'type',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                    case 1:
                        return '首页';
                    case 1026:
                        return '二级页';
                }
            }
        }, {
            width : '120',
            title : '更新时间',
            field : 'updateTime',
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
            width : '140',
            title : '操作者',
            field : 'operator',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/pageManager/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="pageManager-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="pageManagerEditFun(\'{0}\');" >编辑</a>', row.id);
                </shiro:hasPermission>
                <shiro:hasPermission name="/pageManager/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="pageManager-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="pageManagerDeleteFun(\'{0}\');" >删除</a>', row.id);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.pageManager-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.pageManager-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#pageManagerToolbar'
    });
});

/**
 * 添加框
 * @param url
 */
function pageManagerAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/pageManager/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = pageManagerDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#pageManagerAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function pageManagerEditFun(id) {
    if (id == undefined) {
        var rows = pageManagerDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        pageManagerDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/pageManager/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = pageManagerDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#pageManagerEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function pageManagerDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = pageManagerDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         pageManagerDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/pageManager/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     pageManagerDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function pageManagerCleanFun() {
    $('#pageManagerSearchForm input').val('');
    pageManagerDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function pageManagerSearchFun() {
     pageManagerDataGrid.datagrid('load', $.serializeObject($('#pageManagerSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="pageManagerSearchForm">
            <table>
                <tr>
                    <th>名称:</th>
                    <td><input name="name" id="name" type="text" placeholder="搜索条件"/></td>
                    <th>启用状态:</th>
                    <td>
                        <select name="isDisplay" id="isDisplay">
                            <option value=""></option>
                            <option value="0">停用</option>
                            <option value="1">启用</option>
                        </select>
                    </td>
                    <th>页面类型:</th>
                    <td>
                        <select name="type" id="type">
                            <option value=""></option>
                            <option value="1">首页</option>
                            <option value="1026">二级页</option>
                        </select>
                    </td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="pageManagerSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="pageManagerCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="pageManagerDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="pageManagerToolbar" style="display: none;">
    <shiro:hasPermission name="/pageManager/add">
        <a onclick="pageManagerAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>