<%@page import="javax.sound.midi.SysexMessage"%>
<%/*------------------------------------------------------------------------------------------------
修改人			     
修改时间 		
修改内容		
版本号			 
-------------------------------------------------------------------------------------------------*/%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.Work_bean" import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css"/>
<link rel="stylesheet" type="text/css" href="Css/Work.css"/>
<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css"/>
</head>
<style>
		a{
			cursor: pointer;
		}
</style>
<body>

<%
		//接收传过来的ID 和类型
		String ID = null;
		String type = "1";
		String pages = "1";
		if(request.getAttribute("ID")!=null)
		{
		ID=(String)request.getAttribute("ID");
		}else if(request.getParameter("ID")!=null)
		{
		ID=request.getParameter("ID");
		}
		if(request.getParameter("type")!=null)
		{
		type=request.getParameter("type");
		}
		if(request.getParameter("pages")!=null)
		{
		pages=request.getParameter("pages");
		}
%>
<%
		//接收表单传过来的当前页数
		String nowpages = request.getParameter("nowpage");//传值给当前页码
		int nowpage;//真*当前页码
		if (nowpages == null || nowpages.equals("")) { //安全设置
			nowpage = 1;
		} else {
	  	try {
		  	//把接收的值赋值给当前页码
	      	nowpage = Integer.parseInt(nowpages.trim());//Integer.parseInt String强转Int类型  .tirm()去掉两端空格
	      	} catch (NumberFormatException e) {
	       	nowpage = 1;
	      	}
	      	if(nowpage <= 0) //安全设置
	    	 nowpage =nowpage+1;
 		}


		Work_bean wb = new Work_bean(ID);
		
	
		int pageSize = 4;//设置页面最大记录数
		int allRecord =wb.get_allRecord("all_works",type,pages,ID);//全部记录
		int allPages = allRecord/pageSize+1;//总页数(allpages)=总记录数/每页显示数+1
		
		//安全设置
		if(nowpage>allPages){
			nowpage=allPages;
		}
		
		
		int startRecord = (nowpage - 1) * pageSize; //设置起始查询记录序数  (例：第三页起始记录数为3 减去一*最大记录数5=10，即从第10条开始查询)
		
		//最后一页的记录数
		int nowpage_lines = pageSize;
		if(nowpage==allPages){
			nowpage_lines = allRecord % pageSize;
			if(nowpage_lines ==1){
				nowpage_lines = allRecord;
			}
		}
		
		
		
		String need_search = "ID,content,tittle,like,finish_date,work_id";//查询字段 发布人id、标题、发布日期、点赞数、内容
		String content = wb.get_Allcontent(startRecord, pageSize,"all_works",need_search,type,pages,ID);
											//起始记录    页面最大记录数   查询表名     查询字段   页面类型    用户id

	    String poster_id = "000";//定义发布人id
	    String poster_nickiname = "Frank";//定义发布人昵称
	    String tittle = "2222";//定义标题
	    String date = "222";//定义日期
	    String contents = "22222";//定义内容
	    String head_photo = "1";//定义头像
	    String likes = "10";//定义点赞数
	    String work_id = "1";
	    
	   
	    if(content.equals("")||content==null){
	    	 %>
	    <div style="width:100%;margin-top:60px;text-align: center;float:left">
				<img src="img/example/empty1.png"></br></br>
				<font style="font-size:20px;color:#bfbfbf"><b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前还啥都没有~ </b></font>
			</div>
	     
	    	 
	     <%
	    }else{
	    StringTokenizer textline_cut = new StringTokenizer(content,"轎藎燼");//new 一个字符串剪切对象
		String text_line = "";//定义临时变量存储总字串
%>




	<div class="body_block" id="display">
	
	<%	for(int a=0;a<nowpage_lines;a++){
			text_line = textline_cut.nextToken(); //获取数据字符串
			StringTokenizer line_cut = new StringTokenizer(text_line,"麤讜黌");//new 一个子字符串剪切对象
			poster_id = line_cut.nextToken();//创建变量存储 id
			poster_nickiname = wb.get_nickiname(poster_id);//根据id 获取昵称
			head_photo = wb.get_headPhoto(poster_id);//根据id 获取头像	
			contents = line_cut.nextToken();
			tittle = line_cut.nextToken();
			likes = line_cut.nextToken();
			date = line_cut.nextToken();
			work_id = line_cut.nextToken();
			String file_name = "once";
			String file_url = "/once/homepage.html";
			if(type.equals("2")){
				StringTokenizer url_cut = new StringTokenizer(contents,"$%");
				while(url_cut.hasMoreTokens()){
					file_name = url_cut.nextToken();
					file_url = url_cut.nextToken();
				}
			}
	%>	
		<div id="tidings">
			<div id="tidings_left">
				<div id="img">
					<img src="img/head_photo/<%=head_photo%>.jpg"
						style="margin-top: 15px; border-radius: 25px; margin-left: 15px;"
						class="small_head_photo">
				</div>
				<div id="name">
					<font class="small-font" id="samll-B"><%=poster_nickiname%></font><br /> <a>
						<font class="small-font"><%=tittle%></font>
					</a>

				</div>
					<div id="detail">
				<div id="detail_photo">
				</div>
				<div id="detail_text">
				<%if(type.equals("1")){%>
				<form action="Work_details.jsp" method="post" id="form_<%=a%>">
					<a onclick="document:form_<%=a%>.submit();">详细</a>
					<input type="text" name="work_id" value="<%=work_id%>" style="display:none"/>
				</form>
				<%}%>
				<%if(type.equals("2")){%>	
				<form action="Work_surface_show.jsp" method="post" id="form_<%=a%>">
					<a onclick="document:form_<%=a%>.submit();">详细</a>
					<input type="text" name="file_name" value="<%=file_name %>" style="display:none"/>
					<input type="text" name="file_url" value="<%=file_url %>" style="display:none"/>
					<input type="text" name="ID" value="<%=ID%>" style="display:none"/>
					<input type="text" name="type" value="<%=pages+"_"+type%>" style="display:none"/>
				</form>
				<%}%>
				</div>
				</div>

			</div>
			<div id="tidings_right" style="margin-top:1px;">
				<div class="dynamic_content_new dinylight-color"style="border-radius: 1px;">
					<%if(type.equals("1")){%><textarea class="dynamic_content_new dinylight-color" readonly="readonly" style="width:100%;border:0;resize: none;"><%=contents %></textarea><%}%>
					<%if(type.equals("2")){
					%>
					<div class="dynamic_content_new dinylight-color"style="border-radius: 1px;">
					<%="<img src='user_work_surface/"+file_name+".png' style='width: 100%; height: 100%;object-fit: cover;'/>"%>		
					</div>
					<%}%>
					
				<div id="function">
					<div id="time">
						<font id="samll"><%=date %></font>
					</div>
					<div id="like">
						<img src="img/example/点赞.png" id="good"> <font id="samll"><%=likes %></font>
					</div>

				</div>
			</div>
		</div>
		<%}  %>
		<!-- 分页模块 -->
			<form name="form" action="Work.jsp" method="post">
				<div class="turnpage-conntrol light-color">
				<div class="turnpage-foin">
					<input type="text" name="ID" value="<%=ID%>" style="display:none">
					<input type="text" name="type" value="<%=pages+"_"+type%>" style="display:none">
					<button  value="1" name="nowpage" class="turnpage-number small-font font-normal-color" style="width: 10%;"><font class="small-font">首页</font></button>
					<button  value="<%=nowpage-1%>" name="nowpage" class="turnpage-number small-font font-normal-color"><font class="small-font">上一页</font></button>
					<div class="turnpage-turn font-normal-color"> <font class="small-font">第<%=nowpage%>页/共<%=allPages%>页</font></div>
					<div class="turnpage-turn font-normal-color" id="e" >
					<select disabled="true" name="nowpage" style="float: left;border: 0;margin-top: 9px;margin-left: 7%;" class="font-normal-color small-font" id="wascheck">
					
       				<%
      		 			for(int i=1; i<=allPages; i++) {
     				%>
      	 			<option value=<%=i%> <%=(nowpage == i) ? "selected" : ""%>> 第<%=i%>页 <%}%>
 		 			</select>		
					<button type="submit" class="turnpage-number small-font font-normal-color" style="width: 20%;"><font class="small-font">▶</font></button>
					</div>
					<button  value="<%=nowpage+1%>" name="nowpage" class="turnpage-number small-font font-normal-color"><font class="small-font">下一页</font></button>
					<button value="<%=allPages%>" name="nowpage" class="turnpage-number small-font font-normal-color" style="width: 10%;"><font class="small-font">尾页</font></button>
				</div>
			</div>
		</form>	
				
		</div>
		<%}wb.con.close(); %>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
$(function(){
	 
	 $('#e').click(function(){
			$('#wascheck').attr("disabled",false);
		 });
	});        
         
</script>