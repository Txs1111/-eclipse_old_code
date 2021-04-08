<%@page import="bean.Security_set_bean"%>
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
	    <%
	    String dis = "none";
	    String get_id = null;
	    if(request.getSession().getAttribute("ID")!=null&&!request.getSession().getAttribute("ID").equals("")){
		    get_id =(String)request.getSession().getAttribute("ID");
	    }
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		String[] data = new String[3];
		data[0] = get_id;
		data[1] = oldpassword;
		data[2] = newpassword;
		Security_set_bean sb = new Security_set_bean();
		boolean bl = sb.Security_set_bean(data);
		System.out.println(bl);
		if((oldpassword==null&&newpassword==null)||bl){
		    
		   dis = "none";
		}else{
			dis = "";
		}
	    %>
	    <form id="voteform" action="Security_set.jsp" method="post">
		<div id="theme">
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;安全设置
			</div>
			<div id="power">
				<font class="small-font">旧密码：</font>
				<input type="text" id="nick" name="oldpassword" />
				<font class="small-font" color="#bfbfbf" style="display:<%=dis%>">&nbsp;&nbsp;&nbsp;&nbsp;旧密码错误</font>
			</div>
			<div id="power" style="margin-top:22px">
				<font class="small-font">新密码：</font>
				<input type="text" id="nick" name="newpassword" />
			</div>
			
			<button class="normal-color" id="submit" type="submit" style="border: 0;outline: none; margin-right:50px;margin-top:50px;">
				    <font class="small-font" color="#ffffff">提交</font>
			</button>
		</div>
		</form>
	</body>
</html>
