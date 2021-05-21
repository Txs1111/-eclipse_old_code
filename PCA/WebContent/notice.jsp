
<%
	/*------------------------------------------------------------------------------------------------
	修改人：王旭升		     
	修改时间 ：2021-1-9	
	修改内容：增加后台
	版本号			 
	-------------------------------------------------------------------------------------------------*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
<link href="Css/Public_style.css" rel="stylesheet" />
<link href="Css/Homepage.css" rel="stylesheet" />
</head>

<body>
    <%
      String ID = null;
 	  if (request.getAttribute("ID") != null || request.getAttribute("ID") != "") {//获取Homepage.jsp页面中传过来的ID
		ID=request.getParameter("ID");
	}
      notice_bean not=new notice_bean();
      String[] cont = not.content();
      String[] sid = not.sid();
      for(int x=0;x<9;x++){
    	  System.out.println("..."); 
    	  System.out.println(sid[x]); 
      }
    %>
	<ul class="notice_whole_ul dinylight-color">
        <%
         for(int i=0;i<9;i++){
        	  if(i%2==0){
        		  %>
        		  <form action="notice_detail" method="post" id="form_<%=i%>">
        		  	<input type="text" name="ID" value="<%=ID%>" style="display:none"/>
					<input type="text" name="notice_ID" value="<%=sid[i]%>" style="display:none"/>
                  <li class="small-font"style="cursor:pointer;"><a onclick="document:form_<%=i%>.submit();" ><%=cont[i]%></a></li>	
                  </form>
        	      <%
        	  }else if(i%2==1){
        		  %>
        		  <form action="notice_detail" method="post" id="form_<%=i%>">
        		  	<input type="text" name="ID" value="<%=ID%>" style="display:none"/>
					<input type="text" name="notice_ID" value="<%=sid[i]%>" style="display:none"/>
                  <li class="small-font" style="background-color: white;cursor:pointer;">
                  	<a onclick="document:form_<%=i%>.submit();"><%=cont[i]%></a>
                  </li>	
                  </form>
        		  <%
        	}
          }        
        %>
		
		<li class="small-font" style="background-color: white;">
		<div id="submit" style="border:1px soild #FAFAFA">
				<form action="notice_all" method="post" id="form_all">
				<input type="text" name="ID" value="<%=ID%>" style="display:none"/>
				<a id="url" onclick="document:form_all.submit();"style="cursor:pointer;"><font class="small-font-B font-normal-color">查看全部</font></a>
				</form>
			</div>
		</li>	
	</ul>
</body>

</html>