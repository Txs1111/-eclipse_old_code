<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link href="Css/Homepage.css" rel="stylesheet" />
<link href="Css/resuorce.css" rel="stylesheet" />
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
</head>
<body>
   <%
   String id = request.getParameter("ID");
   String resource = request.getParameter("resource");
   String baidu = null;
   String bili = null;
   String abab = null;
   if("1".equals(resource)){
	   baidu="color";
   }else if("2".equals(resource)){
	   bili="color";
   }else if("3".equals(resource)){
	   abab="color";
   }else {
	   baidu="color";
   }
   %>
   <div class="resuorce_menu">
       <div class="resuorce_menu_head">
           <font class="middle-font" style="color:#FFA980;">导航</font>
       </div>
       <div class="resuorce_menu_heads" >
           <font class="small-font" style="">规则</font>
       </div>
       <div class="resuorce_menu_b baidu color" id="1">
       <form action="resource_function.jsp" method="post" id="form_1">
					<input type="text" name="resource" value="1" style="display:none"/>
                    <input type="text" name="ID" value="<%=id %>" style="display:none"/>
          <a onclick="document:form_1.submit();" class="<%=baidu %>"> <font class="small-font">•&nbsp;百度云</font></a>
          	</form>
       </div>
       <div class="resuorce_menu_b bilibili" id="2">
        <form action="resource_function.jsp" method="post" id="form_2">
					<input type="text" name="resource" value="2" style="display:none"/>
					<input type="text" name="ID" value="<%=id %>" style="display:none"/>
          <a  onclick="document:form_2.submit();" class="<%=bili %>"> <font class="small-font">•&nbsp;哔哩哔哩</font></a>
          </form>
       </div>
       <div class="resuorce_menu_b abab" id="3">
       <form action="resource_function.jsp" method="post" id="form_3">
					<input type="text" name="resource" value="3" style="display:none"/>
					<input type="text" name="ID" value="<%=id %>" style="display:none"/>
          <a  onclick="document:form_3.submit();" class="<%=abab %>"> <font class="small-font">•&nbsp;阿巴阿巴网盘</font></a>
          </form>
       </div>
   </div>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		$('.resuorce_menu_b').click(function(){
			
			$('.resuorce_menu_b').removeClass("color");
			$(this).addClass("color");
			
		});
 
	});
</script>