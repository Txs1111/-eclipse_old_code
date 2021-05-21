<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="bean.sendtext_bean" import="dao.sendtext" import="java.util.StringTokenizer"%>
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../Css/Public_Color/orange.css" />
		<link href="../Css/Public_style.css" rel="stylesheet" />
	</head>
	<body>
	<form action="send_notice.jsp" method="post">
		<div style="width:100%;height:700px">
			<div style="width:10%;height:100%;float:left;">
				<%
					request.setCharacterEncoding("UTF-8");
					int nowpage=1;
					String tips="";
					if(request.getParameter("act")!=null&&!"".equals( request.getParameter("act"))&&!"null".equals( request.getParameter("act"))){
					int allpage=Integer.parseInt( request.getParameter("allpage"));
					nowpage=Integer.parseInt(request.getParameter("nowpage"));
					int topage=Integer.parseInt( request.getParameter("topage"));
					String act=request.getParameter("act");
					if("1".equals(act)){
						if(nowpage-1>0){
							nowpage=nowpage-1;
						}
					}else if("2".equals(act)){
						nowpage=topage;
					}else if("3".equals(act)){
						if(nowpage+1<=allpage){
							nowpage=nowpage+1;
						}
					}									
				}				
				String role=request.getParameter("role");
				if(role==null||"".equals(role)||"null".equals(role)){
					role="0";
				}
				System.out.println("role:"+role);
				String ID=(String)request.getSession().getAttribute("ID");
				sendtext_bean bean=new sendtext_bean(ID);
				String userrole=bean.getuserrole();
				StringTokenizer chart=new StringTokenizer(userrole,"_");
			%>			
					<div class="small-tittle middle-font font-normal-color" style="margin-bottom:2px;float:left;width:100%;margin-right:0.2%;">
						&nbsp;-&nbsp;职位
					</div>
					<%	
				String color="";
				int num=chart.countTokens()/2;
				for(int a=-1;a<num;a++){
					if(a+1==Integer.parseInt(role)){
						color="light-color";
					}else{
						color="white-color";
					}
					if(a<0){
			%>
					<ul style="float:left;width:100%;list-style-type: none;">
						<li style="width:100%;height:38px;line-height:35px;">
							<div style="width:100%;height:35px;line-height:35px;">
								<button style="cursor:pointer;width:100%;height:100%;border:0px solid white;" name="role" class="<%=color %>"
								 value="0">
									全部成员</button>
							</div>
						</li>
					</ul>
					<% }else{%>
					<ul style="float:left;width:100%;list-style-type: none;">
						<li style="width:100%;height:38px;line-height:35px;">
							<div style="width:100%;height:35px;line-height:35px;">
								<button style="cursor:pointer;width:100%;height:100%;border:0px solid white;" name="role" class="<%=color %>"
								 value="<%=chart.nextToken() %>">
									<%=chart.nextToken() %></button>
							</div>
						</li>
					</ul>

					<%
					}} 
			%>
				
			</div>
			
				<%System.out.println("+++++++++++++++++++++++++++++++++++");
				String sendID=(String)request.getSession().getAttribute("ID");
				String getersID=(String)request.getParameter("geterID");
				String getrole=request.getParameter("role");
				String send=request.getParameter("send");
				String gettype=request.getParameter("gettype");
				String tittle=request.getParameter("tittle");
				String content=request.getParameter("content");
				if(tittle==null||"null".equals(tittle)){
					tittle="";
				}
				if(content==null||"null".equals(content)){
					content="";
				}
	
				sendtext sendmessage=new sendtext();
				if("1".equals(send)){
					if("1".equals(gettype)){
						if(content==null||"".equals(content)||"null".equals(content)){
							tips="内容未补完";
						}else if(getersID==null||"".equals(getersID)||"null".equals(getersID)){
							tips="未选择接收人";
							}else{						
							sendmessage.send(sendID,getersID,getrole,gettype,tittle,content);
							content="";
							tips="发送成功";
						}
					}else{
					if(tittle==null||"".equals(tittle)||"null".equals(tittle)){
						tips="标题未补完";
					}else if(content==null||"".equals(content)||"null".equals(content)){
						tips="内容未补完";
						}else if(getersID==null||"".equals(getersID)||"null".equals(ID)){
							tips="未选择接收人";
							}else{
							sendmessage.send(sendID,getersID,getrole,gettype,tittle,content);
							content="";
							tittle="";
							tips="发送成功";
						}
					}
				}
				
				
				
				
				
				System.out.println("+++++++++++++++++++++++++++++++++++");
				%>
				<div style="width:0.1%;height:100%;background-color:gray;float:left;"> </div>

				<div style="width:35%;height:100%;float:left;">
					<div class="small-tittle middle-font font-normal-color" style="margin-bottom:2px;float:left;width:100%;margin-right:0.2%;">
						&nbsp;-&nbsp;接收人
					</div>
					<ul style="float:left;width:100%;list-style-type: none;">
						<%
			String checkID=request.getParameter("geterID");
			String checker="";
			if(bean.equal("@E_E", checkID)){
				System.out.println("选中");
				checker="checked='checked'";
			}
			%>
						<li style="cursor:pointer;width:100%;height:38px;line-height:35px;">
							<div style="width:100%;height:35px;line-height:35px;background-color:white;">
								<input type="radio" name="geterID" value="0" style="float:left;margin-top:12px;" <%=checker %>/>
								<div style="width:35px;height:35px;float:left;">
									<img src="../img/head_photo/1.jpg" style="width:25px;height:25px;margin-top:5px;margin-left:3px;border-radius:20px;border:1px solid gray;">
								</div>
								&nbsp;全体成员
							</div>
						</li>
						<%
				bean.getuser(role, nowpage);
				StringTokenizer chart1=new StringTokenizer(bean.ID_headphoto,"鰶");
				StringTokenizer chart2=new StringTokenizer(bean.usersname,"鰶");
				int num2=chart2.countTokens();
				
				System.out.println("checkerID"+checkID);
				for(int b=0;b<num2;b++){
					
					String geterID=chart1.nextToken();
					System.out.println("geterID"+geterID);
					checker="";
					if(bean.equal(geterID, checkID)){
						System.out.println("选中");
						checker="checked='checked'";
					}
				%>
						<li style="cursor:pointer;width:100%;height:38px;line-height:35px;">
							<div style="width:100%;height:35px;line-height:35px;background-color:white;">
								<input type="radio" name="geterID" value="<%=geterID %>" style="float:left;margin-top:12px;" <%=checker %> />
								<div style="width:35px;height:35px;float:left;">
									<img src="../img/head_photo/<%=chart1.nextToken() %>.jpg" style="width:25px;height:25px;margin-top:5px;margin-left:3px;border-radius:20px;border:1px solid gray;">
								</div>
								&nbsp;
								<%=chart2.nextToken() %>
							</div>
						</li>
						<%
					}
				int allpage=0;
				int num1=bean.countuser;
					for (;;) {
						num1 = num1 - 15;
						if(num1==-15){
							allpage=1;
							break;
						}else if (num1 > -15 && num1 <= 0) {
							allpage = allpage  + 1;							
							break;
						} else if (num1 > 0) {
							allpage  = allpage  + 1;
						}
					}
				
				
				%>
					</ul>

					<input name="role" value="<%=role %>" style="display:none;">
					<input name="allpage" value="<%=allpage %>" style="display:none;">
					<input name="nowpage" value="<%=nowpage %>" style="display:none;">
					<div style="width:100%;" align="center">
						<font>第
							<%=nowpage %>页/共
							<%=allpage %>页
							<%=bean.countuser %>位同学
						</font> <br />
						<button name="act" value="1" style="cursor:pointer;background-color: #FFCAB0;  width: 23%; height: 30px; border-radius: 5px; border: 0px solid lightgray;">上一页</button>
						<select name="topage" style="width: 23%;height: 30px;border-radius:5px;background-color:#FFCAB0;border:0px solid white;">
							<option value="<%=nowpage %>">
								<%=nowpage %>
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
						<button name="act" value="2" style="cursor:pointer;background-color: #FFCAB0;  width: 23%; height: 30px; border-radius: 5px; border: 0px solid lightgray;">跳转</button>
						<button name="act" value="3" style="cursor:pointer;background-color: #FFCAB0;  width: 23%; height: 30px; border-radius: 5px; border: 0px solid lightgray;">下一页</button>
					</div>

				</div>
				<div style="width:0.1%;height:100%;background-color:gray;float:left;"> </div>
				<!-- 填写消息模块 -->
				<div style="width:54.8%;height:100%;float:left;">
					<%	String color1="dinylight-color";
						String color2="dinylight-color";
						String color3="dinylight-color";
						if(bean.countuser==0){
							tips="无成员";
						}
						String messagetype=request.getParameter("messagetype");
						if("1".equals(request.getParameter("send"))){
							
							messagetype=request.getParameter("gettype");
						}
						if(messagetype==null||"".equals(messagetype)||"null".equals(messagetype)){
							messagetype="1";
						}
						if("1".equals(messagetype)){						
							color1="light-color";
							out.println("<input name='gettype' value='1'style='display:none;'/>");
						}
						if("2".equals(messagetype)){
							color2="light-color";
							out.println("<input name='gettype' value='2'style='display:none;'/>");
						}	
						if("3".equals(messagetype)){						
							color3="light-color";
							out.println("<input name='gettype' value='3'style='display:none;'/>");
						}		
					%>
					<div class="small-tittle middle-font font-normal-color" style="margin-bottom:2px;float:left;width:100%;margin-right:0.2%;">
						&nbsp;-&nbsp;消息类型
					</div>
					<div style="width:100%;height:33px;background-color:white;float:left;">
						<input name="role" value="<%=role %>" style="display:none;">
						<input name="allpage" value="<%=allpage %>" style="display:none;">
						<input name="nowpage" value="<%=nowpage %>" style="display:none;">
						<ul style="width:30%;height:35px;float:left;list-style-type: none;">
							<li>
								<div style="width:100%;height:32px">
									<button style="line-height:30px;width:100%;height:30px;border:0px solid white;" class="<%=color1 %>" name="messagetype"
									 value="1">
										&nbsp;-&nbsp;短消息
									</button>
								</div>
							</li>
						</ul>
						<ul style="width:30%;height:40px;float:left;line-height:35px;list-style-type: none;">
							<li>
								<div style="width:100%;height:32px">
									<button style="line-height:30px;width:100%;height:30px;border:0px solid white;" class="<%=color2 %>" name="messagetype"
									 value="2">
										&nbsp;-&nbsp;通知消息
									</button>
								</div>
							</li>
						</ul>
						<ul style="width:30%;height:40px;float:left;line-height:35px;list-style-type: none;">
							<li>
								<div style="width:100%;height:32px">
									<button style="line-height:30px;width:100%;height:30px;border:0px solid white;" class="<%=color3 %>" name="messagetype"
									 value="3">
										&nbsp;-&nbsp;作业提醒
									</button>
								</div>
							</li>
						</ul>
					</div>
					<div style="width:100%;height:700px;float:left;" align="center">
						<%if("1".equals( messagetype)){ %>
						<div class="small-tittle middle-font font-normal-color" style="margin-bottom:2px;float:left;width:100%;margin-right:0.2%;">
							&nbsp;-&nbsp;内容&nbsp;-&nbsp;
						</div>
						<input style="width:98%;height:30px;font-size:20px;line-height:30px;" name="content" value="<%=content %>"/>
						<%if(bean.countuser>0){ %>
						<button type="submit" name="send" value="1" style="width:65%;height:30px;line-height:30px;font-size:20px;border:0px solid white;border-radius:3px;margin-top:7px;color:white;"
						 class="light-color">
							发送
						</button>
						<%} %>
						<div style="width:100%;height:25px;line-height:25px;font-size:15px;color:red;" align="center" id="tips">
							<%=tips %>
						</div>
						<%}else{ %>
						<div class="small-tittle middle-font font-normal-color" style="margin-bottom:2px;float:left;width:100%;margin-right:0.2%;">
							&nbsp;-&nbsp;标题&nbsp;-&nbsp;
						</div>
						<input style="width:98%;height:30px;font-size:20px;line-height:30px;" name="tittle" value="<%=tittle %>"/>
						<div class="small-tittle middle-font font-normal-color" style="margin-bottom:2px;float:left;width:100%;margin-right:0.2%;">
							&nbsp;-&nbsp;内容&nbsp;-&nbsp;
						</div>
						<textarea style="width:98%;height:300px;font-size:15px;"name="content"><%=content %></textarea>
						<%if(bean.countuser>0){ %>
						<button type="submit" name="send" value="1" style="width:65%;height:30px;line-height:30px;font-size:20px;border:0px solid white;border-radius:3px;margin-top:7px;color:white;"
						 class="light-color">
							发送
						</button>
						<%} %>
						<div style="width:100%;height:25px;line-height:25px;font-size:15px;color:red;" align="center" id="tips">
							<%=tips %>
						</div>
						<%} %>
					</div>
				</div>
			
		</div>
		</form>
	</body>
	<script>
		var list = document.getElementsByTagName("li");
		for (var i = 0; i < list.length; i++) {
			//为li注册鼠标进入事件
			list[i].onmouseover = function() {
				this.style.backgroundColor = "#FFCAB0";
			};
			//为li注册鼠标离开事件
			list[i].onmouseout = function() {
				//恢复到这个标签默认的颜色
				this.style.backgroundColor = "";
			};

		}
	</script>
</html>
