
<%@page import="bean.Homepage_bean" import="bean.getpower"%>
<%
	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*" import="java.util.Random"%>
<%request.setCharacterEncoding("UTF-8"); //或者指定的编码(GBK或其他)
	String ID = (String) request.getSession().getAttribute("ID");
	if (request.getAttribute("ID") != null) {//toHomepage.java页面传来的request
		ID = (String) request.getAttribute("ID");
	} //获取登录用户的ID
	if (request.getParameter("ID") != null) {//通过form表单传递数据过来
		ID = (String) request.getParameter("ID");
	} //获取登录用户的ID
	request.getSession().setAttribute("ID", ID);//设置页面session对象中的ID
	if(ID==null||"".equals(ID)||"null".equals(ID)){
		request.setAttribute("alter", "1");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	Homepage_bean bean = new Homepage_bean(ID); //加载Homepage页面各模块的数据
	String apart = bean.apartment(); //获取部门数据返回值
	String sins[] = bean.get_content(); //加载并提取宠物对话数据
	bean.head(); //运行方法 加载头模块数据	
	String role = bean.role;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=bean.nickiname%>的主页</title>
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<link href="Css/Public_style.css" rel="stylesheet" />
<link href="Css/Homepage.css" rel="stylesheet" />
</head>
<body bgcolor="#F4F5F7">
	<!-- 季节模块 -->
	<jsp:include page="season.jsp"></jsp:include>

	<!-- 头模块 -->
	<jsp:include page="head.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
		<jsp:param value="<%=role%>" name="role" />
		<jsp:param value="<%=bean.level%>" name="level" />
		<jsp:param value="<%=bean.nickiname%>" name="nickiname" />
		<jsp:param value="<%=bean.sign%>" name="sign" />
		<jsp:param value="<%=bean.background%>" name="background" />
		<jsp:param value="<%=bean.headphoto%>" name="headphoto" />
	</jsp:include>
	<!-- 导航栏模块 -->
	<!-- 把用户ID传递给导航栏，导航栏再传给各个大页面 -->
	<jsp:include page="lead.jsp">
		<jsp:param value="<%=ID%>" name="ID" />
	</jsp:include>


	<div class="Homepage_whole_block">

		<div class="dynamic">
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;官方动态</div>
			<div class="content">
				<jsp:include page="dynamic.jsp">
					<jsp:param value="<%=ID%>" name="ID" />
				</jsp:include>
			</div>
		</div>

<%getpower power=new getpower(ID);
if(power.checkpower("8")){
%>
		<div style="width: 28%; height: 190px; float: right;">

			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;部门名片</div>
			<div class="card_photo" align="center">
				<img src="img/apartment_photo/<%=apart%>.png"
					style="width: 100%; height: 100%; margin: 0 auto;">
			</div>
		</div>
<%} %>
		<!-- 公告模块 -->
		<div class="notice">
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;公告</div>
			<div class="noticecotent">
				<jsp:include page="notice.jsp">
					<jsp:param value="<%=ID%>" name="ID" />
				</jsp:include>
			</div>
		</div>


		<div class="pet">

			<div class="pet_sign"
				style="left: 57%; top: 915px; line-height: 20px; text-align: center;"
				id="pet_sign"></div>
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;哇塞！宠物 <font style="float: right">更多&nbsp;┃&nbsp;</font>
			</div>
			<div class="pet_area" id="pet_click">
				<jsp:include page="pet.jsp"></jsp:include>
			</div>
		</div>


		<div class="calendar">
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;每日签到</div>
			<%
				String calendar = bean.check_clendar(); //获取当天是否签到签到 若已签到则返回用户ID
				String signed = bean.singed_calendar(); //获取用户当月签到的所有的日期
				bean.con.close();
			%>
			<jsp:include page="calendar.jsp">
				<jsp:param value="<%=signed%>" name="signed" />
				<jsp:param value="<%=ID%>" name="ID" />
				<jsp:param value="<%=calendar%>" name="calendar" />
			</jsp:include>
		</div>
	</div>
</body>
</html>

<script src="js/jquery-3.4.1.js"></script>
<script src="js/loading.js"></script>
<script type="text/javascript" charset="UTF-8">

$(function(){/* 导航栏的动态效果 */
	$('#homepage').css('border-bottom-style','solid');
	var $logo = $('#sign_list li');
	 
	 
	 $logo.mouseenter(function(){
    	 $(this).css('border-bottom-style','solid');
    	 $('#homepage').css('border-bottom-style','none');
 		});
	 
	 $logo.mouseleave(function(){ 
		  $logo.css('border-bottom-style','none');
		  $('#homepage').css('border-bottom-style','solid');
		 });
	});
	
	
	
$(function(){
	var Sign_array =  new Array();
	<%for (int i = 0; i < sins.length; i++) {%>
	Sign_array[<%=i%>]="<%=sins[i]%>";
<%}%>
	$('#pet_sign').hide();
		var isClick = true;
		var rand;
		$('#pet_click').click(function() {

			//x上限，y下限     
			var x =<%=sins.length - 1%>;
			var y = 0;
			rand = parseInt(Math.random() * (x - y + 1) + y);
			$('#pet_sign').html("").append("</br>" + Sign_array[rand]);

			//我也不知道为啥 反正这样可以实现效果(Frank)
			$('#pet_sign').show();
			$('#pet_sign').stop();
			$('#pet_sign').css('opacity', 1);
			$('#pet_sign').stop();
			$('#pet_sign').css('opacity', 1).delay(2000).fadeOut(300, "swing");
		});
	});
</script>
