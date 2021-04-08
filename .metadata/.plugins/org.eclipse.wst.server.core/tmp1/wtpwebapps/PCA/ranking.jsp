<%@page import="java.util.StringTokenizer"%>
<%@page import="bean.*"%>
<%
	/*------------------------------------------------------------------------------------------------
	修改人 王旭升		     
	修改时间 	2021-1-27	
	修改内容	添加后台
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="./Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/score.css" />
<link rel="stylesheet" type="text/css" href="./Css/Public_Color/orange.css" />
</head>
<body>

	<form action="goto_user_personal_homepage" method="post">
		<ul class="rank_users" style="overflow-y:hidden;height:500px;" id="judgearea">
			<%
				request.setCharacterEncoding("UTF-8");
				count_rank rank = new count_rank();
				String rankdata = "";
				rankdata = rank.getrank();
				StringTokenizer chart = new StringTokenizer(rankdata, "鰶");
				int num = chart.countTokens() / 3;
				
				for (int i = 0; i < num; i++) {
					if (i < 3) {
			%>
			<li style="list-style: none;">
				<button class="rank_users" value="<%=chart.nextToken()%>" style="cursor: pointer; border: 0px solid white;" name="toID" id="<%=i%>">
					<div class="rank_users">
						<div class="rank_user_number middle-font" style="color: #FFA980;"><%=i + 1%></div>
						<div class="rank_user_name middle-font"><%=chart.nextToken()%></div>
						<div class="rank_user_point small-font">
							积分:<%=chart.nextToken()%></div>
					</div>
				</button>
			</li>
			<%
				} else {
			%><li style="list-style: none;">
				<button class="rank_users" value="<%=chart.nextToken()%>" style="cursor: pointer; border: 0px solid white;" name="toID" id="<%=i%>">
					<div class="rank_users">
						<div class="rank_user_number small-font"><%=i + 1%></div>
						<div class="rank_user_name middle-font"><%=chart.nextToken()%></div>
						<div class="rank_user_point small-font">
							积分:<%=chart.nextToken()%></div>
					</div>
				</button>
			</li>
			<%
				}

				}
			%>
		</ul>
	</form>
</body>
</html>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script>
$(function(){
	$('#judgearea').mouseover(function(){
		$(this).css('overflow-y','auto');
	});
	$('#judgearea').mouseleave(function(){
		$(this).css('overflow-y','hidden');
	});
});
</script>




