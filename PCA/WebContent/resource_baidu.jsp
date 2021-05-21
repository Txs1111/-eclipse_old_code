<%@page import="dao.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link href="Css/Homepage.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="Css/score.css" />
<link rel="stylesheet" type="text/css" href="Css/resuorce.css" />
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String get_id = (String) request.getSession().getAttribute("ID");
		//分类
		String resource = "1";
		resource = request.getParameter("resource");//resource_baidu.jsp传来的值目的为
		String classer = "百度网盘";
		String name = "百度云";
		if (resource != null && !"".equals(resource)) {
			if ("1".equals(resource)) {
				classer = "百度网盘";
				name = "百度云";
			} else if ("2".equals(resource)) {
				classer = "哔哩哔哩";
				name = "bilibili";
			} else if ("3".equals(resource)) {
				classer = "阿巴阿巴网盘";
				name = "阿巴阿巴网盘";
			}
		} else {
			resource = "1";
		}
		System.out.println("ID:" + get_id);
		System.out.println("resource:" + resource);
		//页码
		String act = request.getParameter("act");
		String nowpages = request.getParameter("nowpage");//传值给当前页码	
		String allpages ;
		if (nowpages == null || nowpages.equals("")) { //安全设置
			nowpages = "1";
		}
		if (act != null && !"".equals(act)) {
			allpages = request.getParameter("allpage");
			if ("1".equals(act)) {
				nowpages = "1";
			} else if ("2".equals(act)) {
				nowpages = Integer.toString(Integer.parseInt(nowpages) - 1);;

			} else if ("4".equals(act)) {
				nowpages = Integer.toString(Integer.parseInt(nowpages) + 1);
			} else if ("5".equals(act)) {
				nowpages = allpages;
			}
			
		}
        System.out.println("///"+nowpages);
		
		/**
		*后端辅助模块
		**/
		get_resource re = new get_resource();
		resource_entity heads = re.allResource();
		resource_entity head = re.resource();
		
		String[][] classify = new String[re.path_number.get(Integer.parseInt(resource) - 1)][5];
		int x = 0;
		while (head != null) {
			if (resource.equals(head.path)) {
				StringTokenizer st = new StringTokenizer(head.time, " ");
				System.out.println();
				classify[x][0] = head.title;
				classify[x][1] = re.alltype.get((Integer.parseInt(head.type) - 1));
				classify[x][2] = st.nextToken();
				classify[x][3] = head.content;
				classify[x][4] = head.verification;
				System.out.println(classify[x][2]);
				x++;
				
			}
			head = head.next;
		}
		//百度云类资源的个数
		int sizes = re.path_number.get(Integer.parseInt(resource) - 1);
		//计算函数
		// sizes = Integer.parseInt(re.allpath.get(Integer.parseInt(resource)-1));
		System.out.println("王" + sizes + "王");
	%>

	<div class="oldwork_head ">
		<font class="middle-font" color="#FFA980">&nbsp;┃&nbsp;<%=name%></font>
	</div>
	<%
		//显示一页的数据  
		int allpage = 1;//总页数
		int nowpage = Integer.parseInt(nowpages);//当前页码
		System.out.println("[]"+nowpage);
		int limiters = 0;//限定条件当消息达到六条时跳出
		if (sizes > 0) {
			if(sizes%6 == 0){
				allpage = (sizes/6);
			}else{
				allpage = (sizes/6) + 1;
			}
			System.out.println("王" + sizes%6 + "王");
			if (nowpage > allpage) {//防止无限次翻页
				nowpage = allpage;
			} else if (nowpage<0 || nowpage==0) {
				nowpage = 1;
			}
			int num = (nowpage - 1) * 6;//第几条消息
			System.out.println("[[]]"+num);
			for (int i = num; i < sizes; i++) {
				limiters++;
	%>
	<div class="resource_entry">
		<div class="entry_1">
			<a><img class="entry_img" src="img/example/entry.png"
				align="texttop"></a> <font class="middle-font"><%=classify[i][0]%></font>	<button style="margin-left:20px;width:8%;font-size: 10px;border: 0;color:grey;cursor: pointer;">失效提醒</button>
		</div>
		<div class="entry_2">
			<a href="<%=re.get_a(classify[i][3])%>"><img class="entry_img" src="img/example/下载 .png" align="absbottom"></a>
		</div>
		<div class="entry_3">
			<div class="label">
				<font class="small-font"><%=classify[i][1]%></font>
			</div>
			<div class="time"style="color:gray;">
				<font><%=classify[i][2]%></font>
			</div>
			<%
				  if ("1".equals(resource)) {
			%>
			<div class="time"style="color:gray;" style="height: 50px;">
				<font>提取码:<%=classify[i][4]%></font>
			</div>
			<% 
				  }
            %>
		</div>
	</div>
	<%
		          if (limiters == 6) {
					     break;
	               }
	         }
	%>
	<div
		style="width: 59%; height: 250px; float: left; text-align: center; position: absolute; top: 975px;">
		<form name="form" action="resource_function.jsp" method="post">
		    <input name="ID" value="<%=get_id%>"  style="display: none;">
		    <input type="text" name="resource" value="<%=resource %>" style="display:none"/>
			<input name="allpage" value="<%=allpage%>" style="display: none;">
			<input name="nowpage" value="<%=nowpage%>" style="display: none;">
			<div class="turnpage-conntrol light-color"
				style="border-radius: 40px;">
				<div class="turnpage-foin" Style="width: 447px">
					<button value="1" name="act"
						class="turnpage-number small-font font-normal-color"
						style="width: 45px;">
						<font class="small-font">首页</font>
					</button>
					<button value="2" name="act"
						class="turnpage-number small-font font-normal-color"
						style="width: 60px;">
						<font class="small-font">上一页</font>
					</button>
					<div class="turnpage-turn font-normal-color " style="width: 100px;">
						<font class="small-font">第<%=nowpage%>页/共<%=allpage%>页
						</font>
					</div>
					<div class="turnpage-turn font-normal-color " id="e"
						style="width: 95px;">
						<select disabled="true" name="nowpage"
							style="float: left; border: 0; margin-top: 9px; margin-left: 7%;"
							class="font-normal-color small-font" id="wascheck">

							<%
								for (int i = 1; i <= allpage; i++) {
							%>
							<option value=<%=i%> <%=(nowpage == i) ? "selected" : ""%>>
								第<%=i%>页
								<%
								}
							%>
							
						</select>
						<button type="submit"
							class="turnpage-number small-font font-normal-color"
							style="width: 20%;">
							<font class="small-font">▶</font>
						</button>
					</div>
					<button value="4" name="act"
						class="turnpage-number small-font font-normal-color"
						style="width: 60px;">
						<font class="small-font">下一页</font>
					</button>
					<button value="5" name="act"
						class="turnpage-number small-font font-normal-color"
						style="width: 45px">
						<font class="small-font">尾页</font>
					</button>
				</div>
			</div>
		</form>
	</div>
	<%
		} else {
	%><div id="tidings" class="small-font"
		style="text-align: center; line-height: 200px; border-bottom: 0; color: gainsboro;">
		<font>站内暂无资源</font>
	</div>
	<%
		}
	%>
</body>
</html>