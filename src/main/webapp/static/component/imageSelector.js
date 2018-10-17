var ImageSelector={
	open:function(options,callback){
		var defaults = {
        	title:'图片选择器',
        	width:1050,
        	height:640,
        	closabled:true,
        	url:'/component/queryImageList.sc?imgType='+options
	    };
		var opts = $.extend(defaults, options);
		// 弹出内容框
    	openwindow(opts.url,opts.width,opts.height,opts.title,function(){
	    	// 获取内容体
	    	var document = this.iframe.contentWindow.document;
	    	// 通过约定格式获取选定数据
	    	var str="";
			str='[';
			var tb=$(document.getElementById("tbody"));
			var checkObj=tb.find(":radio:checked");
			checkObj.each(function(index, element) {
			   str+='{';
			   var vals=$(this).val().split(';');
			   var val="";
			   for(var i=0;i<vals.length;i++)
			   {
				   val='"imgName":"'+vals[0]+'","id":"'+vals[1]+'"';  
			   }
			   str+=val+'}';
			   if(index!=checkObj.length-1)
			   	{
					str+=',';
				}
	        });
			str+=']';
		
	    	// 调用回调函数
	    	callback(eval(str));
	    	
	    	// 关闭弹出框
	    	if(opts.closabled){
	    		this.close();
	    	}
	    	
			return false;
	    });
	}
};