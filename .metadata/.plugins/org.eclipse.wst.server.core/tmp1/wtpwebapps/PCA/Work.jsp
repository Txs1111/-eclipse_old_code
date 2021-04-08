
<%/*------------------------------------------------------------------------------------------------
修改人			     
修改时间 		
修改内容		
版本号			 
-------------------------------------------------------------------------------------------------*/%>
<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="bean.Work_bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作品</title>
		<link rel="stylesheet" type="text/css" href="Css/Public_style.css"/>
		<link rel="stylesheet" type="text/css" href="Css/Work.css"/>
		<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css"/>
	</head>
	<style>
		button{
			border:0;
			outline:none;
			cursor: pointer;
		}
	</style>
<body bgcolor="#F4F5F7">

	<% 	//-----------
		request.setCharacterEncoding("UTF-8") ;//或者指定的编码(GBK或其他)
		String ID = null;
	    ID=(String)request.getSession().getAttribute("ID");
		String nowpage = "1";
		String class_1 = "worktype_chosen white-font normal-color work_bold_font normal-color";
		String class_2 = "worktype_unchoosen light-color";
		String class_3 = "worktype_unchoosen light-color";
		String lineClass_1 = "underline_show";
		String lineClass_2 = "underline_hide";
		String lineClass_3 = "underline_hide";
		
		if(request.getAttribute("ID")!=null)
		{
			ID=(String)request.getAttribute("ID");
		}else if(request.getParameter("ID")!=null)
		{
			ID=request.getParameter("ID");
		}
		if(ID.equals("2019000101884")){
			request.getRequestDispatcher("Ajax_test.jsp").forward(request,response); 
		}
		if(request.getParameter("nowpage")!=null)
		{
		nowpage=request.getParameter("pages");
		}
		String type="1_1";
		String pages = "1";
		String chose = "1";
		if(request.getParameter("type")!=null)
		{
			type=(String)request.getParameter("type");
		}
		StringTokenizer StrTk = new StringTokenizer(type,"_");
		if(StrTk.hasMoreTokens()){
			pages = StrTk.nextToken();
			chose = StrTk.nextToken();
		}
		
		if(pages.equals("1")){
			 class_1 = "worktype_chosen white-font normal-color work_bold_font normal-color";
			 class_2 = "worktype_unchoosen light-color";
			 class_3 = "worktype_unchoosen light-color";
		}
		if(pages.equals("2")){
			 class_2 = "worktype_chosen white-font normal-color work_bold_font normal-color";
			 class_1 = "worktype_unchoosen light-color";
			 class_3 = "worktype_unchoosen light-color";
		}
		if(pages.equals("3")){
			 class_3 = "worktype_chosen white-font normal-color work_bold_font normal-color";
			 class_1 = "worktype_unchoosen light-color";
			 class_2 = "worktype_unchoosen light-color";
		}
		
		
		if(chose.equals("1")){
			lineClass_1 = "underline_show";
		    lineClass_2 = "underline_hide";
			lineClass_3 = "underline_hide";
		}
		if(chose.equals("2")){
			lineClass_1 = "underline_hide";
		    lineClass_2 = "underline_show";
			lineClass_3 = "underline_hide";
		}
		if(chose.equals("3")){
			lineClass_1 = "underline_hide";
		    lineClass_2 = "underline_hide";
			lineClass_3 = "underline_show";
		}
		
		Work_bean bean=new Work_bean(ID);
		bean.head();
		String role=bean.role;
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
			
			
		<form action="Work.jsp" method="post" name="form1">
		<!-- 页面选择 -->
		<div class="lead_block">
		<div class="worktype_discribe_shead"></div>
		<div class="worktype_discribe_head dinylight-color"></div>
			<input type="text" name="ID" value="<%=ID%>" style="display:none">
			<button class="<%=class_1%>" id="everybody_work" name="type" value="1_<%=chose%>">大家的作品</button>
			<button  class="small-font <%=class_2%>" id="mywork" name="type" value="2_<%=chose%>">我的作品</button>
			<button  class="small-font <%=class_3%>" id="sendwork" name="type" value="3_<%=chose%>">提交作品</button>
		<div class="worktype_discribe"></div>
		<%if(!pages.equals("3")){%>
		<div class="type_choose"> 
				<div class="type_choose_area">
					<button class="type_choose_line small-font <%=lineClass_1 %>" id="back_works" value="<%=pages%>_1" name="type">后端作品</button><div class="type_choose_row font-normal-color">|</div>
					<button class="type_choose_line small-font <%=lineClass_2 %>" id="head_works"  value="<%=pages%>_2" name="type">前端作品</button><div class="type_choose_row font-normal-color">|</div>
					<button class="type_choose_line small-font <%=lineClass_3 %>" id="all_works"  value="<%=pages%>_3" name="type">全部作品</button>
				</div>
			<!--搜索 -->
		<div class="search_area">
			<div class="search ">
				<div class="search-block">
					<div class="search-symble" style="margin-left: 4%;"><img src="img/lead_photo/搜索.png" style="width: 90%; height:90%;"/></div>
					<div class="search-form">
					
						<input type="text" style="width: 73.5%;height: 25px;"/>
						<input type="submit" class="check_button normal-color" value="搜索" />
					</div></div> </div>			
		  		  </div>
			</div>	
			<%} %>
			</div>
			</form>
		<!-- 单条作品 -->
		<div class="body_block" id="display">
		
		<%if(type.equals("1_1")||type.equals("1_2")||type.equals("2_1")||type.equals("2_2")){ %>
			<jsp:include page="Work_block.jsp">
				<jsp:param value="<%=ID %>" name="ID"/>
				<jsp:param value="<%=chose %>" name="type"/>
				<jsp:param value="<%=pages %>" name="pages"/>
				
			</jsp:include>
		<%} %>
		<%if(type.equals("2_3")||type.equals("1_3")){ %>
			<jsp:include page="Work_allworks.jsp">
				<jsp:param value="<%=ID %>" name="ID"/>
				<jsp:param value="<%=pages %>" name="pages"/>
				
			</jsp:include>
		<%} %>
		<%if(pages.equals("3")){ %>
			<jsp:include page="Work_submitworks.jsp">
				<jsp:param value="<%=ID %>" name="ID"/>
			</jsp:include>
		<%} %>
		</div>
	</body>
</html>
<% bean.con.close();%>


<script>
$(function(){
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
</script>