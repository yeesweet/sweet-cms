<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<style>
    .part-line{
        height: 1px;
        background-color: #eee;
        margin: 4px 0px;
    }
    .title{
        font-size:28px;
        font-weight: 600px;
        margin: 6px 0px;
    }
    .btn-area{
        height: 40px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    .btn {

        padding: 5px 3px;
        border: 1px solid #999999;
        border-radius: 5px;
        background-image: linear-gradient(rgb(255, 255, 255) 0px, rgb(238, 238, 238) 100%);
        background-position-x: initial;
        background-position-y: initial;
        background-size: initial;
        background-repeat-x: repeat;
        background-repeat-y: no-repeat;
        background-attachment: initial;
        background-origin: initial;
        background-clip: initial;
        background-color: initial;
    }
    #saveSpecTableBtn{
        margin: 6px 0px;
    }
    .commodity-part-content {
        margin-bottom: 40px;
    }

    .commodity-part-content {
        margin-left: 60px;
    }

    .commodity-part-content th input {
        width: 300px;
    }

    #sale-spec {
        display: flex;
        flex-wrap: wrap;
    }

    .sale-spec-area {
        width: 100px;
        height:24px;
        float: left;
    }

    /*图片上传部分*/
    .imgs {
        position: relative;
    }

    .spec-imgs {
        position: relative;
        margin: 20px 0px;
        border-bottom: 1px solid #aaaaaa;
    }

    .imageDiv {
        display: inline-block;
        width: 140px;
        height: 140px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        border: 1px dashed darkgray;
        background: #f8f8f8;
        position: relative;
        overflow: hidden;
    }

    .imageDiv img {
        width: 100%;
        height: 100%;
    }

    .cover {
        position: absolute;
        z-index: 1;
        top: 0;
        left: 0;
        width: 140px;
        height: 140px;
        background-color: rgba(0, 0, 0, .3);
        display: none;
        line-height: 125px;
        text-align: center;
        cursor: pointer;
    }

    .cover > .delbtn {
        color: red;
        font-size: 20px;
    }

    .imageDiv:hover .cover {
        display: block;
    }

    .addImages {
        display: inline-block;
        width: 140px;
        height: 140px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        border: 1px dashed darkgray;
        background: #f8f8f8;
        position: relative;
        overflow: hidden;
    }

    .text-detail {
        margin-top: 40px;
        text-align: center;
    }

    .text-detail > span {
        font-size: 40px;
    }

    .file {
        position: absolute;
        top: 0;
        left: 0;
        width: 140px;
        height: 140px;
        opacity: 0;
    }

    .files-area {
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



</style>
<div class="easyui-panel" title="选择分类" id="categoryPanel" style="width:700px;height:200px;padding:10px;">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:true" style="width:360px;padding:10px">
            <form id="category1CheckForm">
                <table id="categoryTable1" title="选择一级分类" class="easyui-datagrid" style="width:360px;height:400px"
                       url="${path}/category/getCategoryList?level=1" method="get"
                       idField="id" pagination="true"
                       rownumbers="true"
                       iconCls="icon-save">
                    <thead>
                    <tr>
                        <th field="ck" checkbox="true"></th>
                        <th field="name" width="200">全选</th>
                        <th field="id" width="80">id</th>
                    </tr>
                    </thead>
                </table>
            </form>
        </div>
        <div data-options="region:'center'" style="padding:10px">
            <form id="category1CheckForm2">
                <table id="categoryTable2" title="选择二级分类" class="easyui-datagrid" style="width:360px;height:400px"
                       method="get"
                       idField="id" pagination="true"
                       rownumbers="true"
                       iconCls="icon-save">
                    <thead>
                    <tr>
                        <th field="ck2" checkbox="true"></th>
                        <th field="name" width="200">全选</th>
                        <th field="id" width="80">id</th>
                    </tr>
                    </thead>
                </table>
            </form>
        </div>
    </div>
</div>
<div class="easyui-layout" id="nextBtnDiv" data-options="fit:true,border:false">


    <a id="nextBtn" class="easyui-linkbutton">下一步，填写商品信息</a>
</div>
<div class="easyui-panel" title="填写商品信息" style="width:1200px;height:600px;padding:10px;">
    <div class="easyui-layout" data-options="fit:true">

        <div data-options="region:'center'" style="padding:10px">
            <div class='commodity-part'>
                <div class='commodity-part-title title'>基本内容</div>
                <table class='commodity-part-content'>
                    <tr>
                        <th><span class="name">*商品标题:</span></th>
                        <th><input id="commodity-name" class="easyui-validatebox"
                                   data-options="required:true,validType:'length[2,100]'"></th>
                    </tr>
                    <tr>
                        <th><span class="name">&nbsp;商品标语:</span></th>
                        <th><input id="commodity-desc" class="easyui-validatebox" data-options="required:false"></th>
                    </tr>
                    <tr>
                        <th><span class="name">&nbsp;品牌:</span></th>
                        <th><input id="commodity-brand" class="easyui-validatebox" data-options="required:false"></th>
                    </tr>
                    <tr>
                        <th><span class="name">*货号:</span></th>
                        <th><input id="itemNo" name="itemNo" class="easyui-validatebox"
                                   data-options="required:true,validType:'length[2,100]'"></th>
                    </tr>

                </table>

                <div class="part-line"></div>
                <div class='title'>商品基本信息</div>
                <div class='sale-spec-title'><b>规格</b></div>
                <div id="sale-spec"></div>
                <br/>

                <div class="sale-spec-table">
                    <table id="dg" class="easyui-datagrid" title="编辑对应规格商品" style="width:700px;height:auto"
                           data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				onClickRow: specTable.onClickRow
			">
                        <thead>
                        <tr>
                            <th data-options="field:'id',width:80">id</th>
                            <th data-options="field:'name',width:100">销售规格</th>
                            <th data-options="field:'costPrice',width:80,align:'right',editor:{type:'numberbox',options:{precision:1}}">
                                成本价
                            </th>
                            <th data-options="field:'salePrice',width:80,align:'right',editor:'numberbox'">销售价</th>
                            <th data-options="field:'marketPrice',width:80,align:'right',editor:'numberbox'">市场价</th>
                            <th data-options="field:'discount',width:80,align:'right'">折扣（%）</th>
                            <th data-options="field:'grossProfit',width:80,align:'right'">毛利（%）</th>
                            <th data-options="field:'stock',width:80,align:'right',editor:'numberbox'">库存</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <a id="saveSpecTableBtn" class="easyui-linkbutton">保存销售规格价格信息</a>
                <div class="part-line"></div>
                <div class='title'>图片和描述</div>
                <div class="imgs">
                    <%--上传角度图图片区域--%>
                </div>
                <div class="desc-imgs">
                    <%--上传描述图片区域--%>
                    <div class="spec-imgs"><h3>描述图</h3>
                        <div class="picDiv">
                            <div class="addImages" id="addImages_desc"><input type="file" class="file" id="fileInput" multiple
                                                          accept="image/png, image/jpeg, image/gif, image/jpg"/>
                                <div class="text-detail"><span>+</span>
                                    <p>点击上传</p></div>
                            </div>
                        </div>
                        <div class="btn-area">
                            <span class="btn" id="desc-space-choose-btn">图片空间选择</span>
                        </div>

                    </div>
                </div>
                <a id="save-btn" href="#" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存且下架</a>
                <a id="sale-save-btn" href="#" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存并开始销售</a>
                <div class="fix-space"></div>

            </div>


            <div id="space-window" class="easyui-window" title="图片空间" data-options="iconCls:'icon-save',closed:true"
                 style="width:500px;height:400px;padding:5px;">
                <div class="easyui-layout" data-options="fit:true">
                    <div data-options="region:'west',split:true" style="width:100px"></div>
                    <div data-options="region:'center'" style="padding:10px;">
                        <div class="files-area">

                        </div>
                    </div>
                    <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                        <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
                           onclick="javascript:imgsMgr.getSelectServiceImg()" style="width:180px">插入选中的图片</a>
                        <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)"
                           onclick="javascript:$('#space-window').window('close');" style="width:80px">取消</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    var ViewMgr = {
        curImgIndex: 0,
        curDescImgIndex: 0,
        //点击二级分类触发
        selectLevel2: function (obj) {
            Commodity.category2 = obj.id;
        },

        //上传图片input选择文件后触发
        uploadImgChange: function () {
            var lastFile = $('.img-area .pic-box input:last').val();
            if (lastFile.length > 0) {
                this.curImgIndex++;

                var el = '<div class="pic-box"><input type="file" name="fileList" id="upload-img' + this.curImgIndex + '"  onchange="ViewMgr.uploadImgChange()"/><img id="Img' + this.curImgIndex + '" class="img"/></div>';
                $('.img-area').append(el);
            }
        },
        descImgChange: function () {
            var lastFile = $('.desc-img-area .desc-pic-box input:last').val();
            if (lastFile.length > 0) {
                this.curDescImgIndex++;

                var el = '<div class="desc-pic-box"><input type="file" name="fileList" id="upload-desc-img' + this.curDescImgIndex + '"  onchange="ViewMgr.descImgChange()"/><img id="descImg' + this.curDescImgIndex + '" class="img"/></div>';
                $('.desc-img-area').append(el);
            }
        },
        //检验待上传图片数据
        checkViewData: function (isDesc) {
            var isDesc = typeof(isDesc) != "undefined" && isDesc;
            var idStr = isDesc ? "#upload-desc-img" : "#upload-img";
            var inputNum = isDesc ? ViewMgr.curDescImgIndex : ViewMgr.curImgIndex;
            for (var i = 0; i < inputNum; i++) {
                var fileInput = $(idStr + i);
                var file = fileInput.val();
                var fileType = file.substring(file.lastIndexOf(".") + 1);
                if (file == "") {
                    alert("请选择文件");
                    return false;
                } else if (fileType.toLowerCase() != "jpg" && fileType.toLowerCase() != "png" && fileType.toLowerCase() != "gif" && fileType.toLowerCase() != "bmp") {
                    return false;
                }
            }
            return true;

        },
        //获取待上传图片input id
        getUploadImgIdList: function (isDesc) {
            var arr = [];
            var idStr = isDesc ? "upload-desc-img" : "upload-img";
            var inputNum = isDesc ? ViewMgr.curDescImgIndex : ViewMgr.curImgIndex;
            for (var i = 0; i < inputNum; i++) {
                arr.push(idStr + i);
            }

            return arr;
        },
        //更新预览图片
        updateImgView: function (urlList, isDesc) {
            if (urlList.length > 0) {
                var idStr = isDesc ? "#descImg" : "#Img";
                for (var i = 0; i < urlList.length; i++) {
                    $(idStr + i).attr('src', urlList[i]);
                }
            }
        }
    }
    var Commodity = {
        commodityNo: ${maxCommodityNo+1},
        category1: '',
        category2: '',
        name: '',
        status:1,
        desc: '',
        brand: '',
        salePrice: 0,
        marketPrice: 0,
        costPrice: 0,
        discount: '',
        saleSpec: [],
        imgList: [],
        descImgList: [],


        //检验是否已选指定id的销售属性
        isCheckSpec: function (propNo) {
            if (this.saleSpec.length > 0) {
                var i = 0;
                while (i < this.saleSpec.length) {
                    if (this.saleSpec[i].propNo == propNo) {
                        console.log('isCheckSpec', i);
                        return i;
                    }
                    i++;
                }
            }
            return -1;
        },

        //勾选一个销售属性
        addSpec: function (data) {
            var propNo = data.propNo;
            var index = this.isCheckSpec(propNo);
            if (index < 0) {
                this.saleSpec.push(data);
            }
        },
        //取消勾选一个销售属性
        rmSpec: function (data) {
            var propNo = data.propNo;
            var index = this.isCheckSpec(propNo);
            if (index >= 0) {
                this.saleSpec.splice(index, 1);
            }
        },
        //检验待保存商品数据
        checkCommitData: function () {
            var self = this;
            if (this.saleSpec.length == 0) {
                alert("请勾选销售属性");
                return false;
            }
            if($('.desc-imgs').find('img').length==0){
                alert('请上传描述图');
                return false;
            }

            for (var i=0;i<self.saleSpec.length;i++){
                var propNo = self.saleSpec[i].propNo;
                var propName = self.saleSpec[i].propName;
                var imgsId = 'spec-imgs' + propNo;
                if($('#'+imgsId).find('img').length==0){
                    alert('请添加销售规格：“'+propName+'”的角度图')
                    return false;
                }
            }
            saveSpecTableData();
            if(specTable.list.length==0){
                return false;
            }
            return true;
        },

        //获取待提交数据
        getCommitData: function () {
            var self = this;
            var commodityId = self.commodityNo;
            var commodityArr = [];
            var specList = specTable.list;
            var getCategoriesArr=function (no) {
                var arr = [];
                for (var i=0;i<self.categoriesData.length;i++){
                    arr.push({
                        categoryId:self.categoriesData[i].id,
                        commodityNo:no
                        })
                }
                return arr;
            };
            var getPics = function (propNo,no) {
                var imgsId = 'spec-imgs' + propNo;
                if($('#'+imgsId).find('img').length==0){
                    alert('请添加销售规格：“'+propName+'”的角度图')
                    return false;
                }
                var imgElList = $('#'+imgsId).find('img');
                var descElList = $('.desc-imgs').find('img');
                var picArr = [];
                var defaultPic = $(imgElList[0]).attr('src');
                for (var i=0;i<imgElList.length;i++){
                    var obj = {
                        image:$(imgElList[i]).attr('src'),
                        commodityNo:no,
                        sortNo:i+1,
                        type:1
                    }
                    picArr.push(obj);
                }
                for (var i=0;i<descElList.length;i++){
                    var obj = {
                        image:$(descElList[i]).attr('src'),
                        commodityNo:no,
                        sortNo:i+1,
                        type:2
                    }
                    picArr.push(obj);
                }
                return {arr:picArr,defaultPic:defaultPic};
            }

            var data = [];
            for (var i=0;i<specList.length;i++){
                var commodityNo = commodityId+i+'';
                var specObj = specList[i];
                var picsObj = getPics(specObj.id,commodityNo)
                var commodityObj = {
                    commodityNo:commodityNo,
                    commodityName:self.name,
                    brandName:self.brand,
                    itemNo:self.itemNo,
                    sellPoint:self.desc,
                    salePrice:parseFloat(specObj.salePrice),
                    stock:parseInt(specObj.stock,10),
                    marketPrice:parseFloat(specObj.marketPrice),
                    costPrice:parseFloat(specObj.costPrice),
                    propNo:specObj.id,
                    commodityStatus:self.status,
                    categories:getCategoriesArr(commodityNo),
                    pics:picsObj.arr,
                    defaultPic:picsObj.defaultPic
                };
                data.push(commodityObj);
            }
            return data;
        }
    }
    var specIdCont = 0;

    var specTable = {
        editIndex: undefined,
        list:[],
        //根据字符串获取数字，异常返回0
        getNum: function (v) {
            var n = parseFloat(v)
            if ((typeof v == 'number' || typeof v == 'string') && v != '' || n >= 0) {
                return n;
            }
            return 0;
        },
        endEditing: function () {
            if (specTable.editIndex == undefined) {
                return true
            }
            if ($('#dg').datagrid('validateRow', specTable.editIndex)) {
                var salePriceEl = $('#dg').datagrid('getEditor', {index: specTable.editIndex, field: 'salePrice'});
                var costPriceEl = $('#dg').datagrid('getEditor', {index: specTable.editIndex, field: 'costPrice'});
                var marketPriceEl = $('#dg').datagrid('getEditor', {index: specTable.editIndex, field: 'marketPrice'});
                var salePrice = specTable.getNum($(salePriceEl.target)[0].value);
                var costPrice = specTable.getNum($(costPriceEl.target)[0].value);
                var marketPrice = specTable.getNum($(marketPriceEl.target)[0].value);

                $('#dg').datagrid('getRows')[specTable.editIndex]['discount'] = marketPrice != 0 ? (100 * (salePrice / marketPrice)).toFixed(2) : '-';
                $('#dg').datagrid('getRows')[specTable.editIndex]['grossProfit'] = salePrice != 0 ? (100 * (salePrice - costPrice) / salePrice).toFixed(2) : '-';
                // $('#dg').datagrid('getRows')[editIndex]['grossProfit'] = grossProfit;
                $('#dg').datagrid('endEdit', specTable.editIndex);
                specTable.editIndex = undefined;
                return true;
            } else {
                return false;
            }
        },
        onClickRow: function (index) {
            if (specTable.editIndex != index) {
                if (specTable.endEditing()) {
                    $('#dg').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                    specTable.editIndex = index;
                } else {
                    $('#dg').datagrid('selectRow', specTable.editIndex);
                }
            }
        },
        append: function (obj) {
            if (specTable.endEditing()) {
                $('#dg').datagrid('appendRow', {id: obj.propNo, name: obj.propName});
                specTable.editIndex = $('#dg').datagrid('getRows').length - 1;
                $('#dg').datagrid('selectRow', specTable.editIndex)
                    .datagrid('beginEdit', specTable.editIndex);
            }
        },
        removeRow: function (obj) {
            specTable.endEditing();
            var arr = $('#dg').datagrid('getData');
            console.log('arr', arr);
            console.log('obj', obj);
            var i = 0;
            var removeIndex = -1;
            while (i < arr.rows.length) {
                if (arr.rows[i].id == obj.propNo) {
                    removeIndex = i;
                }
                i++;
            }
            console.log('removeIndex', removeIndex);
            if (removeIndex >= 0) {
                if (specTable.editIndex == undefined) {
                    $('#dg').datagrid('deleteRow', removeIndex);
                } else {
                    $('#dg').datagrid('cancelEdit', specTable.editIndex)
                        .datagrid('deleteRow', removeIndex);
                    specTable.editIndex = undefined;
                }
            }

        },
        accept: function () {
            if (specTable.endEditing()) {
                $('#dg').datagrid('acceptChanges');
            }
        },
        reject: function () {
            $('#dg').datagrid('rejectChanges');
            specTable.editIndex = undefined;
        },
        getChanges: function () {
            var rows = $('#dg').datagrid('getChanges');
            alert(rows.length + ' rows are changed!');
        }
    };
    var imgsMgr = {
        curDir: '',
        curSpecId: '',
        //添加指定销售规格的图片到上传区域
        addUploadDiv: function (specData) {
            var self = this;
            if (typeof (specData) != 'object' || specData == null) {
                return false;
            }
            var propNo = specData.propNo;
            var propName = specData.propName;
            if (typeof (specData.propNo) != 'string' || specData.propNo == null) {
                return false;
            }
            var imgsId = 'spec-imgs' + propNo;
            var imgsHtml = '<div class="spec-imgs" id="' + imgsId + '"><h3>' + propName + '角度图</h3><div class="picDiv"><div class="addImages" id="addImages_' + propNo + '"><input type="file" class="file" id="fileInput" multiple accept="image/png, image/jpeg, image/gif, image/jpg"/><div class="text-detail"><span>+</span><p>点击上传</p></div></div></div><div class="btn-area"><span  class=" btn" id="space-choose-btn' + propNo + '" data="' + propNo + '">图片空间选择</span></div></div>'
            $('.imgs').append(imgsHtml);

            $("#" + imgsId + " .file").change(function () {
                //获取选择图片的对象
                var docObj = $(this)[0];
                // var picDiv = $(this).parents(".picDiv");
                var addImages = $(this).parents(".addImages");
                //得到所有的图片文件
                var fileList = docObj.files;
                for (var i = 0; i < fileList.length; i++) {
                    var fr = new FileReader();
                    var single = fileList[i];
                    fr.onload = function (single) {
                        // var picHtml = "<div class='imageDiv' > <img id='img" + single.name + "' src='" + single.target.result + "' /> <div class='cover'><i class='delbtn'>删除</i></div></div>"
                        // addImages.before(picHtml);
                        // var imgObjPreview = document.getElementById("img" + single.name);
                        // //图片属性
                        // imgObjPreview.style.display = 'block';
                        // imgObjPreview.style.width = '140px';
                        // imgObjPreview.style.height = '140px';

                        $.ajax({
                            type: "POST",
                            url: "${path}/cmsImageControler/uploadImageBase64",
                            data: {'image': single.target.result, path: encodeURI("commodity/test", "UTF-8"), type: 0},//图片base64编码，图片格式（当前仅支持jpg,png,jpeg三种），图片对象索引
                            dataType: "json",
                            success: function (data) {
                                alert(data);
                                if (data.status == 'success') {
                                    //图片上传成功回调
                                    var picHtml = "<div class='imageDiv' > <img id='img" + single.name + "' src='" + data.imageUrl + "' /> <div class='cover'><i class='delbtn'>删除</i></div></div>"
                                    addImages.before(picHtml);
                                    var imgObjPreview = document.getElementById("img" + single.name);
                                    //图片属性
                                    imgObjPreview.style.display = 'block';
                                    imgObjPreview.style.width = '140px';
                                    imgObjPreview.style.height = '140px';
                                }
                                else {//图片未上传成功回调

                                }
                            },
                            error: function (err) {
                                //服务器连接失败报错处理
                                alert("error");
                                //alert(err.responseText);
                            }
                        });
                    };
                    fr.readAsDataURL(single);
                }
            });
            /*点击删除已选图片*/
            $(document).on("click", "#" + imgsId + " .delbtn", function () {
                console.log("click")
                var _this = $(this);
                _this.parents(".imageDiv").remove();
            });

            /*点击选择空间图片*/
            $(document).on("click", "#space-choose-btn" + propNo, function () {
                console.log("click")
                var _this = $(this);
                self.curSpecId = _this.attr('data');
                console.log('curSpecId', self.curSpecId)

                $('#space-window').window('open');
                $('.files-area').empty();
                self.getServiceDir(self.curDir);

            });


        },
        getSelectServiceImg: function () {
            var self = this;
            var imgBoxList = $('.file-box-focus');
            var propNo = self.curSpecId;
            var addImages = $('#addImages_' + propNo);
            if (typeof propNo != 'string') {
                return;
            }
            for (var i = 0; i < imgBoxList.length; i++) {
                var imgBox = imgBoxList[i];
                var img = $(imgBox).children('img')
                var src = $(img).attr('src');

                var picHtml = "<div class='imageDiv' > <img  src='" + src + "' /> <div class='cover'><i class='delbtn'>删除</i></div></div>"
                addImages.before(picHtml);

            }
            $('#space-window').window('close');

            /*点击删除已选图片*/
            $(document).on("click", "#addImages_" + propNo + " .delbtn", function () {
                console.log("click")
                var _this = $(this);
                _this.parents(".imageDiv").remove();
            });
        },
        //移除指定销售规格的图片上传区域
        delUploadDivById: function (specId) {
            if (typeof (specId) != 'string' || specId == '') {
                return false;
            }
            var imgsId = 'spec-imgs' + specId;
            $("#" + imgsId).remove();
        },

        getServiceDir: function (dir) {
            this.curDir = dir;
            var url = '${path}/cmsImageControler/getDirList?path='
            if (typeof dir == 'string' && dir != '') {
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
                        var serviceImgDiv = $('.files-area');
                        var filesHtml = '';
                        var dir = imgsMgr.curDir;
                        console.log('imgsMgr.curDir', imgsMgr.curDir)
                        if (typeof dir == 'string' && dir != '') {

                            var index = dir.lastIndexOf("/");
                            var previousDir = '';
                            if (index > 0) {
                                previousDir = dir.substring(0, dir.lastIndexOf("/"));
                            }
                            filesHtml = filesHtml + '<div class="file-box" ondblclick="imgsMgr.getServiceDir(\'' + previousDir + '\')" ><span class="pro-file-icon"></span><p>返回上一层</p></div>'
                        }
                        console.log('files', result.length)
                        for (var i = 0; i < result.length; i++) {
                            var fileObj = result[i];
                            if (fileObj.type == 1) {
                                var imgDir = fileObj.imgDir
                                var name = imgDir.substring(imgDir.lastIndexOf("/") + 1);
                                filesHtml = filesHtml + '<div class="file-box" ondblclick="imgsMgr.getServiceDir(\'' + imgDir + '\')" ><span class="file-icon"></span><p title="' + imgDir + '">' + name + '</p></div>';
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
        initDescUploadArea:function () {
            var self = this;
            $(".desc-imgs .file").change(function () {
                //获取选择图片的对象
                var docObj = $(this)[0];
                var addImages = $(this).parents(".addImages");
                //得到所有的图片文件
                var fileList = docObj.files;
                for (var i = 0; i < fileList.length; i++) {
                    var fr = new FileReader();
                    var single = fileList[i];
                    fr.onload = function (single) {
                        $.ajax({
                            type: "POST",
                            url: "${path}/cmsImageControler/uploadImageBase64",
                            data: {'image': single.target.result, path: encodeURI("commodity/test", "UTF-8"), type: 0},//图片base64编码，图片格式（当前仅支持jpg,png,jpeg三种），图片对象索引
                            dataType: "json",
                            success: function (data) {
                                if (data.status == 'success') {
                                    //图片上传成功回调
                                    var picHtml = "<div class='imageDiv' > <img id='img" + single.name + "' src='" + data.imageUrl + "' /> <div class='cover'><i class='delbtn'>删除</i></div></div>"
                                    addImages.before(picHtml);
                                    var imgObjPreview = document.getElementById("img" + single.name);
                                    //图片属性
                                    imgObjPreview.style.display = 'block';
                                    imgObjPreview.style.width = '140px';
                                    imgObjPreview.style.height = '140px';
                                }else {//图片未上传成功回调

                                }
                            },
                            error: function (err) {
                                //服务器连接失败报错处理
                                alert("error");
                                //alert(err.responseText);
                            }
                        });
                    };
                    fr.readAsDataURL(single);
                }
            });
            /*点击删除已选图片*/
            $(document).on("click", ".desc-imgs .delbtn", function () {
                console.log("click");
                var _this = $(this);
                _this.parents(".imageDiv").remove();
            });
        }
    };
    //保存销售规格表格数据
    function  saveSpecTableData(){
        specTable.endEditing();
        var arr = $('#dg').datagrid('getData').rows;
        specTable.list = [];
        console.log('arr',arr);
        for (var i=0;i<arr.length;i++){
            var obj = arr[i];
            if(obj.salePrice == ''){
                alert("请填写销售规格“"+obj.name+"”的销售价");
                return;
            }else if(obj.costPrice == ''){
                alert("请填写销售规格“"+obj.name+"”的成本价")
                return;
            }else if(obj.marketPrice == ''){
                alert("请填写销售规格“"+obj.name+"”的市场价")
                return;
            }else if(obj.stock == ''){
                alert("请填写销售规格“"+obj.name+"”的库存数量")
                return;
            }
        }
        specTable.list = arr;
    }
    $(function () {
        $("#categoryTable1").datagrid({
            onCheck: function (index, row) {
                var rows = $('#categoryTable1').datagrid('getChecked');
                var pid = rows[0].id;
                for (var i = 1; i < rows.length; i++) {
                    pid = pid + ',' + rows[i].id;
                }
                var url = "${path}/category/getCategoryList?level=2&pid=" + pid;
                $('#categoryTable2').datagrid('reload', url);
            },
            onUncheck: function (rowIndex, rowData) {
                var rows = $('#categoryTable1 ').datagrid('getChecked');
                // alert(rows.length);
            }
        });
        $('#nextBtn').bind('click', function () {
            var rows = $('#categoryTable2 ').datagrid('getChecked');
            if(rows.length==0){
                return alert('请选择二级分类');
            }
            // alert(rows.length);
            Commodity.categoriesData = rows;
            console.log('rows', rows);
            $('#categoryPanel').parent().hide();
            $('#nextBtnDiv').hide();
        })
        $('#saveSpecTableBtn').bind('click', saveSpecTableData);
        updateSpecData();
        $('#desc-space-choose-btn').bind('click',function () {
            $('#space-window').window('open');
            imgsMgr.curSpecId = 'desc';
            $('.files-area').empty();
            imgsMgr.getServiceDir(imgsMgr.curDir);
        });
        imgsMgr.initDescUploadArea();

        $('#save-btn').bind('click',function () {
            Commodity.status = 1;
            saveCommodity();
        })
        $('#sale-save-btnn').bind('click',function () {
            Commodity.status = 2;
            saveCommodity();
        })

    })

    //获取销售属性
    function updateSpecData() {
        $.ajax({
            type: 'get',
            dataType: 'json',
            url: '${path}/commodityProp/propsJson',
            success: function (data, textStatus) {
                var arr = data;
                var checkbox = '';
                $.each(arr, function (n, item) {

                    var checked = Commodity.isCheckSpec(item.propNo) >= 0 ? 'checked="true"' : '';

                    checkbox = checkbox + '<div class="sale-spec-area"><input class="sale-spec-box" type="checkbox" ' + checked + ' name="spec" dataname="' + item.propName + '" value="' + item.propNo + '"  />' + '<span class="sale-spec-label">' + item.propName + '</span></div>';
                });
                checkbox = checkbox + '<div class="sale-spec-area"><span id="addSaleSpecBtn"  class="easyui-linkbutton btn" data-options="iconCls:\'icon-add\'">添加</span></div>';
                $("#sale-spec").empty();
                $('#sale-spec').append(checkbox);
                $("input[name='spec']").change(function () {
                    var propNo = $(this).val();
                    var propName = $(this).attr('dataname');
                    var isChecked = $(this).prop("checked");
                    var data = {propNo: propNo, propName: propName};
                    if (isChecked) {
                        Commodity.addSpec(data);
                        specTable.append(data);
                        imgsMgr.addUploadDiv(data);
                    } else {
                        Commodity.rmSpec(data);
                        specTable.removeRow(data);
                        imgsMgr.delUploadDivById(propNo);
                    }
                });

                $('#addSaleSpecBtn').bind('click', function () {
                    $.messager.prompt("添加销售规格", "请输入要添加的销售规格", function (name) {
                        if (name) {
                            $.ajax({
                                type: 'post',
                                dataType: 'json',
                                url: '${path}/commodityProp/add',
                                data: {propName: name, type: 1},
                                success: function (data, textStatus) {
                                    if (data.success) {
                                        updateSpecData();
                                    }
                                },
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                    alert('服务器内部错误');
                                }
                            });
                        }
                    });
                });

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert('服务器内部错误');
            }
        });
    }

    //保存商品
    function saveCommodity() {
        var name = $('#commodity-name').val();
        if(name.length<=1){
            return alert("请填写商品名称");
        }
        Commodity.name = name;
        Commodity.desc = $('#commodity-desc').val();
        Commodity.brand = $('#commodity-brand').val();
        var itemNo = $('#itemNo').val();
        if(itemNo.length<=1){
            return alert("请填写货号");
        }
        Commodity.itemNo = itemNo;
        if(!Commodity.checkCommitData()){
            return false;
        }
        var data = Commodity.getCommitData();
        var jsonData = JSON.stringify(data);
        alert(jsonData)
        console.log('add data',data);
        $.ajax({
            headers:{
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: 'POST',
            dataType: "json",
            data: jsonData,
            url: '${path}/commodity/add',
            success: function(result) {
                console.log('add data success',result);
                if (result.success) {
                    alert(result.msg);
                    //commodityDataGrid.datagrid('reload');
                }
                //progressClose();
            }

        })
    }

</script>