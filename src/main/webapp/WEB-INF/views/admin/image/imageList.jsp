<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<style>
    .file {
        position: absolute;
        top: 0;
        left: 0;
        width: 140px;
        height: 140px;
        opacity: 0;
    }

    .image-list-files-area {
        width: 100%;
        height: 100%;
        display: flex;
        align-content: flex-start;
        flex-wrap: wrap;
    }

    .file-box {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        border-radius: 10px;
        height: 140px;
        margin: 6px 10px;
        padding: 4px;
    }

    .file-box-focus {
        border: 1px solid yellowgreen;
        background-color: #99cdff;
    }

    .file-box .file-icon {
        width: 100px;
        height: 100px;
        background-image: url(http://i1.fuimg.com/652563/82ba1672e0a99c12.jpg);
        background-repeat: no-repeat !important;
        background-size: 100% 100%;
    }

    .file-box .pro-file-icon {
        width: 100px;
        height: 100px;
        background-image: url(http://i4.fuimg.com/652563/0f1e16e957d758a4.png);
        background-repeat: no-repeat !important;
        background-size: 100% 100%;
    }

    .file-box img {
        width: 100px;
        height: 100px;
    }

    .file-box p {
        width: 100%;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        text-align: center;

    }

    .fix-space{
        height: 100px;
    }

    .edit-dir-area{
        width: 80%;
        height: 100%;
        margin: auto 10%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .edit-dir-area .edit-dir-title{
        width: 100%;
        font-weight:bold;
        font-size: 16px;

    }
    .edit-dir-area .edit-dir-title span{
        font-weight: normal;
        font-size: 16px;
    }
    .edit-dir-area input{
        width: 100%;
        font-size: 16px;
        line-height: 26px;
        height: 26px;
        vertical-align: middle;

    }
    .edit-dir-area .btn{
        display: block;
        padding: 8px 26px;
        background-color: #ff0000;
        color:#fff;
        font-size: 16px;
        margin: 20px;
        border-radius: 4px;
    }

</style>
<script type="text/javascript">
    var imageListMgr = {
        curDir:'',
        getServiceDir: function (dir) {
            var self = this;

            var url = '${path}/cmsImageControler/getDirList?path='
            if (typeof dir == 'string' && dir != '') {
                this.curDir = dir;
                url = '${path}/cmsImageControler/getNameList?path=' + dir
            }

            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                type: 'get',
                dataType: "json",
                url: url,
                success: function (result) {
                    console.log('getDirList', result)
                    if (Object.prototype.toString.call(result) == '[object Array]') {
                        var serviceImgDiv = $('.image-list-files-area');
                        var filesHtml = '';
                        var dir = self.curDir;
                        console.log('self.curDir', self.curDir)
                        if (typeof dir == 'string' && dir != '') {

                            var index = dir.lastIndexOf("/");
                            var previousDir = '';
                            if (index > 0) {
                                previousDir = dir.substring(0, dir.lastIndexOf("/"));
                            }
                            filesHtml = filesHtml + '<div class="file-box" ondblclick="imageListMgr.getServiceDir(\'' + previousDir + '\')" ><span class="pro-file-icon"></span><p>返回上一层</p></div>'
                        }
                        console.log('files', result.length)
                        for (var i = 0; i < result.length; i++) {
                            var fileObj = result[i];
                            if (fileObj.type == 1) {
                                var imgDir = fileObj.imgDir
                                var name = imgDir.substring(imgDir.lastIndexOf("/") + 1);
                                filesHtml = filesHtml + '<div class="file-box" ondblclick="imageListMgr.getServiceDir(\'' + imgDir + '\')" ><span class="file-icon"></span><p title="' + imgDir + '">' + name + '</p></div>';
                            } else {
                                var imgUrl = fileObj.imgUrl;
                                var name = imgUrl.substring(imgUrl.lastIndexOf("/") + 1);
                                filesHtml = filesHtml + '<div class="file-box img-box"><img src="' + imgUrl + '"/><p title="' + imgUrl + '">' + name + '</p></div>';
                            }
                        }
                        if (filesHtml.length == 0) {
                            return false;
                        }
                        serviceImgDiv.empty();
                        serviceImgDiv.append($(filesHtml));
                        $('.files-area .img-box').bind('click', function () {
                            var focusCss = 'file-box-focus';
                            if ($(this).hasClass(focusCss)) {
                                $(this).removeClass(focusCss);
                            } else {
                                $(this).addClass(focusCss);
                            }
                        })

                    }
                    //progressClose();
                }

            })
        },
        showCreatDirDialog:function () {

            $('#edit-dir-win').window('open');

            $('.edit-dir-area .edit-dir-title span').text(this.curDir);
            $('.edit-dir-area input').val('');
        },
        createDir:function () {
            var self = imageListMgr;
            var dir = $('.edit-dir-area input').val();
            if(dir==''){
                alert('请输入要创建的分类名称')
            }
            var curDir = self.curDir;
            if(curDir!=''){
                curDir = curDir+'/'+dir;
            }else{
                curDir = dir;
            }
            var url = '${path}/cmsImageControler/mkDir?path='
            if (typeof curDir == 'string' && curDir != '') {
                url = '${path}/cmsImageControler/mkDir?path=' +  encodeURI(curDir,"UTF-8")
            }
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                type: 'get',
                dataType: "json",
                url: url,
                success: function (result) {
                    $('#edit-dir-win').window('close');
                    self.getServiceDir(self.curDir);
                },
                error:function (e) {
                    console.log('error',e)
                }

            })

        }
    }
    $(function() {
        $('.files-area').empty();
        imageListMgr.getServiceDir();
        $('.edit-dir-area .btn').click(imageListMgr.createDir)
    });

    //上传图片
    function ajaxImageUpload() {
        var fileName = $("#fileimg").val();
        var file = document.getElementById("fileimg").files[0];
        if(fileName==""){
            alert("请选择文件");
            return false;
        }
        var fileType = fileName.substring(fileName.lastIndexOf(".")+1);
        if(fileType.toLowerCase()!="jpg" && fileType.toLowerCase()!="png" && fileType.toLowerCase()!="gif" && fileType.toLowerCase()!="bmp"){
            alert("只能上传图片!");
            return false;
        }
        var imagSize =  file.size;
        imagSize = Math.floor(imagSize / 1024);
        if(fileType.toLowerCase()=="gif" && imagSize > 100){
            alert("上传GIF格式图片大小不能超过100KB！");
            return false;
        } else if (fileType.toLowerCase()!="gif" && imagSize > 60){
            alert("上传图片大小不能超过60KB！");
            return false;
        }
        var date = new Date();
        var year=date.getFullYear();
        var month=date.getMonth()+1;
        var path = "category/"+year+"/"+month;

        var formData = new FormData();
        formData.append("file", file);
        formData.append("path", encodeURI(path,"UTF-8"));
        formData.append("type", 1);
        $.ajax({
            url: '${path}/cmsImageControler/uploadImage.sc',
            type: 'post',
            data: formData,
            dataType: "json",
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function(data){
                if(data.status == "success"){
                    alert("上传成功！");
                    $("#iptimg").attr("src",data.imageUrl);
                    $("#image").val(data.imageUrl);
                }else{
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
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'north',border:true" style="height: 50px" >
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="javascript:imageListMgr.showCreatDirDialog()">Add</a>
    </div>
    <div data-options="region:'center',border:false" style="overflow: auto;padding: 3px;" >
        <div data-options="region:'west',split:true" style="width:100px"></div>
        <div data-options="region:'center'" style="padding:10px;">
            <div class="image-list-files-area">

            </div>
        </div>
    </div>
    <div id="edit-dir-win" class="easyui-window" title="创建分类" style="width:600px;height:400px"
         data-options="iconCls:'icon-edit',modal:true,closed:true">
        <div class="edit-dir-area">
            <p class="edit-dir-title">新建到&nbsp; <span></span></p>
            <input type="text" placeholder="请输入分类名称"/>
            <span class="btn">确定</span>
        </div>
    </div>
</div>