<%
/*------------------------------------------------------------------------------------------------
修改人				     
修改时间		2021-1-19
修改内容		完善后台
版本号		1.1.1
-------------------------------------------------------------------------------------------------*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>计算机协会</title>
 <link href="Css/Public_Color/orange.css" rel="stylesheet" />
    <link href="Css/Public_style.css" rel="stylesheet" />
    <link href="Css/Login.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="Css/htmleaf-demo.css">
		<link rel="stylesheet" type="text/css" href="Css/verify.css">
</head>
<body>
<div style="width:100%;height:1020px;overflow:hidden;background-image: url(img/background-photo/login.png);background-repeat:no-repeat;">
    <div class="login_mokuai">
		<%request.setCharacterEncoding("UTF-8");
			String alter=(String)request.getAttribute("alter");
			if("1".equals(alter)){
				out.println("<script>window.alert('登录信息过期！请重新登陆！');</script>");
			}else if("2".equals(alter)){
				out.println("<script>window.alert('搞事情？老老实实登录好吧！');</script>");
			}
			String passwrong="";
			String tips=(String)request.getAttribute("tips");
		 	if ("passwrong".equals(tips)) {
				passwrong = "密码错误";
			} else if ("nouser".equals(tips)) {
				passwrong = "用户不存在 ";
			}
		%>
			<!-- 背景区块  -->
            <div class="body_div">			
				<!-- 顶在上面负责调整登录位置的div  -->
				<div class="position_block"></div>
				<!-- 登录卡片 -->
				<div class="check_div">
					
					<div>					
						<div class="ahead_sign_area">
							<div class="ahead_sign">
								<img src="img/season/ahead_blue.jpg" style="height:110%;width: 100%;"/> 
							</div>
						</div>
					</div>
					
					<!-- 登录主体 -->
					<div class="check_body">
						<div class="sign_borderline"></div>
						<!-- 提示标语tips -->
						<div class="tips" ><%=passwrong %> </div>
						<div class="check_form">
							<!-- 表单提交区域 -->
							<form action="Login" method="POST" id="sub">
									<input class="user_input" name="ID" type="text" placeholder="  请输入用户名">
									<input class="psw_input" name="password" type="password" placeholder="  请输入密码">
									<%/* 
									<input class="test_input" name="Testcode" type="text" placeholder="  请输入验证码" id="test_context">
									<div class="Testpc_area" id="view"></div>
									<div class="Testline_area">看不清？点击图片切换</div>
									 */%>
									 <div id="mpanel1" style="width: 100%;margin-top: 30px;margin-left:9%"></div>
									 	<input class="submit_input light-color uncheck" type="button" value="登录" id="check"style="cursor:pointer;">
							</form>	
										
						</div>
					</div>
					<div class="check_tail">
						<div style="margin: 0 auto;width:10%;height:20px;margin-top:17px;">
						<form action="toregister_Servlet" method="post">
							<input type="submit" value="注册" style="cursor:pointer;border:0;outline: none;magrin:0 auto;color:lightblue;background-color: #F7F7F7" >
						</form>	
						</div>	
					</div>
				</div>	
			
				<div style=" width: 75%;margin:0 auto; height: 75px;color:white;margin-top:150px;" align="center">
					<ul class="footer-b">
					<li style=" font-size:15px;list-style: none;">Copyright&nbsp;©2020计算机协会&nbsp;&nbsp;&nbsp;</li>
					<li style="color:white;font-size:15px;list-style: none;"><a href="https://beian.miit.gov.cn/" target="_blank">
							<font color="white">&nbsp;&nbsp;赣ICP备2020015014号-1&nbsp;&nbsp;</font>
						</a>
					</li>
					<li style=" font-size:15px;list-style: none;">
						作者:许良&nbsp;刘军&nbsp;王旭升&nbsp;谭炳昊
					</li>
					
					</ul>
				</div>
			</div>
			
    </div>
    
    </div>
        <div id="outerdiv" style="position:fixed;top:0;left:0;opz-index:2;width:100%;height:100%;display:none;background:rgba(192,192,192,0.5);">
    	    <div id="innerdiv" style="position:absolute;">
    	        <img id="bigimg" src="" />
    	    </div>
    	</div>
    	
</body>
</html>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/verify.js"></script>
<script src="js/loading.js"></script>
<script src="js/verify.min.js"></script>

<script type="text/javascript">
$(function(){
	var ifcheck = '0';
	$('#check').click(function(){
		if($('#check').hasClass("uncheck")){
		alert('请先完成滑块验证~');
		}
	});
	$('#mpanel1').slideVerify({
		type : 1,
		vOffset : 5,
		barSize : {
			width : '79%',
			height : '30px',
		},
		ready : function(){
			
		},
		success : function(){
			$('#check').removeClass("uncheck");
			$('#check').attr("type","submit");
		},
		error : function(){
			
		}
	});
	
	 $('#sub').submit(function(){
		 imgShow("#outerdiv", "#innerdiv", "#bigimg","img/pet_photo/fox.gif");
	 });
	
});		
</script>