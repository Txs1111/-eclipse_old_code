
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Assignment.css" />
<link rel="stylesheet" type="text/css" href="./Css/Public_Color/orange.css" />
</head>
<body>
	<!--任务具体信息 -->
	<div class="finish_first_headline normal-color">
		<div class="finish_first_head_1 normal-color normal-font">发布日期</div>
		<div class="finish_first_head_2  normal-color normal-font">截止日期</div>
		<div class="finish_first_head_2  normal-color normal-font">语言</div>
		<div class="finish_secend_head  normal-color normal-font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看作业</div>
		<div class="finish_first_head_2  normal-color normal-font">难度</div>
		<div class="finish_third_head  normal-color normal-font">类型</div>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		String missiondate = request.getParameter("missiondate");
		StringTokenizer chart1 = new StringTokenizer(missiondate, "欛");
		StringTokenizer chart2 = null;
		int num = chart1.countTokens();
		String color = "";
		for (int a = 0; a < num; a++) {
			if (a % 2 == 0) {
				color = "white-color";
			} else {
				color = "dinylight-color";
			}
			chart2 = new StringTokenizer(chart1.nextToken(), "鰶");
	%>
	<div class="finish_first_contentline <%=color%>">
		<div class="<%=color%>">
			<div class="finish_first_1 <%=color%> small-font light-font"><%=chart2.nextToken()%></div>
			<div class="finish_first_2 <%=color%> small-font light-font"><%=chart2.nextToken()%></div>
			<div class="finish_first_2 <%=color%> small-font"><%=chart2.nextToken()%></div>
			<form action="Assignment_unfinished_details.jsp" method="post">
				<div class="finish_secend <%=color%> small-font">
					<button style="line-height: 35px; width: 100%; height: 100%; border: 0px solid white;" class="<%=color%>" name="missionID" value="<%=chart2.nextToken()%>">
						<img src="img/mission_tips/<%=chart2.nextToken()%>.png" style="height: 50%; margin-top: 5px; float: left;">
						<%=chart2.nextToken()%>
					</button>
				</div>
			</form>
			<div class="finish_first_2 <%=color%> small-font ">
				<%
					int starts = Integer.parseInt(chart2.nextToken());
						for (int b = 0; b < starts; b++) {
				%>
				<img src="img/example/星星.png" style="height: 30%; margin-top: 15%;">
				<%
					}
				%>
			</div>
			<div class="finish_third <%=color%> small-font light-font"><%=chart2.nextToken()%></div>
		</div>
	</div>
	<%
		}
	%>



</body>
</html>