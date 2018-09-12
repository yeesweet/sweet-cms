<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var commodityPropDataGrid;
    $(function() {
        commodityPropDataGrid = $('#commodityPropDataGrid').datagrid({
        url : '${path}/commodityProp/dataGrid',
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        idField : 'id',
        sortName : 'id',
        sortOrder : 'desc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
        frozenColumns : [ [ {
            width : '60',
            title : '编号',
            field : 'id',
            sortable : true
        }, {
            width : '60',
            title : '属性编码',
            field : 'propNo',
            sortable : false
        }, {
            width : '140',
            title : '属性名称',
            field : 'propName',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/commodityProp/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="commodityProp-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="commodityPropEditFun(\'{0}\');" >编辑</a>', row.id);
                </shiro:hasPermission>
                <shiro:hasPermission name="/commodityProp/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="commodityProp-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="commodityPropDeleteFun(\'{0}\');" >删除</a>', row.id);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.commodityProp-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.commodityProp-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#commodityPropToolbar'
    });
});

/**
 * 添加框
 * @param url
 */
function commodityPropAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/commodityProp/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = commodityPropDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#commodityPropAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function commodityPropEditFun(id) {
    if (id == undefined) {
        var rows = commodityPropDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        commodityPropDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/commodityProp/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = commodityPropDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#commodityPropEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function commodityPropDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = commodityPropDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         commodityPropDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/commodityProp/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     commodityPropDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function commodityPropCleanFun() {
    $('#commodityPropSearchForm input').val('');
    commodityPropDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function commodityPropSearchFun() {
     commodityPropDataGrid.datagrid('load', $.serializeObject($('#commodityPropSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false">
        <table id="commodityPropDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="commodityPropToolbar" style="display: none;">
    <shiro:hasPermission name="/commodityProp/add">
        <a onclick="commodityPropAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>