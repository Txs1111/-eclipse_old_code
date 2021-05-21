<%/*------------------------------------------------------------------------------------------------
修改人			     
修改时间 		
修改内容		
版本号			 
-------------------------------------------------------------------------------------------------*/%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="bean.Work_bean" import="java.util.StringTokenizer"%>
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
			color:grey;
		}
</style>
<body>

<%
		//接收传过来的ID 和类型
		String ID = null;
		String pages = "1";
		if(request.getAttribute("ID")!=null)
		{
		ID=(String)request.getAttribute("ID");
		}else if(request.getParameter("ID")!=null)
		{
		ID=request.getParameter("ID");
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
		
	
		int pageSize = 8;//设置页面最大记录数
		int allRecord =wb.get_allwork("all_works",pages,ID);//全部记录
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
		
		
		
		String need_search = "ID,tittle,finish_date,work_id,type";//查询字段 发布人id、标题、发布日期、点赞数、内容
		String content = wb.get_Allworks(startRecord, pageSize, "all_works", need_search, pages, ID);
									  //起始记录    页面最大记录数   查询表名     查询字段   页面类型    用户id

	    String poster_id = "000";//定义发布人id
	    String poster_nickiname = "Frank";//定义发布人昵称
	    String tittle = "2222";//定义标题
	    String date = "222";//定义日期
	    String head_photo = "1";//定义头像
	    String work_id = "1";
	    String if_surface = "0";
	    
	    
	    StringTokenizer textline_cut = new StringTokenizer(content,"轎藎燼");//new 一个字符串剪切对象
		String text_line = "";//定义临时变量存储总字串
%>
 <%if(content.equals("")||content==null){
	    	 %>
	    <div style="width:100%;margin-top:60px;text-align: center;float:left">
				<img src="img/example/empty1.png"></br></br>
				<font style="font-size:20px;color:#bfbfbf"><b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前还啥都没有~ </b></font>
			</div>
	     
	    	 
	     <% 
	    }else{
	    %>


	<table style="width:86.6%;height: 75px; color: darkslategray;margin-top:10px;margin:0 auto;" border="0" cellspacing="1px">
					<tr style="width: 100%;background-color: #FFCAB0; height: 30px;">
						<th style="width: 15%;">发布人</th>
						<th style="width: 60%;">发布作品</th>
						<th style="width: 10%;">类型</th>
						<th style="width: 15%;">发布时间</th>
						
		<%	for(int a=0;a<nowpage_lines;a++){
			text_line = textline_cut.nextToken(); //获取数据字符串
			StringTokenizer line_cut = new StringTokenizer(text_line,"麤讜黌");//new 一个子字符串剪切对象
			poster_id = line_cut.nextToken();//创建变量存储 id
			poster_nickiname = wb.get_nickiname(poster_id);//根据id 获取昵称
			head_photo = wb.get_headPhoto(poster_id);//根据id 获取头像	
			tittle = line_cut.nextToken();
			date = line_cut.nextToken();
			work_id = line_cut.nextToken();
			if_surface = line_cut.nextToken();
			if(if_surface.equals("0")){
				if_surface = "后端作品 ";
			}
			if(if_surface.equals("1")){
				if_surface = "前端作品 ";
			}
			
			
	%>				
					<tr style='background-color: #FFEFE8;'>
					<td style="height: 45px; color: darkgrey; "align="left">
					<div style="float:left;">
					<img src="img/head_photo/<%=head_photo%>.jpg" style="margin-top:2px;margin-left:10px; width:40px;height:40px;border-radius:20px;">
					</div>
					<div style="float:left;margin-left:10px;">
					<font style="line-height:45px;">.<%=poster_nickiname %></font>
					</div>
					</td>
					<td style="height: 45px; color: darkgrey; text-align: center;"><form action="Work_details.jsp" method="post" id="form_<%=a%>">
					<a onclick="document:form_<%=a%>.submit();"><%=tittle%></a>
					<input type="text" name="work_id" value="<%=work_id%>" style="display:none"/>
					</form>
					<td style="height: 45px; color: darkgrey; text-align: center;"><%=if_surface%>
					<form action="notice_detail" method="post" id="form_">
					<input type="text" name="ID" value="" style="display:none"/>
					<input type="text" name="notice_ID" value="" style="display:none"/>
					<a class="small-font " onclick="document:form_.submit();"></a>
					</form>
					</td>
					<td style="height: 45px; color: darkgrey; text-align: center;"><%=date%>

					</td>
					</tr>
	<%} %>
				</table>
	
	<!-- 分页模块 -->
			<form name="form" action="Work.jsp" method="post">
				<div class="turnpage-conntrol light-color"  style="width:86.6%;margin-left:6.8%;">
				<div class="turnpage-foin">
					<input type="text" name="ID" value="<%=ID%>" style="display:none">
					<input type="text" name="type" value="<%=pages+"_3"%>" style="display:none">
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
		<%} %>
		<%wb.con.close(); %>
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