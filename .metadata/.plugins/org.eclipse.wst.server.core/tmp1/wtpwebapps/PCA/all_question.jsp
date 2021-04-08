
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全部问题</title>
<link rel="stylesheet" type="text/css" href="./Css/question.css" />
<link rel="stylesheet" type="text/css" href="./Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="./Css/Public_Color/orange.css" />
</head>
<body>
	<div id="tidings">
		<div id="tidings_left">
			<div id="img">
				<img src="img/example/unbrella.jpg" style="margin-top: 15px; border-radius: 25px; margin-left: 15px;" class="small_head_photo">
			</div>
			<div id="name">
				<font class="small-font" id="samll-B">计算机协会官方</font>
				<br />
				<a>
					<font class="small-font">！！欢度元旦！！</font>
				</a>

			</div>
			<div id="detail">
				<div id="detail_photo">
					<img src="img/lead_photo/details.png" style="width: 100%; height: 100%;" />
				</div>
				<div style="margin-top: 8px;" id="detail_text">
					<font>详细</font>
				</div>
			</div>

		</div>
		<div id="tidings_right">
			<div class="dynamic_content_new dinylight-color" style="border-radius: 1px;">内容</div>
			<div id="function">
				<div id="time">
					<font id="samll">2020-12-13</font>
				</div>
				<div id="like">
					<img src="img/example/点赞.png" id="good">
					<font id="samll">10</font>
				</div>
				<div id="like">
					<img src="img/example/收藏.png" id="good">
					<font id="samll">22</font>
				</div>

			</div>
		</div>
	</div>


	<!--评论模块 -->
	<div class="questions_right">
		<div class="comm_block">
			<div id="comm_img">
				<img src="img/example/shark.jpg" style="margin-top: 15px; border-radius: 25px; margin-left: 15px;" class="small_head_photo">
			</div>
			<div id="comm_name">
				<font class="small-font">NFR-155565</font>
			</div>
			<div id="comm_data">
				<font id="samll">2020-12-13</font>
			</div>
			<div id="comm_content" class="dinylight-color">
				<font class="small-font">ababa</font>
			</div>
		</div>
	</div>

	<div id="tidings">
		<div id="tidings_left">
			<div id="img">
				<img src="img/example/unbrella.jpg" style="margin-top: 15px; border-radius: 25px; margin-left: 15px;" class="small_head_photo">
			</div>
			<div id="name">
				<font class="small-font" id="samll-B">计算机协会官方</font>
				<br />
				<a>
					<font class="small-font">！！欢度元旦！！</font>
				</a>

			</div>
			<div id="detail">
				<div id="detail_photo">
					<img src="img/lead_photo/details.png" style="width: 100%; height: 100%;" />
				</div>
				<div style="margin-top: 8px;" id="detail_text">
					<font>详细</font>
				</div>
			</div>

		</div>
		<div id="tidings_right">
			<div class="dynamic_content_new dinylight-color" style="border-radius: 1px;">内容</div>
			<div id="function">
				<div id="time">
					<font id="samll">2020-12-13</font>
				</div>
				<div id="like">
					<img src="img/example/点赞.png" id="good">
					<font id="samll">10</font>
				</div>
				<div id="like">
					<img src="img/example/收藏.png" id="good">
					<font id="samll">22</font>
				</div>

			</div>
		</div>
	</div>


	<!--评论模块 -->
	<div class="questions_right">
		<div class="comm_block">
			<div id="comm_img">
				<img src="img/example/shark.jpg" style="margin-top: 15px; border-radius: 25px; margin-left: 15px;" class="small_head_photo">
			</div>
			<div id="comm_name">
				<font class="small-font">NFR-155565</font>
			</div>
			<div id="comm_data">
				<font id="samll">2020-12-13</font>
			</div>
			<div id="comm_content" class="dinylight-color">
				<font class="small-font">ababa</font>
			</div>
		</div>
	</div>
	<div class="turnpage-conntrol light-color">
		<div class="turnpage-foin">
			<button class="turnpage-number small-font font-normal-color" style="width: 9%;">
				<font class="small-font">首页</font>
			</button>
			<button class="turnpage-number small-font font-normal-color">
				<font class="small-font">上一页</font>
			</button>
			<div class="turnpage-turn font-normal-color">
				<font class="small-font">第1页/共6页</font>
			</div>
			<div class="turnpage-turn font-normal-color">
				<select style="float: left; border: 0; margin-top: 9px; margin-left: 7%;" class="font-normal-color small-font">
					<option value="1" />
					第1页
					</option>
					<option value="2" />
					第2页
					</option>
					<option value="3" />
					第3页
					</option>
				</select>
				<button class="turnpage-number small-font font-normal-color" style="width: 40%;">
					<font class="small-font">▶</font>
				</button>
			</div>

			<button class="turnpage-number small-font font-normal-color">
				<font class="small-font">下一页</font>
			</button>
			<button class="turnpage-number small-font font-normal-color" style="width: 9%;">
				<font class="small-font">尾页</font>
			</button>

		</div>
	</div>


</body>
</html>