
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" import="bean.Handle_date" import="bean.check_ifcalendar" pageEncoding="UTF-8" import="bean.getpower"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Document</title>
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<link href="Css/Public_style.css" rel="stylesheet" />
<link href="Css/Homepage.css" rel="stylesheet" />
</head>

<%
	Handle_date date = new Handle_date();
	int nowday = date.getIntDay();
	int year = date.getIntyear();
	int month = date.getIntMonth();
	System.out.println(
			"date:" + date.getMonth() + "intdate" + date.getIntMonth() + "alldate:" + date.getIntDate());
	int a = 0, yvshu = 0;
	int day1 = 0;
	for (a = 2; a <= year; a++) {
		if (a % 4 == 0 && a % 100 != 0 || a % 400 == 0) {
			day1 = day1 + 366;
		} else {
			day1 = day1 + 365;
		}
	}
	int m[] = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 };
	int n[] = { 0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30 };
	int day2 = 0;
	if (a % 4 == 0 && a % 100 != 0 || a % 400 == 0) {
		for (a = 0; a < month; a++) {
			day2 = day2 + n[a];
		}
	} else {
		for (a = 0; a < month; a++) {
			day2 = day2 + m[a];
		}
	}
	yvshu = (day1 + day2) % 7;

	String ID = request.getParameter("ID");
	String calendar = (String) request.getParameter("calendar");
	System.out.println("==" + calendar + "==" + ID);
	System.out.println(
			"1:" + yvshu + "nowday:" + nowday + "year:" + year + "month:" + month + "calendar:" + calendar);
%>
<div class='calendar_whole_block'>
	<ul>
		<li class='week'>一</li>
		<li class='week'>二</li>
		<li class='week'>三</li>
		<li class='week'>四</li>
		<li class='week'>五</li>
		<li class='week'>六</li>
		<li class='week'>日</li>
		<%
			int c = 0;
			for (c = 1; c <= yvshu; c++) {
				out.println("<li></li>");
			}

			int m1[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
			int n1[] = { 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
			String signed = request.getParameter("signed");
			check_ifcalendar check = new check_ifcalendar();
			if (yvshu % 4 == 0 && yvshu % 100 != 0 || yvshu % 400 == 0) {
				for (c = 1; c <= n1[month - 1]; c++) {
					if (c == nowday && "null".equals(calendar)) {
						out.println("<li class='today_li light-color'>" + c + "</li>");
					} else if (c == nowday && !"null".equals(calendar) || check.check(c, signed)) {
						out.println("<li class='today_li 'style='color:#FFA980;'>" + c + "</li>");
					} else {
						out.println("<li class='today_li dinylight-color'>" + c + "</li>");
					}
				}
			} else {
				for (c = 1; c <= m1[month - 1]; c++) {
					if (c == nowday && "null".equals(calendar)) {
						out.println("<li class='today_li light-color'>" + c + "</li>");
					} else if (c == nowday && !"null".equals(calendar) || check.check(c, signed)) {
						out.println("<li class='today_li 'style='color:#FFA980;'>" + c + "</li>");
					} else {
						out.println("<li class='today_li dinylight-color'>" + c + "</li>");
					}
				}
			}
		%>
	</ul>
	<%
		System.out.println("测试calendar:" + calendar);
		if (!"null".equals(calendar)) {
			out.println(
					"<!-- <form action='calendar_detail.jsp'method='post'>--> <button class='signup light-color'>已签到(查看更多)</button><!--</form>-->");
		} else {
			getpower power = new getpower(ID);
			if (power.checkpower("24")) {
	%>
	<form action='calendar' method='post'>
		<%
			}
		%>
		<button class='signup light-color' type='submit' name='calendar' value='<%=ID%>'>签到</button>
	</form>
	<%
		}
	%>
</div>
</body>

</html>