<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<style>
.commodity-name{
    width: 100%;
    height: 80px;
    display: flex;
    align-items: center;
    justify-content: center;
    word-wrap:break-word!important;
    text-align: left;
}
.commodity-name p{
    width:100px;
    line-height: 20px;
    margin: 0px;
    word-wrap:break-word!important;
}

</style>
<script type="text/javascript">
    var commodityWaitSaleDataGrid;
    $(function() {

        commodityWaitSaleDataGrid = $('#commodityWaitSaleDataGrid').datagrid({
        url : '${path}/commodity/waitSale/dataGrid',
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        autoRowHeight:true,
        idField : 'id',
        nowrap:false,
        sortName : 'downDate',
        sortOrder : 'desc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
        frozenColumns : [ [ {
            field : 'ck',
            checkbox : true
        },{
            width : '60',
            title : '商品编号',
            field : 'commodityNo',
            sortable : false
        },{
            width : '60',
            height:'60',
            title : '商品图片',
            field : 'defaultPic',
            sortable : false,
            formatter : function(value, row, index) {
                if(value != null && value != ""){
                    return '<img src='+value+'  width="60" height="60">';
                }
            }
        },{
            width : '160',
            title : '商品名称',
            field : 'commodityName',
            sortable : false,
            formatter : function(value, row, index) {
                if(value != null && value != ""){
                    return '<div class="commodity-name" ><p style="word-wrap:break-word;" title="'+value+'">'+value+'</p></div>';
                }
            }
        }, {
            width : '80',
            title : '总库存',
            field : 'stock',
            sortable : true
        }, {
            width : '80',
            title : '销售价',
            field : 'salePrice',
            sortable : false
        }, {
            width : '80',
            title : '销量',
            field : 'salesQuantity',
            sortable : false
        },{
            width : '60',
            title : '货号',
            field : 'itemNo',
            sortable : true
        },{
            width : '160',
            title : '下架时间',
            field : 'downDate',
            sortable : true
        },{
            width : '160',
            title : '修改时间',
            field : 'updateTime',
            sortable : true
        },{
            field : 'action',
            title : '操作',
            width : 80,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/commodity/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="commodity-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="commodityEditFun(\'{0}\');" >修改</a>', row.id);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.commodity-easyui-linkbutton-edit').linkbutton({text:'修改'});
        },
        toolbar : '#commodityToolbar'
    });
        $('#commodityWaitSaleDataGrid').datagrid('fixRowHeight',100);
});

/**
 * 编辑
 */
function commodityEditFun(id) {
    if (id == undefined) {
        var rows = commodityWaitSaleDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        commodityWaitSaleDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    var myDialog = parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/commodity/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                waitSaleListEdit();
                myDialog.dialog('close');
            }
        } ]
    });
}


/**
 * 删除
 */
 function commodityDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = commodityWaitSaleDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         commodityWaitSaleDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/commodity/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     commodityWaitSaleDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function commodityCleanFun() {
    $('#commodityWaitSaleSearchForm input').val('');
    commodityWaitSaleDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function commoditySearchFun() {
     commodityWaitSaleDataGrid.datagrid('load', $.serializeObject($('#commodityWaitSaleSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="commodityWaitSaleSearchForm">
            <table>
                <tr>
                    <th>商品名称:</th>
                    <td><input name="commodityName" placeholder="请输入商品名称"/></td>
                    <th>商品编码:</th>
                    <td><input name="commodityNo" placeholder="请输入商品编码"/></td>
                    <th>下架时间:</th>
                    <td>
                        <input name="downDateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                        <input  name="downDateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                    </td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="commoditySearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="commodityCleanFun();">重置</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="commodityWaitSaleDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>