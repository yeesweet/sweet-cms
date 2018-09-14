<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script src="/static/jquery/ajaxfileupload.js"></script>
<script type="text/javascript">
    $(function() {
        $('#categoryEditForm').form({
            url : '${path}/category/edit',
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
                    var form = $('#categoryEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });
        
    });

    //上传图片
    function ajaxImageUpload() {
        var imgType =	$("#imgType").val();
        var file = $("#fileimg").val();
        if(file==""){
            alert("请选择文件");
            return false;
        }
        var fileInput = $("#fileimg");
//        byteSize  = fileInput.files.size;
//        var fileSize = Math.floor(byteSize / 1024);
        var fileType = file.substring(file.lastIndexOf(".")+1);
//        if(fileType.toLowerCase()=="gif" && fileSize > 100){
//            alert("上传GIF格式图片大小不能超过100KB！");
//            return false;
//        } else if (fileType.toLowerCase()!="gif" && fileSize > 60){
//            alert("上传图片大小不能超过60KB！");
//            return false;
//        }
        if(fileType.toLowerCase()!="jpg" && fileType.toLowerCase()!="png" && fileType.toLowerCase()!="gif" && fileType.toLowerCase()!="bmp"){
            alert("只能上传图片!");
            return false;
        }else{
            var date = new Date();
            var year=date.getFullYear();
            var month=date.getMonth()+1;
            var path = "category/"+year+"/"+month;
            $.ajaxFileUpload({
                url: '${path}/cmsImageControler/uploadImage.sc?path='+encodeURI(path,"UTF-8")+'&type=1',
                type: 'post',
                secureuri: false, //一般设置为false
                fileElementId: 'fileimg', // 上传文件的id、name属性名
                dataType: 'json', //返回值类型，一般设置为json、application/json
                success: function(data){
                    if (data.status == 'success') {
                        alert("上传成功！");
                        $("#iptimg").attr("src",data.imageUrl);
                        $("#image").val(data.imageUrl);
                    }else{
                        alert(data.errorDesc);
                        $("#iptimg").attr("src","http://47.95.213.244/pics/category/2018/9/1536891709591.png");
                        $("#image").val("");
                    }
                },
                error: function(data, e){
                    alert("上传失败！");
                    $("#iptimg").attr("src","http://47.95.213.244/pics/category/2018/9/1536891709591.png");
                }
            });
        }
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="categoryEditForm" method="post">
            <input name="level"  type="hidden" value="${category.level}"/>
            <input name="pid"  type="hidden" value="${category.pid}"/>
            <input name="id"  type="hidden" value="${category.id}"/>
            <table class="grid">
                <tr>
                    <td>分类级别</td>
                    <td><input name="levelName" type="text" placeholder="" class="easyui-validatebox span2" data-options="required:true"
                               value="<c:choose><c:when test="${category.level==1}">一级分类</c:when><c:otherwise>二级分类</c:otherwise></c:choose>"></td>
                </tr>
                <tr>
                    <td>分类名称</td>
                    <td><input name="name" type="text" placeholder="" class="easyui-validatebox span2" data-options="required:true"
                               value="${category.name}"></td>
                </tr>
                <tr>
                    <td>序号</td>
                    <td><input name="sortNo" type="text" placeholder="" class="easyui-validatebox span2" data-options="required:true"
                               value="${category.sortNo}"></td>
                </tr>
                <tr>
                    <th>分享图片：</th>
                    <td>
                        <p>
                            <input type="file" name="file" id="fileimg" class="fileimg"/>
                            <input type="button" id="uploadBtn" class="uploadBtn" value="上传图片" onclick="javascript:ajaxImageUpload()"/>
                            <input type="button" class="addImageBtn" value="添加图片"/>
                            <font color="red">(建议图片尺寸160*160)</font>
                        </p>
                        <div style="position: relative;max-width:150px;margin:10px 0 10px 10px;">
                            <a href="javascript:closeImg(2);"><img src="http://47.95.213.244/pics/category/2018/9/1536891782986.png" style="position: absolute;top:0px;right:0px;z-index: 1000;width:25px;"/></a>
                            <img src="${category.image}" id="iptimg" class="iptimgs" style="max-width:150px;"/>
                            <input type="hidden" id="image" name="image" value="${category.image}"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>分类状态</td>
                    <td>
                        <input name="display" <c:choose><c:when test="${category.display==1}">checked</c:when></c:choose> type="radio" value="1"/> 启用
                        <input name="display" <c:choose><c:when test="${category.display==0}">checked</c:when></c:choose> type="radio" value="0"/> 停用
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>