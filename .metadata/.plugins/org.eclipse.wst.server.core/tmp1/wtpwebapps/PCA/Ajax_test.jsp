<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="Css/ssi-uploader.css"/>
</head>
<body>
	<!-- <div id="content" style="width: 10%; height: 20px; background-color: blue">22</div>
	<div style="width: 10%; height: 20px; background-color: blue" id="content_2"></div>
	<input id="s1" value="9" id="s">
	<input id="s2" style="display: none;" value="7"> -->
	
			<div class="row">
				<div class="col-md-12">
					<input type="file" multiple id="ssi-upload"/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h3>无预览图效果：</h3>
					<input type="file" multiple id="ssi-upload2"/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h3>不带拖放区域：</h3>
					<input type="file" multiple id="ssi-upload3"/>
				</div>
			</div>
		</div>
	
	
	
</body>
</html>
	<script>window.jQuery || document.write('<script src="js/jquery-3.4.1.js"><\/script>')</script>
	<script src="js/ssi-uploader.js"></script>
<script type="text/javascript">
		$('#ssi-upload').ssi_uploader({url:'uploaderController',maxFileSize:6,allowed:['jpg','png']});
		$('#ssi-upload2').ssi_uploader({url:'uploaderController',preview:false,allowed:['jpg','png']});
		$('#ssi-upload3').ssi_uploader({url:'UploadServlet',dropZone:false,preview:false,allowed:['jpg','png']});
	</script>

	<% /*$(function() {
		$('#content').click(function() {
			$.ajax({
				url : "test_ajax",
				context : document.body,
				type : "POST",
				data : {
					"s1" : $("#s1").val(),
					"s2" : $("#s2").val()
				},
				success : function(data) {
					$('#content').html(data);
				}
			});
		});

		$('#content_2').click(function() {
			$(this).css("background-color", "yellow");
		});
	});*/ %>
	