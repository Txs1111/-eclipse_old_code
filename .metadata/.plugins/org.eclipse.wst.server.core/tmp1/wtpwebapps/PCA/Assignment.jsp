
<%@page import="java.util.ArrayList"%>
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="bean.Assignment_bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>任务</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Assignment.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
</head>
<body bgcolor="#F4F5F7">
	<%
		request.setCharacterEncoding("UTF-8");//或者指定的编码(GBK或其他)
		String ID = null;
		String pages = null;
		if (request.getAttribute("ID") != null) {
			ID = (String) request.getAttribute("ID");
		} else if (request.getParameter("ID") != null) {
			ID = request.getParameter("ID");
		}
		if (ID == null || "".equals(ID) || "null".equals(ID)) {
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		String showpage = null;
		pages = request.getParameter("page");
		String type1 = null;
		String type2 = null;
		//筛选元素
		String types = request.getParameter("type");
		String languages = request.getParameter("language");
		String difs = request.getParameter("dif");
		//======
		Assignment_bean bean = new Assignment_bean(ID);
		ArrayList<String> type = bean.gettype();
		ArrayList<String> language = bean.getlanguage();
		if (request.getParameter("setlocal") != null) {
			type2 = "light-color";
			type1 = "dinylight-color";
			showpage = "Assignment_finished.jsp";
			bean.getfinished(languages, types, difs);
		} else if ("0".equals(pages)) {
			type2 = "light-color";
			type1 = "dinylight-color";
			showpage = "Assignment_finished.jsp";
			bean.getfinished(languages, types, difs);
		} else if ("1".equals(pages)) {
			type1 = "light-color";
			type2 = "dinylight-color";
			showpage = "Assignment_unfinish.jsp";
			bean.get_allmission(languages, types, difs);
		} else {
			type1 = "light-color";
			type2 = "dinylight-color";
			showpage = "Assignment_unfinish.jsp";
			bean.get_allmission(languages, types, difs);
		}
		String missiondate = bean.missiondate;
		bean.head();//获取头像模块的信息
		String role = bean.role;//获取用户角色
	%>
	<!-- 调用头部页面 -->
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
	<!-- 调用任务模块页面 -->
	<div class="Assignment_lead_block">
		<form action="Assignment.jsp" method="post">
			<input type="text" name="ID" value="<%=ID%>" style="display: none">


			<button type="submit" class="finish middle-font <%=type1%>" style="cursor: pointer;" name="page" value="1">全部任务</button>
			<button type="submit" class="finish middle-font <%=type2%>" style="cursor: pointer; margin-left: 1%;" name="page" value="0">已完成</button>
		</form>
		<!-- 任务筛选模块 -->
		<%
			if ("Assignment_unfinish.jsp".equals(showpage)) {
		%>
		<form action="Assignment.jsp" method="post">
			<font style="float: left; margin-left: 15px; margin-top: 28px;">语言</font>
			<select name="language" style="float: left; width: 12%; height: 25px; margin-top: 25px; margin-left: 5px;">
				<%
					if (languages == null || "".equals(languages) || "null".equals(languages)) {
				%>
				<option value="">--</option>
				<%
					} else {
				%>
				<option value="<%=languages%>"><%=language.get(Integer.parseInt(languages) - 1)%></option>
				<option value="">--</option>
				<%
					}
						for (int num = 1; num <= language.size(); num++) {
				%>
				<option value="<%=num%>"><%=language.get(num - 1)%></option>
				<%
					}
				%>
			</select>
			<font style="float: left; margin-left: 15px; margin-top: 28px;">类型</font>
			<select name="type" style="float: left; width: 12%; height: 25px; margin-top: 25px; margin-left: 5px;">
				<%
					if (types == null || "".equals(types) || "null".equals(types)) {
				%>
				<option value="">--</option>
				<%
					} else {
				%>
				<option value="<%=types%>"><%=type.get(Integer.parseInt(types) - 1)%></option>
				<option value="">--</option>
				<%
					}
						for (int num = 1; num <= type.size(); num++) {
				%>
				<option value="<%=num%>"><%=type.get(num - 1)%></option>
				<%
					}
				%>
			</select>
			<font style="float: left; margin-left: 15px; margin-top: 28px;">难度</font>
			<select name="dif" style="float: left; width: 12%; height: 25px; margin-top: 25px; margin-left: 5px;">
				<%
					if (difs == null || "".equals(difs) || "null".equals(difs)) {
				%>
				<option value="">--</option>
				<%
					} else {
				%>
				<option value="<%=difs%>"><%=difs%></option>
				<option value="">--</option>
				<%
					}
						for (int num = 1; num <= 3; num++) {
				%>
				<option value="<%=num%>"><%=num%></option>
				<%
					}
				%>
			</select>
			<input style="display: none;" name="page" value="<%=pages%>">
			<input type="text" name="ID" value="<%=ID%>" style="display: none">
			<button name="select" value="1" style="width: 9%; height: 35px; border: 0px solid white; border-radius: 5px; color: white; margin-top: 13px;" class="light-color">筛选</button>
		</form>
		<%
			}
		%>
		<!-- 
				<div class="search ">
					<div class="search-block">
						<div class="search-symble">
							<img src="img/lead_photo/搜索.png" style="width: 110%; height:110%;"/>
						</div>
						<div class="search-form">
							
								<input type="text" style="width: 83.5%;height: 25px;"/>
								<input type="submit" style="cursor:pointer;" class="check_button normal-color" value="搜索" />
							
						</div>
					</div>
				</div>
				 -->
	</div>
	<!--任务导航信息 -->
	<style type="text/css">
.selection {
	margin-left: 2%;
	width: 96%;
	height: 28px;
	margin-bottom: 2px;
	line-height: 28px;
}

.select_button {
	margin-left: 2%;
	width: 96%;
	height: 30px;
	pading-top: 2.5%;
}
</style>
	<!--  
		<div class="Assignment_head_block dinylight-color">
					<div class="selection light-color">
						类型
						<b>&nbsp;|&nbsp; </b>
					</div>
					<div class="selection light-color">
						语言
						<b>&nbsp;|&nbsp; </b>
					</div>
					<div class="selection light-color">
						<div style="width:50%;float:left;">
							难度
							<b>&nbsp;|&nbsp; </b>
						</div>
						<div style="width:50%;float:left;">
							得分
							<b>&nbsp;|&nbsp; </b>
						</div>
					</div>
					<div class="select_button light-color">
						<button id="button" class="normal-color" style="cursor:pointer;width:15%;height:95%;border:0px solid white;border-radius:3px;">筛选</button>
					</div>
					
		</div>
		-->
	<div style="width: 75%; margin: 0 auto;">
		<jsp:include page="<%=showpage%>">
			<jsp:param value="<%=ID%>" name="ID" />
			<jsp:param value="<%=missiondate%>" name="missiondate" />
		</jsp:include>
	</div>
</body>
<script>
	$(function() {
		$('#assignment').css('border-bottom-style', 'solid');
		var $logo = $('#sign_list li');

		$logo.mouseenter(function() {
			$(this).css('border-bottom-style', 'solid');
			$('#assignment').css('border-bottom-style', 'none');
		});

		$logo.mouseleave(function() {
			$logo.css('border-bottom-style', 'none');
			$('#assignment').css('border-bottom-style', 'solid');
		});
	});
</script>
</html>
<%
	bean.con.close();
%>
