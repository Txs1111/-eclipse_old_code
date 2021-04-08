
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
<%@page import="bean.Score_bean"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>积分排行</title>
<link rel="stylesheet" type="text/css"
	href="Css/Public_Color/orange.css" />
<link rel="stylesheet" type="text/css" href="Css/score.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />

</head>
<body bgcolor="#F4F5F7">
	<%
		request.setCharacterEncoding("UTF-8");//或者指定的编码(GBK或其他)
		String ID = null;
		if (request.getAttribute("ID") != null) {
			ID = (String) request.getAttribute("ID");
		}
		if (request.getParameter("ID") != null) {
			ID = request.getParameter("ID");
		}
		String topage = "1";//将要跳转的页面
		Score_bean bean = new Score_bean(ID);
		if (request.getAttribute("topage") != null && request.getAttribute("topage") != "") {
			topage = (String) request.getAttribute("topage");

		}
		System.out.println("=======================================================\nscore页面ID:" + ID);

		String point = bean.equally_points();
		bean.getmission(topage);
		String role = bean.role;
		bean.con.close();
	%>

	<jsp:include page="season.jsp"></jsp:include>
	<jsp:include page="head.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
		<jsp:param value="<%=role%>" name="role" />
		<jsp:param value="<%=bean.level%>" name="level" />
		<jsp:param value="<%=bean.nickiname%>" name="nickiname" />
		<jsp:param value="<%=bean.sign%>" name="sign" />
		<jsp:param value="<%=bean.background%>" name="background" />
		<jsp:param value="<%=bean.headphoto%>" name="headphoto" />
	</jsp:include>
	<jsp:include page="lead.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
	</jsp:include>


	<div class="page_background">
		<div class="background_left">
			<div class="scorecard_background">
				<jsp:include page="user_points.jsp">
					<jsp:param value="<%=point%>" name="user_point" />
				</jsp:include>
			</div>
			<div class="rank_background">
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;排行榜
			</div>
			<jsp:include page="ranking.jsp"></jsp:include>
			</div>
		</div>
		<div class="background_right">
			<jsp:include page="oldwork.jsp">
				<jsp:param value="<%=bean.finishs%>" name="missions" />
				<jsp:param value="<%=ID%>" name="ID" />
				<jsp:param value="<%=bean.allpage%>" name="allpage" />
				<jsp:param value="<%=topage%>" name="nowpage" />
			</jsp:include>

		</div>
	</div>
</body>
</html>
<script>
	$(function() {
		$('#score').css('border-bottom-style', 'solid');
		var $logo = $('#sign_list li');

		$logo.mouseenter(function() {
			$(this).css('border-bottom-style', 'solid');
			$('#score').css('border-bottom-style', 'none');
		});

		$logo.mouseleave(function() {
			$logo.css('border-bottom-style', 'none');
			$('#score').css('border-bottom-style', 'solid');
		});
	});
</script>