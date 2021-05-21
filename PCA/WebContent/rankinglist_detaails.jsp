<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="bean.*"%>
<%@page import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>总排行榜</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Work.css" />

<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
</head>
<body>
	<div style="width: 75%; height: 1000px; margin: 0 auto;" class="dinylight-color">
		<div style="width: 100%; height: 35px;"></div>
		<div style="margin-top: 35px; margin: 0 auto; font-size: 25px; text-align: center; color: gray;">
			<font>总排行榜</font>
		</div>
		<div style="margin-top: 35px; width: 95%; height: 2px; background-color: gray; margin: 0 auto;"></div>
		<form action="goto_user_personal_homepage" method="post">
			<ul style="width:100%;">
				<%
					request.setCharacterEncoding("UTF-8");
					ranknode head = null;

					count_rank rank = new count_rank();
					head = rank.node;
					String rankdata = "";
					rankdata = rank.getrank();
					StringTokenizer chart = new StringTokenizer(rankdata, "鰶");
					int num = chart.countTokens() / 3;
					int i = 1;
					while (head.next != null) {
				%><li style="list-style: none;">
					<button  value="<%=head.ID%>" style="cursor: pointer; border: 0px solid white;width:100%;height:30px;" name="toID">
						<div style="wdith:100%;height:100%;">
							<div  style="width:25%;height:100%;float:left;color: #FFA980;"><%=i + 1%></div>
							<div style="width:45%;height:100%;float:left;"><%=head.name%></div>
							<div style="width:30%;height:100%;float:left;">
								积分:<%=head.point%></div>
						</div>
					</button>
				</li>
				<%head=head.next;
					}
				%>
			</ul>
		</form>


	</div>

</body>
</html>