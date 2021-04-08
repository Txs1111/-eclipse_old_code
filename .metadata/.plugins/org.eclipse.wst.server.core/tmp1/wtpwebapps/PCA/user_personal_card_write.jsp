<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.Score_bean" import="bean.code_sort_out" import="bean.user_personal_write_part"%>
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
		String ID=(String)request.getSession().getAttribute("ID");//获取编辑者的ID
		String tips="";//页面的小提示
		user_personal_write_part bean=new user_personal_write_part(ID);//获取页面数据等
		Score_bean point=new Score_bean(ID);
		String sub=request.getParameter("sub");
		if(sub==null||"".equals(sub)||"null".equals(sub)){//初始化进入界面时的数据
			pagedata=bean.getcard();
			if("".equals(pagedata)||"null".equals(pagedata)||pagedata==null){
				pagedata=bean.user_personal_card;
			}
		}
		if("1".equals(sub)){
			
		}else if("2".equals(sub)){
			if(pagedata!=null&&!"".equals(pagedata)&&!"null".equals(pagedata)){
			tips="保存成功";
			bean.savecard(pagedata);//保存代码到保存区 不会展示
			}else{
				tips="不能保存空数据！";
			}
		}else if("3".equals(sub)){
			String a="";
			a=bean.readcard();//读取上一次保存的代码
			if(a==null||"".equals(a)||"null".equals(a)){
				tips="无存档！";
			}else{
				pagedata=a;
			tips="读取成功";
			}
		}else if("4".equals(sub)){
			
			bean.writrecard(pagedata);//读取提交的代码 并且保存到展示字段
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
		<form action="user_personal_card_write.jsp" method="post">
		<div style="width:49%;height:555px;float:left;">
			<div class="small-tittle middle-font font-normal-color" style="width:100%;float:left" align="center">
				<font style="float:left;">&nbsp;┃&nbsp;代码编写&nbsp;</font><button name="sub"value="5" style="height:30px;mragin-top:5px;width:70px;border-radius:3px;border:0px solid white;float:left;"class="light-color">简单换行</button> 				
				<font style="float:right;" color="red"><%=tips %>&nbsp;&nbsp;</font>
			</div>
			
				<input style="display:none;"name="write"value="<%=num %>">
				<textarea name="pagedata"wrap="off" style="width:100%;height:500px;overflow:scroll;" class="lined"><%=pagedata%></textarea>
				<button name="sub" value="1" style="float:left;margin-top:5px;width:24.25%;height:50px;border:0px solid white;border-radius:5px;background-color:#F5F5F5;color:#FFA980;">预览</button>
				<button name="sub" value="2" style="float:left;margin-top:5px;width:24.25%;height:50px;margin-left:1%;border:0px solid white;border-radius:5px;background-color:#84BFD9;">保存</button>
				<button name="sub" value="3" style="float:left;margin-top:5px;width:24.25%;height:50px;margin-left:1%;border:0px solid white;border-radius:5px;background-color:#84BFD9;">读取</button>
				<button name="sub" value="4" style="float:left;margin-top:5px;width:24.25%;height:50px;margin-left:1%;border:0px solid white;border-radius:5px;"
				 class="light-color">提交</button>				
			
		</div>
		</form>
		<div style="width:50%;height:550px;float:left;flow-over:hidden;">
			<div class="small-tittle middle-font font-normal-color" style="width:100%;">
				&nbsp;┃&nbsp;预览窗口
			</div><%pagedata=pagedata.replace("|%|score|%|",point.getpoint()+"" );
			pagedata=pagedata.replace("|%|finish|%|",point.allfinish+"" );
			pagedata=pagedata.replace("|%|rank|%|",point.userrank()+"" ); %>
			<div style="width:100%;height:500px;float:left;border:1px solid gray;"><%=pagedata %></div>
		</div>
		<div style="width:100%;height:200px;float:left;margin-top:35px;backgrouund-color:blue;">
		<textarea style="width:100%;height:100%;"readonly>*积分卡片初始样式为积分页面的样式，在此页面可以自定义卡片样式用于个人主页的展示。
*使用方法，积分卡片的代码自己添加，积分卡片的个人数据内容可以用特殊字符串从系统引用，排名、积分、已完成任务数量
  积分卡片只能引用展示在个人主页的各个模块内，详细引用方法参考模块编辑器。
  预览：不会对积分卡片样式产生任何影响，只会在与预览窗口展示效果。
  保存/读取：保存也不会把代码展示到个人积分卡片，只会将数据上传至云端，可在下一次编辑的时候点击”读取“加载上一次编辑的内容
  提交：提交的代码会提交到个人卡片数据库，但如果是点击错误不小心提交了，可以提交空素材重置积分卡片为初始样式。
  简单换行：点击后会自动将每一个标签单独成一行，目前无法自动推进为波浪型。
  引用排名  ”|%|rank|%|“ 引用积分“|%|point|%|”引用已完成任务数量“|%|finish|%|”（双引号不用引用）
  积分卡片素材可以使用计算机协会提供的素材，也可以使用外部链接内容，但如若发现违规内容，
  将作封号处理。
*自定义积分卡片只能在个人主页使用，所以尺寸等数据得自己把控  </textarea>
		
		 
		
		</div>
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