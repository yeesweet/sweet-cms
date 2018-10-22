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
    var commodityDataGrid;
    $(function() {
        commodityDataGrid = $('#commodityDataGrid').datagrid({
        url : '${path}/commodity/sale/dataGrid',
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : false,
        idField : 'id',
        sortName : 'downDate',
        sortOrder : 'desc',
        nowrap:false,
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
            width : '180',
            title : '上架时间',
            field : 'showDate',
            sortable : true
        },{
            width : '180',
            title : '修改时间',
            field : 'updateTime',
            sortable : true
        } ] ],
        onLoadSuccess:function(data){
            $('.commodity-easyui-linkbutton-edit').linkbutton({text:'修改'});
            $('.commodity-easyui-linkbutton-del').linkbutton({text:'下架'});
            $('.commodity-easyui-linkbutton-del-batch').linkbutton({text:'批量下架'});

        },
        toolbar : '#commodityToolbar'
    });
});

/**
 * 清除
 */
function commodityCleanFun() {
    $('#commoditySearchForm input').val('');
    commodityDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function commoditySearchFun() {
     commodityDataGrid.datagrid('load', $.serializeObject($('#commoditySearchForm')));
}

</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 80px; overflow: hidden;background-color: #fff">
        <form id="commoditySearchForm">
            <table>
                <tr>
                    <th>商品名称:</th>
                    <td><input name="commodityName" placeholder="请输入商品名称"/></td>
                    <th>商品编码:</th>
                    <td><input name="commodityNo" placeholder="请输入商品编码"/></td>
                </tr>
                <tr>
                    <th>商品分类:</th>
                    <td>
                        <input id="firstCategory" class="easyui-combobox" data-options="
                            value:'请选择一级分类',
                            valueField: 'id',
                            textField: 'name',
                            method:'get',
                            url: '${path}/category/getCategoryList?level=1',
                            onSelect: function(rec){
                                var url = '${path}/category/getCategoryList?level=2&pid='+rec.id;
                                $('#secondCategory').combobox('reload', url);
                                $('#secondCategory').combobox('setValue','请选择二级分类');
                            }" />
                        <input id="secondCategory" name="secondCategoryId" class="easyui-combobox" data-options="
                            value:'请选择二级分类',
                            valueField:'id',
                            textField:'name',
                            method:'get'
                        " />
                    </td>
                </tr>
                <tr>
                    <th>上架时间:</th>
                    <td>
                        <input name="showDateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                        <input  name="showDateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
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
        <table id="commodityDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>