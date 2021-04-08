<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.user_personal_homepage_write_bean" import="bean.code_sort_out" import="bean.user_personal_write_part" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" type="text/css" href="Css/Message.css" />
	<link rel="stylesheet" type="text/css" href="Css/Public_Color/orange.css" />
	<link rel="stylesheet" type="text/css" href="Css/Public_style.css" />
	<link rel="stylesheet" type="text/css" href="Css/Homepage.css" />
	<link href="Css/linedtextarea.css" type="text/css" rel="stylesheet" />
	<body>
	<%	
		request.setCharacterEncoding("UTF-8");
		String pagedata="";//页面展示框的内容
		code_sort_out sort=new code_sort_out();
		pagedata=request.getParameter("pagedata");
		
		String num=request.getParameter("write");//页面正在编辑的模块编号
		System.out.println("num:"+num);
		String ID=(String)request.getSession().getAttribute("ID");//获取编辑者的ID
		String tips="";//页面的小提示
		user_personal_homepage_write_bean bean=new user_personal_homepage_write_bean(ID,num);//获取页面数据等
		user_personal_write_part part=new user_personal_write_part(ID);
		String sub=request.getParameter("sub");
		if(sub==null||"".equals(sub)||"null".equals(sub)){//初始化进入界面时的数据
			pagedata=bean.getblock();
			if("".equals(pagedata)||"null".equals(pagedata)||pagedata==null){
				pagedata=bean.first_page;
			}
		}
		if("1".equals(sub)){
			
		}else if("2".equals(sub)){
			
			if(pagedata!=null&&!"".equals(pagedata)&&!"null".equals(pagedata)){
				tips="保存成功";
				bean.savedata(pagedata);//保存代码到保存区 不会展示
				}else{
					tips="不能保存空数据！";
				}
		}else if("3".equals(sub)){
			String a="";
			a=bean.readedata();//读取上一次保存的代码
			if(a==null||"".equals(a)||"null".equals(a)){
				tips="无存档！";
			}else{
				pagedata=a;
			tips="读取成功";
			}
		}else if("4".equals(sub)){
			
			bean.writrblock(pagedata);//读取提交的代码 并且保存到展示字段
			tips="提交成功";
		}else if("5".equals(sub)){
			
			pagedata=sort.sort(pagedata);
			tips="已换行";
		}
		pagedata=sort.check_code(pagedata);
	%>
		<form action="user_personal_homepage.jsp" method="post">
			<div class="small-tittle middle-font font-normal-color">
				&nbsp;┃&nbsp;模块代码添加
				<img src="img/lead_photo/返回.png" style="width:30px;height:25px;float:right;">
				<button name="setlocal" value="1" style="height:100%;float:right;width=35px;border:0px solid white;background:#FAFAFA;"
				 class="middle-font font-normal-color">
					返回上一级
				</button>
			</div>
		</form>
		<form action="user_personal_homepage_write_all.jsp"method="post">
		<div style="width:100%;height:500px;flow-over:hidden;">
		<div class="small-tittle middle-font font-normal-color" style="width:100%;">
				&nbsp;┃&nbsp;预览窗口
			</div>
			<div style="width:100%;height:500px;overflow:hidden;border:1px solid gray;">
			
			<%
			if(-1!=pagedata.indexOf("|%|point_card|%|")){
			String card=part.getcard();
			if(card==null||"".equals(card)||"null".equals(card)){
				card=part.user_personal_card;
			}
			%>
			<%=pagedata.replace("|%|point_card|%|", card)%><% 
			}
			else
			{%>
			<%=pagedata%><%
			}
			%>			
			</div>
		</div>
		<div style="width:50%;height:550px;margin-top:35px;float:left;">
				<input style="display:none;"name="write"value="<%=num %>">
				<div class="small-tittle middle-font font-normal-color" style="width:100%;float:left"align="center">
					<font style="float:left;">&nbsp;┃&nbsp;代码编写&nbsp;</font>
					<button name="sub"value="5" style="height:30px;mragin-top:5px;width:70px;border-radius:3px;border:0px solid white;float:left;"class="light-color">简单换行</button> 
					<font style="float:right;" color="red"><%=tips %>&nbsp;&nbsp;</font>
				</div>
				<div style="width:85%;height:500px;float:left;">
					<textarea name="pagedata"wrap="off" style="width:100%;height:500px;overflow:scroll;" class="lined"><%=pagedata%></textarea>
				</div>
				<div style="width:15%;height:500px;float:left;">
					<button name="sub" value="1" style="width:90%;height:123px;margin-left:10%;border:0px solid white;border-radius:5px;background-color:#F5F5F5;color:#FFA980;float:left;">预览</button>
					<button name="sub" value="2" style="width:90%;margin-top:3px;height:123px;margin-left:10%;border:0px solid white;border-radius:5px;background-color:#84BFD9;float:left;">保存</button>
					<button name="sub" value="3" style="width:90%;margin-top:3px;height:123px;margin-left:10%;border:0px solid white;border-radius:5px;background-color:#84BFD9;float:left;">读取</button>
					<button name="sub" value="4" style="width:90%;margin-top:2px;height:123px;margin-left:10%;border:0px solid white;border-radius:5px;float:left;"
					 class="light-color">提交</button>
				</div>
		</div>
		<div style="width:49.5%;margin-left:0.5%;height:535px;float:left;margin-top:35px;backgrouund-color:blue;">
		<textarea style="width:100%;height:100%;"readonly>*个人主页编辑模块使用方法
*个人主页被分为两种模块：大模块宽度为页面的百分之百，小模块为百分之五十，高度都为500px;
  预览：不会对个人主页产生任何影响，只会在与预览窗口展示效果。
  保存/读取：保存也不会把代码展示到个人主页，只会将数据上传至云端，
  可在下一次编辑的时候点击”读取“加载上一次编辑的内容
  提交：提交的代码会直接展示到主页，但如果是点击错误不小心提交了，可以提交空素材重置主页。
*引用模块：卡片模块为|%|point_card|%|,若有更新自定义卡片则会读取自定义卡片内容。
  简单换行：点击后会自动将每一个标签单独成一行，目前无法自动推进为波浪型。
  每个模块已设置为overflow:hidden,所以，编辑的内容不可超过给定的模块尺寸。
  模块内容可随意编辑，自己添加代码，可使用计算机协会提供的素材，也可以添加外部链接内容。
  但外部链接内容不可使用违规内容，否则将封号处理！</textarea>
		
		 
		
		</div>
		</form>
	</body>
</html>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
	<script src="js/jquery-linedtextarea.js"></script>
	<script>
	$(function() {
		$(".lined").linedtextarea(
			{selectedLine: 1}
		);
	});
	</script>
