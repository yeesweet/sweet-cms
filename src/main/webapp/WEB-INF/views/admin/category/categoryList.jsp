<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var categoryDataGrid;
    $(function() {
        categoryTree = $('#categoryTree').tree({
            url : '${path }/category/tree',
            parentField : 'pid',
            lines : true,
            onClick : function(node) {
                //如果点击的一级分类，则查询该一级分类下所以二级分类，如果点击的某个二级分类，则只展示该分类
                if(node.pid == 0){
                    if(node.pid == 0 && node.id == 0){
                        $("#level").val(1);
                        $("#pid").val(0);
                        categoryDataGrid.datagrid('load', {
                            level:1,
                            pid: 0
                        });
                    }
                    if(node.pid == 0 && node.id != 0){
                        $("#level").val(2);
                        $("#pid").val(node.id);
                        categoryDataGrid.datagrid('load', {
                            level:2,
                            pid: node.id
                        });
                    }
                }
                if(node.pid != 0){
                    categoryDataGrid.datagrid('load', {
                        level: 2,
                        id: node.id
                    });
                }
            }
        });

        categoryDataGrid = $('#categoryDataGrid').datagrid({
        url : '${path}/category/dataGrid',
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
            title : '序号',
            field : 'id',
            sortable : true
        }, {
            width : '60',
            title : '图片',
            field : 'image',
            sortable : true,
            formatter : function(value, row, index) {
                if(value != null && value != ""){
                    return '<img src='+value+' height="28" width="60" >';
                }
            }
        }, {
            width : '60',
            title : '分类名称',
            field : 'name',
            sortable : true,
            formatter : function(value, row, index) {
                var level = $("#level").val();
                if(level != 2){
                    return '<a href="javascript:getTwoCategory(2,'+row.id+');">'+value+'</a>';
                }
                return value;
            }
        }, {
            width : '60',
            title : '分类级别',
            field : 'level',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                case 1:
                    return '一级分类';
                case 2:
                    return '二级分类';
                }
            }
        }, {
            width : '60',
            title : '状态',
            field : 'display',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                case 0:
                    return '停用';
                case 1:
                    return '启用';
                }
            }
//        }, {
//            width : '140',
//            title : 'sku数',
//            field : '',
//            sortable : true
        }, {
            width : '140',
            title : '排序号',
            field : 'sortNo',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/category/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="category-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="categoryEditFun(\'{0}\');" >编辑</a>', row.id);
                </shiro:hasPermission>
                <shiro:hasPermission name="/category/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="category-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'"' +
                            ' onclick="categoryDeleteFun(\'{0}\',\'{1}\');" >删除</a>', row.id, row.level);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.category-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.category-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#categoryToolbar'
    });
});

/**
 * 添加框
 * @param url
 */
function categoryAddFun() {
    var level = $("#level").val();
    alert(level);
    var pid = $("#pid").val();
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/category/addPage?level='+level+'&pid='+pid,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = categoryDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#categoryAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function categoryEditFun(id) {
    if (id == undefined) {
        var rows = categoryDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        categoryDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/category/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = categoryDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#categoryEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function categoryDeleteFun(id,level) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = categoryDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         categoryDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/category/delete', {
                 id : id ,
                 level:level
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     categoryDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}

/**
 * 点击一级分类进入二级分类
 */
 function getTwoCategory(level,pid) {
    $("#level").val(level);
    $("#pid").val(pid);
    categoryDataGrid.datagrid('load', $.serializeObject($('#categorySearchForm')));
}


/**
 * 清除
 */
function categoryCleanFun() {
    $('#categorySearchForm input').val('');
    categoryDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function categorySearchFun() {
     categoryDataGrid.datagrid('load', $.serializeObject($('#categorySearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="categorySearchForm">
            <input name="level" id="level" type="hidden" value="1"/>
            <input name="pid" id="pid" type="hidden" value="0"/>
            <table>
                <tr>
                    <th>名称:</th>
                    <td><input name="name" placeholder="搜索条件"/></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="categorySearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="categoryCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="categoryDataGrid" data-options="fit:true,border:false"></table>
    </div>

    <div data-options="region:'west',border:true,split:false,title:'全部分类'"  style="width:150px;overflow: hidden; ">
        <ul id="categoryTree" style="width:160px;margin: 10px 10px 10px 10px"></ul>
    </div>
</div>
<div id="categoryToolbar" style="display: none;">
    <shiro:hasPermission name="/category/add">
        <a onclick="categoryAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>