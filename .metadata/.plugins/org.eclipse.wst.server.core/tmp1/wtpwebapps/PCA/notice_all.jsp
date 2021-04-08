<%/*------------------------------------------------------------------------------------------------
修改人			  许良     
修改时间 	   2021/1/25
修改内容		   实现倒序展示
版本号			 0.0.1
-------------------------------------------------------------------------------------------------*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" import="bean.*" import="java.util.StringTokenizer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
		button{
			border:0;
			outline:none;	
		}

</style>
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<link href="Css/Public_style.css" rel="stylesheet" />
<link href="Css/Homepage.css" rel="stylesheet" />
<body bgcolor="#F4F5F7">


<!-- 调用头部页面 -->


	
<%	
	request.setCharacterEncoding("UTF-8") ;//或者指定的编码(GBK或其他)
	String ID = null;
	if (request.getAttribute("ID") != null || request.getAttribute("ID") != "") {
		ID=request.getParameter("ID");
	}
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

	
	Homepage_bean bean  = new Homepage_bean(ID);
	bean.head();
	NoticeAll_Dao t_pages = new NoticeAll_Dao();
			
		
			int pageSize = 10;//设置页面最大记录数
			int allRecord = t_pages.get_allRecord("notice");//全部记录
			int allPages = allRecord/pageSize+1;//总页数(allpages)=总记录数/每页显示数+1
			
			//安全设置
			if(nowpage>allPages){
				nowpage=allPages;
			}
			
			
			int startRecord = (nowpage - 1) * pageSize; //设置起始查询记录序数  (例：第三页起始记录数为3 减去一*最大记录数5=10，即从第10条开始查询)
			
			//int startRecord = allRecord - ((nowpage) * pageSize); //设置起始查询记录序数 (倒序) (例：总记录数为 54 第三页起始记录为 54-（3-1）*10 = 34)
			
			//最后一页的记录数
			int nowpage_lines = pageSize;
			if(nowpage==allPages){
				nowpage_lines = allRecord % pageSize;
			}
			
			
			String need_search = "poster_id,ID,tittle,postdate";//查询字段 发布人id、标题、发布日期、详情ID
			String content = t_pages.get_pageData(startRecord, pageSize,"notice",need_search);
												//起始记录    页面最大记录数   查询表名     查询字段
	
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

<form action="Homepage.jsp" method="post" name="">
	<div style="width:75%;margin:0 auto;">
		<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;
				<button class="middle-font font-light-color" value="<%=ID%>" name="ID" style="cursor:pointer;background-color: #FAFAFA" >主页</button>
				<button class="middle-font font-light-color" disabled="disabled" style="cursor:pointer;background-color: #FAFAFA" > / 全部公告</button>
				<img src="img/lead_photo/返回.png"style="width:30px;height:25px;float:right;">
				<button class="middle-font font-light-color" value="<%=ID%>" name="ID" style="cursor:pointer;float:right;background-color: #FAFAFA" >返回上一级</button>	
		</div>
</form>
		
		<div style="width: 100%;" align="center">
				<table style="width:100%;height: 75px; color: darkslategray;" border="0"
					cellspacing="1px">
					<tr style="width: 100%;background-color: #FFCAB0; height: 30px;">
						<th style="width: 15%;">发布人</th>
						<th style="width: 70%;">发布内容</th>
						<th style="width: 15%;">发布时间</th>
					</tr>
			<%
					StringTokenizer textline_cut = new StringTokenizer(content,"轎藎燼");//new 一个字符串剪切对象
					String text_line = "";//定义临时变量存储总字串
					for(int a=0;a<nowpage_lines;a++){
						
						
						text_line = textline_cut.nextToken(); //获取数据字符串
						StringTokenizer line_cut = new StringTokenizer(text_line,"麤讜黌");//new 一个子字符串剪切对象
						String posterer_id = line_cut.nextToken();//创建变量存储 id
						String poster_nickiname = t_pages.get_nickiname(posterer_id);//根据id 获取昵称
						String poster_headPhoto = t_pages.get_headPhoto(posterer_id);//根据id 获取头像					
						String notice_id = line_cut.nextToken();
						if (a % 2 == 0) {
								out.println("<tr style='background-color: #FFEFE8;'>");
							} else
								out.println("<tr style='background-color: white;'>");
			%>
					<td style="height: 45px; color: darkgrey; "align="left">
					<div style="float:left;">
					<img src="img/head_photo/<%=poster_headPhoto%>.jpg" style="margin-top:2px;margin-left:10px; width:40px;height:40px;border-radius:20px;">
					</div>
					<div style="float:left;margin-left:10px;">
					<font style="line-height:45px;">	<%=poster_nickiname%>.</font>
					</div>
					</td>
					<td style="height: 45px; color: darkgrey; text-align: center;">
					<form action="notice_detail" method="post" id="form_<%=a%>">
					<input type="text" name="ID" value="<%=ID%>" style="display:none"/>
					<input type="text" name="notice_ID" value="<%=notice_id %>" style="display:none"/>
					<a class="small-font " onclick="document:form_<%=a%>.submit();"style="cursor:pointer;"><%=line_cut.nextToken()%></a>
					</form>
					</td>
					<td style="height: 45px; color: darkgrey; text-align: center;">
					<%=line_cut.nextToken()%>
					</td>
					</tr>
					<%} %>
				</table>
				
			<form name="form" action="notice_all.jsp" method="post">
				<input type="text" name="ID" value="<%=ID%>" style="display:none"/>
				<div class="turnpage-conntrol light-color">
				<div class="turnpage-foin">
					<button  value="1" name="nowpage" class="turnpage-number small-font font-normal-color" style="width: 10%;cursor:pointer;"><font class="small-font">首页</font></button>
					<button  value="<%=nowpage-1%>" name="nowpage"style="cursor:pointer;" class="turnpage-number small-font font-normal-color"><font class="small-font">上一页</font></button>
					<div class="turnpage-turn font-normal-color"> <font class="small-font">第<%=nowpage%>页/共<%=allPages%>页</font></div>
					<div class="turnpage-turn font-normal-color" id="se" >
					<select disabled="disabled"  name="nowpage" style="float: left;border: 0;margin-top: 9px;margin-left: 7%;" class="font-normal-color small-font" id="check">
					
       				<%
      		 			for(int i=1; i<=allPages; i++) {
     				%>
      	 			<option value=<%=i%> <%=(nowpage == i) ? "selected" : ""%>> 第<%=i%>页 <%}%>
 		 			</select>		
					<button type="submit" class="turnpage-number small-font font-normal-color" style="width: 20%;cursor:pointer;"><font class="small-font">▶</font></button>
					</div>
					<button  value="<%=nowpage+1%>" name="nowpage" class="turnpage-number small-font font-normal-color"style="cursor:pointer;"><font class="small-font">下一页</font></button>
					<button value="<%=allPages%>" name="nowpage" class="turnpage-number small-font font-normal-color" style="width: 10%;cursor:pointer;"><font class="small-font">尾页</font></button>
				</div>
			</div>
		</form>	
				
			<%t_pages.con.close(); %>
	</div>
</body>

</html>
<script src="js/jquery-3.4.1.js"></script>
<script>        
       
$(function(){
	$('#homepage').css('border-bottom-style','solid');
	var $logo = $('#sign_list li');
	 
	 $('#se').click(function(){
			$('#check').attr("disabled",false);
		 });    
    
	 
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