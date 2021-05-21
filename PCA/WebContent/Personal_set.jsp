<%@page import="java.util.StringTokenizer"%>
<%@page import="bean.personal_set_bean"%>
<%/*------------------------------------------------------------------------------------------------
修改人			     
修改时间 		
修改内容		
版本号			 
-------------------------------------------------------------------------------------------------*/%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/Public_style.css"/>
		<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css"/>
		<link rel="stylesheet" type="text/css" href="Css/Set.css"/>
	</head>
	<body style="overflow-y:auto;">
		<%
		  String get_id = null;
		  if(request.getSession().getAttribute("ID")!=null&&!request.getSession().getAttribute("ID").equals("")){
			  get_id =(String)request.getSession().getAttribute("ID");
		  }
		  String head = request.getParameter("head"); //接收头像
		  String nick = request.getParameter("nick"); //接收昵称
	      String background = request.getParameter("background"); //接收背景图
	      String signature_text = request.getParameter("signature_text"); //接收签名
	      
	      String[] data = new String[5];
	      data[0] = get_id;
		  data[1] = nick;
		  data[2] = signature_text;
		  data[3] = head;
		  data[4] = background;
           
		  personal_set_bean pb = new personal_set_bean(data);
	      int number = 1;

		%>
		
	<form id="voteform" action="Personal_set.jsp" method="post">
		<div id="theme" style="">
		        <div class="small-tittle middle-font font-normal-color">
					&nbsp;┃&nbsp;个性设置
				</div>
				<div id="title">
					<font class="small-font">昵称：</font>
					<input type="text" id="nick" name="nick" form="voteform"/>
					<font class="small-font" color="#bfbfbf"></font>
				</div>
				<div id="modify_theme">
					<div id="modify_theme_head">
						<font class="small-font">主题：</font>
					</div>
					<div id="content">
						<div id="direcation">
							<div id="front" >
								<a href="javascript:;" id="front_url" name="number"><font size="5" ><</font></a>					    
						    </div>
						    <div id="queen">
							    <a href="javascript:;" id="queen_url" name="number"><font size="5">></font></a>
						    </div>
						</div>
						<div id="content_img">
							<img src="img/theme_photo/1.png" id="img">
							<input type="text" name="background" value="" style="display:none;" id="input_b"/>
						</div>
					</div>
				</div>
				<div class="profile_photo">
					<div class="profile_photo_theme">
						<font class="small-font">头像：</font>
					</div>
					<div class="avatar">
                         <input type="text" style="display:none;" id="input_hd" name="head"  value=""/>
					<%
					String content = pb.showHead_photo();
					
					StringTokenizer st = new StringTokenizer(content,"熏嚩醃");
					int a = 1;
					String h_photo = "";
					while(st.hasMoreTokens()){
						h_photo = st.nextToken();
					%>
						<div class="avatar_img">
						    <img src="img/head_photo/<%=h_photo%>" class="head_photo img_1" id="<%=h_photo%>" >
						</div>
					<%a++;}%>
					</div>
				</div>
				<div id="signature" style="float: left; margin-left: 2%;margin-top:5px;">
					<div id="signature_text">
						<font class="small-font">签名：</font>
					</div>
					<div id="signature_texts" >
					    <textarea cols="98" rows="" name="signature_text" id="signature_textarea" ></textarea>
					</div>
					
				</div>
				<button class="normal-color" id="submit" type="submit" style="border: 0;outline: none; margin-right:50px;margin-top:3px;">
				    <font class="small-font" color="#ffffff">提交</font>
			    </button>
				
		</div>	 
	</form>
			
	</body>
</html>
<script src="js/jquery-3.4.1.js"></script>
	<script>
    $(function(){
    	  $('.img_1').click(function(){
       	  $('#input_hd').val($(this).attr('id'))
       	  $('.img_1').removeClass("head_photo_img");
       	  $(this).addClass("head_photo_img");
       	  $(this).removeClass("avatar_img");
   			console.log($('#input_hd').val());
       	    console.log($(this).attr('class'));
         });
    	
    	
    	
    	
      $('#img').click(function(){
    	  $(this).addClass('head_photo_img');
    	  $('#input_b').val($(this).attr('src'));
         	console.log($('#input_b').val());
      });
      $('#front_url').click(function(){
    	  $('#img').removeClass('head_photo_img');
    	  $('#input_h').val('front_url');
			console.log($('#input_h').val());
      }); 
      $('#queen_url').click(function(){
    	  $('#img').removeClass('head_photo_img');
    	  $('#input_q').val('queen_url');
			console.log($('#input_q').val());
      }); 
      $('#submit').click(function(){
    	  $('#input_s').val('submit');
			console.log($('#input_s').val());
      }); 
      
    })   	
	</script>
	<script type="text/javascript">
			window.onload = function(){
			    var front = document.getElementById('front');
			    var queen = document.getElementById('queen');
			    var img = document.getElementById('img');
			    var arrUrl = ['img/theme_photo/1.png','img/theme_photo/2.png','img/theme_photo/3.png','img/theme_photo/4.png','img/theme_photo/5.png','img/theme_photo/6.png','img/theme_photo/7.png','img/theme_photo/8.png','img/theme_photo/9.png','img/theme_photo/10.png','img/theme_photo/11.png','img/theme_photo/12.png','img/theme_photo/13.png','img/theme_photo/14.png','img/theme_photo/15.png','img/theme_photo/16.png','img/theme_photo/17.png','img/theme_photo/18.png','img/theme_photo/19.png'];
					
			    var num = 0;
			    // 初始化显示内容
			    function fnTab(){//重复的代码要用函数包起来
			        img.src = arrUrl[num];//动态获取数组中图片，先加载第一张图片，因为num是0
			    }
			    fnTab();//调用函数，fnTab()代表执行函数里面的三行代码
					
			    queen.onclick = function(){
			        num ++;//num自增1
			        if(num == arrUrl.length){//如果num的值超过数组的长度
			            num = 0;//恢复到第一张图片（数组中是从0 开始数）
			        }               
			        fnTab();// 然后相应加载的内容进行变动
			    }
			    front.onclick = function(){
			        num --;
			        if(num == -1){
			            num = arrUrl.length - 1;//如果图片已经在第一张，还点击上一张，那么让图片显示最后一张，即数组长度减1为数组最后一张图片
			        }
			        fnTab();
			    }
			}
		</script>
