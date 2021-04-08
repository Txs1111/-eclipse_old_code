<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>反馈</title>
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<link href="Css/Public_style.css" rel="stylesheet" />
</head>
<%@ page import="bean.*" import="java.util.Random"%>
<%
	String ID = (String) request.getSession().getAttribute("ID");
	String ifsuccess = null;
	if (request.getAttribute("ID") != null) {//toHomepage.java页面传来的request
		ifsuccess = (String) request.getAttribute("ifsuccess");
	} //获取登录用户的ID
	if (request.getAttribute("ifsuccess") != null) {//toHomepage.java页面传来的request
		ifsuccess = (String) request.getAttribute("ifsuccess");
	}
	 if(request.getParameter("ifsuccess")!=null)
	{
			ifsuccess=request.getParameter("ifsuccess");
	}
	if (request.getParameter("ID") != null) {//通过form表单传递数据过来
		ID = (String) request.getParameter("ID");
	} //获取登录用户的ID
	request.getSession().setAttribute("ID", ID);//设置页面session对象中的ID
	request.setCharacterEncoding("UTF-8"); //或者指定的编码(GBK或其他)	 
	Homepage_bean bean = new Homepage_bean(ID); //加载Homepage页面各模块的数据
	String apart = bean.apartment(); //获取部门数据返回值
	String sins[] = bean.get_content(); //加载并提取宠物对话数据
	bean.head(); //运行方法 加载头模块数据	
	String role = bean.role;
%>
<style>
.feedback {
	width: 75%;
	height: 500px;
	margin: 0 auto;
}

.feedback .top {
	height: 50px;
	width: 100%;
	float: left;
}

.feedback .top .fk {
	float: left;
}

.feedback .top .return {
	float: right;
}

.feedback .text {
	width: 100%;
	float: left;
	height:650px;
}

.textarea {
	margin-left:8%;
	width: 84%;
	height: 500px;
	font-size: 20px;
	background-color:#6F9C98;
	color:white;
	float:left;
	border-radius:6px;
	border: 6px solid #BCAE89;
}

.textarea  textarea{
	outline:medium;
	resize: none;
	border: 0px;
	width:80%;
	height:240px;
	overflow-y:auto;
	margin-left:10%;
	margin-top:120px;
	color:white;
	background-color: #A9BDB8;
	font-size:20px;
}

.feedback .text button {
	width: 85.2%;
	height: 50px;
	border : 0;
	color:white;
	margin-top:2px;
	background-color:#BCAE89;
	border-radius:6px;
	margin-left:8%;
	font-size:20px;
}	
.bigti {
   height: 30px;
    width: 100%;
    line-height: 30px;
    margin-top:px;
    background-color: #FAFAFA;
    border-bottom: 1px solid #E5E9EF;
    float: left;
}
.back_button{
	border:0;
	outline:none;
	cursor:pointer;
}
.line_over{
	width:1%;
	height:40px;
	background-color: grey;
	margin:0 auto;
}
.lineover_block{
	width:50%;
	height:40px;
	float:left
}
</style>

<body bgcolor="#F4F5F7">
	<!-- 季节模块 -->
	<jsp:include page="season.jsp"></jsp:include>

	<!-- 头模块 -->
	<jsp:include page="head.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
		<jsp:param value="<%=role%>" name="role" />
		<jsp:param value="<%=bean.level%>" name="level" />
		<jsp:param value="<%=bean.nickiname%>" name="nickiname" />
		<jsp:param value="<%=bean.sign%>" name="sign" />
		<jsp:param value="<%=bean.background%>" name="background" />
		<jsp:param value="<%=bean.headphoto%>" name="headphoto" />
	</jsp:include>
	<div class="feedback">
		<div class="bigti middle-font font-normal-color">
				<div style="background-color: #FAFAFA;float:left;"  >&nbsp;&nbsp;┃&nbsp;反馈</div>
				<div style="background-color: #FAFAFA;float:right; width:35%"  >
				<img  src="img/lead_photo/返回.png"style="width:30px;height:25px;float:right;margin-right:1%;">
				<form method="post" action="Homepage.jsp"><button class="middle-font font-light-color back_button" value="<%=ID%>" name="ID" style="margin-right:1%;float:right;background-color: #FAFAFA" >返回主页</button></form>
				</div>
		</div>
		<div class="text dinylight-color">
		<div class="lineover_block">
		<div class="line_over">
		
		</div>
		</div>
		<div class="lineover_block">
		<div class="line_over">
		
		</div>
		</div>
		<form action="toFeedback"method="post">
			<input name="ID" value=<%=ID%> style="display:none;">
			<div id="sign_line" style="position: absolute;width:40%;height:200px;margin-left:17%;margin-top:120px;color:white;font-size:15px;;text-align: center;"><br/><br/><br/><br/><br/><br/>点击这里提出你的宝贵意见 :)<br/><br/>以帮助我们改善和提高网站质量~</div>
			<div class="textarea">
				<textarea  name="text" id="jonana" style="display:none;"></textarea>
			</div>
			<button>提交</button>
		</form>
		</div>

	</div>
	<div style="height:60px;float:left;width:100%;"></div>
	<input value="<%=ifsuccess%>" style="display:none" id="ifsuccess"/>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
	if($('#ifsuccess').val()=="1"){
		alert('反馈成功~');
	}
	$('.textarea').css('cursor','pointer');
	$('#sign_line').css('cursor','pointer');
	$('.textarea').click(function(){
		$('#sign_line').css('cursor','default');
		$(this).css('cursor','default');
		$('#sign_line').css('display','none');
		$('#jonana').css('display','block');
	});
	$('#sign_line').click(function(){
		$('#sign_line').css('cursor','default');
		$(this).css('cursor','default');
		$('#sign_line').css('display','none');
		$('#jonana').css('display','block');
	});
</script>