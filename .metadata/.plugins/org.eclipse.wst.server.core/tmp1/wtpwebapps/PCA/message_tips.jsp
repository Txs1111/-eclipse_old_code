<%/*------------------------------------------------------------------------------------------------
修改人  王旭升			     
修改时间 	2021-1-28	
修改内容	添加访问限制
版本号			 
-------------------------------------------------------------------------------------------------*/%>

<%@page import="bean.official_bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Message.css" />
<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
<link href="Css/Homepage.css" rel="stylesheet" />
<link href="Css/Public_Color/orange.css" rel="stylesheet" />
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8"); //或者指定的编码(GBK或其他)	
    	String act=request.getParameter("act");
    	String nowpages = request.getParameter("nowpage");//传值给当前页码	  
      if(act!=null&&!"".equals(act)){
    	  String allpages =request.getParameter("allpage");
    	  String topages =request.getParameter("topage");
    	 if("1".equals(act)){
    		 nowpages="1";
    	 }else if("2".equals(act)&&Integer.parseInt(nowpages)-1>0){
    		 nowpages=(Integer.parseInt(nowpages)-1)+"";
    		 
    	 }else if("3".equals(act)){
    		 nowpages=topages;
    	 }else if("4".equals(act)&&Integer.parseInt(nowpages)+1<=Integer.parseInt(allpages)){
    		 nowpages=(Integer.parseInt(nowpages)+1)+"";
    	 }else if("5".equals(act)){
    		 nowpages=allpages;
    	 }
      }
    %>
    <div id="Message">
		<div id="Message_head" class="small-tittle middle-font font-normal-color">&nbsp;┃&nbsp;官方消息
		
		</div>
		<%
		//把接收的值赋值给当前页码
		  
		  String get_id  =(String)request.getSession().getAttribute("ID");
		  
		  

		  if (nowpages == null || nowpages.equals("")) { //安全设置
				nowpages = "1";
			} 
		  if (get_id==null){
			  get_id="页面出错";
		  }
		  
		  
		  //提取数据
		  official_bean bean = new official_bean();
	      String result = bean.getmessage(get_id,"2");
	      //String sent_ID;
	      //String get_ID;
	      //String tittle;
	      //String conntent;
	      //String send_time;
	      //String type;
	      
	      
	     //显示一页的数据
	     int allPages;//总页数
	     if(result!=null&&!"".equals(result)){
	     StringTokenizer st=new StringTokenizer(result,"鰶");
	     int num=st.countTokens()/7;
	     int pages=Integer.parseInt(nowpages);
	     for(int a=0;a<(pages-1)*6;a++){
	    	 for(int b=0;b<7;b++){
	    		 st.nextToken();
	    	 }
	     }num=num-(pages-1)*6;
	     if(num>6){
	    	 num=6;
	     }
		  for(int i = 0;i<num;i++){			 
			  //判断是否显示若为空则不显示
			  
				  %>
				     <div id="tidings" style="height:100px; border-bottom: none;">
						<div id="tidings_left" style="margin-bottom:0px;">
							<div id="img">
								<img src="img/head_photo/<%=st.nextToken() %>.jpg"
									style="margin-top: 15px; border-radius: 25px; margin-left: 15px;"
									class="small_head_photo">
							</div>
							<div id="name">
								<font class="small-font" id="samll-B"><%=st.nextToken() %></font><br /><%st.nextToken(); %><%st.nextToken();%>
								 <a>
									<font class="small-font"><%=st.nextToken() %></font>
								</a>
							</div>
						</div>
						<div id="tidings_right" style="height:25px;width:100%;margin-top:0px;">
							<div id="function" style="border-bottom: 1px solid gainsboro;margin-top:0px;">
								<div id="time">
									<font id="samll"><%=st.nextToken() %></font><%st.nextToken();%>
								</div>
							</div>
							
						</div>		
					</div>
					<%
					
			  
		  }
		  int allpage=0;
			int num1=bean.allnum;
				for (;;) {
					num1 = num1 - 6;
					if(num1==-6){
						allpage=1;
						break;
					}else
					 if (num1 > -6 && num1 <= 0) {
						allpage = allpage  + 1;							
						break;
					} else if (num1 > 0) {
						allpage  = allpage  + 1;
					}
				}
		%>
		<form action="message_tips.jsp"method="post">
		<input name="nowpage" value="<%=nowpages %>"style="display:none;" >
		<input name="allpage" value="<%=allpage %>"style="display:none;" >
		<div class="turnpage-conntrol light-color" style="height:110px;padding-top: 1px;">
			<div style="width:100%;height:25px;margin-bottom:3px;line-height:25px;" align="center">
			<font color="white">	当前第<%=nowpages %>页/ 共有<%=allpage %>页<%=bean.allnum %>条消息	</font>		
			</div>
			
			<div align="center" style="width:100%;height:35px;">
				<button name="act"value="1" class="dinylight-color" style="cursor:pointer;border-radius:2px;height:35px;width:12%;border:0px solid white;">首页</button>
				<button name="act"value="2"class="dinylight-color" style="cursor:pointer;border-radius:2px;height:35px;width:12%;border:0px solid white;">上一页</button>
				<select name="topage"style="width:6%;height:35px;border:0px solid white;border-radius:2px;">
							<option value="<%=nowpages %>">
								<%=nowpages %>
							</option>
							<%
								for(int c=0;c<allpage ;c++)
								{ 
							%>
							<option value="<%=c+1 %>">
								<%=c+1 %>
							</option>
							<%
								} 
							%>
						</select>
				<button name="act"value="3"class="dinylight-color" style="cursor:pointer;border-radius:2px;height:35px;width:6%;border:0px solid white;">跳转</button>
				<button name="act"value="4"class="dinylight-color" style="cursor:pointer;border-radius:2px;height:35px;width:12%;border:0px solid white;">下一页</button>
				<button name="act"value="5"class="dinylight-color" style="cursor:pointer;border-radius:2px;height:35px;width:12%;border:0px solid white;">尾页</button>
			</div>
		</div>
		</form>
		<%
		}else{
				 
				  %><div id="tidings" class="small-font" style="text-align: center; line-height: 200px; border-bottom: 0; color: gainsboro;"><font>您暂无短消息</font></div><% 
			  }
	    %>		
	</div>
</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
<script>
