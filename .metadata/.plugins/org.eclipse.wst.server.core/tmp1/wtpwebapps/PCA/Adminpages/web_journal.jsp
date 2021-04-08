<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="dao.journal_tool"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<style type="text/css">
.jo_turnpage-turn {
	width: 20%;
	height: 35px;
	line-height: 35px;
	font-size: 28px;
	vertical-align: middle;
	text-align: center;
	margin-left: 6px;
	float: left;
	overflow: hidden;
	border-radius: 6px;
	border: 0;
    background-color: white;
    outline: none;
}

.jo_turnpage-number {
	width: 15%;
	height: 35px;
	line-height: 30px;
	font-size: 28px;
	float: left;
	margin-top: 0px;
	margin-left: 6px;
	text-align: center;
	background-color: white;
	overflow: hidden;
	border-radius: 6px;
	border: 0;
    outline: none;
}

.jo_turnpage-foin {
	width: 80%;
	margin:0 auto;
	height: 40px;
	margin-top:5px;
}

.jo_turnpage-conntrol {
	margin-top: 1%;
	float: left;
	width: 100%;
	text-align: center;
	height: 45px;
}
	.menu_dad{
		float: left;
		width: 10%;
		height: 823px;
		margin-left:1%;
		overflow-y: auto;
	}
	.menu_firstchild{
		float: left;
		width: 100%;
		height: 20px;
		margin-top: 20px;
		background-color:  #FFA980;
	}
	.menu_child{
		float: left;
		width: 100%;
		height: 40px;
		border-bottom: 1px solid #fafafa;
		margin-top: 2px;
		color: #FFA980;
		background-color: white;
		font-weight: 500;
		text-align: center;
		border: 0;
		outline: none;
		cursor: pointer;
		line-height: 40px;
	}
	.display{
		height: 823px;
		width: 88%;
		float: left;
		margin-left: 1%;
	}
	.body_charge{
		margin: 0 auto;
		width: 90%;
		height: 100%;
	}
	.head_charge{
		width: 100%;
		height: 70px;
		margin-top: 10px;
		background-color: white;
		float: left;
	}
	.stoma_charge{
		width: 100%;
		height: 630px;
		float: left;
		background-color: #FFE4D7;
	}
	.tail_charge{
		width: 100%;
		height: 70px;
		margin-top: 10px;
		float: left;
	}
	.search_block{
		width:50%;
		height:400px;
		margin: 0 auto;
		color: #FFA980;
		background-color:white;
		margin-top: 80px;
	}
	.search_block button{
		outline: none;
		border:0;
		color:white;
		background-color: #FFA980;
		width:70%;
		height: 40px;
		margin-left:15%;
		margin-top: 40px;
		border-radius: 6px;
	}
	.search_line{
		width: 70%;
		height: 40px;
		margin: 0 auto;
		margin-top: 20px;
		
	}
	.search_line input{
		margin-top: 20px;
	}
</style>
	<body>
		<jsp:include page="Admin_lead.jsp">
			<jsp:param value="8" name="block_id" />
		</jsp:include>
		
<%
	request.setCharacterEncoding("UTF-8") ;//或者指定的编码(GBK或其他)
	String type="1";
	String needsearch_type = null;
	String needsearch_content = null;
	if(request.getParameter("type")!=null)
	{
		type=request.getParameter("type");
	}
	if(request.getParameter("needsearch_type")!=null)
	{
		needsearch_type =request.getParameter("needsearch_type");
	}
	if(request.getParameter("needsearch_content")!=null)
	{
		needsearch_content =request.getParameter("needsearch_content");
	}
%>
		<button class="menu_child" style="display:none;"></button>
		<div style="width:87.5%;margin-left:0.1%;height:824px;float:left;" class="dinylight-color">
			<div class="menu_dad">
				<form method="post" action="web_journal.jsp">
					<div class="menu_firstchild"></div>
					<button class="menu_child" value="1" name="type">全部日志
					</button>
					<button class="menu_child" value="2" name="type">条件查询
					</button>
					<button class="menu_child" value="3" name="type">特定人员
					</button>
					<button class="menu_child" value="4" name="type">特定时间
					</button>
					<button class="menu_child" value="5" name="type">特定行为			
					</button>
					<button class="menu_child" value="6" name="type">受影响人		
					</button>
				</form>
			</div>
		<div class="display light-color">
				<div class="body_charge">
				
				<%if(type.equals("1")){
				%>
				<jsp:include page="web_journal_child.jsp">
					<jsp:param value="<%=type%>" name="type" />
				</jsp:include>
				<%} %>
				
				
				
				<%if(type.equals("2")){
					if(needsearch_type==null){%>
					<form action="web_journal.jsp" method="post">
					<div class="search_block">
					<div class="search_line"><input name="needsearch_2_usename"  placeholder="用户名"/></div>
					<div class="search_line"><input name="needsearch_2_useID"  placeholder="用户ID"/></div>
					<div class="search_line"><input name="needsearch_2_cotent" placeholder="用户行为"/></div>
					<div class="search_line"><input name="needsearch_2_begintime" placeholder="开始时间"/>- -<input name="needsearch_2_endtime" placeholder="结束时间"/></div>
						<input name="type" value="2"  style="display:none;"/>
						<input name="needsearch_type" value="needsearch_add"  style="display:none;"/>
						<button>查询</button>
					</div>
				</form>
			<%}else{%>
				<jsp:include page="web_journal_child.jsp">
				<jsp:param value="<%=type%>" name="type" />
				<jsp:param value="<%=needsearch_type%>" name="needsearch_type" />
				<jsp:param value="<%=needsearch_content%>" name="needsearch_content" />
			</jsp:include>
				<%}}%>
				
				
				<%if(type.equals("3")){
					if(needsearch_type==null){%>			
					<form action="web_journal.jsp" method="post">
						<div>根据用户名查询日志：<input name="needsearch_content"/>
							<input name="type" value="3"  style="display:none;">
							<input name="needsearch_type" value="needsearch_username"  style="display:none;">
							<button>查询</button>
						</div>
					</form>
					
					<form action="web_journal.jsp" method="post">
						<div>根据用户ID查询日志：<input name="needsearch_content"/>
							<input name="type" value="3"  style="display:none;">
							<input name="needsearch_type" value="needsearch_userID" style="display:none;"> 
							<button>查询</button>
						</div>
					</form>
				<%}else{%>
					<jsp:include page="web_journal_child.jsp">
					<jsp:param value="<%=type%>" name="type" />
					<jsp:param value="<%=needsearch_type%>" name="needsearch_type" />
					<jsp:param value="<%=needsearch_content%>" name="needsearch_content" />
				</jsp:include>
					<%}}%>
				
				
				
				<%if(type.equals("4")){//select * from journal where time>'2021-03-10' and time<'2021-03-11';%>
					<div>起始时间：<input type="date" /></div>
					<div>结束时间：<input type="date"/></div>
					<button>查询</button>
				<%}%>
				
				
				
				<%if(type.equals("5")){
					if(needsearch_type==null){%>			
					<form action="web_journal.jsp" method="post">
						<div>根据行为查询日志：<input name="needsearch_content"/>
							<input name="type" value="5"  style="display:none;">
							<input name="needsearch_type" value="needsearch_dowhat"  style="display:none;">
							<button>查询</button>
						</div>
					</form>
				<%}else{%>
					<jsp:include page="web_journal_child.jsp">
					<jsp:param value="<%=type%>" name="type" />
					<jsp:param value="<%=needsearch_type%>" name="needsearch_type" />
					<jsp:param value="<%=needsearch_content%>" name="needsearch_content" />
				</jsp:include>
					<%}}%>
				
				<%if(type.equals("6")){
				if(needsearch_type==null){%>			
				<form action="web_journal.jsp" method="post">
					<div>根据受影响人用户名查询日志：<input name="needsearch_content"/>
						<input name="type" value="6"  style="display:none;">
						<input name="needsearch_type" value="needsearch_innusername"  style="display:none;">
						<button>查询</button>
					</div>
					<div>根据受影响人ID查询日志：<input name="needsearch_content"/>
						<input name="type" value="6"  style="display:none;">
						<input name="needsearch_type" value="needsearch_innuserID"  style="display:none;">
						<button>查询</button>
					</div>
				</form>
			<%}else{%>
				<jsp:include page="web_journal_child.jsp">
				<jsp:param value="<%=type%>" name="type" />
				<jsp:param value="<%=needsearch_type%>" name="needsearch_type" />
				<jsp:param value="<%=needsearch_content%>" name="needsearch_content" />
			</jsp:include>
				<%}}%>
			
				
		</div>
	</body>
</html>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" charset="utf-8">
	$('.menu_child:eq(<%=type%>)').addClass('light-color white-font');
</script>