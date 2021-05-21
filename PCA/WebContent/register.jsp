<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>计算机协会注册</title>
<link rel="stylesheet" type="text/css" href="Css/Login.css" />

</head>

<body style="background-image: url(img/background-photo/login.png);">
	<div style="width: 100%; height: 800px; overflow: hidden;">
		<div class="registerCheck_div">

			<%
				request.setCharacterEncoding("UTF-8");
				String color = "grey";
				int size = 1;
				String passwrong = "";
				String tips = (String) request.getAttribute("tips");
				System.out.println("tips" + tips);
				if ("wrong".equals(tips)) {
					color = "red";
					size = 2;
				} else if ("passwrong".equals(tips)) {
					passwrong = "两次密码不一致";
				} else if ("sameaccount".equals(tips)) {
					passwrong = "账号已被注册 ";
				} else if ("infwrong".equals(tips)) {
					passwrong = "信息未填完整 ";
				}
			%>
			<div class="rigister_tittle">
				<div class="ahead_sign">
					<img src="img/season/ahead_blue.jpg" style="height: 100%; width: 100%;" />
				</div>
				<div class="sign_borderline"></div>
			</div>

			<div class="rigister_background" align="center">
				<form action="register_servlet" method="post" id="sub">
					<div style="width: 100%; height: 20px; margin-top: 20px;" align="center">
						<font size='<%=size%>' color='<%=color%>'>账号密码长度不得低于八位</font>
					</div>
					<input type="text" class="rigister_inputs" name="account" placeholder="  请输入用户名(推荐使用学号)" />
					<div style="width: 100%; height: 20px; line-height: 20px;" align="center">
						<font id="tips" size="1" color="gray"><%=passwrong%></font>
					</div>
					<input type="password" class="rigister_inputs" name="password" placeholder="  请输入密码" />
					<input type="password" class="rigister_inputs" name="repassword" placeholder="  确认密码" />
					<input type="text" class="mess_input" name="username" style="margin-left: 11%;" placeholder="  姓名" />
					<input type="text" class="mess_input" name="school_ID" placeholder="  学号" />
					<input type="text" class="mess_input" name="clas" style="margin-left: 11%;" placeholder="  班级" />
					<div class="mess_input_div" style="color: grey; text-align: left; line-height: 30px">
						<font style="font-size: 13px">&nbsp;&nbsp;部门&nbsp;&nbsp;&nbsp;</font>
						<select style="border: 0; font-size: 13px;" name="apartment">
							<option value="0">无部门</option>
							<option value="1">活动部</option>
							<option value="3">外联部</option>
							<option value="6">财务部</option>
							<option value="5">运营部</option>
							<option value="2">宣传部</option>
						</select>
					</div>
					<input class="rigister_test_input" name="Testcode" type="text" placeholder="  请输入验证码" id="test_context">
					<div class="rigister_Testpc_area" id="view"></div>
					<div class="Testline_area">看不清？点击图片切换</div>
					<input type="button" id="check" class="rigister_button" style="cursor: pointer; margin-right: 9%; margin-left: 3%; float: right;" value="注册">
				</form>
				<form action="index.jsp" method="post" style="magin-top: 10px;">
					<button type="submit" class="rigister_button" style="cursor: pointer; float: right; background-color: #84BFD9; font-size: 15px; margin-left: 11%;">
						已有账号
						<br />
						直接登录
					</button>
				</form>

				<div style="width: 75%; margin: 0 auto; height: 80px; color: white; margin-top: 220px;" align="center">
					<ul class="footer-b">
						<li style="font-size: 15px; list-style: none;">Copyright&nbsp;©2020计算机协会&nbsp;&nbsp;&nbsp;</li>
						<li style="color: white; font-size: 15px; list-style: none;">
							<a href="https://beian.miit.gov.cn/" target="_blank">
								<font color="white">&nbsp;&nbsp;赣ICP备2020015014号-1&nbsp;&nbsp;</font>
							</a>
						</li>
						<li style="font-size: 15px; list-style: none;">作者:许良&nbsp;刘军&nbsp;王旭升&nbsp;谭炳昊</li>

					</ul>
				</div>
			</div>
			<div class="check_tail"></div>


		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="js/gVerify.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" charset="UTF-8">
	var verifyCode = new GVerify({
		id : "view",
		type : "blend"
	})
	document.getElementById("check").onclick = function() {
		var res = verifyCode
				.validate(document.getElementById("test_context").value);
		if (res) {
			document.getElementById('sub').submit()
		} else {
			alert("验证码错误");
		}

	}
</script>