<%@page import="java.util.StringTokenizer"%>
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.getmissioninf" import="dao.submit_mission" import="bean.getpower"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Assignment.css" />
<link rel="stylesheet" type="text/css" href="./Css/Public_Color/orange.css" />
</head>
<style>
button {
	border: 0;
	outline: none;
}
</style>
<body bgcolor="#F4F5F7">
	<%
		request.setCharacterEncoding("UTF-8");
		String missionID = request.getParameter("missionID");
		getmissioninf get = new getmissioninf(missionID);
		StringTokenizer chart = new StringTokenizer(get.missioninf, "鰶");
		String ID = (String) request.getSession().getAttribute("ID");
		if (ID == null || "".equals(ID) || "null".equals(ID)) {
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		String tips = "";
		if ("1".equals(request.getParameter("sub"))) {
			String work = request.getParameter("work");
			if (work == null || "".equals(work)) {
				tips = "不能提交空的作业!";
			} else {
				submit_mission sub = new submit_mission(ID, missionID, work);
				tips = "nice~提交成功!";
			}
		}
	%>
	<!--头部信息-->
	<div class="Details_whole_block" style="width: 75%;" style="margin-top:0px;">
		<form action="Assignment.jsp" method="post">
			<div class="big-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;
				<button class="middle-font font-light-color" name="ID" value="<%=(String) request.getSession().getAttribute("ID")%>" style="background-color: #FAFAFA">未完成任务</button>
				/
				<%=chart.nextToken()%>
				<img src="img/lead_photo/返回.png" style="width: 30px; height: 25px; float: right; margin-top: 10px;">

				<button class="middle-font font-light-color" name="ID" value="<%=(String) request.getSession().getAttribute("ID")%>" style="float: right; background-color: #FAFAFA; margin-top: 10px;">返回上一级</button>

			</div>
		</form>

		<div class="body_block">

			<!--详细内容展示 -->
			<div class="small_block  middle-font-B font-normal-color" style="margin-left: 2.5%; margin-top: 10px;">
				&nbsp;发布日期：<%=chart.nextToken()%></div>
			<div class="small_block  middle-font-B font-normal-color" style="margin-left: 2.5%; margin-top: 10px;">
				&nbsp;截止日期：<%=chart.nextToken()%></div>
			<div class="small_block  middle-font-B font-normal-color" style="margin-left: 2.5%; margin-top: 10px;">
				&nbsp;语言：<%=chart.nextToken()%></div>

			<div class="small_block  middle-font-B font-normal-color" style="margin-left: 2.5%; margin-top: 10px;">
				&nbsp;类型：<%=chart.nextToken()%></div>
			<div class="small_block  middle-font-B font-normal-color" style="margin-left: 2.5%; margin-top: 10px;">
				&nbsp;最高可获积分：<%=chart.nextToken()%></div>
			<div class="small_block  middle-font-B font-normal-color" style="margin-left: 2.5%; margin-top: 10px;">
				&nbsp;难度：
				<%
					String nan = chart.nextToken();
					if ("1".equals(nan)) {
						out.println("简单");
					} else if ("2".equals(nan)) {
						out.println("中等");
					} else {
						out.println("困难");
					}
				%>
			</div>



			<div class="small_block  middle-font-B  dinylight-color" style="color: grey; width: 95%; margin-left: 2.5%;">&nbsp;✦&nbsp;任务要求</div>
			<textarea readonly="readonly" class="inf_block middle-font dinylight-color"><%=chart.nextToken()%>
					</textarea>

			<!--任务提交表单 -->
			<div class="foin">
				<div class="foin_block_dis"></div>
				<div class="foin_block">

					<button style="border: 0; width: 90px; height: 30px; background-color: white;" class="font-normal-color">
						<div style="width: 20px; height: 20px; float: left;">
							<img src="img/lead_photo/图片.png" style="width: 100%; height: 100%" />
						</div>
						上传图片(未实现)
					</button>
					<button style="margin-top: 12px; border: 0; width: 110px; height: 30px; background-color: white;" class="font-normal-color">
						<div style="width: 20px; height: 20px; float: left;">
							<img src="img/lead_photo/代码.png" style="width: 90%; height: 90%" />
						</div>
						上传代码文件(未实现)
					</button>
					<%
						getpower power = new getpower(ID);
						if (power.checkpower("6")) {
					%>
					<form action="Assignment_unfinished_details.jsp" method="post">
						<%
							}
						%>
						<input style="display: none" name="missionID" value="<%=missionID%>">
						<textarea class="textarea_style" name="work"></textarea>
						<div style="width: 100%; height: 25px; font-size: 20px; line-height: 25px; color: red;" align="center"><%=tips%>
						</div>
						<button class="middle-font light-color white-font submit_style" value="1" name="sub">提交</button>


					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" charset="utf-8">
	var back = document.getElementById("back");
	back.onclick = function() {
		window.location.href = "Assignment_unfinish.jsp";
	}
</script>
</html>