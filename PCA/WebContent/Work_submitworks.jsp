<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css"/>
<link rel="stylesheet" type="text/css" href="Css/Work.css"/>
<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css"/>
</head>
<body>
	<% 
	//接收传过来的ID
	String ID = null;
	String ifsuccess = "3";
	if(request.getAttribute("ID")!=null)
	{
	ID=(String)request.getAttribute("ID");
	}else if(request.getParameter("ID")!=null)
	{
	ID=request.getParameter("ID");
	}
	
	if(request.getAttribute("ifsuccess")!=null)
	{
		ifsuccess=(String)request.getAttribute("ifsuccess");
	}else if(request.getParameter("ifsuccess")!=null)
	{
		ifsuccess=request.getParameter("ifsuccess");
	}
	
	String type = "3_1";
	if(request.getAttribute("type")!=null)
	{
		type = (String)request.getAttribute("type");
	}else if(request.getParameter("type")!=null)
	{
		type = request.getParameter("type");
	}
	String underline_1 = "underline_show";
	String underline_2 = "underline_hide";
	String underline_3 = "underline_hide";
	
	if(type.equals("3_1")){
		underline_1 = "underline_show";
		underline_2 = "underline_hide";
		underline_3 = "underline_hide";
	}
	if(type.equals("3_2")){
		underline_1 = "underline_hide";
		underline_2 = "underline_show";
		underline_3 = "underline_hide";
	}
	if(type.equals("3_3")){
		underline_1 = "underline_hide";
		underline_2 = "underline_hide";
		underline_3 = "underline_show";
	}
	
	
	%>
	<div style="width:87%;height:600px;margin:0 auto;">
		<div class="type_choose">
			<div class="type_choose_area" style="width:86%;margin-left:7%;">
				<form action="Work.jsp" method="post">
				<button class="type_choose_line small-font <%=underline_1%>" name="type" value="3_1">提交后端作品</button><div class="type_choose_row font-normal-color">|</div>
				<button class="type_choose_line small-font <%=underline_2%>"  name="type" value="3_2">提交前端作品</button><div class="type_choose_row font-normal-color">|</div>
				<button class="type_choose_line small-font <%=underline_3%>"  name="type" value="3_3">提交特定作品</button>
				</form>
			</div>
		</div>
		
		<%if(type.equals("3_1")){%>
		<form action="Work_handle" method="post" id="form_1">
		<input style="display:none" value="3_1" name="type" type="text"/>
		<input style="display:none" value="<%=ID%>" name="ID" type="text"/>
		<input style="display:none" value="0" name="ifsurface" type="text"/>
		<div style="background-color:white; width:99.7%;margin-top:2px;margin-left:0.2%;height:710px;float:left;">
			<div style="margin:0 auto;width:86%;height:580px;margin-top:30px;background-color:#fafafa;">
				<%if(ifsuccess.equals("1")){%><div style="float:left;width:40%;height:20px;margin-top:10px;margin-left:30%;line-height:20px;text-align:center;color:red;">！提交成功！</div><%} %>
				<%if(ifsuccess.equals("0")){%><div style="float:left;width:40%;height:20px;margin-top:10px;margin-left:30%;line-height:20px;text-align:center;color:red;">遇到未知情况———提交失败！@_@  请于反馈处反馈</div><%} %>
				<div style="float:left;width:90%;height:40px;margin-top:30px;margin-left:5%;line-height:40px;" class="dinylight-color font-normal-color">&nbsp;&nbsp;&nbsp;┃&nbsp;输入作品标题&nbsp;:
				<input type="text" name="work_tittle" id="work_tittle" placeholder="标题请限制在35字以内~" style="width:77%;height:20px;float:right;margin-right:1.7%;margin-top:8px;" />
				</div>
				<div style="float:left;width:90%;height:440px;margin-top:20px;margin-left:5%;line-height:40px;" class="dinylight-color font-normal-color">
						&nbsp;&nbsp;&nbsp;┃&nbsp;输入作品内容&nbsp;:<div style="width:15%;height:20px;float:right;margin-top:2px;"><input type="checkbox" name="ifshow" id="ifshow" value="0">  展示给大家</div>
						<div style="float:left;width:96%;height:370px;margin-top:4px;margin-left:2%;line-height:40px;overflow-x: scroll;overflow-y: hidden;">
							<textarea style="width:250%;height: 100%;resize:none;overflow-x:hidden;overflow-y: scroll;" name="work_content" id="work_content"></textarea>
						</div>
				</div>
			</div>
			<div style="margin:0 auto;width:86%;height:80px;margin-top:10px;">
					<button type="button" class="middle-font light-color white-font" style="margin-top:20px;width:100%;border:0;height: 40px;border-radius: 8px;float:left;" id="sub_1">提交</button>
			</div>
		</div>
		</form>
		<%} %>
		
		<%if(type.equals("3_2")){%>
		<div style="background-color:white; width:99.7%;margin-top:2px;margin-left:0.2%;height:710px;float:left;">
			<div style="margin:0 auto;width:86%;height:580px;margin-top:30px;background-color:#fafafa;">
				<div style="float:left;width:90%;height:40px;margin-top:40px;margin-left:5%;line-height:40px;" class="dinylight-color font-normal-color">&nbsp;&nbsp;&nbsp;┃&nbsp;输入作品标题&nbsp;:
				<input placeholder="标题请限制在35字以内~"  type="text" style="width:77%;height:26px;float:right;margin-right:1.7%;margin-top:5px;">
				</div>
				<div style="float:left;width:90%;height:440px;margin-top:20px;margin-left:5%;line-height:40px;" class="dinylight-color font-normal-color">
						&nbsp;&nbsp;&nbsp;┃&nbsp;提交你的作品&nbsp;:
						<div style="float:left;width:96%;height:370px;margin-top:4px;margin-left:2%;line-height:40px;">
							<div style="float:left;width:45%;height:370px;margin-top:4px;margin-left:2%;">
								<div style="width:96%;height:270px;margin-top:4px;margin-right:2%;margin:0 auto;background-color: #fafafa;border:1px dashed #cccccc;">
									<div style="width:70%;height:100%;margin:0 auto;"><img src="img/lead_photo/图片.png" style="width:100%;height:100%;"></div>
								</div>
								<button style="width:96%;border-radius: 18px;height:70px;margin-top:20px;margin-left:2%;font-size:large;" class="light-color white-font">上传预览图(未实现)</button>
							</div>
							<div style="float:right;width:45%;height:370px;margin-top:4px;margin-right:2%;">
								<div style="width:96%;height:270px;margin-top:4px;margin-right:2%;margin:0 auto;background-color: #fafafa;border:1px dashed #cccccc;">
									<div style="width:70%;height:80%;margin:0 auto;margin-top:7%;"><img src="img/lead_photo/代码.png" style="width:100%;height:100%;"></div>
								</div>
								<button style="width:96%;border-radius: 18px;height:70px;margin-top:20px;margin-left:2%;font-size:large;" class="light-color white-font">上传代码文件(未实现)</button>
							</div>
						</div>
						
				</div>
			
			</div>
			<div style="margin:0 auto;width:86%;height:80px;margin-top:10px;">
					<button type="button" class="middle-font light-color white-font" style="margin-top:20px;width:100%;border:0;height: 40px;border-radius: 8px;float:left;" id="sub_2">提交</button>
			</div>
		</div>
		<%} %>
		
		<%if(type.equals("3_3")){%>
		<div style="background-color:white; width:99.7%;margin-top:2px;margin-left:0.2%;height:710px;float:left;">
			<div style="margin:0 auto;width:86%;height:580px;margin-top:30px;background-color:#fafafa;">
				<div style="float:left;width:90%;height:40px;margin-top:40px;margin-left:5%;line-height:40px;" class="dinylight-color font-normal-color">&nbsp;&nbsp;&nbsp;┃&nbsp;输入作品标题&nbsp;:
				<input type="text" style="width:77%;height:26px;float:right;margin-right:1.7%;margin-top:5px;">
				</div>
				<div style="float:left;width:90%;height:440px;margin-top:20px;margin-left:5%;line-height:40px;" class="dinylight-color font-normal-color">
						&nbsp;&nbsp;&nbsp;┃&nbsp;输入作品内容&nbsp;:
						<div style="float:left;width:96%;height:370px;margin-top:4px;margin-left:2%;line-height:40px;">
							<textarea style="width: 100%;height: 100%;resize:none;"></textarea>
						</div>
				</div>
			</div>
			<div style="margin:0 auto;width:86%;height:80px;margin-top:10px;">
					<button type="button" class="middle-font light-color white-font" style="margin-top:20px;width:100%;border:0;height: 40px;border-radius: 8px;float:left;"  id="sub_3">提交</button>
			</div>
		</div>
		<%} %>
		
	</div>
</body>
</html>
<script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
<script type="text/javascript" charset="UTF-8">
$(function(){
	$('#ifshow').click(function(){
		$(this).val('1');
		
	});
	
		$('#sub_1').click(function(){
			var s = $('#work_tittle').val();
			var p = $('#work_content').val();
			var o = 0;
			if(s.length==0){
				alert("标题不可以为空哦");
				o = 1; 
			}
			if(s.length>35){
				alert("标题超出35字数限制啦！");
				o = 1; 
			}
			if(p.length==0){
				alert("内容不可以为空哦");
				o = 1; 
			}
			if(o==0){
				$('#form_1').submit();
			}
			
		});
		
	
	
});
</script>