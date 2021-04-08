<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.Admin_tools"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
		<link rel="stylesheet" type="text/css" href="../Css/Public_style.css" />
		<link rel="stylesheet" type="text/css" href="../Css/Assignment.css" />
		<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
	<body>
	<jsp:include page="Admin_lead.jsp"></jsp:include>
<div style="width:87.5%;margin-left:0.1%;height:824px;float:left;"class="dinylight-color">
	<%
	request.setCharacterEncoding("UTF-8");
		String tips="";
		String name=request.getParameter("name");
		String tittle=request.getParameter("tittle");
		String difficult=request.getParameter("difficult");
		String type=request.getParameter("type");
		String language=request.getParameter("language");
		String nowpage=request.getParameter("nowpage");
		System.out.println(nowpage);
		String text=request.getParameter("text");	
		if(text==null){
			text="";
		}
		String missionID=request.getParameter("missionID");
		System.out.println(missionID);
		String pageID=request.getParameter("pageID");
		System.out.println(pageID);
		String ID=(String)request.getSession().getAttribute("ID");
		Admin_tools bean=new Admin_tools(ID);
		bean.getmissioninf(missionID, pageID);
		if("1".equals( request.getParameter("sub"))){
			if(!"0".equals(request.getParameter("point"))&&request.getParameter("text")!=null&&!"".equals(request.getParameter("text")))
			{	
				bean.subcharge(missionID, pageID, request.getParameter("text"), request.getParameter("point"));
				tips="提交成功";
				text="";
			}else{
				tips="内容未补完!";
			}
		}
	%>
			<form action="check_mission.jsp" method="post">
				<div class="small-tittle middle-font font-normal-color">
					&nbsp;┃&nbsp;<button name="setlocal" value="1" style="height:100%;width=35px;border:0px solid white;background:#FAFAFA;" class="middle-font font-normal-color">
						批改任务
					</button>			
					<img src="../img/lead_photo/返回.png" style="width:30px;height:25px;float:right;">
					<input name="jumpact" value="<%=request.getParameter("nowpage") %>" type="text"style="display:none;">
					<button name="setlocal" value="1" style="height:100%;float:right;width:150px;border:0px solid white;background:#FAFAFA;" class="middle-font font-normal-color">
						返回上一级
					</button>
				</div>
			</form><div style="width:49.5%;height:500px;float:left;">
				<div class="small-tittle middle-font font-normal-color" style="width:100%;">
					&nbsp;-&nbsp;内容
				</div>
				<textarea style="width:100%;height:600px;border:0px solid white;"><%=bean.missionfinishcontent %></textarea>
			</div>
			<div style="width:49.5%;height:500px;margin-left:1%;float:left;">
				<div class="small-tittle middle-font font-normal-color" style="width:75%;float:left;">
					&nbsp;-&nbsp;作业要求
				</div>
				<div class="small-tittle middle-font font-normal-color" style="width:24.9%;margin-left:0.1%;float:left;">
					&nbsp;-&nbsp;作业信息
				</div>
				<textarea style="width:75%;height:200px;border:0px solid white;float:left;"><%=bean.missioninf %> </textarea>
				<div style="width:24.9%;margin-left:0.1%;float:left;height:200px;font-size:20px;">
					<div class="light-color" style="width:35%;float:left;width:100%;line-height:25px;height:25px;color:white;"align="center">提交者</div>
					<div class="dinylight-color" style="width:35%;float:left;width:100%;line-height:25px;height:25px;color:gray;"align="center"><%=name %></div>
					<div class="light-color" style="width:35%;float:left;width:100%;line-height:25px;height:25px;color:white;"align="center">任务类型</div>
					<div class="dinylight-color" style="width:35%;float:left;width:100%;line-height:25px;height:25px;color:gray;"align="center"><%=type%></div>
					<div class="light-color" style="width:35%;float:left;width:100%;line-height:25px;height:25px;color:white;"align="center">任务语言</div>
					<div class="dinylight-color" style="width:35%;float:left;width:100%;line-height:25px;height:25px;color:gray;"align="center"><%=language %></div>
					<div class="light-color" style="width:35%;float:left;width:100%;height:25px;line-height:25px;color:white;"align="center">难度</div>
					<div class="dinylight-color" style="width:35%;float:left;width:100%;line-height:25px;height:25px;color:gray;"align="center"><%=difficult %></div>
				</div>
				<form action="check_mission_details.jsp"method="post">
					<input name="nowpage" value="<%=nowpage %>" style="display:none;">
					<input style="display:none;"name="missionID"value="<%=missionID %>">
					<input style="display:none;"name="pageID"value="<%=pageID %>">
					<input style="display:none;"name="name"value="<%=name %>">
					<input style="display:none;"name="type"value="<%=type %>">
					<input style="display:none;"name="language"value="<%=language %>">
					<input style="display:none;"name="difficult"value="<%=difficult %>">
					<div class="light-color" style="width:100%;float:left;width:100%;height:25px;line-height:25px;color:white;"align="center">编写评价</div>
					<textarea style="width:100%;height:270px;border:0px solid white;" name="text"><%=text %></textarea>
					<div class="light-color" style="width:100%;float:left;width:100%;height:25px;line-height:25px;"align="center">评级</div>
					<select name="point" style="width:100%;height:35px;">
						<option value="0">--</option>
						<option value="1">A+</option>
						<option value="2">A</option>
						<option value="3">B</option>
						<option value="4">C</option>
					</select>
					<button name="sub" value="1" style="width:100%;height:45px;border:0px solid white;border-radius:4px;"class="light-color">提交</button>
				</form>
				<div style="width:100%;height:25px;color:red;line-height:25px;font-size:20px;"align="center"><%=tips %></div>
			</div>
			</div>
</body>
</html>