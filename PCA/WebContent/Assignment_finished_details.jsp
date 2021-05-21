
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="bean.get_mission_user_finished" import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Assignment.css" />
<link rel="stylesheet" type="text/css" href="./Css/Public_Color/orange.css" />
</head>
<%
	String lastpage = request.getParameter("lastpage");
	String lastpages = "Assignment.jsp";
	if ("1".equals(lastpage)) {
		lastpages = "score.jsp";
	} else {
		lastpages = "Assignment.jsp";
	}
	String ID = null;
	if (request.getAttribute("ID") != null) {
		ID = (String) request.getAttribute("ID");
	}
	if (request.getParameter("ID") != null) {
		ID = request.getParameter("ID");
	}
	if (ID == null || "".equals(ID) || "null".equals(ID)) {
		request.setAttribute("alter", "1");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	String missionID = null;
	if (request.getAttribute("missionID") != null) {
		missionID = (String) request.getAttribute("missionID");
	}
	if (request.getParameter("missionID") != null) {
		missionID = request.getParameter("missionID");
	}
	String missiondate = request.getParameter("missiondate");
	System.out.println("missionID:" + missionID + "ID:" + ID + "missiondate:" + missiondate);
	get_mission_user_finished mission = new get_mission_user_finished();
	String nowpage = null;
	if (request.getAttribute("nowpage") != null) {
		nowpage = (String) request.getAttribute("nowpage");
	} else if (request.getParameter("nowpage") != null) {
		nowpage = (String) request.getParameter("nowpage");
	} else {
		nowpage = "1";
	}
	System.out.println("nowpage:" + nowpage);
	System.out.println("完成页面传入的missiondate:" + missiondate);
	mission.getmissioninf(missionID, ID, missiondate, nowpage);
	StringTokenizer chart1 = new StringTokenizer(mission.alldate, "@");
	StringTokenizer chart2 = new StringTokenizer(mission.missioninf, "晸郶蔖");
	StringTokenizer chart3 = new StringTokenizer(mission.finishedinf, "晸郶蔖");
	mission.con.close();
	mission.con2.close();
%>
<body bgcolor="#F4F5F7">

	<!--头部信息-->
	<div class="Details_whole_block" style="width: 75%; margin-top: 0px;">
		<form action="<%=lastpages%>" method="post">
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;任务:<%=chart2.nextToken()%>
				<img src="img/lead_photo/返回.png" style="width: 30px; height: 25px; float: right;">
				<input name="ID" value="<%=ID%>" type="text" style="display: none;">
				<button name="setlocal" value="1" style="height: 100%; float: right; width =35px; border: 0px solid white; background: #FAFAFA;" class="middle-font font-normal-color">返回上一级</button>
			</div>
		</form>
		<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left; width: 49.9%; margin-right: 0.2%;">&nbsp;┃&nbsp;任务详情</div>
		<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left; width: 49.9%;">&nbsp;┃&nbsp;作业评价</div>
		<div class="light-color" style="color: white; margin-bottom: 3px; width: 49.9%; margin-right: 0.2%; height: 150px; float: left; text-align: center; line-height: 50px;">
			<textarea style="color: white; background-color: #FFCAB0; font-size: 20px; resize: none; width: 100%; height: 100%; margin: 0 auto;" readonly>&nbsp;&nbsp;<%=chart2.nextToken()%></textarea>
		</div>


		<div class="light-color" style="color: white; margin-bottom: 3px; width: 49.9%; height: 150px; float: left; text-align: center; line-height: 50px;">
			<textarea style="color: white; background-color: #FFCAB0; font-size: 20px; resize: none; width: 100%; height: 100%; margin: 0 auto;" readonly>&nbsp;&nbsp;<%=chart3.nextToken()%> </textarea>
		</div>
		<div class="body_block dinylight-color" style="margin-top: 3px;">

			<div style="width: 20%; float: left; height: 100%;">

				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left;">&nbsp;┃&nbsp;发布日期</div>
				<div class="light-color" style="color: white; margin-bottom: 3px; width: 100%; height: 50px; float: left; text-align: center; line-height: 50px;">
					<%=chart2.nextToken()%>
				</div>
				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left;">&nbsp;┃&nbsp;截止日期</div>
				<div class="light-color" style="color: white; margin-bottom: 3px; width: 100%; height: 50px; float: left; text-align: center; line-height: 50px;">
					<%=chart2.nextToken()%>
				</div>
				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left;">&nbsp;┃&nbsp;已完成人数</div>
				<div class="light-color" style="color: white; margin-bottom: 3px; width: 100%; height: 50px; float: left; text-align: center; line-height: 50px;">150</div>
				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left;">&nbsp;┃&nbsp;评分</div>
				<div class="light-color" style="color: white; margin-bottom: 3px; width: 100%; height: 50px; float: left; text-align: center; line-height: 50px;">
					<%=chart3.nextToken()%>
				</div>
				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left;">&nbsp;┃&nbsp;考核类型</div>
				<div class="light-color" style="color: white; margin-bottom: 3px; width: 100%; height: 50px; float: left; text-align: center; line-height: 50px;">
					<%=chart2.nextToken()%>
				</div>
				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left;">&nbsp;┃&nbsp;语言类型</div>
				<div class="light-color" style="color: white; margin-bottom: 3px; width: 100%; height: 50px; float: left; text-align: center; line-height: 50px;">
					<%=chart2.nextToken()%>
				</div>
			</div>
			<div style="width: 59.9%; height: 100%; margin-left: 0.1%; background-color: white; float: left;">
				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left;">&nbsp;┃&nbsp;提交内容</div>
				<textarea style="width: 100%; height: 476px; margin: 0 auto; resize: none; font-size: 10px;" readonly><%=chart3.nextToken()%></textarea>
			</div>
			<div style="width: 19.9%; height: 100%; margin-left: 0.1%; background-color: white; float: left;">
				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left;">&nbsp;┃&nbsp;往期提交内容</div>
				<form action="Assignment_finished_details.jsp" method="post">
					<input name="lastpage" value="<%=lastpage%>" style="display: none;">
					<input name="ID" value="<%=ID%>" type="text" style="display: none;">
					<input name="missionID" value="<%=missionID%>" type="text" style="display: none;">
					<input name="nowpage" value="<%=nowpage%>" style="display: none;">
					<div style="width: 100%; height: 460px;">
						<%
							int num = chart1.countTokens();
							String color = "";
							for (int a = 0; a < num; a++) {
								String date = chart1.nextToken();
								if (date.equals(mission.nowdate)) {
									color = "#FFA980;border:1px solid gray;";
								} else if (a % 2 == 0) {
									color = "#FFCAB0;";
								} else {
									color = "#FAFAFA;";
								}
						%>
						<button style="width:100%;height:35px;border:0px solid white;background-color: <%=color%> " name="missiondate" value="<%=date%>"><%=date%>
						</button>
						<%
							}
						%>
					</div>
				</form>
				<form action="finished_mission_page" method="post">

					<input name="ID" value="<%=ID%>" style="display: none;">
					<input name="missionID" value="<%=missionID%>" style="display: none;">
					<input name="allpage" value="<%=mission.allpagenum%>" style="display: none;">
					<input name="nowpage" value="<%=nowpage%>" style="display: none;">
					<div style="width: 100%;" align="center">
						<font>
							第<%=nowpage%>页/共<%=mission.allpagenum%>页
						</font>
						<br />
						<button name="act" value="1" style="background-color: #FFCAB0; width: 23%; height: 30px; border-radius: 5px; border: 0px solid lightgray;">上一页</button>
						<select name="topage" style="width: 23%; height: 30px; border-radius: 5px; background-color: #FFCAB0; border: 0px solid white;">
							<option value="<%=nowpage%>"><%=nowpage%></option>
							<%
								for (int c = 0; c < mission.allpagenum; c++) {
							%>
							<option value="<%=c + 1%>"><%=c + 1%></option>
							<%
								}
							%>
						</select>
						<button name="act" value="2" style="background-color: #FFCAB0; width: 23%; height: 30px; border-radius: 5px; border: 0px solid lightgray;">跳转</button>
						<button name="act" value="3" style="background-color: #FFCAB0; width: 23%; height: 30px; border-radius: 5px; border: 0px solid lightgray;">下一页</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
