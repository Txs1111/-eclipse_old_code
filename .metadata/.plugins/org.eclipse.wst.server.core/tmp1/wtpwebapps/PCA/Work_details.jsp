<%/*------------------------------------------------------------------------------------------------
修改人			     
修改时间 		
修改内容		
版本号			 
-------------------------------------------------------------------------------------------------*/%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@page import="bean.Work_bean,java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
		<link rel="stylesheet" type="text/css" href="Css/Public_style.css"/>
		<link rel="stylesheet" type="text/css" href="Css/Work.css"/>
		<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css"/>
	</head>
	<style>
	</style>
	<body bgcolor="#fafafa">
	<div></div>
		<%
		request.setCharacterEncoding("UTF-8") ;//或者指定的编码(GBK或其他)
		String ID = null;
	    ID=(String)request.getSession().getAttribute("ID");
	    String work_id = null;
	    if(request.getParameter("work_id")!=null)
		{
	    	work_id=request.getParameter("work_id");
		}
	    Work_bean bean=new Work_bean(ID);
		bean.head();
		String role=bean.role;
		String data = null;
		data = bean.work_details(work_id);
		StringTokenizer line_cut = new StringTokenizer(data,"麤讜黌");//new 一个子字符串剪切对象
		String poster_id = line_cut.nextToken();
		String tittle = line_cut.nextToken();
		String content = line_cut.nextToken();
		String finish_date = line_cut.nextToken();
		String like = line_cut.nextToken();
		String points = line_cut.nextToken();
		String nickiname = bean.get_nickiname(ID);
		String head_photo = bean.get_headPhoto(ID);
		
	    %>
	    <!-- 调用头部页面 -->
			<jsp:include page="season.jsp"></jsp:include>
			<jsp:include page="head.jsp">
			<jsp:param value="<%=ID %>" name="ID"/>
			<jsp:param value="<%=role %>" name="role"/>
				<jsp:param value="<%=bean.level %>" name="level"/>
				<jsp:param value="<%=bean.nickiname %>" name="nickiname"/>
				<jsp:param value="<%=bean.sign %>" name="sign"/>
				<jsp:param value="<%=bean.background %>" name="background"/>
				<jsp:param value="<%=bean.headphoto %>" name="headphoto"/>
			</jsp:include>
			<jsp:include page="lead.jsp"><jsp:param value="<%=ID %>" name="ID"/></jsp:include>
			
		<div class="details_hoelblock  light-color">
			<div class="details_head_block">
				<div style="width: 7%;height: 70px;margin-top: 10px;margin-left: 1%;float: left;">
					<img src="img/head_photo/<%=head_photo%>.jpg" class="head_photo" />
				</div>
				<div style="width: 7%;height: 30px;margin-top: 30px;float: left;">
					<%=nickiname%>
				</div>
				<div style="width: 86.5%;height: 30px;float: left;">
					<%=tittle %>
				</div>
				<div style="width:34px;height:34px;margin-left:70%;margin-top:30px;position: absolute;cursor: pointer;" id="back"><img src="img/lead_photo/返回.png"style="width:100%;height:100%;"></div>
				<form method="post" action="toWork" id="form_back"></form>
			</div>
			<div class="details_body_block">
				<div style="width: 69.2%;height: 600px;float: left;border-right: 1px solid sandybrown;" class="dinylight-color">
					<div class="small-tittle normal-font font-normal-color">
								 &nbsp;┃&nbsp;作品内容
					</div>
					<div class="details_displayarea normal-color">
						 <textarea readonly="readonly"><%=content %></textarea>
					</div>
				</div>
				<div style="width: 30%;height: 600px;float: left;" class="dinylight-color">
					<div class="small-tittle normal-font font-normal-color">
								 &nbsp;┃&nbsp;作品信息
					</div>
					<div class="details_rightarea1">
							<div style="width: 50%;float: left;height: 100%;" class="light-color">
								<div style="width: 40%;height: 40%;margin: 0 auto;margin-top: 30px;">
									<img src="img/lead_photo/whitelike.png" style="width: 100%;height: 100%;">
								</div>
								<div style="width: 50%;height: 30%;margin: 0 auto;margin-top: 20px;color: white;">
									获赞数：<%=like %>
								</div>
							</div>
							<div style="width: 50%;float: left;height: 100%;" class="light-color">
								<div style="width: 40%;height: 40%;margin: 0 auto;margin-top: 30px;">
									<img src="img/lead_photo/scorestar.png" style="width: 100%;height: 100%;">
								</div>
								<div style="width: 60%;height: 30%;margin: 0 auto;margin-top: 20px;color: white;">
									综合得分：<%=points %>
								</div>
							</div>
					</div>
					<div class="details_rightarea2">
						<div class="small-tittle normal-font font-normal-color">
									 &nbsp;┃&nbsp;作品评价
						</div>	
						<div style="overflow-y: auto;width: 100%;height: 375px;overflow: hidden;" id="judgearea">
						
						<% String data_judge = bean.work_judge(work_id);
						if(data_judge!=null&&!data_judge.equals("")&&!data_judge.equals("null")){
							StringTokenizer line_cut2 = new StringTokenizer(data_judge,"轎藎燼");
							String judge_ID;
							String judge_name;
							String judge_cotent;
							String judge_time;
							while(line_cut2.hasMoreTokens()){
							String line_cut3 = line_cut2.nextToken();
							StringTokenizer line_cut4 = new StringTokenizer(line_cut3,"麤讜黌");
							judge_ID = line_cut4.nextToken();
							judge_time = line_cut4.nextToken();
							judge_cotent = line_cut4.nextToken();
							judge_name = bean.get_nickiname(judge_ID);%>
							<div style="height: 60px;width: 100%;border-bottom: 1px solid sandybrown;">
								<div style="height: 40px;width: 90%;font-size:14px;overflow-y: auto;overflow-x: hidden;float:right;color: #808080;">
									&nbsp;&nbsp;&nbsp;写的非常不辍
								</div>
								<div style="height: 20px;width: 90%;float:right;color: #808080;border-top: 1px solid #D3D3D3;text-align: right;">
									Frank&nbsp;&nbsp;&nbsp;&nbsp;2020-12-3&nbsp;&nbsp;&nbsp;
								</div>
							</div>
						<%}}else{%>
							<div style="height: 20px;width: 50%;margin:0 auto;color: #808080;margin-top:140px;">
									此作品暂无评价:)
								</div>
						<%}%>	
						</div>
					</div>
				</div>
				<%bean.con.close();%>
			</div>
		</div>
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
	$('#work').css('border-bottom-style','solid');
	var $logo = $('#sign_list li');
	 
	 
	 $logo.mouseenter(function(){
    	 $(this).css('border-bottom-style','solid');
    	 $('#work').css('border-bottom-style','none');
 		});
	 
	 $logo.mouseleave(function(){ 
		  $logo.css('border-bottom-style','none');
		  $('#work').css('border-bottom-style','solid');
		 });
	});
	$('#back').click(function(){
		$('#form_back').submit();
	});
</script>