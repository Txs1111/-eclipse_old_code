<%@ page contentType="text/html; charset=gbk" pageEncoding="gbk"%>

<%
	String action = request.getParameter("action");
	if (action != null && action.equals("login")) {
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");
		if (username == null || !username.equals("admin")) {
%>
<font color="white" size=5>username not correct!</font>
<%
	//return;
		} else if (password == null || !password.equals("admin")) {
			out.println("password not correct!");
			//return;
		} else {
			session.setAttribute("admin", "true");
			response.sendRedirect("ShowArticleTree.jsp");
		}
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0054)http://www.simworld.com/client_access/client_login.asp -->
<html>
<HEAD>
<title>SIM - Client Access - Login</title>
<META http-equiv=Content-Type content="text/html; charset=gbk"
	pageEncoding="gbk">
<link href="images/sim_stylesheet.css" type=text/css rel=styleSheet>
<script language=JavaScript src="" type=text/javascript></SCRIPT>

<script language=JavaScript src="" type=text/javascript></SCRIPT>

<script language=JavaScript src="" type=text/javascript></SCRIPT>

<META content="MSHTML 6.00.2900.2963" name=GENERATOR>
<style type="text/css">
<!--
.STYLE1 {
	color: #CCCCCC
}
-->
</style>

</head>
<body>
	bgColor=#20355a leftMargin=0 topMargin=0 onload=init() marginheight="0"
	marginwidth="0">
	<!--Begin all TOP NAVIGATIOND ROPDOWN LAYERS ------------>
	<!--Begin About Sim Dropdown 1 -->
	<div id=about_sim_drop1>
		<table cellSpacing=0 cellPadding=0 width=140 border=0>
			<tbody>
				<tr>
					<td bgColor=#ffffff>
						<table cellSpacing=2 cellPadding=2 width=140 border=0>
							<tbody>
								<tr>
									<td vAlign=top align=left width=130><A class=topnav
										onmouseover="stopTime(); showLayer('about_sim_corporate_drop2'); hideLayer('about_sim_portfolio_drop2');"
										onmouseout=startTime();
										href="http://www.simworld.com/about_sim/corporate/index.asp">Corporate
											Info</a></td>
									<td vAlign=top width=10><img height=10 alt=arrow
										src="images/nav_arrows.gif" width=10></td>
								</tr>
							</tbody>
						</table>
					</td>
			</tr>
			<!-- 
	<tr> 
       <td bgcolor="#CACFDA"> 
         <table width="140" border="0" cellspacing="2" cellpadding="2">
           <tr> 
             <td width="130" valign="top" align="left"><a href="/about_sim/services/index.asp" onMouseOver="stopTime(); hideLayer('about_sim_corporate_drop2');" onMouseOut="startTime();" class="topnav">Services</a></td>
             <td width="10" valign="top"><img src="/pics/spacer.gif" alt="" width="10" height="10"></td>
           </tr>
         </table>
       </td>
     </tr>
-->
			<tr>
				<td bgColor=#cacfda>
					<table cellSpacing=2 cellPadding=2 width=140 border=0>
						<tbody>
							<tr>
								<td vAlign=top align=left width=130><A class=topnav
									onmouseover="stopTime(); hideLayer('about_sim_corporate_drop2');"
									onmouseout=startTime();
									href="http://www.simworld.com/about_sim/products/index.asp">Products</a></td>
								<td vAlign=top width=10><img height=10 alt=""
									src="images/spacer.gif" width=10></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<!--<tr> 
       <td bgcolor="#CACFDA"> 
         <table width="140" border="0" cellspacing="2" cellpadding="2">
           <tr> 
             <td width="130" valign="top" align="left"><a href="/about_sim/portfolio/index1.asp" onMouseOver="stopTime(); showLayer('about_sim_portfolio_drop2'); hideLayer('about_sim_corporate_drop2');" onMouseOut="startTime();" class="topnav">Portfolio</a></td>
             <td width="10" valign="top"><img src="/pics/nav_arrows.gif" alt="arrow" width="10" height="10"></td>
           </tr>
         </table>
       </td>
     </tr>-->
			<tr>
				<td bgColor=#ffffff>
					<table cellSpacing=2 cellPadding=2 width=140 border=0>
						<tbody>
							<tr>
								<td vAlign=top align=left width=130><A class=topnav
									onmouseover=stopTime();
									onmouseout="startTime(); hideLayer('about_sim_corporate_drop2');"
									href="http://www.simworld.com/about_sim/portfolio/index_temp.asp">Portfolio</a></td>
								<td vAlign=top width=10><img height=10 alt=arrow
									src="images/spacer.gif" width=10></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			</tbody>
		</table>
	</DIV>
	<!-- End About Sim Dropdown 1 -->
	<!--Begin About Sim Corporate Dropdown 2 -->
	<div id=about_sim_corporate_drop2>
		<table cellSpacing=0 cellPadding=0 width="100%" border=0>
			<tbody>
				<tr>
					<td bgColor=#cacfda>
						<table cellSpacing=2 cellPadding=2 width="100%" border=0>
							<tbody>
								<tr>
									<td vAlign=top align=left width="100%"><A class=topnav
										onmouseover=stopTime(); onmouseout=startTime();
										href="http://www.simworld.com/about_sim/corporate/mission.asp">Mission</a></td>
								</tr>
							</tbody>
						</table>
					</td>
			</tr>
			<tr>
				<td bgColor=#ffffff>
					<table cellSpacing=2 cellPadding=2 width="100%" border=0>
						<tbody>
							<tr>
								<td vAlign=top align=left width="100%"><A class=topnav
									onmouseover=stopTime(); onmouseout=startTime();
									href="http://www.simworld.com/about_sim/corporate/philosophy.asp">Philosophy</a></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td bgColor=#cacfda>
					<table cellSpacing=2 cellPadding=2 width="100%" border=0>
						<tbody>
							<tr>
								<td vAlign=top align=left width="100%"><A class=topnav
									onmouseover=stopTime(); onmouseout=startTime();
									href="http://www.simworld.com/about_sim/corporate/team.asp">Team</a></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td bgColor=#ffffff>
					<table cellSpacing=2 cellPadding=2 width="100%" border=0>
						<tbody>
							<tr>
								<td vAlign=top align=left width="100%"><A class=topnav
									onmouseover=stopTime(); onmouseout=startTime();
									href="http://www.simworld.com/about_sim/corporate/specialty.asp">Specialty
										Markets </a></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td bgColor=#cacfda>
					<table cellSpacing=2 cellPadding=2 width="100%" border=0>
						<tbody>
							<tr>
								<td vAlign=top align=left width="100%"><A class=topnav
									onmouseover=stopTime(); onmouseout=startTime();
									href="http://www.simworld.com/about_sim/corporate/news.asp">News
										&amp; Awards</a></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			</tbody>
		</table>
	</DIV>
	<!--Begin About Sim Corporate Dropdown 2 -->
	<!--Begin About Sim Portfolio Dropdown 2 -->
	<div id=about_sim_portfolio_drop2>
		<!--<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td bgcolor="#CACFDA"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
            <td width="100%" valign="top" align="left"><a href="/about_sim/portfolio/websites.asp" onMouseOver="stopTime();" onMouseOut="startTime();" class="topnav">Websites</a></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
            <td width="100%" valign="top" align="left"><a href="/about_sim/portfolio/multimedia.asp" onMouseOver="stopTime();" onMouseOut="startTime();" class="topnav">Multimedia Presentations</a></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#CACFDA"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
            <td width="100%" valign="top" align="left"><a href="/about_sim/portfolio/print_graphic_design.asp" onMouseOver="stopTime();" onMouseOut="startTime();" class="topnav" target="_blank">Print / Graphic Design</a></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
            <td width="100%" valign="top" align="left"><a href="/about_sim/client_list.pdf" onMouseOver="stopTime();" onMouseOut="startTime();" class="topnav" target=_"blank">Client List (PDF)</a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>-->
	</DIV>
	<!--Begin About Sim Portfolio Dropdown 2 -->
	<!--Begin Client Access Dropdown 1 -->
	<div id=client_access_drop1>
		<!--<table width="140" border="0" cellspacing="0" cellpadding="0">
     <tr> 
       <td bgcolor="#FFFFFF"> 
         <table width="140" border="0" cellspacing="2" cellpadding="2">
           <tr> 
             <td width="130" valign="top" align="left"><a href="/client_access/client_login.asp" onMouseOver="stopTime(); hideLayer('client_access_customer_drop2');" onMouseOut="startTime();" class="topnav">Client Login</a></td>
             <td width="10" valign="top"><img src="/pics/spacer.gif" alt="" width="10" height="10"></td>
           </tr>
         </table>
       </td>
     </tr>
     <tr> 
       <td bgcolor="#CACFDA"> 
         <table width="140" border="0" cellspacing="2" cellpadding="2">
           <tr> 
             <td width="130" valign="top" align="left"><a href="/client_access/customerservice/index1.asp" onMouseOver="stopTime(); showLayer('client_access_customer_drop2');" onMouseOut="startTime();" class="topnav">Customer Service</a></td>
             <td width="10" valign="top"><img src="/pics/nav_arrows.gif" alt="arrow" width="10" height="10"></td>
           </tr>
         </table>
       </td>
     </tr>
     <tr> 
       <td bgcolor="#FFFFFF"> 
         <table width="140" border="0" cellspacing="2" cellpadding="2">
           <tr> 
             <td width="130" valign="top" align="left"><a href="/under_construction.asp" onMouseOver="stopTime(); hideLayer('client_access_customer_drop2');" onMouseOut="startTime();" class="topnav">Beyond Today</a></td>
             <td width="10" valign="top"><img src="/pics/spacer.gif" alt="" width="10" height="10"></td>
           </tr>
         </table>
       </td>
     </tr>
   </table>-->
	</DIV>
	<!-- End Client Access Dropdown 1 -->
	<!--Begin Client Access Customer Service Dropdown 2 -->
	<div id=client_access_customer_drop2>
		<!--<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td bgcolor="#CACFDA"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
            <td width="100%" valign="top" align="left"><a href="/client_access/customerservice/policy1.asp" onMouseOver="stopTime();" onMouseOut="startTime();" class="topnav">Our Policy</a></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
            <td width="100%" valign="top" align="left"><a href="/client_access/customerservice/help1.asp" onMouseOver="stopTime();" onMouseOut="startTime();" class="topnav">Help</a></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#CACFDA"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
            <td width="100%" valign="top" align="left"><a href="/client_access/customerservice/downloads1.asp" onMouseOver="stopTime();" onMouseOut="startTime();" class="topnav">Downloads</a></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
            <td width="100%" valign="top" align="left"><a href="/client_access/customerservice/tech_standards1.asp" onMouseOver="stopTime();" onMouseOut="startTime();" class="topnav" target=_"blank">Technical Standards</a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>-->
	</DIV>
	<!-- End Client Access Customer Service Dropdown 2 -->
	<!--Begin Join our Team Dropdown 1 -->
	<div id=join_our_team_drop1>
		<table cellSpacing=0 cellPadding=0 width=150 border=0>
			<tbody>
				<tr>
					<td bgColor=#ffffff>
						<table cellSpacing=2 cellPadding=2 width=150 border=0>
							<tbody>
								<tr>
									<td vAlign=top width=10><img height=10 alt=""
										src="images/client_access.htm" width=10></td>
									<td vAlign=top align=right width=140><A class=topnav
										onmouseover=stopTime(); onmouseout=startTime();
										href="http://www.simworld.com/join_our_team/job_openings.asp">Job
											Openings</a></td>
								</tr>
							</tbody>
						</table>
					</td>
			</tr>
			<tr>
				<td bgColor=#cacfda>
					<table cellSpacing=2 cellPadding=2 width=150 border=0>
						<tbody>
							<tr>
								<td vAlign=top width=10><img height=10 alt=""
									src="images/spacer.gif" width=10></td>
								<td vAlign=top align=right width=140><A class=topnav
									onmouseover=stopTime(); onmouseout=startTime();
									href="http://www.simworld.com/join_our_team/apply_online.asp">Employee
										Benefits</a></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td bgColor=#ffffff>
					<table cellSpacing=2 cellPadding=2 width=150 border=0>
						<tbody>
							<tr>
								<td vAlign=top width=10><img height=10 alt=""
									src="images/spacer.gif" width=10></td>
								<td vAlign=top align=right width=140><A class=topnav
									onmouseover=stopTime(); onmouseout=startTime();
									href="http://www.simworld.com/join_our_team/corp_culture.asp">Corporate
										Culture</a></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			</tbody>
		</table>
	</DIV>
	<!-- End Join Our Team  Dropdown 1 -->
	<!--End all TOP NAVIGATIOND ROPDOWN LAYERS ------------>
	<!--Begin Browser Spanning Table, this allows Main Web Site Table to be centered in the middle of the browser -->
	<table height="100%" cellSpacing=0 cellPadding=0 width="100%"
		align=center border=0>
		<tbody>
			<tr>
				<td>
					<!--Begin Main Web Site Table All Website Design elements below-->
					<table borderColor=#ffffff cellSpacing=0 cellPadding=0 width=760
						align=center border=1>
						<tbody>
							<tr>
								<td>
									<table cellSpacing=0 cellPadding=0 width="100%" border=0>
										<tbody>
											<tr>
												<td>
													<!-- Begin Top Logo, Navigation and Message bar Table -->
													<table cellSpacing=0 cellPadding=0 width="100%" border=0>
														<!--Beign Global Nav Buttons --->
														<tbody>
															<tr>
																<td rowSpan=2><img height=53
																	alt="Screened Images Multimedia"
																	src="images/sim_logo_top.gif" width=136
																	useMap=#top_logo_map border=0> <MAP
																		name=top_logo_map>
																		<AREA shape=RECT
																			alt="Screened Images Multimedia [Back to Home]"
																			coords=11,4,120,54
																			href="http://www.simworld.com/index.asp">
																	</MAP></td>
																<td><span class="STYLE1">&#27426;&#36814;&#26469;&#21040;
																		&#33879;&#21517;&#30340;BBS&#21518;&#21488;</span></td>
															</tr>
															<tr>
																<!--End Global Nav Buttons --->
																<td><span class="STYLE1">&#19981;&#36755;&#20837;&#29992;&#25143;&#21517;&#23494;&#30721;&#19981;&#35768;&#36827;
																		&#29992;&#25143;&#21517;: admin &#23494;&#30721;:
																		admin </span></td>
															</tr>
														</tbody>
													</table>
										<!-- End Top Logo, Navigation and Message bar Table -->
										</td>
										</tr>
										<tr>
											<td>
												<!-- Begin Inner Content Table:  This portion will be customizable throughout the website -->
												<table cellSpacing=0 cellPadding=0 width="100%" border=0>
													<tbody>
														<tr>
															<td><img height=324 alt=""
																src="images/client_login_left_arc.gif" width=137
																useMap=#bot_logo_map border=0> <MAP
																	name=bot_logo_map>
																	<AREA shape=RECT
																		alt="Screened Images Multimedia [Back to Home]"
																		coords=11,0,120,24
																		href="http://www.simworld.com/index.asp">
																</MAP></td>
															<td>
																<table cellSpacing=0 cellPadding=0 width="100%" border=0>
																	<tbody>
																		<tr>
																			<td><img height=91 alt="CLIENT LOG-IN"
																				src="images/client_login_title.gif" width=282></td>
																		</tr>
																		<tr>
																			<td>
																				<form action=Login.jsp method=post>
																					<input type=hidden name=action value=login>
																					<table cellSpacing=0 cellPadding=0 width="100%"
																						background="images/client_login_text_bg.gif"
																						border=0>
																						<tbody>
																							<tr>
																								<td rowSpan=4><img height=158 alt=""
																									src="images/spacer.gif" width=22 border=0></td>
																								<td colSpan=2>
																									<P class=bodydarkblue>Please enter your
																										username and password here to preview your
																										designs, check project status and/or submit
																										new job requests.</P>
																								</td>
																							</tr>
																							<tr>
																								<td>
																									<P class=bodyldarkblue>
																										<LABEL for=uname>用户名:</LABEL>
																									</P>
																								</td>
																								<td><INPUT id=uname name=uname></td>
																							</tr>
																							<tr>
																								<td>
																									<P class=bodyldarkblue>
																										<LABEL for=pwd>密码:</LABEL>
																									</P>
																								</td>
																								<td><INPUT id=pwd type=password name=pwd></td>
																							</tr>
																							<tr>
																								<td vAlign=top colSpan=2><A
																									class=bodydarkblue
																									href="http://www.simworld.com/client_access/client_login.asp"><STRONG>
																											<!--Forget your password?-->
																									</STRONG></a><img height=1 alt="" src="images/spacer.gif"
																									width=132 border=0>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT
																									type=image alt=Submit
																									src="images/client_login_submit.gif"
																									align=absMiddle value=Submit name=Submit></td>
																							</tr>
																						</tbody>
																					</table>
																	</td>
																	</tr>
																	<tr>
																		<td><img height=75 alt=""
																			src="images/client_login_bot_arc.gif" width=282></td>
																	</tr>
																	</tbody>
																</table>
													</td>
													<td><img height=324 alt="Log-in Image"
														src="images/client_login_main_pic.jpg" width=341></td>
													</tr>
													</tbody>
												</table>
										<!-- End Inner Content Table -------->
										</td>
										</tr>
										<tr>
											<td>
												<!-- Begin Bottom Navigation: Contact Us, Request A- Quote -->
												<table cellSpacing=0 cellPadding=0 width="100%" border=0>
													<tbody>
														<tr>
															<td><A
																onmouseover="Rollover('nav_homepage_a','nav_homepage');"
																onmouseout="Rollover('nav_homepage','nav_homepage');"
																href="http://www.simworld.com/index.asp"></a><img
																height=26 alt="" src="images/interior_bot_nav_bar.gif"
																width=100%></td>
														</tr>
														<tr>
															<td><img height=12
																alt="Copyright 2003 Screened Images, Inc."
																src="images/bot_footer_bar.gif" width=760></td>
														</tr>
													</tbody>
												</table>
										<!-- End Bottom Navigation: Contact Us, Request A- Quote -->
										</td>
										</tr>
										</tbody>
									</table>
						</td>
						</tr>
						</tbody>
					</table>
		<!--End Main Web Site Table -->
		</td>
		</tr>
		</tbody>
	</table>
	<!--End Browser Spanning Table -->
</BODY>
</html>
