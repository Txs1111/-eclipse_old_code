/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2021-04-03 11:02:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Adminpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.resource_entity;
import dao.get_resource;
import dao.Admin_tools;
import java.util.StringTokenizer;
import bean.official_bean;

public final class resource_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("dao.Admin_tools");
    _jspx_imports_classes.add("java.util.StringTokenizer");
    _jspx_imports_classes.add("dao.resource_entity");
    _jspx_imports_classes.add("bean.official_bean");
    _jspx_imports_classes.add("dao.get_resource");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Css/Public_style.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Css/Assignment.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Css/Message.css\" />\r\n");
      out.write("<link href=\"../Css/Homepage.css\" rel=\"stylesheet\" />\r\n");
      out.write("<link href=\"../Css/Public_Color/orange.css\" rel=\"stylesheet\" />\r\n");

	String content = request.getParameter("submit");
	if (content == null)
		content = "null";
	String uid = request.getParameter("uid");
	get_resource grr = new get_resource(0);
	if (content.equals("合格")) {
		grr.yes(uid);
	} else if (content.equals("不合格")) {
		grr.no(uid);
	} else if (content.equals("过期")) {
		grr.die(uid);
	}

	String ID = (String) request.getSession().getAttribute("ID");
	get_resource gr = new get_resource();
	resource_entity all_head;
	all_head = gr.allResource();
	resource_entity head;
	head = gr.resource();
	resource_entity Submit_head;
	Submit_head = gr.checkSubmitResource();
	resource_entity die_head;
	die_head = gr.checkDieResource();
	gr.get_a("链接：https://pan.baidu.com/s/130o9ba650lMjaOdOCLpHzQ");

      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Admin_lead.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("block_id", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("13", request.getCharacterEncoding()), out, false);
      out.write("\r\n");
      out.write("\t<div\r\n");
      out.write("\t\tstyle=\"width: 87.5%; margin-left: 0.1%; height: 824px; float: left;\"\r\n");
      out.write("\t\tclass=\"dinylight-color\">\r\n");
      out.write("\t\t<div class=\"small-tittle middle-font font-normal-color\">\r\n");
      out.write("\t\t\t&nbsp;┃&nbsp;资源管理</div>\r\n");
      out.write("\t\t<div style=\"width: 66.5%; float: left; margin-right: 0.5%;\">\r\n");
      out.write("\t\t\t<div style=\"width: 100%; float: left;\" align=\"center\"\r\n");
      out.write("\t\t\t\tclass=\"small-tittle middle-font font-normal-color\">\r\n");
      out.write("\t\t\t\t&nbsp;-&nbsp;总资源数&nbsp;-&nbsp;</div>\r\n");
      out.write("\t\t\t<div\r\n");
      out.write("\t\t\t\tstyle=\"font-size: 50px; line-height: 100px; width: 100%; height: 101px; color: white; float: left;\"\r\n");
      out.write("\t\t\t\talign=\"center\" class=\"light-color\">\r\n");
      out.write("\t\t\t\t");
      out.print(head.number);
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"width: 33%; height: 30px; float: left;\">\r\n");
      out.write("\t\t\t<div style=\"width: 100%; float: left;\" align=\"center\"\r\n");
      out.write("\t\t\t\tclass=\"small-tittle middle-font font-normal-color\">\r\n");
      out.write("\t\t\t\t&nbsp;-&nbsp;当天新更新资源数&nbsp;-&nbsp;</div>\r\n");
      out.write("\t\t\t<div\r\n");
      out.write("\t\t\t\tstyle=\"font-size: 20px; line-height: 35px; width: 100%; float: left; color: white; height: 35px;\"\r\n");
      out.write("\t\t\t\talign=\"center\" class=\"light-color\">\r\n");
      out.write("\t\t\t\t");
      out.print(gr.newTodayNumber());
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div style=\"width: 100%; float: left;\" align=\"center\"\r\n");
      out.write("\t\t\t\tclass=\"small-tittle middle-font font-normal-color\">\r\n");
      out.write("\t\t\t\t&nbsp;-&nbsp;当天失效资源数&nbsp;-&nbsp;</div>\r\n");
      out.write("\t\t\t<div\r\n");
      out.write("\t\t\t\tstyle=\"font-size: 20px; line-height: 35px; width: 100%; float: left; color: white; height: 35px;\"\r\n");
      out.write("\t\t\t\talign=\"center\" class=\"light-color\">\r\n");
      out.write("\t\t\t\t");
      out.print(gr.dieTodayNumber());
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div style=\"overflow-x: auto; width: 100%;\">\r\n");
      out.write("\t\t\t");

				for (int i = 0; i < gr.alltype.size(); i++) {
			
      out.write("\r\n");
      out.write("\t\t\t<div style=\"width: 1350px;\">\r\n");
      out.write("\t\t\t\t<div style=\"width: 147px; float: left; margin-left: 3px;\">\r\n");
      out.write("\t\t\t\t\t<div\r\n");
      out.write("\t\t\t\t\t\tstyle=\"width: 100%; float: left; margin-right: 0.5%; margin-top: 5px;\"\r\n");
      out.write("\t\t\t\t\t\talign=\"center\" class=\"small-tittle middle-font font-normal-color\">\r\n");
      out.write("\t\t\t\t\t\t&nbsp;-&nbsp;");
      out.print(gr.alltype.get(i));
      out.write("&nbsp;-&nbsp;\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div align=\"center\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"width: 100%; height: 35px; color: white; float: left; line-height: 35px; font-size: 20px; margin-right: 0.5%;\"\r\n");
      out.write("\t\t\t\t\t\tclass=\"light-color\">");
      out.print(gr.type_number.get(i));
      out.write("</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t");

				}
			
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"width: 50%; height: 100px; float: left;\"\r\n");
      out.write("\t\t\tclass=\"small-tittle small-font font-normal-color\">\r\n");
      out.write("\t\t\t<font>&nbsp;┃&nbsp;提交资源审核&nbsp;");
      out.print(Submit_head.number);
      out.write("\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t\t<div id=\"Message_head\"></div>\r\n");
      out.write("\t\t\t<div id=\"tidings\"\r\n");
      out.write("\t\t\t\tstyle=\"overflow-y: auto; overflow-x: hidden; height: 503px; width: 99%;\">\r\n");
      out.write("\t\t\t\t");

					int submit_number = Submit_head.number;
					for (int i = 0; i < submit_number; i++) {
				
      out.write("\r\n");
      out.write("\t\t\t\t<div id=\"tidings_left\">\r\n");
      out.write("\t\t\t\t\t<div id=\"name\">\r\n");
      out.write("\t\t\t\t\t\t<font class=\"small-font\" id=\"samll-B\">");
      out.print(gr.getName(Submit_head.ID));
      out.write("</font><br />\r\n");
      out.write("\t\t\t\t\t\t<a> <font class=\"small-font\">");
      out.print(Submit_head.title);
      out.write("</font>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div id=\"detail\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"detail_photo\">\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"../img/lead_photo/details.png\"\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"width: 100%; height: 100%;\" />\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"detail_text\">\r\n");
      out.write("\t\t\t\t\t\t\t<font>详细</font>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<form action=\"resource.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"uid\" value=\"");
      out.print(Submit_head.uid);
      out.write("\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"display: none;\"> <input type=\"submit\" name=\"submit\"\r\n");
      out.write("\t\t\t\t\t\tvalue=\"合格\">\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t<form action=\"resource.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"uid\" value=\"");
      out.print(Submit_head.uid);
      out.write("\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"display: none;\"> <input type=\"submit\" name=\"submit\"\r\n");
      out.write("\t\t\t\t\t\tvalue=\"不合格\">\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t<div id=\"tidings_right\">\r\n");
      out.write("\t\t\t\t\t<div class=\"dynamic_content_new dinylight-color\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"border-radius: 1px; width: 71%; height: 104px; margin-left: 24px;\">");
      out.print(Submit_head.content);
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<div id=\"function\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"time\">\r\n");
      out.write("\t\t\t\t\t\t\t<font id=\"samll\">");
      out.print(Submit_head.verification);
      out.print(Submit_head.time);
      out.write("</font>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t");

					if (Submit_head.number - i != 1)
							Submit_head = Submit_head.next;
					}
				
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"width: 50%; height: 100px; float: left;\"\r\n");
      out.write("\t\t\tclass=\"small-tittle small-font font-normal-color\">\r\n");
      out.write("\t\t\t<font>&nbsp;┃&nbsp;失效资源审核&nbsp;");
      out.print(die_head.number);
      out.write("</font>\r\n");
      out.write("\t\t\t<div id=\"Message_head\"></div>\r\n");
      out.write("\t\t\t<div id=\"tidings\"\r\n");
      out.write("\t\t\t\tstyle=\"overflow-y: auto; overflow-x: hidden; height: 503px; width: 99%;\">\r\n");
      out.write("\t\t\t\t");

					int die_number = die_head.number;
					for (int i = 0; i < die_number; i++) {
				
      out.write("\r\n");
      out.write("\t\t\t\t<div id=\"tidings_left\">\r\n");
      out.write("\t\t\t\t\t<div id=\"name\">\r\n");
      out.write("\t\t\t\t\t\t<font class=\"small-font\" id=\"samll-B\">");
      out.print(gr.getName(die_head.ID));
      out.write("</font><br />\r\n");
      out.write("\t\t\t\t\t\t<a> <font class=\"small-font\">");
      out.print(die_head.title);
      out.write("</font>\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div id=\"detail\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"detail_photo\">\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"../img/lead_photo/details.png\"\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"width: 100%; height: 100%;\" />\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"detail_text\">\r\n");
      out.write("\t\t\t\t\t\t\t<font>详细</font>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<form action=\"resource.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"uid\" value=\"");
      out.print(die_head.uid);
      out.write("\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"display: none;\"> <input type=\"submit\" name=\"submit\"\r\n");
      out.write("\t\t\t\t\t\tvalue=\"合格\">\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t<form action=\"resource.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"uid\" value=\"");
      out.print(die_head.uid);
      out.write("\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"display: none;\"> <input type=\"submit\" name=\"submit\"\r\n");
      out.write("\t\t\t\t\t\tvalue=\"过期\">\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t<div id=\"tidings_right\">\r\n");
      out.write("\t\t\t\t\t<div class=\"dynamic_content_new dinylight-color\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"border-radius: 1px; width: 71%; height: 104px; margin-left: 24px;\">");
      out.print(die_head.content);
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<div id=\"function\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"time\">\r\n");
      out.write("\t\t\t\t\t\t\t<font id=\"samll\">");
      out.print(die_head.verification);
      out.print(die_head.time);
      out.write("</font>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t");

					if (die_head.number - i != 1)
							die_head = die_head.next;
					}
				
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>tml>");
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