package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import dao.MySQL_connect;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class test_ajax
 */
@WebServlet("/test_ajax")
public class test_ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_ajax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MySQL_connect con = new MySQL_connect();
String  s1= null;
String  s2= null;
if(request.getAttribute("s1")!=null)
{
	s1=(String)request.getAttribute("s1");
}else if(request.getParameter("s1")!=null)
{
	s1=request.getParameter("s1");
}
if(request.getAttribute("s2")!=null)
{
	s2=(String)request.getAttribute("s2");
}else if(request.getParameter("s2")!=null)
{
	s2=request.getParameter("s2");
}
response.setCharacterEncoding("UTF-8");  
response.setContentType("application/json; charset=utf-8");  
PrintWriter writer = response.getWriter();
writer.append(s1);
	}

}
