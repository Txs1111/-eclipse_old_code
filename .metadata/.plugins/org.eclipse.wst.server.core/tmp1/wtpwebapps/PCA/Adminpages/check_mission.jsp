<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.Admin_tools" import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
<link href="../Css/Public_style.css" rel="stylesheet" />
<style type="text/css">
.firbox {
	width: 17%;
	height: 100%;
	margin-right: 0.1%;
	float: left;
	text-align: center;
	line-height: 35px;
}

.secbox {
	width: 14%;
	height: 100%;
	float: left;
	text-align: center;
	line-height: 35px;
}

.buttons {
	width: 16%;
	height: 35px;
	border: 0px solid white;
	border-radius: 4px;
}
</style>
<%
	Admin_tools tool = new Admin_tools((String) request.getSession().getAttribute("ID"));
	int allpages = tool.getallpages();
	int nowpage = 1;
	if ((request.getParameter("act") != null && !"".equals(request.getParameter("act")))
			|| (request.getParameter("jumpact") != null && !"".equals(request.getParameter("jumpact")))) {
		if (request.getParameter("jumpact") != null && !"".equals(request.getParameter("jumpact"))) {
			nowpage = Integer.parseInt(request.getParameter("jumpact"));
		} else if ("1".equals(request.getParameter("act"))) {
			nowpage = 1;
		} else if ("2".equals(request.getParameter("act")) && nowpage > 1) {
			nowpage = nowpage - 1;
		} else if ("3".equals(request.getParameter("act"))) {
			nowpage = Integer.parseInt(request.getParameter("jumppage"));
		} else if ("4".equals(request.getParameter("act")) && nowpage < allpages) {
			nowpage = nowpage + 1;
		} else if ("5".equals(request.getParameter("act"))) {
			nowpage = allpages;
		}
	}
	tool.getcheck_mission(nowpage);
	int show = tool.showmission;
	//System.out.println("show:" + show);
	int all = tool.allmission;
%>
<body>
	<jsp:include page="Admin_lead.jsp">
		<jsp:param value="2" name="block_id" />
	</jsp:include>
	<div style="width: 87.5%; margin-left: 0.1%; height: 824px; float: left;" class="dinylight-color">
		<div class="small-tittle middle-font font-normal-color" style="margin-bottom: 2px; float: left; width: 100%; margin-right: 0.2%;">&nbsp;┃&nbsp;批改任务</div>
		<!-- <form action="check_mission.jsp" method="post">
			<button name="onlyunfinish" value="1" class="light-color" style="margin-top: 5px; margin-left: 1%; width: 10%; height: 25px; color: white; border: 0px solid white; border-radius: 3px;">只查看未批改</button>
		</form> -->
		<div style="width: 100%; height: 820px; background-color: white;">
			<div style="width: 100%; height: 35px; margin-top: 3px;">
				<div class="firbox light-color">提交时间</div>
				<div class="firbox light-color">作业标题</div>
				<div class="firbox light-color">提交人</div>
				<div class="firbox light-color">语言</div>
				<div class="firbox light-color">状态</div>
				<div class="secbox light-color">任务类型</div>
			</div>
			<%
				String checkshow = request.getParameter("onlyunfinish");
				StringTokenizer chart1 = new StringTokenizer(tool.missions, "鲅");
				StringTokenizer chart2 = null;
				String color = "";
				for (int a = 0; a < show; a++) {
					chart2 = new StringTokenizer(chart1.nextToken(), "鰶");

					if (a % 2 == 0) {
						color = "dinylight-color";
					} else {
						color = "white-color";
					}
			%>

			<form action="check_mission_details.jsp" method="post">
				<div style="width: 100%; height: 35px; margin-top: 3px;">
					<%
						String difficult = chart2.nextToken();
							String pageID = chart2.nextToken();
							String missionID = chart2.nextToken();
							String update_time = chart2.nextToken();
							String tittle = chart2.nextToken();
							String name = chart2.nextToken();
							String language = chart2.nextToken();
							String charge = chart2.nextToken();
							String type = chart2.nextToken();
							//System.out.println("difficult:"+difficult);
					%>
					<input style="display: none" name="difficult" value="<%=difficult%>">
					<input style="display: none" name="nowpage" value="<%=nowpage%>">
					<input style="display: none" name="missionID" value="<%=missionID%>">
					<input style="display: none" name="ID" value="<%=request.getSession().getAttribute(" ID")%>">
					<input style="display: none" name="pageID" value="<%=pageID%>">
					<input style="display: none" name="update_time" value="<%=update_time%>">
					<input style="display: none" name="tittle" value="<%=tittle%>">
					<input style="display: none" name="name" value="<%=name%>">
					<input style="display: none" name="language" value="<%=language%>">
					<input style="display: none" name="type" value="<%=type%>">
					<div class="firbox dinylight-color">
						<button class="<%=color%>" name="missionID" value="<%=missionID%>" style="height: 100%; width: 100%; border: 0px solid white;">
							<%=update_time%></button>
					</div>
					<div class="firbox dinylight-color">
						<button class="<%=color%>" name="missionID" value="<%=missionID%>" style="height: 100%; width: 100%; border: 0px solid white;">
							<%=tittle%></button>
					</div>
					<div class="firbox dinylight-color">
						<button class="<%=color%>" name="missionID" value="<%=missionID%>" style="height: 100%; width: 100%; border: 0px solid white;">
							<%=name%></button>
					</div>
					<div class="firbox dinylight-color">
						<button class="<%=color%>" name="missionID" value="<%=missionID%>" style="height: 100%; width: 100%; border: 0px solid white;">
							<%=language%></button>
					</div>
					<div class="firbox dinylight-color">
						<button class="<%=color%>" name="missionID" value="<%=missionID%>" style="height: 100%; width: 100%; border: 0px solid white;">
							<%=charge%></button>
					</div>
					<div class="secbox dinylight-color">
						<button class="<%=color%>" name="missionID" value="<%=missionID%>" style="height: 100%; width: 100%; border: 0px solid white;">
							<%=type%></button>
					</div>

				</div>
			</form>
			<%
				}
			%>
			<form action="check_mission.jsp" method="post">
				<div class="turnpage-conntrol light-color" style="height: 110px; padding-top: 1px;">
					<div style="width: 100%; height: 25px; margin-bottom: 3px; line-height: 25px;" align="center">
						<font color="white">
							当前第
							<%=nowpage%>页/ 共有
							<%=allpages%>页
							<%=all%>条记录
						</font>
					</div>
					<div style="width: 100%; height: 35px; margin-bottom: 3px;" align="center">
						<%
							for (int a = 1; a <= allpages; a++) {
						%>
						<button name="jumpact" value="<%=a%>" class="dinylight-color" style="border-radius: 2px; height: 35px; width: 7%; border: 0px solid white;">
							<%=a%>
						</button>
						<%
							}
						%>
					</div>
					<div align="center" style="width: 100%; height: 35px;">
						<button name="act" value="1" class="dinylight-color" style="border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;">首页</button>
						<button name="act" value="2" class="dinylight-color" style="border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;">上一页</button>
						<select name="jumppage" style="width: 6%; height: 35px; border: 0px solid white; border-radius: 2px;">
							<%
								for (int a = 1; a <= allpages; a++) {
							%>
							<option value="<%=a%>">
								<%=a%>
							</option>
							<%
								}
							%>
						</select>
						<button name="act" value="3" class="dinylight-color" style="border-radius: 2px; height: 35px; width: 6%; border: 0px solid white;">跳转</button>
						<button name="act" value="4" class="dinylight-color" style="border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;">下一页</button>
						<button name="act" value="5" class="dinylight-color" style="border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;">尾页</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</body>
</html>
