/**
 * 
 */
$('#mywork').click(function(){
			$(this).css('background-color','#00A1D5');
			$(this).siblings('div').css('background-color','white');
			$('#display').html('<iframe src="Work_mywork.jsp" width="100%" height="100%" scrolling="no" frameborder="0"> </iframe>');
	});