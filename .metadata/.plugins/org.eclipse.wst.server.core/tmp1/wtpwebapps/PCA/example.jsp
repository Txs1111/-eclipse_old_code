
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>示例页面</title>、
<link rel="stylesheet" type="text/css"
	href="Css/Public_Color/orange.css" />
<%
	String col = request.getParameter("colors");
	if (col == null || col.equals("")) { //安全设置
%><link href="<%=request.getContextPath()%>/Css/Public_Color/blue.css"
	rel="stylesheet">
<%
	} else {
		try {
%><link
	href="<%=request.getContextPath()%>/Css/Public_Color/<%=col%>.css"
	rel="stylesheet">
<%
	} catch (Exception e) {

		}

	}
%>
<link href="<%=request.getContextPath()%>/Css/Public_style.css"
	rel="stylesheet">
</head>
<body bgcolor="#F4F5F7">
	<font class="big-font">标题字</font>
	</br>
	<font class="small-font">内容字</font>
	</br>
	<font class="middle-font">标签/目录字</font>
	</br>

	<img src="img/example/unbrella.jpg" class="head_photo" />
	<img src="img/example/shark.jpg" class="head_photo" />
	<div
		style="width: 84%; height: 300px; border: 1px solid red; margin: 0 auto; margin-top: 200px;">

		<div
			style="width: 40%; height: 210px; float: left; margin: 0 auto; margin-top: 20px; margin-left: 20px;">
			<div class="dark-color big-font-B"
				style="width: 100%; height: 50px; text-align: center; float: left; line-height: 50px;">大西八模块
			</div>
			<div class="light-color"
				style="width: 100%; height: 40px; text-align: center; float: left; line-height: 40px;">西八模块1
			</div>
			<div class="normal-color"
				style="width: 100%; height: 40px; text-align: center; float: left; line-height: 40px;">西八模块2
			</div>
			<div class="light-color"
				style="width: 100%; height: 40px; text-align: center; float: left; line-height: 40px;">西八模块3
			</div>
			<div class="normal-color"
				style="width: 100%; height: 40px; text-align: center; float: left; line-height: 40px;">西八模块4
			</div>
		</div>

		<form action="example.jsp">
			<select name="colors">
				<option value="blue">蓝色
				<option value="pink">粉色
				<option value="orange">橙色
				<option value="yellow">黄色
				<option value="red">红色
				<option value="black">黑色
				<option value="green">绿色
			</select> <input type="submit" value="确定">
		</form>
	</div>

	<div
		style="width: 84%; height: 300px; border: 1px solid red; margin: 0 auto; margin-top: 200px;">
		<!--标题 -->
		<div class="big-tittle big-font">&nbsp;┃&nbsp;我是大标题</div>
		<div class="small-tittle normal-font">&nbsp;┃&nbsp;我是小标题</div>

		<!--翻页模块 -->
		<div class="turnpage-conntrol light-color">
			<div class="turnpage-foin">
				<button class="turnpage-number small-font font-normal-color"
					style="width: 9%;">
					<font class="small-font">首页</font>
				</button>
				<button class="turnpage-number small-font font-normal-color">
					<font class="small-font">上一页</font>
				</button>
				<div class="turnpage-turn font-normal-color">
					<font class="small-font">第1页/共6页</font>
				</div>
				<div class="turnpage-turn font-normal-color">
					<select
						style="float: left; border: 0; margin-top: 9px; margin-left: 7%;"
						class="font-normal-color small-font">
						<option value="1" />第1页
						</option>
						<option value="2" />第2页
						</option>
						<option value="3" />第3页
						</option>
					</select>
					<button type="submit"
						class="turnpage-number small-font font-normal-color"
						style="width: 20%;">
						<font class="small-font">▶</font>
					</button>
				</div>

				<button class="turnpage-number small-font font-normal-color">
					<font class="small-font">下一页</font>
				</button>
				<button class="turnpage-number small-font font-normal-color"
					style="width: 9%;">
					<font class="small-font">尾页</font>
				</button>

			</div>
		</div>


		<!--搜索模块 -->
		<div class="search ">
			<div class="search-block">
				<div class="search-symble">
					<img src="img/lead_photo/搜索.png" style="width: 110%; height: 110%;" />
				</div>
				<div class="search-form">
					<form>
						<input type="text" style="width: 83.5%; height: 25px;" /> <input
							type="submit" class="check_button normal-color" value="搜索" />
					</form>
				</div>
			</div>
		</div>

		<div style="width: 100%; height: 250px;"></div>
		<!--消息样式 -->
		<div id="Message_head"></div>
		<div id="tidings">
			<div id="tidings_left">
				<div id="img">
					<img src="img/example/unbrella.jpg"
						style="margin-top: 15px; border-radius: 25px; margin-left: 15px;"
						class="small_head_photo">
				</div>
				<div id="name">
					<font class="small-font" id="samll-B">计算机协会官方</font><br /> <a>
						<font class="small-font">！！欢度元旦！！</font>
					</a>

				</div>
				<div id="detail">
					<div id="detail_photo">
						<img src="img/lead_photo/details.png"
							style="width: 100%; height: 100%;" />
					</div>
					<div id="detail_text">
						<font>详细</font>
					</div>
				</div>

			</div>
			<div id="tidings_right">
				<div class="dynamic_content_new dinylight-color"
					style="border-radius: 1px;">内容</div>
				<div id="function">
					<div id="time">
						<font id="samll">2020-12-13</font>
					</div>
					<div id="like">
						<img src="img/example/点赞.png" id="good"> <font id="samll">10</font>
					</div>

				</div>
			</div>
		</div>


		<!-- 按钮样式 -->
		<div id="submit" class="normal-color">
			<a href="#" id="url"><font class="small-font-B" color="#ffffff">提交</font></a>
		</div>
	</div>
</body>
</html>