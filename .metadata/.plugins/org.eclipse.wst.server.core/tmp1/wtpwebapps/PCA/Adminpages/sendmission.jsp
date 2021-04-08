<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.sendmission_bean" import="dao.Admin_tools" import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
<link href="../Css/Public_style.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="Admin_lead.jsp"><jsp:param value="1" name="block_id" /></jsp:include>
	<div style="width: 87.5%; height: 824px; margin-left: 0.1%; float: left;" class="dinylight-color">
		<%
			String ID = (String) request.getSession().getAttribute("ID");
			request.setCharacterEncoding("UTF-8");
			String tittle = "";
			String enddate = "--";
			String content = "";
			String point = "";
			String tips = "";
			if ("1".equals(request.getParameter("send"))) {
				if ((!"0".equals(request.getParameter("year")) && !"0".equals(request.getParameter("month"))
						&& !"0".equals(request.getParameter("date")))) {
					enddate = request.getParameter("year") + "-" + request.getParameter("month") + "-"
							+ request.getParameter("day");

					if (request.getParameter("tittle").length() > 15) {
						tips = "标题过长";
						point = request.getParameter("point");
						tittle = request.getParameter("tittle");
						content = request.getParameter("content");
					} else if (request.getParameter("tittle") == null || "".equals(request.getParameter("tittle"))) {
						tips = "未设置标题";
						point = request.getParameter("point");
						content = request.getParameter("content");
					} else if (request.getParameter("content") == null || "".equals(request.getParameter("content"))) {
						tips = "未添加内容";
						point = request.getParameter("point");
						tittle = request.getParameter("tittle");
					} else if ("0".equals(request.getParameter("language"))
							&& (request.getParameter("newlanguage") == null
									|| "".equals(request.getParameter("newlanguage")))) {
						tips = "任务语言未填写";
						point = request.getParameter("point");
						tittle = request.getParameter("tittle");
						content = request.getParameter("content");
					} else if ("0".equals(request.getParameter("type")) && (request.getParameter("newtype") == null
							|| "".equals(request.getParameter("newtype")))) {
						tips = "任务类型未填写";
						point = request.getParameter("point");
						tittle = request.getParameter("tittle");
						content = request.getParameter("content");
					} else if (request.getParameter("point") == null || "".equals(request.getParameter("point"))) {
						tips = "未设置得分";
						content = request.getParameter("content");
						tittle = request.getParameter("tittle");
					} else {
						Admin_tools tool = new Admin_tools(ID);
						tool.send_mission(request.getParameter("tittle"), request.getParameter("content"),
								request.getParameter("type"), request.getParameter("difficult"),
								request.getParameter("language"), request.getParameter("point"), enddate,
								request.getParameter("newlanguage"), request.getParameter("newtype"));
						tips = "提交成功";
					}
				} else if (("0".equals(request.getParameter("year")) && "0".equals(request.getParameter("month"))
						&& "0".equals(request.getParameter("day")))) {

					enddate = "--";
					if (request.getParameter("tittle").length() > 15) {
						tips = "标题过长";
						point = request.getParameter("point");
						tittle = request.getParameter("tittle");
						content = request.getParameter("content");
					} else if (request.getParameter("tittle") == null || "".equals(request.getParameter("tittle"))) {
						tips = "未设置标题";
						point = request.getParameter("point");
						content = request.getParameter("content");
					} else if (request.getParameter("content") == null || "".equals(request.getParameter("content"))) {
						tips = "未添加内容";
						point = request.getParameter("point");
						tittle = request.getParameter("tittle");
					} else if ("0".equals(request.getParameter("language"))
							&& (request.getParameter("newlanguage") == null
									|| "".equals(request.getParameter("newlanguage")))) {
						tips = "任务语言未填写";
						point = request.getParameter("point");
						tittle = request.getParameter("tittle");
						content = request.getParameter("content");
					} else if ("0".equals(request.getParameter("type")) && (request.getParameter("newtype") == null
							|| "".equals(request.getParameter("newtype")))) {
						tips = "任务类型未填写";
						point = request.getParameter("point");
						tittle = request.getParameter("tittle");
						content = request.getParameter("content");
					} else if (request.getParameter("point") == null || "".equals(request.getParameter("point"))) {
						tips = "未设置得分";
						content = request.getParameter("content");
						tittle = request.getParameter("tittle");
					} else {
						Admin_tools tool = new Admin_tools(ID);
						tool.send_mission(request.getParameter("tittle"), request.getParameter("content"),
								request.getParameter("type"), request.getParameter("difficult"),
								request.getParameter("language"), request.getParameter("point"), enddate,
								request.getParameter("newlanguage"), request.getParameter("newtype"));
						tips = "提交成功";
						tool.con.close();

					}
				} else {
					point = request.getParameter("point");
					tittle = request.getParameter("tittle");
					content = request.getParameter("content");
					tips = "日期未补完";
				}

			}
			sendmission_bean bean = new sendmission_bean(ID);
			System.out.println(ID);
			bean.getmissiontype();
			bean.getmissionlanguage();
			StringTokenizer chart1 = new StringTokenizer(bean.missiontypes, "+");
			bean.con.close();
		%>
		<form action="sendmission.jsp" method="post">
			<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left; width: 100%; margin-right: 0.2%;">&nbsp;┃&nbsp;布置任务</div>
			<div style="width: 49.9%; margin-right: 0.2%; height: 200px; float: left;">
				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left; width: 100%; margin-right: 0.2%;">&nbsp;-&nbsp;任务标题(十五字以内)</div>
				<input style="width: 100%; height: 35px; margin-bottom: 3px;" name="tittle" value="<%=tittle%>">
				<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left; width: 100%; margin-right: 0.2%;">&nbsp;-&nbsp;任务要求</div>
				<textarea style="width: 100%; height: 252px; margin-bottom: 3px;" name="content"><%=content%></textarea>
			</div>
			<div style="width: 49%; margin-right: 0.1%; height: 370px; float: left;">
				<div class="small-tittle middle-font font-normal-color" style="float: left; margin-bottom: 2px; float: left; width: 49.9%; margin-right: 0.2%;">&nbsp;-&nbsp;任务类型</div>
				<div class="small-tittle middle-font font-normal-color" style="float: left; margin-bottom: 2px; float: left; width: 49.9%;">&nbsp;-&nbsp;任务难度</div>
				<select style="float: left; margin-bottom: 2px; float: left; width: 49.9%; height: 35px;" name="type">
					<option value="0">--</option>
					<%
						StringTokenizer chart2 = null;
						int num = chart1.countTokens();
						for (int a = 0; a < num; a++) {
							chart2 = new StringTokenizer(chart1.nextToken(), "_");
					%>
					<option value="<%=chart2.nextToken()%>">
						<%=chart2.nextToken()%>
					</option>
					<%
						}
					%>
				</select>
				<select style="float: left; margin-bottom: 2px; float: left; width: 49.9%; height: 35px;" name="difficult">
					<%
						for (int a = 1; a <= 3; a++) {
					%>
					<option value="<%=a%>">
						<%=a%>
					</option>
					<%
						}
					%>
				</select>
				<div class="small-tittle middle-font font-normal-color" style="float: left; margin-bottom: 2px; float: left; width: 49.9%; margin-right: 0.2%;">&nbsp;-&nbsp;任务语言</div>
				<div class="small-tittle middle-font font-normal-color" style="float: left; margin-bottom: 2px; float: left; width: 49.9%;">&nbsp;-&nbsp;任务最高分</div>
				<select style="float: left; margin-bottom: 2px; float: left; width: 49.9%; height: 35px;" name="language">
					<option value="0">--</option>
					<%
						chart1 = new StringTokenizer(bean.missionlanguage, "/");
						num = chart1.countTokens();
						for (int a = 0; a < num; a++) {
							chart2 = new StringTokenizer(chart1.nextToken(), "_");
					%>
					<option value="<%=chart2.nextToken()%>">
						<%=chart2.nextToken()%>
					</option>
					<%
						}
					%>
				</select>
				<input style="float: right; margin-bottom: 2px; float: left; width: 49.2%; height: 33px; border: 1px solid gray;" name="point" value="<%=point%>">
				<div class="small-tittle middle-font font-normal-color" style="float: left; margin-bottom: 2px; margin-top: 3px; float: left; width: 100%;">&nbsp;-&nbsp;任务截止时间(可为空)</div>
				<select style="width: 33%; height: 35px; margin-right: 0.5%; border: 0px solid white; float: left;" name="year">
					<option value="0">年</option>
					<option value="2021">2021</option>
				</select>

				<select style="width: 33%; height: 35px; margin-right: 0.5%; border: 0px solid white; float: left;" name="month">
					<option value="0">月</option>
					<%
						for (int a = 1; a <= 12; a++) {
					%>
					<option value="<%=a%>"><%=a%></option>
					<%
						}
					%>
				</select>

				<select style="width: 33%; height: 35px; border: 0px solid white; float: left;" name="day">
					<option value="0">日</option>
					<%
						for (int a = 1; a <= 28; a++) {
					%>
					<option value="<%=a%>"><%=a%></option>
					<%
						}
					%>
				</select>
				<div class="small-tittle middle-font font-normal-color" style="float: left; margin-bottom: 2px; margin-top: 3px; float: left; width: 100%;">&nbsp;-&nbsp;新建任务类型(与任务类型二选一(无法撤回))</div>
				<input style="width: 100%; height: 35px; margin-bottom: 3px;" name="newtype">
				<div class="small-tittle middle-font font-normal-color" style="float: left; margin-bottom: 2px; margin-top: 3px; float: left; width: 100%;">&nbsp;-&nbsp;新建任务语言(与任务语言二选一(无法撤回))</div>
				<input style="width: 100%; height: 35px; margin-bottom: 3px;" name="newlanguage">

			</div>

			<button style="width: 58%; margin-left: 21%; height: 55px; border-radius: 5px; border: 0px solid white;" class="light-color" name="send" value="1">提交</button>
			<div style="width: 100%; height: 25px; font-size: 20px; line-height: 25px; color: red;" align="center"><%=tips%>
			</div>
		</form>
	</div>
</body>
</html>