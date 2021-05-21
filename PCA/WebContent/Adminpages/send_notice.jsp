<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.Admin_tools"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>消息公告</title>
		<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
		<link href="../Css/Public_style.css" rel="stylesheet" />
	</head>
	<body><jsp:include page="Admin_lead.jsp"><jsp:param value="4" name="block_id"/></jsp:include>
	<div style="width:87.5%;margin-left:0.1%;height:824px;float:left;"class="dinylight-color">
	<%
	request.setCharacterEncoding("UTF-8");
	String tittlen="";
	String contentn="";
	String tips="标题限制字数 15";
	String ID=(String)request.getSession().getAttribute("ID");
	System.out.println("sendnoticeID:"+ID);
	if(request.getParameter("sendn")!=null){
		System.out.println("发送");
		tittlen=request.getParameter("tittlen");
		contentn=request.getParameter("contentn");
		if(tittlen==null||"null".equals(tittlen)){
			tittlen="";
		}
		if(contentn==null||"null".equals(contentn)){
			contentn="";
		}
		if("".equals(request.getParameter("tittlen"))){
			System.out.println("1");
			tips="未填写标题";		
		}else if("".equals(request.getParameter("contentn"))){
			System.out.println("2");tips="未填写内容";
			
		}else if(tittlen.length()>15){
			tips="标题过长";
		} else{
			Admin_tools tool=new Admin_tools(ID);
			tool.send_notice(tittlen, contentn);
			tool.con.close();
			tips="发送成功";
			tittlen="";
			contentn="";
		}
	}
	%>
		<div style="float:left;width:35%;">
			<div class="small-tittle middle-font font-normal-color" style="margin-bottom:2px;float:left;width:100%;margin-right:0.2%;">
				&nbsp;┃&nbsp;发送通告
			</div>

			<form action="send_notice.jsp" method="post">
				<div style="width:100%; height:300px;float:left;" class="dinylight-color" align="center">
					<div align="center" style="width:100%;height:25px;line-height:25px;float:left;">
						<font color="red">
							<%=tips %>
						</font>
					</div>
					<div style="width:10%;height:100%;float:left;">
						<div style="width:100%;height:75px;line-height:75px;">
							标题:
						</div>
						<div style="width:100%;height:225px;line-height:45px;">
							内容:
						</div>
					</div>

					<div style="float:left;width:90%;height:300px;">

						<div style="width:100%;height:75px;line-height:45px;">
							<input type="text" name="tittlen" style="margin-top:20px;height:35px;width:95%;border:1px solid lightgray;" value="<%=tittlen%>">
						</div>
						<div style="width:100%;height:225px;">
							<textarea name="contentn" style="width:95%;height:201px;margin-top:12px;border:1px solid lightgray;"><%=contentn %></textarea>
						</div>
						<button value="1" name="sendn" style="width:45%;height:45px;border:0px solid white;border-radius:30px;" class="light-color">发送</button>
					</div>
				</div>
			</form>
		</div>
		<div style="float:left;width:0.1%;height:735px;" class="light-color">
		</div>
		<div style="width:64.9%;height:750px;float:left;" >
			<div class="small-tittle middle-font font-normal-color" style="margin-bottom:2px;float:left;width:100%;margin-right:0.2%;">
				&nbsp;┃&nbsp;发送消息
			</div>
			<div style="width:100%;height:717px;">
			<%
			String act=request.getParameter("act");
			String allpage=request.getParameter("allpage");
			String nowpage=request.getParameter("nowpage");
			String topage=request.getParameter("topage");
			String role=request.getParameter("role");
			String geterID=request.getParameter("geterID");
			String send=request.getParameter("send");
			String gettype=request.getParameter("gettype");
			String tittle=request.getParameter("tittle");
			String content=request.getParameter("content");
			
			%>
			<jsp:include page="sendtext.jsp">
				<jsp:param value="<%=act %>" name="act"/>
				<jsp:param value="<%=allpage %>" name="allpage"/>
				<jsp:param value="<%=nowpage %>" name="nowpage"/>
				<jsp:param value="<%=topage %>" name="topage"/>
				<jsp:param value="<%=role %>" name="role"/>
				<jsp:param value="<%=geterID %>" name="geterID"/>
				<jsp:param value="<%=send %>" name="send"/>
				<jsp:param value="<%=gettype %>" name="gettype"/>
				<jsp:param value="<%=tittle %>" name="tittle"/>
				<jsp:param value="<%=content %>" name="content"/>
				
				
				
				
			</jsp:include>
			</div>
			
			
		</div>
		</div>
	</body>
</html>
