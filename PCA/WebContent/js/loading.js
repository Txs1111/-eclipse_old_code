/**
 * 
 */
function imgShow(outerdiv, innerdiv, bigimg,src) {
		$(bigimg).attr("src", src);//设置#bigimg元素的src属性  

		/*获取当前点击图片的真实大小，并显示弹出层及大图*/
		$("<img/>").attr("src", src).load(function() {
			var windowW = $(window).width();//获取当前窗口宽度  
			var windowH = $(window).height();//获取当前窗口高度  
			var realWidth = this.width-300;//获取图片真实宽度  
			var realHeight = this.height-300;//获取图片真实高度  
			var imgWidth, imgHeight;
			var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放  

			if (realHeight > windowH * scale) {//判断图片高度  
				imgHeight = windowH * scale;//如大于窗口高度，图片高度进行缩放  
				imgWidth = imgHeight/realHeight*realWidth;
				if (imgWidth > windowW * scale) {//如宽度扔大于窗口宽度  
					imgWidth = windowW * scale;//再对宽度进行缩放  
				}
			} else if (realWidth > windowW * scale) {//如图片高度合适，判断图片宽度  
				imgWidth = windowW * scale;//如大于窗口宽度，图片宽度进行缩放  
				imgHeight = imgWidth/realWidth*realHeight;
			} else {//如果图片真实高度和宽度都符合要求，高宽不变  
				imgWidth = realWidth;
				imgHeight = realHeight;
			}
			$(bigimg).css("width", imgWidth);//以最终的宽度对图片缩放  

			var w = (windowW - imgWidth)/2;
			var h = (windowH - imgHeight)/2;
			$(innerdiv).css({
				"top" :h,
				"left" :w
			});//设置#innerdiv的top和left属性  
			$(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg  
		});
	}