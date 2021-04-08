<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="bean.sendmission_bean"
	import="dao.Admin_tools" import="java.util.StringTokenizer"%>
<%@page import="dao.resource_entity"%>
<%@page import="dao.get_resource"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../Css/Public_Color/orange.css" />
<link href="../Css/Public_style.css" rel="stylesheet" />
<link
	href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.0.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<%
	String ID = (String) request.getSession().getAttribute("ID");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	System.out.println();
	int type = -1;
	int path = -1;

	if (request.getParameter("type") != null)
		type = Integer.parseInt(request.getParameter("type"));
	if (request.getParameter("path") != null)
		path = Integer.parseInt(request.getParameter("path"));
	System.out.println("type:" + type);
	System.out.println("path:" + path);
	System.out.println("title:" + title);
	System.out.println("content:" + content);
	get_resource gr = new get_resource();
	gr.allResource();
	gr.resource();
	if (title != null && !title.equals(null) && title != "" && content != null && !content.equals(null)
			&& content != "") {
		gr.uploading(ID, title, content, type, path);
		//out.print("alert('成功');");
	} else {
		//out.print("alert('失败');");
	}
%>
<body>
	<jsp:include page="Admin_lead.jsp"><jsp:param value="10"
			name="block_id" /></jsp:include>
	<div
		style="width: 87.5%; height: 824px; margin-left: 0.1%; float: left;"
		class="dinylight-color">
		<div class="container light-color" style="height:380px;margin-top:150px;">
		<div class="big-tittle middle-font font-normal-color" style="margin-bottom: 40px;margin-top: 10px;text-align: center;">
				上  传  资  源</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<div class="row clearfix">
								<div class="col-md-8 column">
									<form class="form-horizontal" role="form"
										action="source_team.jsp" method="post">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">资源标题:</label>
											<div class="col-sm-10">
												<input name="title" type="text" class="form-control"
													id="inputEmail3" />
											</div>
										</div>
										<div class="form-group">
											<label for="inputPassword3" class="col-sm-2 control-label">内容/连接:</label>
											<div class="col-sm-10">
												<textarea name="content" class="form-control"
													id="inputPassword3" required rows="2"style=" resize: none;"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">提取码:</label>
											<div class="col-sm-3">
												<input name="title" type="text" class="form-control"
													id="inputEmail8" />
											</div>
										</div>
								</div>
								<div class="col-md-4 column">
									<div class="btn-group" style="width: 49%;">
										<select class="form-control" name="type"
											style="display: flex; justify-content: center;">
											<%
												for (int i = 0; i < gr.alltype.size(); i++) {
													System.out.println("type:####" + gr.type_daihao.get(i));
											%>
											<option value="<%=gr.type_daihao.get(i)%>"><%=gr.alltype.get(i)%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="btn-group" style="width: 49%;">
										<select class="form-control" name="path"
											style="display: flex; justify-content: center;">
											<%
												for (int i = 0; i < gr.allpath.size(); i++) {
													System.out.println("path:####" + gr.path_daihao.get(i));
											%>
											<option value="<%=gr.path_daihao.get(i)%>"><%=gr.allpath.get(i)%></option>
											<%
												}
											%>
										</select>
									</div>
									
								</div>
							</div>
							<div style="float:left;width:6.5%;height:40px;"></div>
							<input type="submit"  style="border-radius:16px;float:left;magrin-left:60px;width:87%;height:40px;border: 0;margin-top:30px;outline: none;color:white;" class="normal-color" value="提交" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>