<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.MySQL_connect" import="bean.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>个人主页</title>
	</head>
	<link rel="stylesheet" type="text/css" href="Css/Message.css" />
	<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
	<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
	<link rel="stylesheet" type="text/css" href="Css/Homepage.css" />
	<style type="text/css">
		iframe {
			border: 0px solid white;
		}

		.change_style {
			position: absolute;
			width: 6%;
			border-bottom-right-radius: 6px;
			border-bottom-left-radius: 6px;
			background-color: #FFCAB0;
			;
		}
	</style>
	<body>
		<%	
		String ID=(String)request.getSession().getAttribute("ID");		
		user_personal_homepage_bean bean=new user_personal_homepage_bean(ID);
		String opennew=request.getParameter("opennew");	
		if(!"".equals(opennew)&&!"null".equals(opennew)&&opennew!=null){
			bean.openblock(opennew);
		}
		%>
		<div style="width:100%;height:210px;background-color:blue;float:left;">
			<jsp:include page="user_personal_head.jsp">
				<jsp:param value="<%=ID %>" name="ID" />
			</jsp:include>
		</div>
		<div style="width:100%;height:50px;float:left;margin-bottom:5px;margin-top:5px;" class="light-color">
			<form action="user_personal_card_write.jsp" method="post" style="width:10%;height:100%;margin-left:0.5%;float:left;">
				<button style="color:#FFA980;border-radius:5px;width:100%;height:92%;border:0px solid white;margin-top:2%;" class="white-color">
					积分卡片样式
				</button>
			</form>
			<form action="Homepage.jsp" method="post" style="width:10%;height:100%;margin-left:0.5%;margin-right:0.5%;float:right;flow-over:hidden;">
				<button style="color:#FFA980;border-radius:5px;width:100%;height:92%;border:0px solid white;margin-top:2%;" class="white-color">
					返回官网
				</button>
			</form>
			<font style="float:right;color:white;line-height:50px;">*此模块不对外展示*</font>
		</div>

		<div style="width:100%;height:500px;float:left;over-flow:hidden;" class="area">
			<%String block=bean.getblock("1");		
		if(block==null||"".equals(block)){ %>
			<form action="user_personal_homepage_write_all.jsp" method="post">
				<button name="write" value="1" style="border:0px solid white;width:100%;height:500px;float:left;background-color:white;color:#FFEFE8;"
				 class="block" name="write" value="1">
					<font style="font-size:250px;"><b>+</b></font><br />
					<font style="font-size:25px;"><b>点击添加样式</b></font>
				</button></form>
			<%
				}else{%>
			<form action="user_personal_homepage_write_all.jsp" method="post">
				<button name="write" value="1" style="width:30%;height:40px;color:white;margin-left:35%;border:0px solid white;display:none;"
				 class="change_style middle-font">
					<font>修改样式</font>
				</button>
			</form>
			<%
				out.println(block);
				} %>
		</div>

		<div style="width:50%;height:500px;float:left;over-flow:hidden;" class="area">
			<%block=bean.getblock("2");	
		if(block==null||"".equals(block)){ %>
			<form action="user_personal_homepage_write_half.jsp" method="post">
				<button name="write" value="2" style="border:0px solid white;width:100%;height:500px;float:left;background-color:white;color:#FFEFE8;"
				 class="block" name="write" value="2">
					<font style="font-size:250px;"><b>+</b></font><br />
					<font style="font-size:25px;"><b>点击添加样式</b></font>
				</button></form>
			<%
				}else{%>
			<form action="user_personal_homepage_write_half.jsp" method="post">
				<button name="write" value="2" style="width:30%;height:40px;margin-left:10%;color:white;border:0px solid white;display:none;"
				 class="change_style middle-font">修改样式</button>
			</form>
			<%
				out.println(block);
				} %>
		</div>
		
		<div style="width:50%;height:500px;float:left;over-flow:hidden;" class="area">
			<%block=bean.getblock("3");		
		if(block==null||"".equals(block)){ %>
			<form action="user_personal_homepage_write_half.jsp" method="post">
				<button name="write" value="3" style="border:0px solid white;width:100%;height:500px;float:left;background-color:white;color:#FFEFE8;"
				 class="block" name="write" value="3">
					<font style="font-size:250px;"><b>+</b></font><br />
					<font style="font-size:25px;"><b>点击添加样式</b></font>
				</button></form>
			<%
				}else{%>
			<form action="user_personal_homepage_write_half.jsp" method="post">
				<button name="write" value="3" style="width:30%;height:40px;color:white;margin-left:10%;border:0px solid white;display:none;"
				 class="change_style middle-font">修改样式</button>
			</form>
			<%
				out.println(block);
				} %>
		</div>
		
		
		<%
		Score_bean point=new Score_bean(ID);
		int points=point.getpoint();
		if(points<500){//第四模块
		
		%>
		<div class="light-color" style="width:100%;height:50px;color:#FFEFE8;font-size:25px;line-height:50px;float:left;"
		 align="center"><b>到达500积分可开启新的模块/还差
				<%=500-points %>积分</b>
		</div>
		<%}else if("not_allow_to_use".equals(bean.getblock("4"))){ %>
		<form action="user_personal_homepage.jsp" method="post">
			<div style="width:100%;height:200px;color:white;font-size:100px;over-flow:hidden;float:left;" align="center">
				<button style="width:75%;height:150px;border-radius:10px;margin-top:25px;font-size:50px;color:white;border:0px solid white;"
				 class="light-color" name="opennew" value="4">
					<b>开启新的模块</b>
				</button>
			</div>
		</form>
		<%}else {block=bean.getblock("4");	
		if(block==null||"".equals(block)){ %>
		<div style="width:100%;height:500px;color:white;font-size:100px;over-flow:hidden;float:left;" class="area" align="center">
			<form action="user_personal_homepage_write_all.jsp" method="post">
				<button name="write" value="4" style="border:0px solid white;width:100%;height:500px;float:left;background-color:white;color:#FFEFE8;"
				 class="block" name="write" value="4">
					<font style="font-size:250px;"><b>+</b></font><br />
					<font style="font-size:25px;"><b>点击添加样式</b></font>
				</button>
			</form>
		</div>
		<%
			}else{%>
		<div style="width:100%;height:500px;float:left;over-flow:hidden;" class="area">
			<form action="user_personal_homepage_write_all.jsp" method="post">
				<button name="write" value="4" style="position: absolute;width:30%;height:40px;margin-left:35%;color:white;border:0px solid white;display:none;"
				 class="change_style middle-font">修改样式</button>
			</form>
			<%
			out.println(block);
			%></div><%
			} 
		}%>
		
		
		

		<%
		if(points>=500&&!"not_allow_to_use".equals(bean.getblock("4"))){			
			if(points<1000)
			{
				%>
				<div class="light-color" style="width:100%;height:50px;color:#FFEFE8;font-size:25px;line-height:50px;float:left;"
				 align="center"><b>到达1000积分可开启新的模块/还差
				<%=1000-points %>积分</b>
				</div>
			<%
			}
			else if(points>=1000&&"not_allow_to_use".equals(bean.getblock("5")))
			{ 
				%>
					<form action="user_personal_homepage.jsp" method="post">
						<div style="width:100%;height:200px;color:white;font-size:100px;over-flow:hidden;float:left;" align="center">
							<button style="width:75%;height:150px;border-radius:10px;margin-top:25px;font-size:50px;color:white;border:0px solid white;"class="light-color" name="opennew" value="5">
								<b>
									开启新的模块
								</b>
							</button>
						</div>
					</form>
				<%
			}
			else {
				block=bean.getblock("5");	
				if(block==null||"".equals(block))
				{
					%>
						<div style="float:left;width:100%;height:200px;color:white;font-size:100px;over-flow:hidden;" align="center" class="area">
							<form action="user_personal_homepage_write_all.jsp" method="post">
								<button name="write" value="5" style="border:0px solid white;width:100%;height:500px;float:left;background-color:white;color:#FFEFE8;"class="block" name="write" value="4">
									<font style="font-size:250px;"><b>+</b></font><br />
									<font style="font-size:25px;"><b>点击添加样式</b></font>
								</button>
							</form>
						</div>
					<%
				}
				else
				{
					%>
						<div style="width:100%;height:500px;float:left;over-flow:hidden;" class="area">
							<form action="user_personal_homepage_write_half.jsp" method="post">
								<button name="write" value="5" style="position: absolute;width:30%;height:40px;margin-left:35%;color:white;border:0px solid white;display:none;"class="change_style middle-font">修改样式</button>
							</form>
					<% 
					out.println(block);
					%></div><%
				} 
			}	
		}
	%>
	

	</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		var timer;
		$('.block').mouseenter(function() {
			$(this).css('background-color', '#FFEFE8');
			$(this).css('color', 'white');
		});

		$('.block').mouseleave(function() {
			$(this).css('background-color', 'white');
			$(this).css('color', '#FFEFE8');
		});

		<%for(int a = 0;a<5;a++){ //有几个模块就最大值为几%>
		$('.area:eq(<%=a%>)').on({
			"mouseenter": function() {
				clearTimeout(timer);
				timer = setTimeout(function() {
					//触发事件
					$('.change_style:eq(<%=a%>)').slideDown(400);
				}, 1000);
			},
			"mouseleave": function() {
				clearTimeout(timer);
				//结束事件
				$('.change_style:eq(<%=a%>)').slideUp(400);
			}
		});
		<%}%>

	});
</script>
