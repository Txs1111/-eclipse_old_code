<%@page import="bean.Message_set_bean"%>
<%@page import="bean.Message_bean"%>
<%/*------------------------------------------------------------------------------------------------
修改人			     
修改时间 		
修改内容		
版本号			 
-------------------------------------------------------------------------------------------------*/%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Set.css"/>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css"/>
<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css"/>
</head>
<body>
    <script src="Message_set.js" type="text/javascript" charset="utf-8"></script>
    <%
    request.setCharacterEncoding("utf-8");
    String get_id = null;
    if(request.getSession().getAttribute("ID")!=null&&!request.getSession().getAttribute("ID").equals("")){
		  get_id =(String)request.getSession().getAttribute("ID");
	  }
    if(get_id==null){
    	get_id="2222";
    }
	String name = request.getParameter("name");
	String clas = request.getParameter("clas");
	String college = request.getParameter("college");
	String tel = request.getParameter("tel");
	String e_mail = request.getParameter("e-mail");
	String apartment = request.getParameter("apartment");
	String birthday = request.getParameter("birthday");
	String[] user_data = new String[8];
	String[] data = null;
	user_data[0] = get_id;
	user_data[1] = name;
	user_data[2] = clas;
	user_data[3] = college;
	user_data[4] = tel;
	user_data[5] = e_mail;
	user_data[6] = apartment;
	user_data[7] = birthday;
    Message_set_bean mb = new Message_set_bean();
    data = mb.Message_set_bean(user_data);
    %>
		<div id="theme">
		<form action="Message_set.jsp" method="post">
			<div class="small-tittle middle-font font-normal-color">
				<font color="#FFA980">&nbsp;┃&nbsp;资料设置</font>
			</div>
			<div id="private">
				<font class="small-font">姓名：</font>
				<input type="text"  name="name" placeholder="<%=data[1]%>"/>
			</div>
			<div id="private">
				<font class="small-font">班级：</font>
				<input type="text" id="clas" name="clas" placeholder="<%=data[2]%>"/>
			</div>
			<div id="private">
				<font class="small-font">学院：</font>
				<input type="text" id="college" name="college" placeholder="<%=data[3]%>"/>
			</div>
			<div id="private">
				<font class="small-font">电话：</font>
				<input type="text" id="tel" name="tel" placeholder="<%=data[4]%>"/>
			</div>
			<div id="private">
				<font class="small-font">邮箱：</font>
				<input type="text" id="e-mail" name="e-mail" placeholder="<%=data[5]%>"/>
			</div>
			<div id="private">
				<font class="small-font">部门：</font>
				<select name="apartment"  id="sel"style="background-color: #EEEEEE;" disabled="disabled">
				  <option value ="1">活动部</option>
				  <option value ="2">宣传部</option>
				  <option value="3">外联部</option>
				  <option value="4">技术部</option>
				  <option value ="5">运营部</option>
				  <option value="6">财务部</option>
				</select>
			</div>
			<div id="private">
				<font class="small-font">生日：</font>
				<input type="text" id="birthday" name="birthday" placeholder="<%=data[7]%>"/><!--选中变蓝色（待添加）-->
			</div>
			<button class="normal-color" id="submit" type="submit" style="border: 0;outline: none; margin-right:50px;margin-top:50px;">
				    <font class="small-font" color="#ffffff">提交</font>
			</button>
			
		</form>	
		</div>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
$(function(){
	 
	$("#sel").val('<%=data[6]%>');
	});
 
</script>