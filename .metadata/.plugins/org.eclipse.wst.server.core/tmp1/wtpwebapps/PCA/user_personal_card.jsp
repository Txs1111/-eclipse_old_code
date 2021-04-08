<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.Score_bean" import="bean.user_personal_write_part"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="Css/score.css" />
		<link rel="stylesheet" type="text/css" href="./Css/Public_style.css" />
		<link rel="stylesheet" type="text/css" href="./Css/Public_Color/orange.css" />
	</head>
	<body>
		<%			
		String ID = request.getParameter("ID");
		Score_bean bean = new Score_bean(ID);
		user_personal_write_part bean2=new user_personal_write_part(ID);
		String data=bean2.getcard();
		if(data==null||"".equals(data)||"null".equals(data)){
			data=bean2.user_personal_card;
		}
		int score = 0;
		int finish = 0;
		int rank = 0;	
		score=bean.getpoint();			
		finish=bean.allfinish;		
		rank=bean.userrank();
		data=data.replace("|%|score|%|",score+"" );
		data=data.replace("|%|rank|%|",rank+"" );
		data=data.replace("|%|finish|%|",finish+"" );
		out.println(data);
	%>
		





	</body>
</html>
