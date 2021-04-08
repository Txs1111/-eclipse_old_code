<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.journal_tool"
	import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
	margin: 0 auto;
	height: 40px;
	margin-top: 5px;
}

.jo_turnpage-conntrol {
	margin-top: 1%;
	float: left;
	width: 100%;
	text-align: center;
	margin-left: 4%;
	height: 45px;
}

.body_charge {
	margin: 0 auto;
	width: 90%;
	height: 100%;
}

.head_charge {
	width: 100%;
	height: 70px;
	margin-top: 10px;
	background-color: white;
	float: left;
}

.stoma_charge {
	width: 100%;
	height: 630px;
	float: left;
	background-color: #FFE4D7;
}

.tail_charge {
	width: 100%;
	height: 70px;
	margin-top: 10px;
	float: left;
}

.excel {
	float: left;
	width: 15%;
	height: 40px;
	font-size: 20px;
	margin-top: 17px;
	text-align: center;
	font-weight: 600;
	line-height: 40px;
	color: #FFA980;
	border-left: 1px solid #FAE441;
}

.excel_content {
	float: left;
	width: 15%;
	height: 34px;
	font-size: 12px;
	margin-top: 1px;
	text-align: center;
	line-height: 34px;
	border-left: 1px solid #FAE441;
	overflow-x: auto;
}

.border_line {
	height: 1px;
	width: 100%;
	float: left;
	border-bottom: 1px solid #FAE441;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");//或者指定的编码(GBK或其他)
		String needsearch_type = null;
		String needsearch_content = null;
		if (request.getParameter("needsearch_type") != null) {
			needsearch_type = request.getParameter("needsearch_type");
		}
		if (request.getParameter("needsearch_content") != null) {
			needsearch_content = request.getParameter("needsearch_content");
		}
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
			if (nowpage <= 0) //安全设置
				nowpage = nowpage + 1;
		}
		String type = null;
		if (request.getParameter("type") != null) {
			type = request.getParameter("type");
		}
		journal_tool jt = new journal_tool();
		if (type.equals("2")&&(needsearch_content==null||needsearch_content.equals("")||needsearch_content.equals("null"))) {
			String usename =  request.getParameter("needsearch_2_usename");
			String useID =  request.getParameter("needsearch_2_useID");
			String cotent =  request.getParameter("needsearch_2_cotent");
			String btime =  request.getParameter("needsearch_2_begintime");
			String ctime =  request.getParameter("needsearch_2_endtime");
			String sql = jt.sqlCatchup(usename, useID, cotent, btime, ctime);
			needsearch_content = sql;	
		}
		int pageSize = 17;//设置页面最大记录数
		int allRecord = jt.get_allRecord("journal", type, needsearch_type, needsearch_content);//全部记录
		int allPages = allRecord / pageSize + 1;//总页数(allpages)=总记录数/每页显示数+1

		//安全设置
		if (nowpage > allPages) {
			nowpage = allPages;
		}

		int startRecord = (nowpage - 1) * pageSize;
		//最后一页的记录数
		int nowpage_lines = pageSize;
		if (nowpage == allPages) {
			nowpage_lines = allRecord % pageSize;
		}

		/*------------------------------*/
		String need_search = "usename,useID,cotent,time,inname,inID";//查询字段 发布人id、标题、发布日期、详情ID
		String content = null;
		if (type.equals("1")) {
			content = jt.get_pageData(startRecord, pageSize, "journal", need_search, type,"", "");
		}
		if (type.equals("2")) {
			content = jt.get_pageData(startRecord, pageSize, "journal", need_search, type,"",needsearch_content);
		}
		if (type.equals("6") || type.equals("3") || type.equals("4") || type.equals("5")) {
			content = jt.get_pageData(startRecord, pageSize, "journal", need_search, type, needsearch_type,needsearch_content);
		}

		/*------------------------------*/
	%>
	<div class="head_charge">
		<div class="excel" style="border: 0; margin-left: 0.4%;">用户</div>
		<div class="excel">用户ID</div>
		<div class="excel" style="width: 23.8%">操作</div>
		<div class="excel">时间</div>
		<div class="excel">受影响人</div>
		<div class="excel">受影响人ID</div>
	</div>
	<div class="stoma_charge">
		<%
			StringTokenizer textline_cut = new StringTokenizer(content, "轎藎燼");//new 一个字符串剪切对象
			String text_line = "";//定义临时变量存储总字串
			for (int a = 0; a < nowpage_lines; a++) {
				text_line = textline_cut.nextToken(); //获取数据字符串
				StringTokenizer line_cut = new StringTokenizer(text_line, "麤讜黌");//new 一个子字符串剪切对象
				String username = line_cut.nextToken();
				String userID = line_cut.nextToken();
				String dowhat = line_cut.nextToken();
				String dotime = line_cut.nextToken();
				String infeer_name = line_cut.nextToken();
				String infeerID = line_cut.nextToken();
				if (infeer_name.equals("null") || infeer_name.equals("") || infeer_name == null) {
					infeer_name = "无";
				}
				if (infeerID.equals("null") || infeerID.equals("") || infeerID == null) {
					infeerID = "无";
				}
				if (a % 2 == 0) {
		%>
		<div class="excel_content light-color white-font"
			style="border: 0; margin-left: 0.4%;"><%=username%></div>
		<div class="excel_content light-color white-font"><%=userID%></div>
		<div class="excel_content light-color white-font"
			style="width: 23.8%;"><%=dowhat%></div>
		<div class="excel_content light-color white-font"><%=dotime%></div>
		<div class="excel_content light-color white-font"><%=infeer_name%></div>
		<div class="excel_content light-color white-font"><%=infeerID%></div>
		<div class="border_line"></div>
		<%
			} else {
		%>

		<div class="excel_content dinylight-color font-normal-color"
			style="border: 0; margin-left: 0.4%;"><%=username%></div>
		<div class="excel_content dinylight-color font-normal-color"><%=userID%></div>
		<div class="excel_content dinylight-color font-normal-color"
			style="width: 23.8%;"><%=dowhat%></div>
		<div class="excel_content dinylight-color font-normal-color"><%=dotime%></div>
		<div class="excel_content dinylight-color font-normal-color"><%=infeer_name%></div>
		<div class="excel_content dinylight-color font-normal-color"><%=infeerID%></div>
		<div class="border_line"></div>
		<%
			}
			}
		%>
	</div>
	<div class="tail_charge normal-color">
		<form name="form" action="web_journal.jsp" method="post">
			<input value="<%=needsearch_content%>" name="needsearch_content"
				style="display: none;" /> <input value="<%=needsearch_type%>"
				name="needsearch_type" style="display: none;" /> <input
				value="<%=type%>" name="type" style="display: none;" />
			<div class="jo_turnpage-conntrol">
				<div class="jo_turnpage-foin">
					<button value="1" name="nowpage"
						class="jo_turnpage-number small-font font-normal-color"
						style="width: 10%; cursor: pointer;">
						<font class="small-font">首页</font>
					</button>
					<button value="<%=nowpage - 1%>" name="nowpage"
						style="cursor: pointer;"
						class="turnpage-number small-font font-normal-color">
						<font class="small-font">上一页</font>
					</button>
					<div class="jo_turnpage-turn font-normal-color">
						<font class="small-font">第<%=nowpage%>页/共<%=allPages%>页
						</font>
					</div>
					<div class="jo_turnpage-turn font-normal-color" id="se">
						<select disabled="disabled" name="nowpage"
							style="float: left; border: 0; margin-top: 9px; margin-left: 7%;"
							class="font-normal-color small-font" id="check">

							<%
								for (int i = 1; i <= allPages; i++) {
							%>
							<option value=<%=i%> <%=(nowpage == i) ? "selected" : ""%>>
								第<%=i%>页
								<%
								}
							%>
							
						</select>
						<button type="submit"
							class="jo_turnpage-number small-font font-normal-color"
							style="width: 20%; cursor: pointer;">
							<font class="small-font">▶</font>
						</button>
					</div>
					<button value="<%=nowpage + 1%>" name="nowpage"
						class="jo_turnpage-number small-font font-normal-color"
						style="cursor: pointer;">
						<font class="small-font">下一页</font>
					</button>
					<button value="<%=allPages%>" name="nowpage"
						class="jo_turnpage-number small-font font-normal-color"
						style="width: 10%; cursor: pointer;">
						<font class="small-font">尾页</font>
					</button>
				</div>
			</div>
		</form>

	</div>
	<%jt.con.close();%>
</body>
</html>