/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2021-03-14 07:11:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sun.org.apache.bcel.internal.generic.NEW;
import java.util.StringTokenizer;

public final class oldwork_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.StringTokenizer");
    _jspx_imports_classes.add("com.sun.org.apache.bcel.internal.generic.NEW");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP 只允许 GET、POST 或 HEAD。Jasper 还允许 OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

	/*------------------------------------------------------------------------------------------------
	修改人			     
	修改时间 		
	修改内容		
	版本号			 
	-------------------------------------------------------------------------------------------------*/

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"Css/score.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"Css/Public_style.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"Css/Public_Color/orange.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");

		String ID = null;
		if (request.getParameter("ID") != null) {
			ID = request.getParameter("ID");
		}
		int allpage = Integer.parseInt(request.getParameter("allpage"));
		int nowpage = Integer.parseInt(request.getParameter("nowpage"));
		request.setCharacterEncoding("UTF-8");
		String mission = request.getParameter("missions");
		StringTokenizer chart1 = new StringTokenizer(mission, "鷄");
		StringTokenizer chart2 = null;
	
      out.write("\r\n");
      out.write("\t<div class=\"oldwork_head \">\r\n");
      out.write("\t\t<font class=\"middle-font\" color=\"#FFA980\"> &nbsp;┃&nbsp;往期完成任务 </font>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"body_block\" style=\"height: 0px;\">\r\n");
      out.write("\t\t");

			int num = chart1.countTokens();
			System.out.println("本页显示任务数量:" + num);
			if (num == 0) {
		
      out.write("\r\n");
      out.write("\t\t<div style=\"width: 100%;\" align=\"center\">\r\n");
      out.write("\t\t\t<img src=\"img/example/empty1.png\">\r\n");
      out.write("\t\t\t</br>\r\n");
      out.write("\t\t\t</br>\r\n");
      out.write("\t\t\t<font style=\"font-size: 20px; color: #bfbfbf\">\r\n");
      out.write("\t\t\t\t<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前还啥都没有~ </b>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t");

			}
			for (int a = 0; a < num; a++) {
				chart2 = new StringTokenizer(chart1.nextToken(), "撾");
		
      out.write("\r\n");
      out.write("\t\t<form action=\"Assignment_finished_details.jsp\"method=\"post\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"work_inf\" style=\"background-color: #FAFAFA; height: 215px;\">\r\n");
      out.write("\t\t\t\t<div style=\"width: 95%; margin: 0 auto; height: 25px; margin-top: 5px; line-height: 25px;\">\r\n");
      out.write("\t\t\t\t\t<div class=\" middle-font\" style=\"float: left;\">\r\n");
      out.write("\t\t\t\t\t\t");

							String missionID = chart2.nextToken();
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button style=\"cursor: pointer; border: 0px solid white; background-color: #FAFAFA;\" name=\"missionID\" value=\"");
      out.print(missionID);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(chart2.nextToken());
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<input style=\"display: none;\" type=\"text\" name=\"ID\" value=\"");
      out.print(ID);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t<input style=\"display: none;\" type=\"text\" name=\"lastpage\" value=\"1\">\r\n");
      out.write("\t\t\t\t\t<div style=\"float: right;\">\r\n");
      out.write("\t\t\t\t\t\t<font>难度: </font>\r\n");
      out.write("\t\t\t\t\t\t");

							int starts = Integer.parseInt(chart2.nextToken());
								for (int b = 0; b < starts; b++) {
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<img src=\"img/example/星星.png\" id=\"good\">\r\n");
      out.write("\t\t\t\t\t\t");

							}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div style=\"float: right; line-height: 20px;\">\r\n");
      out.write("\t\t\t\t\t\t<font class=\"middle-font\" color=\"#FFA980\"> &nbsp;┃&nbsp; </font>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div style=\"float: right;\">\r\n");
      out.write("\t\t\t\t\t\t<font>类型:</font>\r\n");
      out.write("\t\t\t\t\t\t<font color=\"#000000\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(chart2.nextToken());
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div style=\"float: right; line-height: 20px;\">\r\n");
      out.write("\t\t\t\t\t\t<font class=\"middle-font\" color=\"#FFA980\"> &nbsp;┃&nbsp; </font>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div style=\"float: right;\">\r\n");
      out.write("\t\t\t\t\t\t<font>得分:</font>\r\n");
      out.write("\t\t\t\t\t\t<font color=\"#000000\">\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(chart2.nextToken());
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div style=\"float: right; line-height: 20px;\">\r\n");
      out.write("\t\t\t\t\t\t<font class=\"middle-font\" color=\"#FFA980\"> &nbsp;┃&nbsp; </font>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"dinylight-color work_maininf\">\r\n");
      out.write("\t\t\t\t\t<textarea class=\"dinylight-color\" style=\"line-height: 16px; border: 0px solid white; resize: none; width: 100%; height: 100%;\" readonly>");
      out.print(chart2.nextToken());
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div style=\"margin-top: 2px; width: 95%; margin: 0 auto;\">\r\n");
      out.write("\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t\t");

								String date = chart2.nextToken();
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<font color=\"gray\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(date);
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t\t\t\t<input style=\"display: none;\" type=\"text\" name=\"missiondate\" value=\"");
      out.print(date);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t");

			}
		
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t");

		if (allpage != 0) {
			if (num != 0) {
	
      out.write("\r\n");
      out.write("\t<form action=\"score_turnpage\" method=\"post\">\r\n");
      out.write("\t\t<input name=\"nowpage\" value=\"");
      out.print(nowpage);
      out.write("\" style=\"display: none;\">\r\n");
      out.write("\t\t<input name=\"ID\" value=\"");
      out.print(ID);
      out.write("\" style=\"display: none;\">\r\n");
      out.write("\t\t<input name=\"allpage\" value=\"");
      out.print(allpage);
      out.write("\" style=\"display: none;\">\r\n");
      out.write("\t\t<div class=\"turnpage-conntrol light-color\" style=\"height: 110px; padding-top: 1px;\">\r\n");
      out.write("\t\t\t<div style=\"width: 100%; height: 25px; margin-bottom: 3px; line-height: 25px;\" align=\"center\">\r\n");
      out.write("\t\t\t\t<font color=\"white\">\r\n");
      out.write("\t\t\t\t\t当前第");
      out.print(nowpage);
      out.write("页/ 共有");
      out.print(allpage);
      out.write("页\r\n");
      out.write("\t\t\t\t</font>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div style=\"width: 100%; height: 35px; margin-bottom: 3px;\" align=\"center\">\r\n");
      out.write("\t\t\t\t");

					for (int a = 0; a < allpage; a++) {
				
      out.write("\r\n");
      out.write("\t\t\t\t<button name=\"jumpact\" value=\"");
      out.print(a + 1);
      out.write("\" class=\"dinylight-color\" style=\"cursor: pointer; border-radius: 2px; height: 35px; width: 7%; border: 0px solid white;\">\r\n");
      out.write("\t\t\t\t\t");
      out.print(a + 1);
      out.write("\r\n");
      out.write("\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t");

					}
				
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div align=\"center\" style=\"width: 100%; height: 35px;\">\r\n");
      out.write("\t\t\t\t<button name=\"act\" value=\"1\" class=\"dinylight-color\" style=\"cursor: pointer; border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;\">首页</button>\r\n");
      out.write("\t\t\t\t<button name=\"act\" value=\"2\" class=\"dinylight-color\" style=\"cursor: pointer; border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;\">上一页</button>\r\n");
      out.write("\t\t\t\t<select name=\"jumppage\" style=\"width: 6%; height: 35px; border: 0px solid white; border-radius: 2px;\">\r\n");
      out.write("\t\t\t\t\t<option value=");
      out.print(nowpage);
      out.write('>');
      out.print(nowpage);
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t");

						for (int a = 0; a < allpage; a++) {
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<option value=");
      out.print(a + 1);
      out.write('>');
      out.print(a + 1);
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t");

						}
					
      out.write("\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t<button name=\"act\" value=\"3\" class=\"dinylight-color\" style=\"cursor: pointer; border-radius: 2px; height: 35px; width: 6%; border: 0px solid white;\">跳转</button>\r\n");
      out.write("\t\t\t\t<button name=\"act\" value=\"4\" class=\"dinylight-color\" style=\"cursor: pointer; border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;\">下一页</button>\r\n");
      out.write("\t\t\t\t<button name=\"act\" value=\"5\" class=\"dinylight-color\" style=\"cursor: pointer; border-radius: 2px; height: 35px; width: 12%; border: 0px solid white;\">尾页</button>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("\t");

		}
		}
	
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}