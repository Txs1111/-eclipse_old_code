<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.check_work_tool" import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../Css/Public_Color/orange.css" rel="stylesheet" />
<link href="../Css/Public_style.css" rel="stylesheet" />
</head>
<style>
	button{
		border:0;
		outline:none;
		cursor: pointer;
	}
	.tips_div{
		width:50%;
		height:160px;
		float:left;
		margin-left:15%;
		margin-top:20px;
		position:absolute;
		background-color:white;
		border:1px solid black;
		line-height: 160px;
		text-align: center;
	}
</style>
<body><jsp:include page="Admin_lead.jsp"><jsp:param value="3" name="block_id"/></jsp:include>
<%
	String work_ID = null;
	String poster_id = null;
	String ID=(String)request.getSession().getAttribute("ID");
	if(ID==null||"".equals(ID)){
		ID=request.getParameter("ID");
		request.getSession().setAttribute("ID", ID);
	}
	
	String work_id = null;
	if(request.getAttribute("work_id")!=null)
	{		work_id=(String)request.getAttribute("work_id");
	}else if(request.getParameter("work_id")!=null)
	{
		work_id=request.getParameter("work_id");
	}
	
	String type = "1";
	if(request.getAttribute("type")!=null)
	{		type=(String)request.getAttribute("type");
	}else if(request.getParameter("type")!=null)
	{
		type=request.getParameter("type");
	}
	
	check_work_tool cwt = new check_work_tool();
	String data1 = (String)request.getParameter("judge_poster_id");
	String result = "";
	if(data1!=null&&!data1.equals("")){
		String data2 = (String)request.getParameter("judge_points");
		String data3 = (String)request.getParameter("judge_ID");
		String data4 = (String)request.getParameter("judge_work_id");
		String data5 = (String)request.getParameter("judge_content");
		result = cwt.judge_work(data1,data2,data3,data4,data5);
		}
%>
<div class="select—button" style="display:none;"></div>
<div style="width:87.5%;margin-left:0.1%;height:824px;float:left;"class="dinylight-color">
	<input type="text" style="display:none;" value="<%=result%>" id="poop" >
	<div style="width:100%;height:124px;border-bottom:1px soild #fafafa;">
		<form action="check_works.jsp" method="post" >
		<button style="width:17.2%;height:60px;float:left;margin-left:3%;margin-top:31px;" class="light-color white-font select—button" value="1" name="type">评价后端作品</button>
		<button style="width:17.2%;height:60px;float:left;margin-left:2%;margin-top:31px;" class="light-color white-font select—button" value="2" name="type">评价前端作品</button>
		<button style="width:17.2%;height:60px;float:left;margin-left:2%;margin-top:31px;" class="light-color white-font select—button" value="3" name="type">评价特定作品</button>
		<button style="width:17.2%;height:60px;float:left;margin-left:2%;margin-top:31px;" class="light-color white-font select—button" value="4" name="type">发布特定作品</button>
		<button style="width:17.2%;height:60px;float:left;margin-left:2%;margin-top:31px;" class="light-color white-font select—button" value="5" name="type">我的评价历史</button>
		</form>
	</div>
	<div style="width:94%;height:518px;margin-left:3%;" class="light-color">
		<%if(type.equals("1")){ %>
		<div style="width:32%;height:518px;float:left;">
		<div style="width:100%;height:40px;background-color: white;text-align: center;line-height:40px;" class="font-normal-color">作品列表</div>
		<div style="width:100%;height:478px;overflow-y:auto;">
		<%
		String menuData = cwt.get_Tittle("0",ID);
		StringTokenizer linecut = new StringTokenizer(menuData,"麤讜黌");
		int i=0;
		if(result.equals("OK")){
			out.println("<div class=\"tips_div font-normal-color big-font\">！！提交成功！！</div>");
		}else if(result.equals("sorry")){
			out.println("<div class=\"tips_div font-normal-color big-font\">@*-~——提交失败。。</div>");
		}
		while(linecut.hasMoreTokens()){
			if(i%2==0){%>
			<form action="check_works.jsp" method="post"><input type="text" style="display:none;" value="<%=linecut.nextToken()%>" name="work_id">
			<button style="width:90%;height:40px;margin-left:5%;margin-top:10px;" class="normal-color"><%=linecut.nextToken()%></button>
			</form>
			<% }if(i%2!=0){%>
			<form action="check_works.jsp" method="post"><input type="text" style="display:none;" value="<%=linecut.nextToken()%>" name="work_id">
			<button style="width:90%;height:40px;background-color: white;margin-left:5%;margin-top:10px;"><%=linecut.nextToken()%></button>
			</form>
		<%}i++;}%>
		</div>
		</div>
		
		<%
		String nickiname = "- -";
		String work_content = "- -";
		String work_point = "- -";
		String work_tittle = "- -";
		String head_photo = "1";
		if(work_id!=null&&!work_id.equals("")){
		String contentData = cwt.get_content(work_id);
		StringTokenizer linecut2 = new StringTokenizer(contentData,"麤讜黌");
		work_ID = linecut2.nextToken();
		poster_id = linecut2.nextToken();
		work_tittle = linecut2.nextToken();
		work_point = linecut2.nextToken();
		work_content = linecut2.nextToken();
		nickiname = cwt.get_nickiname(poster_id);
		head_photo = cwt.get_headPhoto(poster_id);
		}
		%>
		<div style="width:67.8%;height:518px;float:left;">
		<div style="width:100%;height:40px;background-color: white;text-align: center;line-height:40px;" class="font-normal-color">作品内容</div>
		<div style="width:99%;height:460px;margin-top:10px;">
			<div style="margin-top:10px;margin-left:2%;float:left;"><img src="../img/head_photo/<%=head_photo%>.jpg" class="head_photo" /></div>
			<div style="width:30%;height:20px;float:left;margin-top:30px;margin-left:2%;margin-bottom:10px;color:#0080C7;"><%=nickiname%></div>
			<div style="width:60%;height:20px;float:left;margin-left:2%;" class="white-font"><%=work_tittle%></div>
			<div style="width:20%;height:20px;float:right;margin-right:1.5%;" class="white-font">平均得分：<%=work_point%></div>
			<textarea wrap="off" style="width:95%;height:350px;margin-left:3%;margin-top:15px;resize: none;overflow:scroll;" readonly="readonly"><%=work_content%></textarea>
		</div>
		</div>
		<%} %>
		
		<%if(type.equals("2")){ %>
		<%} %>
		
		<%if(type.equals("3")){ %>
		<%} %>
		
		<%if(type.equals("4")){ %>
		<%} %>
		
		<%if(type.equals("5")){ %>
		<%} %>
		
	</div>
		<%if(type.equals("1")){%>
		<form action="check_works.jsp" method="post" id="form_1">
			<input type="text" style="display:none;" value="<%=work_ID%>" name="judge_work_id" id="work_ID">
			<input type="text" style="display:none;" value="<%=poster_id%>" name="judge_poster_id">
			<input type="text" style="display:none;" value="<%=ID%>" name="judge_ID">
			<div style="width:94%;height:80px;margin-top:10px;margin-left:3%;" class="light-color">
				<div style="width:30%;height:80px;margin-left:2%;float:left;line-height:80px;overflow:hidden;">综合评分：<input type="number" height="40px" style="margin-top:17px;width:30%;" name="judge_points" id="number" oninput="if(value<0)value=0;if(value>100)value=100">  得分最高为100~</div>
					<div  style="width:30%;height:80px;margin-left:2%;float:left;line-height:80px;">评价: <textarea style="position:absolute;width:20%;height:40px;margin-top:17px;" id="text" name="judge_content"></textarea></div>
					<button type="button" style="width:20%;height:60px;float:right;margin-right:2%;margin-top:10px;border-radius: 10px;font-size: 20px;" class="normal-color white-font" id="sub_1">评价</button>
				</div>
		</form>
		<%} %>
		
		<%if(type.equals("2")){%>
				<div style="width:94%;height:80px;margin-top:10px;margin-left:3%;" class="light-color">
				
				</div>
		<%} %>
		
		<%if(type.equals("3")){%>
		<div style="width:94%;height:80px;margin-top:10px;margin-left:3%;" class="light-color">
				
				</div>
		<%} %>
		
		<%if(type.equals("4")){%>
		<div style="width:94%;height:80px;margin-top:10px;margin-left:3%;" class="light-color">
				
				</div>
		<%} %>
		
		<%if(type.equals("5")){%>
		<div style="width:94%;height:80px;margin-top:10px;margin-left:3%;" class="light-color">
				
		</div>
		<%} %>
</div>
</body>
</html>
<script src="../js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$('.select—button:eq(<%=type%>)').css('background-color', '#FFA980');
		
		$('#text').click(function(){
			$(this).css('height','140px');
			$("#text").css('width','30%');
			
		});
		$("#text").click(function(e){
		     e.stopPropagation();
		   });
		$('body').click(function(){
			$('.tips_div').css('display','none');	
			$("#text").css('height','40px');
			$("#text").css('width','20%');
		});
		$('#sub_1').click(function(){
			var s = $('#number').val();
			
			if($('#work_ID').val()==null||$('#work_ID').val()==""){
				alert("还没有选中作品哦");
			}
			else if(s==null||s==""){
				alert("评分不可为空哦");
			}else{
				 $('#form_1').submit();
			}
			
		});
	   
		
	});
</script>