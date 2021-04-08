<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>

<body>
	<%
		int a = 1;
		String c = "s";
	%>
	<script>
		varjson = {"a":<%=a%>,"c":"<%=c%>"};
		//json = "<%=c%>";
		document.write(JSON.stringify(varjson));
		//document.write(JSON.stringify(json));
		v = <%=a%>;
		document.write(v);
		v=v+1;
		<%-- <%a=%>v; --%>
		
	</script>
	<%
		System.out.println(a);
	%>
</body>

</html>