<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/score.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
</head>
<body>
	<%
		String ID = null;
		if (request.getParameter("ID") != null) {
			ID = request.getParameter("ID");
		}
		int allpage = Integer.parseInt(request.getParameter("allpage"));
		int nowpage = Integer.parseInt(request.getParameter("nowpage"));
		request.setCharacterEncoding("UTF-8");
		String mission = request.getParameter("missions");
		StringTokenizer chart1 = new StringTokenizer(mission, "鷄");
		StringTokenizer chart2 = null;
	%>
	<div class="oldwork_head ">
		<font class="middle-font" color="#FFA980"> &nbsp;┃&nbsp;往期完成任务 </font>
	</div>
	<div class="body_block" style="height: 0px;">
		<%
			int num = chart1.countTokens();
			System.out.println("本页显示任务数量:" + num);
			if (num == 0) {
		%>
		<div style="width: 100%;" align="center">
			<img src="img/example/empty1.png">
			</br>
			</br>
			<font style="font-size: 20px; color: #bfbfbf">
				<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前还啥都没有~ </b>
			</font>
		</div>
		<%
			}
			for (int a = 0; a < num; a++) {
				chart2 = new StringTokenizer(chart1.nextToken(), "撾");
		%>
		<form action="Assignment_finished_details.jsp"method="post">


			<div class="work_inf" style="background-color: #FAFAFA; height: 215px;">
				<div style="width: 95%; margin: 0 auto; height: 25px; margin-top: 5px; line-height: 25px;">
					<div class=" middle-font" style="float: left;">
						<%
							String missionID = chart2.nextToken();
						%>
						<button style="cursor: pointer; border: 0px solid white; background-color: #FAFAFA;" name="missionID" value="<%=missionID%>">
							<%=chart2.nextToken()%>
						</button>
					</div>
					<input style="display: none;" type="text" name="ID" value="<%=ID%>">
					<input style="display: none;" type="text" name="lastpage" value="1">
					<div style="float: right;">
						<font>难度: </font>
						<%
							int starts = Integer.parseInt(chart2.nextToken());
								for (int b = 0; b < starts; b++) {
						%>
						<img src="img/example/星星.png" id="good">
						<%
							}
						%>
					</div>
					<div style="float: right; line-height: 20px;">
						<font class="middle-font" color="#FFA980"> &nbsp;┃&nbsp; </font>
					</div>
					<div style="float: right;">
						<font>类型:</font>
						<font color="#000000">
							<%=chart2.nextToken()%>
						</font>
					</div>
					<div style="float: right; line-height: 20px;">
						<font class="middle-font" color="#FFA980"> &nbsp;┃&nbsp; </font>
					</div>
					<div style="float: right;">
						<font>得分:</font>
						<font color="#000000">
							<%=chart2.nextToken()%>
						</font>
					</div>
					<div style="float: right; line-height: 20px;">
						<font class="middle-font" color="#FFA980"> &nbsp;┃&nbsp; </font>
					</div>
				</div>
				<div class="dinylight-color work_maininf">
					<textarea class="dinylight-color" style="line-height: 16px; border: 0px solid white; resize: none; width: 100%; height: 100%;" readonly><%=chart2.nextToken()%></textarea>
				</div>
				<div style="margin-top: 2px; width: 95%; margin: 0 auto;">
					<div>
						<div>
							<%
								String date = chart2.nextToken();
							%>
							<font color="gray">
								<%=date%>
							</font>
							<input style="display: none;" type="text" name="missiondate" value="<%=date%>">
						</div>
					</div>
				</div>
			</div>
		</form>
		<%
			}
		%>
	</div>
	<%
		if (allpage != 0) {
			if (num != 0) {
	%>
	<form action="score_turnpage" method="post">
		<input name="nowpage" value="<%=nowpage%>" style="display: none;">
		<input name="ID" value="<%=ID%>" style="display: none;">
		<input name="allpage" value="<%=allpage%>" style="display: none;">
		<div class="turnpage-conntrol light-color" style="height: 110px; padding-top: 1px;">
			<div style="width: 100%; height: 25px; margin-bottom: 3px; line-height: 25px;" align="center">
				<font color="white">
					当前第<%=nowpage%>页/ 共有<%=allpage%>页
				</font>
			</div>
			<div style="width: 100%; height: 35px; margin-bottom: 3px;" align="center">
				<%
					for (int a = 0; a < allpage; a++) {
				%>
				<button name="jumpact" value="<%=a + 1%>" class="dinylight-color" style="cursor: pointer; border-radius: 2px; height: 35px; width: 7%; border: 0px solid white;">
					<%=a + 1%>
				</button>
				<%
					}
				%>

			</div>
			<div align="center" style="width: 100%; height: 35px;">
				<button name="act" value="1" class="dinylight-color" style="cursor: pointer; border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;">首页</button>
				<button name="act" value="2" class="dinylight-color" style="cursor: pointer; border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;">上一页</button>
				<select name="jumppage" style="width: 6%; height: 35px; border: 0px solid white; border-radius: 2px;">
					<option value=<%=nowpage%>><%=nowpage%></option>
					<%
						for (int a = 0; a < allpage; a++) {
					%>
					<option value=<%=a + 1%>><%=a + 1%></option>
					<%
						}
					%>
				</select>
				<button name="act" value="3" class="dinylight-color" style="cursor: pointer; border-radius: 2px; height: 35px; width: 6%; border: 0px solid white;">跳转</button>
				<button name="act" value="4" class="dinylight-color" style="cursor: pointer; border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;">下一页</button>
				<button name="act" value="5" class="dinylight-color" style="cursor: pointer; border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;">尾页</button>
			</div>
		</div>
	</form>
	<%
		}
		}
	%>
</body>
</html>
