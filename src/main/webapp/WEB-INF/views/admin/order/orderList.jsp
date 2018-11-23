<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var orderDataGrid;
    $(function() {
        orderDataGrid = $('#orderDataGrid').datagrid({
        url : '${path}/order/dataGrid',
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
            title : '订单编号',
            field : 'orderNo',
            sortable : true
        }, {
            width : '60',
            title : '订单状态',
            field : 'orderStatus',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                case 1:
                    return '待支付';
                case 2:
                    return '已支付';
                case 3:
                    return '已取消';
                case 4:
                    return '已发货';
                case 5:
                    return '已完成';
                }
            }
        }, {
            width : '60',
            title : '收件人',
            field : 'name',
            sortable : true
        }, {
            width : '120',
            title : '收件人手机号',
            field : 'phone',
            sortable : true
        }, {
            width : '140',
            title : '订单创建时间',
            field : 'createTime',
            sortable : true
        }, {
            width : '60',
            title : '支付总金额',
            field : 'prodTotalAmt',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/order/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="order-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="orderEditFun(\'{0}\');" >编辑</a>', row.id);
                </shiro:hasPermission>
                <shiro:hasPermission name="/order/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="order-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="orderDeleteFun(\'{0}\');" >删除</a>', row.id);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.order-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.order-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#orderToolbar'
    });
});

/**
 * 添加框
 * @param url
 */
function orderAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/order/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = orderDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#orderAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function orderEditFun(id) {
    if (id == undefined) {
        var rows = orderDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        orderDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/order/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = orderDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#orderEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function orderDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = orderDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         orderDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/order/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     orderDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function orderCleanFun() {
    $('#orderSearchForm input').val('');
    orderDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function orderSearchFun() {
     orderDataGrid.datagrid('load', $.serializeObject($('#orderSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="orderSearchForm">
            <table>
                <tr>
                    <th>名称:</th>
                    <td><input name="name" placeholder="搜索条件"/></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="orderSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="orderCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="orderDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="orderToolbar" style="display: none;">
    <shiro:hasPermission name="/order/add">
        <a onclick="orderAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>