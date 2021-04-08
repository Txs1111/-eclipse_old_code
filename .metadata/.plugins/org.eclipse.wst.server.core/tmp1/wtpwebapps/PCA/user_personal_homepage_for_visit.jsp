<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.user_personal_homepage_bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String toID=(String)request.getAttribute("toID");
	if(toID==null||"".equals(toID)||"null".equals(toID)){
		toID=request.getParameter("like");
	}
	String visitID=(String)request.getSession().getAttribute("ID");
	user_personal_homepage_bean bean=new user_personal_homepage_bean(toID);
	bean.creat_page(toID);
	String name=bean.getname(toID);
	int lastpage=-1;
	String like=request.getParameter("like");
 	int alllike=bean.getalllike();
	if(like!=null&&!"null".equals(like)&&!"".equals(like)){
		System.out.println("======点赞");
		bean.like(visitID);
		lastpage=-2;
		alllike++;
	}
	%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=name %>的个人主页</title>
</head>
<link rel="stylesheet" type="text/css" href="Css/Message.css" />
		<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
		<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
		<link rel="stylesheet" type="text/css" href="Css/Homepage.css" />
		<body>
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;<%=name %>的个人主页
				<img src="img/lead_photo/返回.png" style="width:30px;height:25px;float:right;">
				<button onclick="javascript:history.go(<%=lastpage %>);"

				 name="setlocal" value="1" style="height:100%;float:right;border:0px solid white;background:#FAFAFA;"
				 class="middle-font font-normal-color">
					返回上一级
				</button>
				<%if(bean.check_if_like(visitID)==0){ %>
				<font class="middle-font font-normal-color"style="line-height:30px;float:right;margin-right:2%;"><%=alllike %></font>
					<img src="img/user_personal_homepage/icons/未点赞.png" style="margin-top:3px;margin-top:3px;width:30px;height:25px;float:right;">
					
					<form style="float:right;" action="user_personal_homepage_for_visit.jsp" method="post">
					<button name="like" value="<%=toID %>"   style="height:95%;float:right;border:0px solid white;background:#FAFAFA;"
					 class="middle-font font-normal-color">
						点个赞再走
					</button>
				</form>
				<%}else{ %>
				<font class="middle-font font-normal-color"style="line-height:30px;float:right;margin-right:2%;"><%=alllike %></font>
					<img src="img/user_personal_homepage/icons/已点赞.png" style="margin-top:3px;width:30px;height:25px;float:right;">
					
					<button name="like" value="1"   style="height:100%;float:right;width=35px;border:0px solid white;background:#FAFAFA;"
					 class="middle-font font-normal-color">
						明天还来哟~
					</button>
				<%} %>
			</div>

	
	<div style="width:100%;height:210px;background-color:blue;float:left;">
			<jsp:include page="user_personal_head.jsp">
				<jsp:param value="<%=toID %>" name="ID" />
			</jsp:include>
	</div>
	<% String pagedata=bean.getblock("1"); 
	if(pagedata==null||"".equals(pagedata)||"null".equals(pagedata)){
	%>
	<div style="overflow:hidden;width:100%;height:500px;float:left;"align="center"class="dinylight-color">
		<font style="font-size:75px;line-height:500px;color:gray;">这个人很懒，没有编辑这个模块</font>	
	</div>
	<%}else{
		%>
		<div style="overflow:hidden;width:100%;height:500px;float:left;"align="center"class="dinylight-color">
		<%=pagedata %>	
		</div>
		
		<% 
	}%>
	<%  pagedata=bean.getblock("2"); 
	if(pagedata==null||"".equals(pagedata)||"null".equals(pagedata)){
	%>
	<div style="overflow:hidden;width:50%;height:500px;float:left;"align="center"class="dinylight-color">
		<font style="font-size:25px;line-height:500px;color:gray;">这个人很懒，没有编辑这个模块</font>	
	</div>
	<%}else{
		%>
		<div style="overflow:hidden;width:50%;height:500px;float:left;"align="center"class="dinylight-color">
		<%=pagedata %>	
		</div>
		
		<% 
	}%>
	<%  pagedata=bean.getblock("3"); 
	if(pagedata==null||"".equals(pagedata)||"null".equals(pagedata)){
	%>
	<div style="overflow:hidden;width:50%;height:500px;float:left;"align="center"class="dinylight-color">
		<font style="font-size:25px;line-height:500px;color:gray;">这个人很懒，没有编辑这个模块</font>	
	</div>
	<%}else{
		%>
		<div style="overflow:hidden;width:50%;height:500px;float:left;"align="center"class="dinylight-color">
		<%=pagedata %>	
		</div>
		
		<% 
	}%>
	<% pagedata=bean.getblock("4"); 
	if(!"not_allow_to_use".equals(pagedata)){
		  
		if(pagedata==null||"".equals(pagedata)||"null".equals(pagedata)){
		%>
		<div style="overflow:hidden;width:100%;height:500px;float:left;"align="center"class="dinylight-color">
			<font style="font-size:75px;line-height:500px;color:gray;">这个人很懒，没有编辑这个模块</font>	
		</div>
		<%}else{
			%>
			<div style="overflow:hidden;width:100%;height:500px;float:left;"align="center"class="dinylight-color">
			<%=pagedata %>	
			</div>
			
			<% 
		}
	}
	%>
	<% pagedata=bean.getblock("5"); 
	if(!"not_allow_to_use".equals(pagedata)){
		  
		if(pagedata==null||"".equals(pagedata)||"null".equals(pagedata)){
		%>
		<div style="overflow:hidden;width:100%;height:500px;float:left;"align="center"class="dinylight-color">
			<font style="font-size:75px;line-height:500px;color:gray;">这个人很懒，没有编辑这个模块</font>	
		</div>
		<%}else{
			%>
			<div style="overflow:hidden;width:100%;height:500px;float:left;"align="center"class="dinylight-color">
			<%=pagedata %>	
			</div>
			
			<% 
		}
	}
	%>
	</body>
</html>