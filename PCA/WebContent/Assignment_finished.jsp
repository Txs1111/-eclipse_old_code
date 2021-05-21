
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
<style type="text/css">
.white {
	background-color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Assignment.css" />
<link rel="stylesheet" type="text/css" href="./Css/Public_Color/orange.css" />
</head>
<body>
	<%
		int pageID = 1;//用于鉴别页面的ID 1为已完成 0为未完成
		String finished = request.getParameter("missiondate");
		System.out.println("finished:" + finished);
		StringTokenizer chart1 = new StringTokenizer(finished, "]");
	%>
	<!--任务具体信息 -->
	<div class="finish_first_headline normal-color">
		<div class="finish_first_head_1 normal-color normal-font">发布日期</div>
		<div class="finish_first_head_2  normal-color normal-font">截止日期</div>
		<div class="finish_first_head_2  normal-color normal-font">语言</div>
		<div class="finish_secend_head  normal-color normal-font">查看作业</div>
		<div class="finish_first_head_2  normal-color normal-font">评分</div>
		<div class="finish_third_head  normal-color normal-font">积分</div>
	</div>
	<%
		String ID = null;
		if (request.getParameter("ID") != null) {
			ID = request.getParameter("ID");
		}
		if (ID == null || "".equals(ID) || "null".equals(ID)) {
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		StringTokenizer chart2 = null;
		int num1 = chart1.countTokens();
		String color = null;
		if (num1 == 0) {
	%>
	<div style="width: 100%;" align="center">
		<img src="img/example/empty1.png">
		</br>
		</br>
		<font style="font-size: 20px; color: #bfbfbf">
			<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前还啥都没有~ </b>
		</font>
		</br>
	</div>
	<%
		}
		for (int a = 0; a < num1; a++) {
			if (a % 2 == 0) {
				color = "dinylight-color";
			} else {
				color = "white";
			}
			String inf = "";
			inf = chart1.nextToken();
			chart2 = new StringTokenizer(inf, "[");
	%>
	<form action="Assignment_finished_details.jsp" method="post">
		<input name="ID" value="<%=ID%>" style="display: none;">
		<div class="finish_first_contentline ">
			<div class="<%=color%>">
				<div class="finish_first_1 <%=color%> small-font light-font">
					<%=chart2.nextToken()%>
				</div>
				<div class="finish_first_2 <%=color%> small-font light-font">
					<%=chart2.nextToken()%>
				</div>
				<div class="finish_first_2 <%=color%> small-font">
					<%=chart2.nextToken()%>
				</div>
				<div class="finish_secend <%=color%> small-font">
					<button class="<%=color%>" style="width: 100%; height: 100%; border: 0px solid white;" name="missionID" value="<%=chart2.nextToken()%>">
						<%=chart2.nextToken()%>
					</button>
				</div>
				<div class="finish_first_2 <%=color%> small-font "><%=chart2.nextToken()%></div>
				<div class="finish_third <%=color%> small-font light-font"><%=chart2.nextToken()%></div>
			</div>
		</div>
	</form>
	<%
		}
	%>
	<%
		if (num1 != 0) {
	%>
	<!--
	
		<input name="nowpage" value=""style="display:none;" >
		<input name="ID" value=""style="display:none;" >
		<input name="allpage" value=""style="display:none;" >
		<div class="turnpage-conntrol light-color" style="height:110px;padding-top: 1px;">
			<div style="width:100%;height:25px;margin-bottom:3px;line-height:25px;" align="center">
			<font color="white"></font>		
			</div>
			<div style="width:100%;height:35px;margin-bottom:3px;" align="center">
			
				<button name="jumpact"value="" class="dinylight-color" style="border-radius:2px;height:35px;width:7%;border:0px solid white;">
					
				</button>
				
				
			</div>
			<div align="center" style="width:100%;height:35px;">
				<button name="act"value="1" class="dinylight-color" style="border-radius:2px;height:35px;width:12%;border:0px solid white;">首页</button>
				<button name="act"value="2"class="dinylight-color" style="border-radius:2px;height:35px;width:12%;border:0px solid white;">上一页</button>
				<select name="jumppage"style="width:6%;height:35px;border:0px solid white;border-radius:2px;">
				<option value= ></option>
				
				<option value= ></option>
			
				</select>
				<button name="act"value="3"class="dinylight-color" style="border-radius:2px;height:35px;width:6%;border:0px solid white;">跳转</button>
				<button name="act"value="4"class="dinylight-color" style="border-radius:2px;height:35px;width:12%;border:0px solid white;">下一页</button>
				<button name="act"value="5"class="dinylight-color" style="border-radius:2px;height:35px;width:12%;border:0px solid white;">尾页</button>
			</div>
		</div>
		
		<%}%>
	-->
</body>
</html>




























<%
	
%>