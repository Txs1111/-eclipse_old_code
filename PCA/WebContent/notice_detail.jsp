
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="dao.NoticeAll_Dao" import="bean.Homepage_bean"  import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<link href="Css/Public_style.css" rel="stylesheet" />
<link href="Css/Homepage.css" rel="stylesheet" />
</head>
<style>
		button{
			border:0;
			outline:none;
			cursor:pointer;	
		}

</style>
<body bgcolor="#F4F5F7">
	<%
	request.setCharacterEncoding("UTF-8") ;//或者指定的编码(GBK或其他)
	String ID = null;
	String notice_ID = "1";
	if (request.getAttribute("notice_ID") != null || request.getAttribute("notice_ID") != "") {
		notice_ID=request.getParameter("notice_ID");
	}
	if (request.getAttribute("ID") != null || request.getAttribute("ID") != "") {
		ID=request.getParameter("ID");
	}
	System.out.println(ID+"---公告详情传来的用户id");
	System.out.println(notice_ID+"----公告详情传来的详情id");
	
	NoticeAll_Dao tp = new NoticeAll_Dao();
	Homepage_bean bean = new Homepage_bean(ID);
	bean.head();
	String text_line = tp.get_content(notice_ID);
	StringTokenizer line_cut = new StringTokenizer(text_line,"麤讜黌");
	
	String posterer_id = line_cut.nextToken();//创建变量存储 id
	String poster_nickiname = tp.get_nickiname(posterer_id);//根据id 获取昵称
	String poster_headPhoto =tp.get_headPhoto(posterer_id);//根据id 获取头像		
	
	String tittle = line_cut.nextToken();
	String content = line_cut.nextToken();
	String date = line_cut.nextToken();
	
	String allmess = tp.get_Tittle();
	System.out.println(allmess);
	StringTokenizer line_cut2 = new StringTokenizer(allmess,"麤讜黌");
	
	%>
	
	<!-- 调用头部页面 -->
			<jsp:include page="season.jsp"></jsp:include>
			<jsp:include page="head.jsp">
				<jsp:param value="<%=bean.level %>" name="level"/>
				<jsp:param value="<%=bean.nickiname %>" name="nickiname"/>
				<jsp:param value="<%=bean.sign %>" name="sign"/>
				<jsp:param value="<%=bean.background %>" name="background"/>
				<jsp:param value="<%=bean.headphoto %>" name="headphoto"/>
			</jsp:include>
			<jsp:include page="lead.jsp"><jsp:param value="<%=ID %>" name="ID"/></jsp:include>
	
	<div style="width:75%;margin:0 auto;">
		<div class="small-tittle middle-font font-normal-color">
				<div style="background-color: #FAFAFA;float:left;"  >&nbsp;┃&nbsp;</div>
				<div style="background-color: #FAFAFA;float:left; width:60%"  >
				<form action="Homepage.jsp" method="post" name="">
				<button class="middle-font font-light-color" value="<%=ID%>" name="ID" style="background-color: #FAFAFA;float:left;" >主页 </button>
				</form>
				<form action="notice_all" method="post" name="">
				<button class="middle-font font-light-color" value="<%=ID%>" name="ID" style="background-color: #FAFAFA;float:left;margin-left:4px;" >   / 全部公告  </button>
				</form>
				<button class="middle-font font-light-color" value="<%=ID%>" name="ID" disabled="disabled" style="background-color: #FAFAFA;float:left;margin-left:4px;" > / <%=tittle %></button>
				</div>
				<div style="background-color: #FAFAFA;float:right; width:35%"  >
				<img  src="img/lead_photo/返回.png"style="width:30px;height:25px;float:right;">
				<form action="notice_all" method="post" name="">
				<button class="middle-font font-light-color" value="<%=ID%>" name="ID" style="float:right;background-color: #FAFAFA" >返回上一级</button>
				</form>
				</div>
		</div>
		<div style="width:100%;height:685px;padding-top:15px;" class="dinylight-color">	
		<div style="margin-left:1%;width:23%;height:650px;float:left;margin-top:6px;">
		<div class="small-tittle middle-font font-normal-color">&nbsp;┃&nbsp;<a class="middle-font font-normal-color">全部公告</a></div>
			
		<div style="width:100%;height: 615px; color: darkslategray;overflow-y:auto;">
				<%
				   int i = 0;
				   String allnotice_id = null;
					while(line_cut2.hasMoreTokens()){
						allnotice_id = line_cut2.nextToken();
						if(i%2!=0){
							if(!allnotice_id.equals(notice_ID)){
							out.println("<form action=\"notice_detail.jsp\" method=\"post\"><input type=\"text\" style=\"display:none;\" value=\""+ID+"\" name=\"ID\"><input type=\"text\" style=\"display:none;\" value=\""+allnotice_id+"\" name=\"notice_ID\"><button style=\"width:100%;height: 35px;margin-top:6px;line-height:35px;\" class=\"dinylight-color\">&nbsp;"+line_cut2.nextToken()+"</button></form>");
							}
							if(allnotice_id.equals(notice_ID)){
							out.println("<div style=\"width:100%;height: 35px;text-align:center;margin-top:6px;line-height:35px;\" class=\"dinylight-color font-normal-color\">&nbsp;"+line_cut2.nextToken()+"</div>");
							}
						}	
						if(i%2==0){
							if(!allnotice_id.equals(notice_ID)){
							 out.println("<form action=\"notice_detail.jsp\" method=\"post\"><input type=\"text\" style=\"display:none;\" value=\""+ID+"\" name=\"ID\"><input type=\"text\" style=\"display:none;\" value=\""+allnotice_id+"\" name=\"notice_ID\"><button style=\"width:100%;height: 35px;margin-top:6px;background-color: white;line-height:35px;\">&nbsp;"+line_cut2.nextToken()+"</button></form>");
							}	
							if(allnotice_id.equals(notice_ID)){
								out.println("<div style=\"width:100%;height: 35px;background-color: white;text-align:center;margin-top:6px;line-height:35px;\" class=\"font-normal-color\">&nbsp;"+line_cut2.nextToken()+"</div>");
							}
						}
						i++;
					}
				%>												
		</div>
		</div>
		
		
		
		
		
		
			<div style="margin-left:1%;margin-top:6px;width:5%;height:652px;background-color:white;float:left;border-radius:10px 0px 0px 10px;">
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
				<div style="width:100%;height:5px;margin-top:45px;"class="light-color"></div>
			</div>

			<div style="float:left;width:69.5%;margin-left:0.5%;height:637px;padding-top:15px;margin-top:6px;background-color:white;border-radius:0px 10px 10px 0px;">
				<div style="width:75%;height:30px;margin:0 auto;border-badius:3px;line-height:30px;"class="light-color" align="center">
					<font style="color:white;float:left;">&nbsp;&nbsp;┃</font>	
					<%=tittle %>
					<font style="color:white;float:right;">┃&nbsp;&nbsp;</font>	
				</div>
				<div style="width:75%;height:450px;margin:0 auto;"><br/>
				<textarea style="line-height:25px; width:100%;height:400px;border:0px solid white" readonly><%=content%>
				</textarea>
					
				</div>
				<div style="width:15%;height:130px;float:right;margin-right:12.5%;" align="center">
				<img  src="img/head_photo/<%=poster_headPhoto%>.jpg"style="width:50px;height:50px;border-radius:25px;"><br/>
				<font color="gray"><%=poster_nickiname %></font><br/><br/>
					<font color="gray"><%=date %></font>
				</div>
			</div>
		</div>
	</div>
</body>
<%bean.con.close();%>
</html>
<script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
<script type="text/javascript" charset="UTF-8">

$(function(){
	$('#homepage').css('border-bottom-style','solid');
	var $logo = $('#sign_list li');
	 
	 
	 $logo.mouseenter(function(){
    	 $(this).css('border-bottom-style','solid');
    	 $('#homepage').css('border-bottom-style','none');
 		});
	 
	 $logo.mouseleave(function(){ 
		  $logo.css('border-bottom-style','none');
		  $('#homepage').css('border-bottom-style','solid');
		 });
	});
	

</script>
