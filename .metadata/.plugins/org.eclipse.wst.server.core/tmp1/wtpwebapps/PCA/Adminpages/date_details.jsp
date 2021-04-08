<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.Admin_datadetails" import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" type="text/css" href="../Css/Public_style.css" />
	<link rel="stylesheet" type="text/css" href="../Css/Assignment.css" />
	<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
	<%request.setCharacterEncoding("UTF-8");
			String ID=(String)request.getSession().getAttribute("ID");
			Admin_datadetails bean=new Admin_datadetails();
			String data=bean.getPCAstudata();
			StringTokenizer chart=new StringTokenizer(data,"_");
		%>
	<body>
		<jsp:include page="Admin_lead.jsp">
			<jsp:param value="0" name="block_id" />
		</jsp:include>
		<div style="width:87.5%;margin-left:0.1%;height:824px;float:left;" class="dinylight-color">
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;数据分析:计算机协会
			</div>
			<div style="width:66.5%;float:left;margin-right:0.5%;">
				<div style="width:100%;float:left;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;当前用户总数&nbsp;-&nbsp;
				</div>

				<div style="font-size:50px;line-height:100px;width:100%;height:101px;color:white;float:left;" align="center" class="light-color">
					<%=chart.nextToken() %>
				</div>
			</div>
			<div style="width:33%;height:30px;float:left;">
				<div style="width:100%;float:left;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;当天已签到人数&nbsp;-&nbsp;
				</div>
				<div style="font-size:20px;line-height:35px;width:100%;float:left;color:white;height:35px;" align="center" class="light-color">
					<%=chart.nextToken() %>
				</div>
				<div style="width:100%;float:left;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;当天已提交任务次数&nbsp;-&nbsp;
				</div>
				<div style="font-size:20px;line-height:35px;width:100%;float:left;color:white;height:35px;" align="center" class="light-color">
					<%=chart.nextToken() %>
				</div>
			</div>

			<div style="width:100%;height:100px;float:left;">
				<div style="width:100%;float:left;margin-top:25px;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;各部门人数明细&nbsp;-&nbsp;
				</div>
				<div style="width:19.6%;float:left;margin-right:0.5%;margin-top:5px;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;活动部&nbsp;-&nbsp;
				</div>
				<div style="width:19.6%;float:left;margin-right:0.5%;margin-top:5px;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;宣传部&nbsp;-&nbsp;
				</div>
				<div style="width:19.6%;float:left;margin-right:0.5%;margin-top:5px;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;外联部&nbsp;-&nbsp;
				</div>
				<div style="width:19.6%;float:left;margin-right:0.5%;margin-top:5px;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;运营部&nbsp;-&nbsp;
				</div>
				<div style="width:19.6%;float:left;margin-top:5px;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;财务部&nbsp;-&nbsp;
				</div>

				<div align="center" style="width:19.6%;height:35px;color:white;float:left;line-height:35px;font-size:20px;margin-right:0.5%;"
				 class="light-color">
					<%=chart.nextToken() %>
				</div>
				<div align="center" style="width:19.6%;height:35px;color:white;float:left;line-height:35px;font-size:20px;margin-right:0.5%;"
				 class="light-color">
					<%=chart.nextToken() %>
				</div>
				<div align="center" style="width:19.6%;height:35px;color:white;float:left;line-height:35px;font-size:20px;margin-right:0.5%;"
				 class="light-color">
					<%=chart.nextToken() %>
				</div>
				<div align="center" style="width:19.6%;height:35px;color:white;float:left;line-height:35px;font-size:20px;margin-right:0.5%;"
				 class="light-color">
					<%=chart.nextToken() %>
				</div>
				<div align="center" style="width:19.6%;height:35px;color:white;float:left;line-height:35px;font-size:20px;" class="light-color">
					<%=chart.nextToken() %>
				</div>
			</div>
			<%
			bean.load_mission_data();
			String mission_language_data=bean.mission_language_data;
			chart=new StringTokenizer(mission_language_data,"_");
			int num=chart.countTokens()/2;			
			%>
			<div style="width:100%;height:70px;float:left;margin-top:50px;">
				<div style="width:100%;float:left;margin-top:5px;" align="center" class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;任务相关明细/共<%=bean.missionsnum %>个任务&nbsp;-&nbsp;
				</div>
				<div style="width:100%;float:left;margin-top:5px;"  class="small-tittle middle-font font-normal-color">
					&nbsp;-&nbsp;任务语言及数量,任务语言<%=num %>种
				</div>
			</div>
			
			<div style="overflow-x: auto;width:100%;">
				<div style="width: <%=num*150%>px;">
				<%for(int a=0;a<num;a++){ %>
					<div style="width:147px;float:left;margin-left:3px;">
						<div style="width:100%;float:left;margin-right:0.5%;margin-top:5px;" align="center" class="small-tittle middle-font font-normal-color">
							&nbsp;-&nbsp;<%=chart.nextToken() %>&nbsp;-&nbsp;
						</div>
						<div align="center" style="width:100%;height:35px;color:white;float:left;line-height:35px;font-size:20px;margin-right:0.5%;"
						 class="light-color">
							<%=chart.nextToken() %>
						</div>
					</div>				
				<%} %>								
				</div>
			</div>
			<%String mission_type_data=bean.mission_type_data;
			chart=new StringTokenizer(mission_type_data,"_");
			num=chart.countTokens()/2; %>
			<div style="width:100%;float:left;margin-top:5px;"  class="small-tittle middle-font font-normal-color">
				&nbsp;-&nbsp;任务类型及数量,任务类型<%=num %>种
			</div>		
			<div style="overflow-x: auto;width:100%;">
				<div style="width: <%=num*150%>px;">
				<%for(int a=0;a<num;a++){ %>
					<div style="width:147px;float:left;margin-left:3px;">
						<div style="width:100%;float:left;margin-right:0.5%;margin-top:5px;" align="center" class="small-tittle middle-font font-normal-color">
							&nbsp;-&nbsp;<%=chart.nextToken() %>&nbsp;-&nbsp;
						</div>
						<div align="center" style="width:100%;height:35px;color:white;float:left;line-height:35px;font-size:20px;margin-right:0.5%;"
						 class="light-color">
							<%=chart.nextToken() %>
						</div>
					</div>				
				<%} %>								
				</div>
			</div>
			
		</div>
	</body>
</html>
