
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="bean.getpower"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Page_head.css" />
<link rel="stylesheet" type="text/css"
	href="Css/Public_Color/orange.css" />
</head>
<body>
	<%
		String ID = request.getParameter("ID");
	%>

	<div class="lead_whole_block middle-font">
		<div class="lead_box"></div>
		<ul class="sign_list" id="sign_list" >
			<form action="lead?page=1" method="post" id="pageform1">
				<input type="text" name="ID" value="<%=ID%>" style="display: none;">
				<li id="homepage"style="cursor:pointer;margin-left:2%;">
					<div class="lead_symble" >
						<img src="img/lead_photo/主页.png" style="width: 80%; height: 100%" />
					</div>
					<div style="height: 28px; line-height: 28px; width: 100%;">
						主页</div>
				</li>
			</form>
			<form action="lead?page=4" method="post" id="pageform4">
				<input type="text" name="ID" value="<%=ID%>" style="display: none;">
				<li id="message"style="cursor:pointer;">
					<div class="lead_symble" >
						<img src="img/lead_photo/消息.png" style="width:80%;"/>
					</div>
					<div style="height: 28px; line-height: 28px; width: 100%;">
						消息
					</div>
				</li>
			</form>
			<form action="lead?page=3" method="post" id="pageform3">
				<input type="text" name="ID" value="<%=ID%>" style="display: none;">
				<li id="score"style="cursor:pointer;">
					<div class="lead_symble">
						<img src="img/lead_photo/积分2.png" style="width:80%;"/>
					</div>
					<div style="height: 28px; line-height: 28px; width: 100%;">
						积分</div>
				</li>
			</form>
				<form action="lead?page=2" method="post" id="pageform2">
				<input type="text" name="ID" value="<%=ID%>" style="display: none;">
				<li id="assignment" style="cursor:pointer;">
					<div class="lead_symble">
						<img src="img/lead_photo/任务.png" style="width:80%;"/>
					</div>
					<div style="height: 28px; line-height: 28px; width: 100%;">
						任务</div>
				</li>
			</form>
			
			<form action="lead?page=5" method="post" id="pageform5">
				<input type="text" name="ID" value="<%=ID%>" style="display: none;">
				<li id="work"style="cursor:pointer;">
					<div class="lead_symble">
						<img src="img/lead_photo/作品.png" style="width: 85%; height: 110%" />
					</div>
					<div style="height: 28px; line-height: 28px; width: 100%;">
						作品</div>
				</li>
			</form>
			<form action="lead?page=6" method="post" id="pageform6">
				<input type="text" name="ID" value="<%=ID%>" style="display: none;">
				<li id="resuorce"style="cursor:pointer;">
					<div class="lead_symble">
						<img src="img/lead_photo/资源.png" style="width:60%;height:80%;margin-top:5px;"/>
					</div>
					<div style="height: 28px; line-height: 28px; width: 100%;">
						资源</div>
				</li>
			</form>
		<!--  
			<form action="lead?page=6" method="post" id="pageform6">
				<input type="text" name="ID" value="<%=ID%>" style="display: none;">
				<li id="question"style="cursor:pointer;">
					<div class="lead_symble">
						<img src="img/lead_photo/信封.png" style="width:80%;"/>
					</div>
					<div style="height: 28px; line-height: 28px; width: 100%;">
						反馈</div>
				</li>
			</form>
			-->
			<%
			getpower power=new getpower(ID);
			if(power.checkpower("9")){
			%>
			<form action="lead?page=7" method="post" id="pageform7">
				<input type="text" name="ID" value="<%=ID%>" style="display: none;">
				<li style="float: right;cursor:pointer;margin-right:2%;" id="lead_set">
					<div class="lead_symble">
						<img src="img/lead_photo/设置.png" style="width:80%;"/>
					</div>
					<div style="height: 28px; line-height: 28px; width: 100%;">
						设置</div>
				</li>
			</form>
			<%} %>
		</ul>
		
	</div>
	<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(192,192,192,0.5);z-index:2;width:100%;height:100%;display:none;">
    	    <div id="innerdiv" style="position:absolute;">
    	        <img id="bigimg" src="" />
    	    </div>
    	</div>
</body>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/loading.js"></script>
<script type="text/javascript" charset="utf-8">
$(document).ready(function () {
	var homepage = document.getElementById("homepage");
	homepage.onclick = function() {
		document.getElementById('pageform1').submit();
		console.log('ok');
		 imgShow("#outerdiv", "#innerdiv", "#bigimg","img/pet_photo/fox.gif");
		//window.location.href="lead?page=1";
	}

	var assignment = document.getElementById("assignment");
	assignment.onclick = function() {
		document.getElementById('pageform2').submit();
		 imgShow("#outerdiv", "#innerdiv", "#bigimg","img/pet_photo/fox.gif");
		 console.log('ok');
		//Document	="lead?page=2";
	}

	var score = document.getElementById("score");
	score.onclick = function() {
		document.getElementById('pageform3').submit();
		 imgShow("#outerdiv", "#innerdiv", "#bigimg","img/pet_photo/fox.gif");
		 console.log('ok');
		// window.location.href="lead?page=3";
	}

	var message = document.getElementById("message");
	message.onclick = function() {
		document.getElementById('pageform4').submit();
		 imgShow("#outerdiv", "#innerdiv", "#bigimg","img/pet_photo/fox.gif");
		 console.log('ok');
		// window.location.href="lead?page=4";
	}

	var work = document.getElementById("work");
	work.onclick = function() {
		document.getElementById('pageform5').submit();
		 imgShow("#outerdiv", "#innerdiv", "#bigimg","img/pet_photo/fox.gif");
		 console.log('ok');
		// window.location.href="lead?page=5";
	}
	var work = document.getElementById("resuorce");
	work.onclick = function() {
		document.getElementById('pageform6').submit();
		 imgShow("#outerdiv", "#innerdiv", "#bigimg","img/pet_photo/fox.gif");
		 console.log('ok');
		// window.location.href="lead?page=5";
	}
	//var question = document.getElementById("question");
	//question.onclick = function() {
		//document.getElementById('pageform6').submit();
		//window.location.href="lead?page=6";
	//}

	var set = document.getElementById("lead_set");
	set.onclick = function() {
		document.getElementById('pageform7').submit();
		 imgShow("#outerdiv", "#innerdiv", "#bigimg","img/pet_photo/fox.gif");
		 console.log('ok');
		//window.location.href="lead?page=7";
	}
});
</script>
</html>