<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.member_menage"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成员管理</title>
</head>
<link rel="stylesheet" type="text/css" href="../Css/Public_style.css" />
<link rel="stylesheet" type="text/css" href="../Css/Assignment.css" />
<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	String ID=(String)request.getSession().getAttribute("ID");
	if(ID==null||"".equals(ID)||"null".equals(ID)){
		request.setAttribute("alter", "1");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
		String nowpage = request.getParameter("nowpage");
		if (nowpage == null || "".equals(nowpage) || "null".equals(nowpage)) {
			nowpage = "1";
		}
		String act = request.getParameter("act");
		if (act != null && !"".equals(act) && !"null".equals(act)) {
			if ("1".equals(act)) {
				nowpage = 1 + "";
			} else if ("2".equals(act) && Integer.parseInt(nowpage) > 1) {
				nowpage = Integer.parseInt(nowpage) - 1 + "";
			} else if ("3".equals(act)) {
				nowpage = request.getParameter("jumppage");
			} else if ("4".equals(act)
					&& Integer.parseInt(nowpage) < Integer.parseInt(request.getParameter("allpage"))) {
				nowpage = Integer.parseInt(nowpage) + 1 + "";
			} else if ("5".equals(act)) {
				nowpage = request.getParameter("allpage");
			}
		}
		

		String select_name = null;
		String select_ID = null;
		String select_role = null;
		if (request.getParameter("chose") != null) {
			select_name = request.getParameter("select_name");
			select_ID = request.getParameter("select_ID");
			select_role = request.getParameter("select_role");
		}
		if (select_name == null) {
			select_name = "";
		}
		if (select_ID == null) {
			select_ID = "";
		}
		if (select_role == null) {
			select_role = "";
		}
		member_menage bean = new member_menage(ID);
		String role[] = bean.getroles();
		bean.getIDs(select_name, select_ID, select_role, nowpage);
		String pageurl = "change_show.jsp";
		String changeID = "";
		if (request.getParameter("changeshow") != null) {
			pageurl = "change_show.jsp";
			changeID = request.getParameter("changerole");
			request.getSession().setAttribute("changeID", changeID);
		} else if (request.getParameter("changerole") != null) {
			pageurl = "change_user_role.jsp";
			changeID = request.getParameter("changerole");
			request.getSession().setAttribute("changeID", changeID);
		} else if (request.getParameter("changedata") != null) {
			pageurl = "change_data.jsp";
			changeID = request.getParameter("changedata");
			request.getSession().setAttribute("changeID", changeID);
		}
		System.out.println(pageurl);
	%>
	<jsp:include page="Admin_lead.jsp">
		<jsp:param value="7" name="block_id" />
	</jsp:include>
	<div style="width: 87.5%; margin-left: 0.1%; height: 824px; float: left;" class="dinylight-color">
		<div class="small-tittle middle-font font-normal-color">&nbsp;┃&nbsp;成员管理</div>

		<div style="width: 100%; margin-bottom: 2px; height: 45px; float: left; line-height: 45px; color: white;" class="light-color">
			<form action="number_menage.jsp" method="post">
				<div style="width: 50%; height: 45; float: left;">
					<font style="margin-left: 2%;">姓名:&nbsp;</font>
					<input value="<%=select_name%>" name="select_name" style="width: 20%; border-radius: 3px; margin-top: 11px; height: 21px; border: 1px solid gray;" />
					<font style="margin-left: 2%;">账号:&nbsp;</font>
					<input value="<%=select_ID%>" name="select_ID" style="width: 20%; border-radius: 3px; margin-top: 11px; height: 21px; border: 1px solid gray;" />
					<font style="margin-left: 2%;">角色:&nbsp;</font>
					<select name="select_role" style="width: 20%; border-radius: 3px; margin-top: 11px; height: 21px; border: 1px solid gray;">
						<%
							if (select_role != null && !"".equals(select_role) && !"null".equals(select_role)) {
								int getrole = Integer.parseInt(select_role);
						%>

						<option value="<%=getrole%>">
							<%=role[getrole - 1]%>
						</option>
						<option value="">--</option>
						<%
							} else {
						%>
						<option value="">--</option>
						<%
							}
							for (int a = 1; a <= role.length; a++) {
						%>
						<option value="<%=a%>">
							<%=role[a - 1]%>
						</option>
						<%
							}
						%>
					</select>
				</div>
				<button name="chose" value="1" style="line-height: 31px; float: left; margin-right: 5%; margin-top: 6px; height: 31px; width: 15%; color: #FFA980; background-color: white; border: 0px solid white; border-radius: 4px;">筛选</button>
			</form>
			<form action="number_menage.jsp" method="post">
				<input style="display: none;" name="chose" value="<%=request.getParameter("chose")%>">
				<input style="display: none;" name="select_name" value="<%=select_name%>">
				<input style="display: none;" name="select_ID" value="<%=select_ID%>">
				<input style="display: none;" name="select_role" value="<%=select_role%>">
				<input style="display: none;" name="nowpage" value="<%=nowpage%>">
				<button name="changeshow" value="1" style="line-height: 31px; float: left; margin-left: 5%; margin-top: 6px; height: 31px; width: 15%; color: #FFA980; background-color: white; border: 0px solid white; border-radius: 4px;">角色管理</button>
			</form>
		</div>

		<div style="width: 100%;">
			<div style="width: 65%; float: left;">
				<div style="float: left; width: 100%; font-size: 17px; line-height: 35px; height: 35px; margin-top: 2px; text-align: center;">
					<div style="color: white; width: 10%; heigth: 35px; float: left;" class="light-color">序号</div>
					<div style="color: white; width: 25%; heigth: 35px; float: left; margin-left: 0.1%;" class="light-color">账号</div>
					<div style="width: 20%; color: white; heigth: 35px; float: left; margin-left: 0.1%;" class="light-color">姓名</div>
					<div style="width: 15%; heigth: 35px; float: left; color: white; margin-left: 0.1%;" class="light-color">角色</div>
					<div style="width: 29.5%; heigth: 35px; float: left; color: white; margin-left: 0.1%;" class="light-color">操作</div>
				</div>
				<%
					for (int a = 0; a < bean.showdata; a++) {
						String color = "";
						if (a % 2 == 0) {
							color = "dinylight-color";
						} else {
							color = "white-color";
						}
				%>
				<div style="color: gray; width: 100%; font-size: 15px; line-height: 25px; height: 25px; margin-top: 2px; float: left; text-align: center;" class="<%=color%>">
					<div style="width: 10%; heigth: 25px; float: left;"><%=a + 1 + ((Integer.parseInt(nowpage) - 1) * 20)%></div>
					<div style="width: 25%; heigth: 25px; float: left; margin-left: 0.1%;"><%=bean.allID.get(a)%></div>
					<div style="width: 20%; heigth: 25px; float: left; margin-left: 0.1%;"><%=bean.allname.get(a)%></div>
					<div style="width: 15%; heigth: 25px; float: left; margin-left: 0.1%;"><%=role[Integer.parseInt(bean.allrole.get(a)) - 1]%></div>
					<div style="width: 29.5%; heigth: 25px; float: left; margin-left: 0.1%;" align="center">
						<form action="number_menage.jsp" method="post">
							<input style="display: none;" name="chose" value="<%=request.getParameter("chose")%>">
							<input style="display: none;" name="select_name" value="<%=select_name%>">
							<input style="display: none;" name="select_ID" value="<%=select_ID%>">
							<input style="display: none;" name="select_role" value="<%=select_role%>">
							<input style="display: none;" name="nowpage" value="<%=nowpage%>">
							<%
								String border1 = "border: 0px solid white;";
									String border2 = "border: 0px solid white;";
									if (bean.allID.get(a).equals((String) request.getSession().getAttribute("changeID"))) {
										if ("change_data.jsp".equals(pageurl)) {
											border2 = "border:2px solid gray;";
											border1 = " border: 0px solid white;";
										} else {
											border2 = "border:0px solid gray;";
											border1 = "border:2px solid gray;";
										}

									}
							%>
							<button name="changerole" value="<%=bean.allID.get(a)%>" style="<%=border1%> color: white; width: 35%; height: 100%; border-radius: 5px; " class="light-color">角色</button>
							<button name="changedata" value="<%=bean.allID.get(a)%>" style="<%=border2%> color: white; background-color: #84BFD9; margin-left: 0.1%; width: 35%; height: 100%; border-radius: 5px;">编辑</button>
						</form>
					</div>
				</div>
				<%
					}
				%>

				<div class="turnpage-conntrol light-color" style="color: gray; height: 45px; padding-top: 2px; margin-top: 3px;">
					<div style="width: 100%; height: 15px; margin-bottom: 3px; line-height: 15px;" align="center">
						<%
							int num = bean.datanum;
							int allpage = 0;
							for (;;) {
								num = num - 20;
								if (num == -20) {
									allpage = 1;
									break;
								} else if (num > -20 && num <= 0) {
									allpage = allpage + 1;
									break;
								} else if (num > 0) {
									allpage = allpage + 1;
								}
							}
						%>
						<font color="white">
							当前第<%=nowpage%>页/共有<%=allpage%>页<%=bean.datanum%>条记录
						</font>
					</div>
					<form action="number_menage.jsp" method="post">
						<input style="display: none;" name="select_name" value="<%=select_name%>">
						<input style="display: none;" name="select_ID" value="<%=select_ID%>">
						<input style="display: none;" name="select_role" value="<%=select_role%>">
						<input style="display: none;" name="allpage" value="<%=allpage%>">
						<input style="display: none;" name="nowpage" value="<%=nowpage%>">
						<div align="center" style="width: 100%; height: 25px;">
							<button name="act" value="1" class="dinylight-color" style="border-radius: 2px; height: 25px; width: 12%; border: 0px solid white;">首页</button>
							<button name="act" value="2" class="dinylight-color" style="border-radius: 2px; height: 25px; width: 12%; border: 0px solid white;">上一页</button>
							<select name="jumppage" style="width: 6%; height: 25px; border: 0px solid white; border-radius: 2px;">
								<option value="<%=nowpage%>"><%=nowpage%></option>
								<%
									for (int a = 1; a <= allpage; a++) {
								%>
								<option value="<%=a%>"><%=a%></option>
								<%
									}
								%>
							</select>
							<button name="act" value="3" class="dinylight-color" style="border-radius: 2px; height: 25px; width: 6%; border: 0px solid white;">跳转</button>
							<button name="act" value="4" class="dinylight-color" style="border-radius: 2px; height: 25px; width: 12%; border: 0px solid white;">下一页</button>
							<button name="act" value="5" class="dinylight-color" style="border-radius: 2px; height: 25px; width: 12%; border: 0px solid white;">尾页</button>
						</div>
					</form>
				</div>
			</div>
			<div style="width: 0.1%; height: 625px; background-color: black; float: left;"></div>
			<div style="width: 34.8%; height: 625px; background-color: white; float: left; margin-left: 0.1%; margin-top: 2px;">
				<iframe style="width: 100%; height: 100%; border: 0px solid white;" src="<%=pageurl%>"></iframe>
			</div>
			<!-- 翻页 -->


		</div>
	</div>
</body>
</html>
