
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%
	/*------------------------------------------------------------------------------------------------
	修改人		 		     许良	     						许良
	修改时间    			2021.1.19						2021.1.20
	修改内容	   添加随机标语和根据日期更替季节实现      将提示性语句（system.out）删去
	版本号				   0.0.1 							0.0.2
	-------------------------------------------------------------------------------------------------*/
%>

<%@page import="dao.*"
 import="bean.*"
  import="java.util.Random"%>
  
<%  
	//定义存放标语和月份的变量
	String sign = null;
	int nowmounth = 0;

	if(sign==null||nowmounth==0||sign.equals("")){
	//new 数据库连接、数据读取、随机对象
	MySQL_connect con = new MySQL_connect();
	Tabledata_read tr = new Tabledata_read();
	Handle_date hd = new Handle_date();
	Random r = new Random();
	
	
	try{
		//sql语句及执行
		String sql = "select id from page_sets";
		con.result = con.usercommend.executeQuery(sql);
		
		//随机读取并赋给标语变量
		con.result.last();
		int count = con.result.getRow();
		int ran = r.nextInt(count)%(count)+1;
		
		
		String sql2 = "select tips from page_sets where id = '"+ran+"'";
		con.result = con.usercommend.executeQuery(sql2);
		con.result.next();
		sign = con.result.getString("tips");
		}catch(SQLException e){
			sign = "I miss dancing with you the most of all";
			}
	
	try{
		nowmounth = Integer.parseInt(hd.getMonth());
	}catch(Exception e){
		nowmounth = 11;
		}
	}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="Css/Page_head.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
</head>
<body bgcolor="black">
	<div class="season_whole_block" >
		<div class="ahead_sign">

			<!--Ahead_图片-->
			<img src="img/season/ahead_yellow.jpg" style="height: 110%;" />
		</div>

		<!--签名信息-->
		<div class="season_title big-font font-normal-color"><%out.println(sign+"");%></div>
		<!-- 最大长度：三十个字 -->

		<!--季节图片-->
		<div class="season_area ">
			<% if(nowmounth==3 ||nowmounth==4||nowmounth==5){
			out.println("<img src=\"img/season/spring.jpg\" style=\"width: 70%; height: 100%\" />");
			}%>
			<% if(nowmounth==6 ||nowmounth==7||nowmounth==8){
			out.println("<img src=\"img/season/sum.jpg\" style=\"width: 70%; height: 100%\" />");
			}%>
			<% if(nowmounth==9 ||nowmounth==10||nowmounth==11){
			out.println("<img src=\"img/season/autumn.jpg\" style=\"width: 70%; height: 100%\" />");
			}%>
			<% if(nowmounth==12 ||nowmounth==2||nowmounth==1){
			out.println("<img src=\"img/season/winter.png\" style=\"width: 70%; height: 100%\" />");
			}%>
		</div>
	</div>
</body>
</html>