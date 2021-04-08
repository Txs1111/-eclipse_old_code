<%@page import="bean.*"%>
<%/*------------------------------------------------------------------------------------------------
修改人	王旭升		     
修改时间 	2021-1-26
修改内容	添加后台
版本号			 
-------------------------------------------------------------------------------------------------*/%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Insert title here</title>
	    <link rel="stylesheet" type="text/css" href="Css/Message.css" />
	    <link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
	    <link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
	    <link rel="stylesheet" type="text/css" href="Css/Homepage.css" />
	</head>
	
	<body bgcolor="#F4F5F7">
	    <%
	     //将接收的值给当前页面显示详情
	     String title = request.getParameter("tittle");//通过tittle进行索引
	     Office_bean ob = new Office_bean();
	     String[] detail = ob.Office_bean(title);//索引出的详细数据
	     String[] catalogue = ob.office_all(); //全部标题
	    %>
		<jsp:include page="season.jsp"></jsp:include>
		<br><div class"fenge">
		<br></div>
		    <div class="details">
		        <div class="detail_content">
		            <div class="title small-font light-font">&nbsp;<%if(detail[5].equals("1")){out.println("官方");}else{out.println("");}%>>&nbsp;/&nbsp;活动&nbsp;/&nbsp;如何成为一个合格...</div>
		            <div class="title small-font light-font" style="float:right;"><a href="Homepage.jsp">返回&nbsp;&nbsp;&nbsp;&nbsp;</a></div>
		          <div class="separator light-font"><span>------------------------------------------------------------------------------------------------------------------------------------------------</span></div>
		          <div class="head">
		              <div class="head_photo"><img class="small_head_photo" src="img/example/unbrella.jpg" style="border-radius: 25px;"></div>
		              <div class="title middle-font">如何成为一个合格的粉刷匠！！！</div>
		              <div class="nickname small-font light-font">暴力美学<span class="time">2021/1/1</span></div>
		          </div>
		          <div class="content"> 
		              int ans = 0;
		              <br> int[] rec;
		              <br> // public void dfs(int[] nums,int sum,int target){
		              <br> // if(sum > target){
		              <br> // return ;
		              <br> // }
		              <br> // if(sum == target){
		              <br> // ans ++;
		              <br> // return ;
		              <br> // }
		              <br> // for(int i = 0 ;inums.length;i ++){
		              <br> // dfs(nums,sum + nums[i],target);
		              <br> // }
		              <br> // }
		              <br> // public int dfs(int[] nums ,int target){
		              <br> // //记忆化搜索
		              <br> // if(target 0){
		              <br>// return 0;
		              <br> // } // if(target == 0){
		              <br> // return 1;
		              <br> // }
		              <br> // if(rec[target] != 0){
		              <br> // return rec[target];
		              <br> // }
		              <br> // int count = 0;
		              <br> // for(int i = 0 ;inums.length;i ++){
		              <br>// count += dfs(nums,target - nums[i]);
		              <br> // }
		              <br> // rec[target] = count;
		              <br> // return rec[target];
		              <br> // }
		              <br> int[] dp;
		              <br> public int dpfuc(int[] nums ,int target){
		              <br> dp = new int[target + 1];
		              <br> dp[0] = 1;
		              <br> for(int i = 1;i=t arget;i ++){
		              <br> for(int j = 0 ;jnums.length; j ++){
		              <br>if(i >= nums[j]){
		              <br> dp[i] += dp[i - nums[j]];
		              <br> }
		              <br> }
		              <br> }
		              <br> return dp[target]<br>; }
		              <br> public int combinationSum4(int[] nums, int target) {<br> if(target == 0){<br> return 0;<br> }
		              <br> // rec = new int[target + 1];<br> // dfs(nums,target);<br> // return rec[target];<br> return dpfuc(nums,target);<br> }
		              <br>
		          </div>
		          <div id="function">
		              <div id="time" style="width: 150px; height: 60px; margin-top: 10px;">
		                  <font id="samll" style="font-size: 20px;">2020-12-13</font>
		              </div>
		              <div id="like" style="width: 150px; height: 60px;">
		                  <img src="img/example/点赞.png" id="good" style="width: 45px;">
		                  <font id="samll" style="font-size: 20px; ">10</font>
		              </div>
		              <div id="like" style="width: 150px; height: 60px;">
		                  <img src="img/example/收藏.png" id="good" style="width: 45px;">
		                  <font id="samll" style="font-size: 20px;">22</font>
		                </div>
		
		            </div>
		        </div>
		        <div class="detail_list">
		            <div class="title white-font">
		                所有消息
		            </div>
		            <div class="list">
		                <ul>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li class="xz"><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                    <li><a href="#">我是所有内容的目录</a></li>
		                </ul>
		            </div>
		
		        </div>
		
		    </div>
	
	
	</body>

</html>