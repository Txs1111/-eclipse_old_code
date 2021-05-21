
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.Score_bean" import="java.util.*" import="bean.getpower"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="Css/score.css" />
<link rel="stylesheet" type="text/css" href="./Css/Public_style.css" />
<link rel="stylesheet" type="text/css"
	href="./Css/Public_Color/orange.css" />
<title></title>
</head>
<body>
	<%
		String point = request.getParameter("user_point");
		String ID = (String) request.getSession().getAttribute("ID");
		//String ID = "000";
		Score_bean bean = new Score_bean(ID);
		int score = 0;
		int finish = 0;
		int rank = 0;	
		score=bean.getpoint();			
		finish=bean.allfinish;		
		rank=bean.userrank();
		getpower power=new getpower(ID);
	%>


	<div class="scorecard_tittle light-color">
		<font class="middle-font">我的积分卡片</font>
	</div>
	<div class="scorecard_date">
		<div class="scorecard_date_left small-font">积分</div>
		<div class="scorecard_date_centre small-font">已完成</div>
		<div class="scorecard_date_right small-font">排名</div>
	</div>
	<div class="scorecard_date_b">
		<div class="scorecard_date_left middle-font">
		<%if(power.checkpower("5")){ %>
			<%=score%>
		<%}else{
		%>
		--
		<% 
		}	%>
		
		</div>
		<div class="scorecard_date_centre middle-font">
		<%if(power.checkpower("5")){ %>
			<%=finish%><%}else{
		%>
		--
		<% 
		}	%>
		</div>
		<div class="scorecard_date_right middle-font">
		<%if(power.checkpower("5")){ %>
			<%=rank%><%}else{
		%>
		--
		<% 
		}	%>
		</div>
	</div>
	<div class="scorecard_synthesize_tittle light-color">
		<font class="middle-font">综合评分</font>
	</div>
	<div class="scorecard_synthesize dinylight-color">
		<font class="big-font">
		<%if(power.checkpower("5")){ %>
		<%=point%><%}else{
		%>
		--
		<% 
		}	%></font>
	</div>
</body>
</html>