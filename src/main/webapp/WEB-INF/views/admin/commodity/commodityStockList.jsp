<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<style>
    .window-area{
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>
<script type="text/javascript">
    var commodityStockDataGrid;
    $(function() {
        commodityStockDataGrid = $('#commodityStockDataGrid').datagrid({
        url : '${path}/commodity/stock/dataGrid',
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        idField : 'id',
        sortName : 'downDate',
        sortOrder : 'desc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
        frozenColumns : [ [ {
            field : 'ck',
            checkbox : true
        },{
            width : '360',
            title : '商品名称',
            field : 'commodityName',
            sortable : false
        },{
            width : '100',
            title : '商品编码',
            field : 'commodityNo',
            sortable : false
        },{
            width : '100',
            title : '货号',
            field : 'itemNo',
            sortable : false
        }, {
            width : '100',
            title : '库存总数',
            field : 'stock',
            sortable : true
        } ,{
            field : 'action',
            title : '操作',
            width : 100,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/commodity/edit">
                str += $.formatString('<a href="javascript:void(0)" class="commodity-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="commodityEditFun(\'{0}\');" >修改</a>', row.id+','+row.stock+','+row.commodityName);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
            onLoadSuccess:function(data){
                $('.commodity-easyui-linkbutton-edit').linkbutton({text:'修改'});
            }
    });
});
/**
 * 清除
 */
function commodityCleanFun() {
    $('#commodityStockSearchForm input').val('');
    commodityStockDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function commoditySearchFun() {
     commodityStockDataGrid.datagrid('load', $.serializeObject($('#commodityStockSearchForm')));
}
/**
 * 编辑
 */
function commodityEditFun(str) {
    // var rows = commodityStockDataGrid.datagrid('getSelections');
    // console.log('selection id',rows[0].id)
    var arr = str.split(",");
    var id = arr[0];
    var defaultStock = arr[1];
    var name = arr[2];
    console.log('id',id)
    console.log('stock',defaultStock)
    if (id == undefined) {
        var rows = commodityStockDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        commodityStockDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    $('#edit-window').window('open');
    $('#commodity-name').text(name);
    $('#stok-input').val(defaultStock);
    $('#stok-input').attr('data',id);
    return;
    $.messager.prompt('修改'+name+'库存',defaultStock, function (stock) {
        var stockNum = parseInt(stock,10);
        if (typeof stock == "string" && stock.length>0 && !isNaN(stockNum) && stockNum>=0) {
            var data = {id:id,stock:stockNum};
            var jsonData = JSON.stringify(data);
            // alert(jsonData)
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                type: 'POST',
                dataType: "json",
                data: jsonData,
                url: '${path}/commodity/edit',
                success: function (result) {
                    console.log('add edit success', result);
                    if (result.success) {
                        $('#commodityStockDataGrid').datagrid('reload');
                    }
                    //progressClose();
                }

            })
        }
    });
}
//点击弹窗确定按钮执行
function commitEdit() {
    var id = $('#stok-input').attr('data');
    var stockStr = $('#stok-input').val();
    var stock = parseInt(stockStr,10);
    if (typeof stockStr == "string" && stockStr.length>0 && !isNaN(stock) && stock>=0) {
        var data = {id:id,stock:stock};
        var jsonData = JSON.stringify(data);
        // alert(jsonData)
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: 'POST',
            dataType: "json",
            data: jsonData,
            url: '${path}/commodity/edit',
            success: function (result) {
                console.log('add edit success', result);
                if (result.success) {
                    $('#edit-window').window('close');
                    $('#commodityStockDataGrid').datagrid('reload');
                }
                //progressClose();
            }

        })
    }else{
        alert('请正确输入库存')
    }
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="commodityStockSearchForm">
            <table>
                <tr>
                    <th>商品名称:</th>
                    <td><input name="commodityName" placeholder="请输入商品名称"/></td>
                    <th>商品编码:</th>
                    <td><input name="commodityNo" placeholder="请输入商品编码"/></td>
                    <th>货号:</th>
                    <td><input name="itemNo" placeholder="请输入货号"/></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="commoditySearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="commodityCleanFun();">重置</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="commodityStockDataGrid" data-options="fit:true,border:false"></table>
    </div>
    <div id="edit-window" class="easyui-window" title="修改库存" data-options="iconCls:'icon-edit',closed:true"
         style="width:500px;height:400px;padding:5px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'west',split:true" style="width:100px"></div>
            <div data-options="region:'center'" style="padding:10px;">
                <p id="commodity-name"></p>
                <div class="window-area">
                    <p id="input-title">库存</p>
                    <input id="stok-input" type="number" placeholder="请输入库存"/>
                </div>
            </div>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                   onclick="javascript:commitEdit()" style="width:180px">确定</a>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)"
                   onclick="javascript:$('#edit-window').window('close');" style="width:80px">取消</a>
            </div>
        </div>
    </div>
</div>
