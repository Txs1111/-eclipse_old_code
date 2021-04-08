<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.Homepage_bean" import="bean.check_power"  import="java.util.Random" import="bean.getpower"%>
<!DOCTYPE html>
<%	request.setCharacterEncoding("UTF-8");
	String block_id = null;
	String ID=(String)request.getSession().getAttribute("ID");
	if(ID==null||"".equals(ID)){
		ID=request.getParameter("ID");
		request.getSession().setAttribute("ID", ID);
	}
	Homepage_bean bean=new Homepage_bean(ID);
	bean.head();
	getpower power=new getpower(ID);
	if(request.getParameter("block_id")!=null)
	{
		block_id=request.getParameter("block_id");
	}
	String topage=request.getParameter("turnpage");
	String showpage="";
	if(topage==null||"".equals(topage)){
		showpage="date_details.jsp";
	}else if("1".equals(topage)){
		showpage="date_details.jsp";
	}else if("2".equals(topage)&&power.checkpower("11")){
		showpage="sendmission.jsp";
	}else if("3".equals(topage)&&power.checkpower("10")){
		showpage="check_mission.jsp";
	}else if("4".equals(topage)&&power.checkpower("13")){
		showpage="check_works.jsp";
	}else if("5".equals(topage)&&power.checkpower("12")){
		showpage="send_notice.jsp";
	}else if("6".equals(topage)&&power.checkpower("14")){
		showpage="apartment_menage.jsp";
	}else if("7".equals(topage)&&power.checkpower("15")){
		showpage="group_menage.jsp";
	}else if("8".equals(topage)&&power.checkpower("16")){
		showpage="number_menage.jsp";
	}else if("9".equals(topage)&&power.checkpower("17")){
		showpage="web_journal.jsp";
	}else if("10".equals(topage)&&power.checkpower("18")){
		showpage="web_more.jsp";
	}else if("11".equals(topage)&&power.checkpower("23")){
		showpage="source_team.jsp";
	}else if("12".equals(topage)&&power.checkpower("19")){
		showpage="source_team.jsp";
	}else if("13".equals(topage)&&power.checkpower("20")){
		showpage="web_more.jsp";
	}else if("14".equals(topage)&&power.checkpower("21")){
		showpage="resource.jsp";
	}else{
		showpage="date_details.jsp";
	}
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>计协后台管理界面</title>
		<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
		<link href="../Css/Public_style.css" rel="stylesheet" />
	</head>
	<body bgcolor="#515151">
		<form action="../toHomepage" method="post">
			<div style="width:100%;height:65px;line-height:61px;overflow:hidden;" class="normal-color">
				<img src="../img/season/ahead_white.png" style="height:60px;float:left;">
				<font style="font-size:15px;color:white;margin-left:15px;font-family:sans-serif;">
					<b>
						后台管理界面
					</b>
				</font>

				<input style="display:none" value="<%=ID %>" name="ID">
				<img src="img/返回.png" style="height:20%;margin-top:24px;margin-right:10px;float:right;">
				<button style="color:white;float:right;border:0px solid white;margin-top:20px;margin-right:6px;cursor:pointer;"
				 class="normal-color">返回官网</button>

			</div>
		</form>
		<!-- 左侧菜单栏 -->

		<div style="width: 12.4%;height: 824px;float:left;" class="dinylight-color" id="menu">
			<!-- 个人信息模块 -->
			<div align="center" style="width:100%;margin-bottom:3px; height:120px;overflow:hidden;background: url(../img/theme_photo/<%=bean.background%>.png);">
				<div style="width:100%;height:75px;">
					<img src="../img/head_photo/<%=bean.headphoto %>.jpg" style="border-radius:50%;height:90%;margin-top:10px;" />
				</div>
				<div style="width:100%;">
					<br />
					<font color="white">
						<%=bean.nickiname %>
					</font>
				</div>
			</div>
			<form action="date_details.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change0"
					 name="turnpage" value="1">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/分析white.png" style="height:65%;margin-top:12%;">
						</div>
						<font style="font-size:15px;float:left;">数据分析</font>
					</button>
				</div>
			</form>
			<%if(power.checkpower("11")){ %>
			<form action="sendmission.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change1"
					 name="turnpage" value="2">
						<div style="height:100%;float:left;width:35%;">
							<img src="img/布置作业.png" style="height:60%;margin:7px;margin-left:15%;">
						</div>
						<font style="font-size:15px;float:left;">布置任务</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("10")){ %>
			<form action="check_mission.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change2"
					 name="turnpage" value="3">
						<div style="height:100%;float:left;width:35%;">
							<img src="img/批改white.png" style="height:100%;margin-left:10%;">
						</div>
						<font style="font-size:15px;float:left;">任务批改</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("13")){ %>
			<form action="check_works.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change3"
					 name="turnpage" value="4">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/作品white.png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">作品评价</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("12")){ %>
			<form action="send_notice.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change4"
					 name="turnpage" value="5">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/公告white.png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">消息公告</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("14")){ %>
			<form action="apartment_menage.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change5"
					 name="turnpage" value="6">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/部门white.png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">部门管理</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("15")){ %>
			<form action="group_menage.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change6"
					 name="turnpage" value="7">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/小组white.png" style="height:55%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">小组管理</font>
					</button>
				</div>
			</form>
			<% }%>
			<%if(power.checkpower("16")){ %>
			<form action="number_menage.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change7"
					 name="turnpage" value="8">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/成员white.png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">成员管理</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("17")){ %>
			<form action="web_journal.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change8"
					 name="turnpage" value="9">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/日志.png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">网站日志</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("18")){ %>
			<form action="web_more.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;"> 
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change9"
					 name="turnpage" value="10">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/内容 (1).png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">站内内容</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("23")){ %>
			<form action="source_team.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change10"
					 name="turnpage" value="11">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/内容 (1).png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">内容团队</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("19")){ %>
			<form action="web_more.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change11"
					 name="turnpage" value="12">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/内容 (1).png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">审核团队</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("20")){ %>
			<form action="web_more.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change12"
					 name="turnpage" value="13">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/内容 (1).png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">项目组</font>
					</button>
				</div>
			</form>
			<%} %>
			<%if(power.checkpower("21")){ %>
			<form action="resource.jsp" method="post">
				<div style="width:100%;height:45px;float:left;margin-bottom:2px;">
					<button style="width:100%;height:100%;border:0px solid white;line-height:45px;color:white;float:left;" class="light-color block_change13"
					 name="turnpage" value="14">
						<div style="height:100%;float:left;width:35%;" align="center">
							<img src="img/内容 (1).png" style="height:65%;margin-top:15%;">
						</div>
						<font style="font-size:15px;float:left;">资源管理</font>
					</button>
				</div>
			</form>
			<%} %>
		</div>
	</body>
</html>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" charset="utf-8">
	$('.block_change<%=block_id%>').addClass('normal-color');
	$('.block_change<%=block_id%>').removeClass('light-color');
</script>