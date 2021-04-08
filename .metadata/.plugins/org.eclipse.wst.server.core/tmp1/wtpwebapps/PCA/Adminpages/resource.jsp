<%@page import="dao.resource_entity"%>
<%@page import="dao.get_resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.Admin_tools"
	import="java.util.StringTokenizer"%>
<%@page import="bean.official_bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="../Css/Assignment.css" />
<link rel="stylesheet" type="text/css" href="../Css/Message.css" />
<link href="../Css/Homepage.css" rel="stylesheet" />
<link href="../Css/Public_Color/orange.css" rel="stylesheet" />
<%
	String content = request.getParameter("submit");
	if (content == null)
		content = "null";
	String uid = request.getParameter("uid");
	get_resource grr = new get_resource(0);
	if (content.equals("合格")) {
		grr.yes(uid);
	} else if (content.equals("不合格")) {
		grr.no(uid);
	} else if (content.equals("过期")) {
		grr.die(uid);
	}

	String ID = (String) request.getSession().getAttribute("ID");
	get_resource gr = new get_resource();
	resource_entity all_head;
	all_head = gr.allResource();
	resource_entity head;
	head = gr.resource();
	resource_entity Submit_head;
	Submit_head = gr.checkSubmitResource();
	resource_entity die_head;
	die_head = gr.checkDieResource();
	gr.get_a("链接：https://pan.baidu.com/s/130o9ba650lMjaOdOCLpHzQ");
%>
</head>
<body><jsp:include page="Admin_lead.jsp"><jsp:param value="13" name="block_id" /></jsp:include>
	<div
		style="width: 87.5%; margin-left: 0.1%; height: 824px; float: left;"
		class="dinylight-color">
		<div class="small-tittle middle-font font-normal-color">
			&nbsp;┃&nbsp;资源管理</div>
		<div style="width: 66.5%; float: left; margin-right: 0.5%;">
			<div style="width: 100%; float: left;" align="center"
				class="small-tittle middle-font font-normal-color">
				&nbsp;-&nbsp;总资源数&nbsp;-&nbsp;</div>
			<div
				style="font-size: 50px; line-height: 100px; width: 100%; height: 101px; color: white; float: left;"
				align="center" class="light-color">
				<%=head.number%>
			</div>
		</div>
		<div style="width: 33%; height: 30px; float: left;">
			<div style="width: 100%; float: left;" align="center"
				class="small-tittle middle-font font-normal-color">
				&nbsp;-&nbsp;当天新更新资源数&nbsp;-&nbsp;</div>
			<div
				style="font-size: 20px; line-height: 35px; width: 100%; float: left; color: white; height: 35px;"
				align="center" class="light-color">
				<%=gr.newTodayNumber()%>
			</div>
			<div style="width: 100%; float: left;" align="center"
				class="small-tittle middle-font font-normal-color">
				&nbsp;-&nbsp;当天失效资源数&nbsp;-&nbsp;</div>
			<div
				style="font-size: 20px; line-height: 35px; width: 100%; float: left; color: white; height: 35px;"
				align="center" class="light-color">
				<%=gr.dieTodayNumber()%>
			</div>
		</div>

		<div style="overflow-x: auto; width: 100%;">
			<%
				for (int i = 0; i < gr.alltype.size(); i++) {
			%>
			<div style="width: 1350px;">
				<div style="width: 147px; float: left; margin-left: 3px;">
					<div
						style="width: 100%; float: left; margin-right: 0.5%; margin-top: 5px;"
						align="center" class="small-tittle middle-font font-normal-color">
						&nbsp;-&nbsp;<%=gr.alltype.get(i)%>&nbsp;-&nbsp;
					</div>
					<div align="center"
						style="width: 100%; height: 35px; color: white; float: left; line-height: 35px; font-size: 20px; margin-right: 0.5%;"
						class="light-color"><%=gr.type_number.get(i)%></div>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div style="width: 50%; height: 100px; float: left;"
			class="small-tittle small-font font-normal-color">
			<font>&nbsp;┃&nbsp;提交资源审核&nbsp;<%=Submit_head.number%>
			</font>
			<div id="Message_head"></div>
			<div id="tidings"
				style="overflow-y: auto; overflow-x: hidden; height: 503px; width: 99%;">
				<%
					int submit_number = Submit_head.number;
					for (int i = 0; i < submit_number; i++) {
				%>
				<div id="tidings_left">
					<div id="name">
						<font class="small-font" id="samll-B"><%=gr.getName(Submit_head.ID)%></font><br />
						<a> <font class="small-font"><%=Submit_head.title%></font>
						</a>

					</div>
					<div id="detail">
						<div id="detail_photo">
							<img src="../img/lead_photo/details.png"
								style="width: 100%; height: 100%;" />
						</div>
						<div id="detail_text">
							<font>详细</font>
						</div>
					</div>

				</div>
				<form action="resource.jsp" method="post">
					<input type="text" name="uid" value="<%=Submit_head.uid%>"
						style="display: none;"> <input type="submit" name="submit"
						value="合格">
				</form>
				<form action="resource.jsp" method="post">
					<input type="text" name="uid" value="<%=Submit_head.uid%>"
						style="display: none;"> <input type="submit" name="submit"
						value="不合格">
				</form>
				<div id="tidings_right">
					<div class="dynamic_content_new dinylight-color"
						style="border-radius: 1px; width: 71%; height: 104px; margin-left: 24px;"><%=Submit_head.content%></div>
					<div id="function">
						<div id="time">
							<font id="samll"><%=Submit_head.verification%><%=Submit_head.time%></font>
						</div>
					</div>
				</div>
				<%
					if (Submit_head.number - i != 1)
							Submit_head = Submit_head.next;
					}
				%>
			</div>
		</div>
		<div style="width: 50%; height: 100px; float: left;"
			class="small-tittle small-font font-normal-color">
			<font>&nbsp;┃&nbsp;失效资源审核&nbsp;<%=die_head.number%></font>
			<div id="Message_head"></div>
			<div id="tidings"
				style="overflow-y: auto; overflow-x: hidden; height: 503px; width: 99%;">
				<%
					int die_number = die_head.number;
					for (int i = 0; i < die_number; i++) {
				%>
				<div id="tidings_left">
					<div id="name">
						<font class="small-font" id="samll-B"><%=gr.getName(die_head.ID)%></font><br />
						<a> <font class="small-font"><%=die_head.title%></font>
						</a>

					</div>
					<div id="detail">
						<div id="detail_photo">
							<img src="../img/lead_photo/details.png"
								style="width: 100%; height: 100%;" />
						</div>
						<div id="detail_text">
							<font>详细</font>
						</div>
					</div>
				</div>
				<form action="resource.jsp" method="post">
					<input type="text" name="uid" value="<%=die_head.uid%>"
						style="display: none;"> <input type="submit" name="submit"
						value="合格">
				</form>
				<form action="resource.jsp" method="post">
					<input type="text" name="uid" value="<%=die_head.uid%>"
						style="display: none;"> <input type="submit" name="submit"
						value="过期">
				</form>
				<div id="tidings_right">
					<div class="dynamic_content_new dinylight-color"
						style="border-radius: 1px; width: 71%; height: 104px; margin-left: 24px;"><%=die_head.content%></div>
					<div id="function">
						<div id="time">
							<font id="samll"><%=die_head.verification%><%=die_head.time%></font>
						</div>
					</div>
				</div>
				<%
					if (die_head.number - i != 1)
							die_head = die_head.next;
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>tml>