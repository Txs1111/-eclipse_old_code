
<%
	/*------------------------------------------------------------------------------------------------
	* 修改人			     
	* 修改时间 		
	* 修改
	* 版本号2.0
	* -------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.*" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<link href="Css/Public_style.css" rel="stylesheet" />
<link href="Css/Homepage.css" rel="stylesheet" />
<style>
.imgs {
	height: 120px;
	width: 32%;
	float: left;
	margin-left: 1%;
	overflow: hidden;
}

.left_photo {
	border-top-left-radius: 16px;
	border-bottom-left-radius: 16px;
}

.right_photo {
	border-top-right-radius: 16px;
	border-bottom-right-radius: 16px;
}

.two_photo {
	height: 129px;
	width: 48.5%;
	float: left;
	margin-left: 1%;
	overflow: hidden;
}

.one_photo {
	height: 129px;
	border-radius: 16px;
	width: 98%;
	float: left;
	margin-left: 1%;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="dynamic_body_block">
		<%
			String ID = request.getParameter("ID");//接收从Homepage.jsp页面form中传过来的ID
			//String ID = (String) request.getSession().getAttribute("ID");//接收session中的ID
			//System.out.println("#############dynamic.jsp：" + ID);
			dynamicDao dynamic = new dynamicDao();//创建dynamicDao对象，以便使用dynamicDao中的方法
			Message dmessage = dynamic.data();//创建一个message对象，接收dynamicDao中的获取所有数据的方法
			Message head_message = dynamic.data();//创建一个message对象（头结点），取出所有图片
			int times = 4;//动态条数
		%>
		<form action="dynamic_details.jsp" method="post" name="form_ID">
			<input type="text" name="ID" value="<%=ID%>" style="display: none;">
		</form>
		<!-- form表单传值 -->
		<%
			/* System.out.println("dynamic.jsp dmessage.head_photo：" + dmessage.head_photo); */
			for (int detaile_number = 1; detaile_number <= times; detaile_number++) {//循环打印动态消息
		%>
		<div id="tidings">
			<div id="tidings_left">
				<div id="img">
					<img src="img/head_photo/<%=dmessage.head_photo%>.jpg"
						style="margin-top: 15px; borde r-radius: 25px; margin-left: 15px;"
						class="small_head_photo">
				</div>
				<div id="name">
					<font class="small-font" id="samll-B"><%=dmessage.nickiname%></font><br />
					<a> <font class="small-font"><%=dmessage.title%></font>
					</a>

				</div>
				<div id="detail">
					<div id="detail_photo"></div>
					<div id="detail_text">
						<%
							request.getSession().setAttribute("head_message", head_message);
						%>
						<%-- <a href="dynamic_details.jsp?detaili=<%=detaile_number%>"><font
							style="color: #bfbfbf;">详细</font></a> --%>

					</div>
				</div>

			</div>
			<div id="tidings_right">
				<div class="dynamic_content_new dinylight-color"
					style="border-radius: 1px;">
					<font><%=dmessage.content%></font>
					<div class="dynamic_content_img">
						<%
							//for (int i = 0; i < dynamic.getAllphotourl(dmessage).size(); i++) {
								switch (dynamic.getAllphotourl(dmessage).size()) {
									case 3 :
						%>
						<div style="width: 100%; height: 200px;">
							<div class="imgs left_photo">
								<img src="<%=dynamic.getAllphotourl(dmessage).get(0)%>"
									style="object-fit: cover; width: 100%; height: 100%;"
									class="pimg">
							</div>
							<div class="imgs">
								<img src="<%=dynamic.getAllphotourl(dmessage).get(1)%>"
									style="object-fit: cover; width: 100%; height: 100%;"
									class="pimg">
							</div>
							<div class="imgs right_photo">
								<img src="<%=dynamic.getAllphotourl(dmessage).get(2)%>"
									style="object-fit: cover; width: 100%; height: 100%;"
									class="pimg">
							</div>
						</div>
						<%
							break;
									case 2 :
						%><div
							style="width: 100%; height: 200px;">
							<div class="two_photo left_photo">
								<img src="<%=dynamic.getAllphotourl(dmessage).get(0)%>"
									style="object-fit: cover; width: 100%; height: 100%;"
									class="pimg">
							</div>
							<div class="two_photo right_photo">
								<img src="<%=dynamic.getAllphotourl(dmessage).get(1)%>"
									style="object-fit: cover; width: 100%; height: 100%;"
									class="pimg">
							</div>
						</div>
						<%
							break;
									case 1 :
						%>
						<div style="width: 100%; height: 200px;">
							<div class="one_photo">
								<img src="<%=dynamic.getAllphotourl(dmessage).get(0)%>"
									class="pimg"
									style="object-fit: cover; width: 100%; height: 100%;">
							</div>
						</div>
						<%
							break;
								}
						%>

					</div>
				</div>
				<div id="function">
					<div id="time">
						<font id="samll"><%=dmessage.psotdate%></font>
					</div>
					<div id="like">
						<img src="img/example/点赞.png" id="good"> <font id="samll"><%=dmessage.like%></font>
					</div>
				</div>
			</div>
		</div>
		<div id="outerdiv_1" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
	    <div id="innerdiv_1" style="position:absolute;">
	        <img id="bigimg_1" style="border:1px solid #fff;" src="" />
	    </div>
	</div>
		<!-- ######################################################## -->
		<%
			dmessage = dmessage.next;//定位到下一个对象
			}
		%>

	</div>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$(".pimg").click(function() {
			var _this = $(this);//将当前的pimg元素作为_this传入函数  
			imgShow_1("#outerdiv_1", "#innerdiv_1", "#bigimg_1", _this);
		});
	});

	function imgShow_1(outerdiv, innerdiv, bigimg, _this) {
		var src = _this.attr("src");//获取当前点击的pimg元素中的src属性  
		$(bigimg).attr("src", src);//设置#bigimg元素的src属性  

		/*获取当前点击图片的真实大小，并显示弹出层及大图*/
		$("<img/>").attr("src", src).load(function() {
			var windowW = $(window).width();//获取当前窗口宽度  
			var windowH = $(window).height();//获取当前窗口高度  
			var realWidth = this.width;//获取图片真实宽度  
			var realHeight = this.height;//获取图片真实高度  
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

		$(outerdiv).click(function() {//再次点击淡出消失弹出层  
			$(this).fadeOut("fast");
		});
	}
</script>
